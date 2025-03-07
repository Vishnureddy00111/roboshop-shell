source common.sh

eco -e "color$ Copy Dispatch Service file $no_color"
cp dispatch.service etc/systemd/system/dispatch.service

echo -e "$color Install GoLang $no_color"
dnf install golang -y

echo -e "$color Add Application User $no_color"
useradd roboshop

echo -e "$color Create ApplicationDirectory $no_color"
rm -rf /app
mkdir /app

echo -e "$color Download Application content $no_color"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch-v3.zip
cd /

echo -e "$color Extract Application content $no_color"
unzip /tmp/dispatch.zip

echo -e "$color Copy Download application Dependencies $no_color"
go mod init dispatch
go get
go build

echo -e "$color start Application Service $no_color"
systemctl daemon-reload
systemctl enable dispatch
systemctl restart dispatch