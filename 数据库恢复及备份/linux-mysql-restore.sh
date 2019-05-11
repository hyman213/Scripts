#!/bin/bash
dbuser=root
dbpassword=root
dbpath=/data/today
dbpath1=/data/history
# mysql的安装根目录
mysqlpath=/usr
# 记录日志
logFile=${dbpath1}/record.log
dbname=
DATE=`date +%Y%m%d%H`
# 需要删除的历史数据库文件
startday=`date +%Y%m%d -d "15 days ago"`
sqlbackname=${dbname}_${DATE}.sql
if [ -f "${dbpath}/$sqlbackname" ];then
	${mysqlpath}/bin/mysql -u${dbuser} -p${dbpassword} ${dbname} < ${dbpath}/${dbname}_${DATE}.sql 
	echo "${DATE}  ${dbpath}/${dbname}_${DATE}.sql restored" >> ${logFile}
	mv -f ${dbpath}/${dbname}_${DATE}.sql ${dbpath1}
else
	echo "${DATE}  ${dbpath}/${dbname}_${DATE}.sql not found." >> ${logFile}
fi

echo "${DATE}   ATTEMP TO DELETE ${dbpath1}/${dbname}_${startday}*.sql" >> ${logFile}
find ${dbpath1}/ -name ${dbname}_${startday}*.sql | xargs rm -f




