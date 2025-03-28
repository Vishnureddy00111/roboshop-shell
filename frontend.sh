source common.sh
app_name=fronted


print_heading "Disable Default Nginx"
dnf module disable nginx -y &>>log_file
status_check $?

print_heading "Enable Nginx 24 version"
dnf module enable nginx:1.24 -y &>>log_file
status_check $?

print_heading "Install Nginx"
dnf install nginx -y &>>log_file
status_check $?

print_heading "Copy Nginx config files"
cp nginx.conf /etc/nginx/nginx.conf &>>log_file
status_check $?

print_heading "Clean up old Application Content"
rm -rf /usr/share/nginx/html/* &>>log_file
status_check $?

print_heading "Download Application Content"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>>log_file
status_check $?

cd /usr/share/nginx/html

print_heading "Extract Application Content"
unzip /tmp/frontend.zip &>>log_file
status_check $?


print_heading "Start Nginx"
systemctl enable nginx &>>log_file
systemctl restart nginx &>>log_file
status_check $?
