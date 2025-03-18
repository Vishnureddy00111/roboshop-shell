source common.sh
app_name=mysql


if [ -z "$1" ]; then
  echo INputMYSQL Root Password is missing
  exit 1
  fi

MySQL_ROOT_PASSWORD=$1
print_heading"Install MySQL Server"
dnf install mysql-server -y &>>log_file
status_check $?

print_heading"Start MySQL Server"
systemctl enable mysqld &>>log_file
systemctl start mysqld &>>log_file
status_check $?

print_heading"Setup MySQL Password"
mysql_secure_installation --set-root-pass $RABBITMQ_PASSWORD &>>log_file
status_check $?