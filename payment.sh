color="$\e[36m"
no_color="\e[0m"

eco -e "$color Copy Payment Service file $no_color"
cp payment.service /etc/systemd/system/payment.service

echo -e "$color install python $no_color"
dnf install python3 gcc python3-devel -y
useradd roboshop

eco -e "$color Create Application Directory $no_color"
rm -rf /app
mkdir /app

eco -e "$color Download Application Directory $no_color"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip
cd /app

eco -e "$color Extract Application Content $no_color"
unzip /tmp/payment.zip

eco -e "$color Download Application Dependencies $no_color"
pip3 install -r requirements.txt

eco -e "$color Start Application Service $no_color"
systemctl daemon-reload
systemctl enable payment
systemctl start payment