@echo off
:: 注意本机的日期和时间格式
if "%time:~0,2%" lss "10" (set hh=0%time:~1,1%) else (set hh=%time:~0,2%) 
set Ymd=%date:~,4%%date:~5,2%%date:~8,2%%hh%
:: 数据库用户名，密码
set user=root
set password=root
set host=127.0.0.1
:: 需要备份的数据库名
set dbname=d_province
:: 保留的历史记录(天数)
set keepday=7
:: 当天备份的文件路径(如果每天只备份一次，可不需要该文件夹)
set path=D:\dbbackup\today
:: 历史备份文件路径
set path1=D:\dbbackup\history
:: MySQL安装路径
set mysqlpath=D:\Program Files (x86)\MySQL\mysql-5.6.21-winx64

:: forfiles使用绝对路径(是以文件修改时间为基准)
C:\Windows\System32\forfiles /p "%path1%" /m *.sql -d -%keepday% /c "cmd /c del /f @path"

:: 将上一次的备份文件移动到history文件夹下
move %path%\*.sql %path1%


:: 数据库备份脚本
"%mysqlpath%\bin\mysqldump" --opt --single-transaction=TRUE --user=%user% --password=%password% --host=%host% --protocol=tcp --port=3306 --default-character-set=utf8 --single-transaction=TRUE --routines --events "%dbname%" > "%path%\%dbname%_%Ymd%.sql"
@echo on
