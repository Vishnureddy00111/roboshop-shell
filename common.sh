color="\e[35m"
no_color="\e[0m"

log_file=/tmp/roboshop.log
rm -f $log_file


app_prerequisities() {

  print_heading Add Application User "
  useradd roboshop &>>log_file
  echo $?

  print_heading Create ApplicationDirectory "
  rm -rf /app &>>log_file
  mkdir /app &>>log_file
  echo $?

  print_heading Download Application content "
  curl -L -o /tmp/$app_name.zip https://roboshop-artifacts.s3.amazonaws.com/$app_name-v3.zip
  cd /
  echo $?

  print_heading Extract Application content "
  unzip /tmp/$app_name.zip &>>log_file
  echo $?
}

print_heading() {
  echo -e "$color $1 $no_color" &>>log_file
  echo -e "$color $1 $no_color"
}
