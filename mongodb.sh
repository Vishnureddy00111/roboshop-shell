cp mongodb.repo /etc/yum.repos.d/mongodb.repo
#cp catalogue /etc/systemd/system/catalogue.service
dnf install mongodb-org -y


sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

systemctl enable mongod
systemctl restart mongod