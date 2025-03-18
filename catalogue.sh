source common.sh
app_name=catalogue


nodejs_setup

print_heading "Copy MongoDB repo file"
cp scripts_path/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>log_file
status_check $?
#cp catalogue /etc/systemd/system/catalogue.service

print_heading "Install MongoDB Client"
dnf install mongodb-mongosh -y &>>log_file
status_check $?

print_heading "Load Master Data"
mongosh --host mongodb.vishnureddy.online </app/db/master-data.js
status_check $?

print_heading "Restart catalogue Service"
systemctl restart catalogue &>>log_file
status_check $?


