
@echo off

(
echo;open 192.168.12.13
echo;user
echo;password
echo;prompt off
echo;lcd D:\dbbackup\today
echo;cd dbbackup/today
echo;mput *.sql
echo;close
echo;bye
)>ftp.txt
ftp -s:[µ±Ç°Ä¿Â¼]\ftp.txt

