color="\e[35m"
no_color="\e[0m"

log_file=/tmp/roboshop.log
rm -f $log_file


app_prerequisities() {

  echo -e "$color Add Application User $no_color"
  useradd roboshop &>>log_file
  echo $?

  echo -e "$color Create ApplicationDirectory $no_color"
  rm -rf /app &>>log_file
  mkdir /app &>>log_file
  echo $?

  echo -e "$color Download Application content $no_color"
  curl -L -o /tmp/$app_name.zip https://roboshop-artifacts.s3.amazonaws.com/$app_name-v3.zip
  cd /
  echo $?

  echo -e "$color Extract Application content $no_color"
  unzip /tmp/$app_name.zip &>>log_file
  echo $?
}
