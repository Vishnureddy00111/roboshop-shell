# roboshop-shell

shell scripting 

linux does not require file extension.



### sed command 
syn text : sed -i -e operation2 files
Ex:sed -i -e 'root/ d' -e'2d file
Note:if we don't give 'i' option then it will make changes on the output not on the file


###shell

20/10/24 11:46:43 cd roboshop-shell/
4  20/10/24 11:46:47 ls
5  20/10/24 11:54:41 sudo bash catalogue.sh
6  20/10/24 12:02:49 cat /etc/passwd
7  20/10/24 12:04:31 sed -e '/root/ d' /etc/passwd
8  20/10/24 12:06:44 sed -e '/root/ a Helloworld' /etc/passwd
9  20/10/24 12:08:52 sed -e 'i a Hello world' /etc/passwd
10  20/10/24 12:10:30 sed -e 's/root/ADMIN /etc/passwd


11  20/10/24 12:11:19 sed -e 's/root/ADMIN/' etc/passwd
12  20/10/24 12:13:38 sed -e 's/root/ADMIN/g' /etc/passwd
13  20/10/24 12:14:10 sed -e 's/root/ADMIN/1' /etc/passwd
14  20/10/24 12:14:23 sed -e 's/root/ADMIN/2' /etc/passwd
15  20/10/24 12:15:11 history
