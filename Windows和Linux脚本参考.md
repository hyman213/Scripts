# Windows和Linux脚本

> 持续更新。记录工作过程中使用到的脚本，以作为日后的参考

## 1. Windows环境

### 1-1. 语法注意点

#### 1-1-1. 添加注释

- REM/rem
- ::

### 1-1. 获取日期时间

日期截取遵从格式` %date:~x,y%`，表示从第x位开始，截取y个长度(x,y的起始值为0)

时间截取遵从格式`%time:~x,y%`，表示从第x位开始，截取y个长度(x,y的起始值为0)

```dos
:: @echo off 表示不回显执行的命令  
@echo off   
@echo =========Windows的原本日期时间格式=======================  
:: 设置变量，使用变量时需要用一对%包起来  
set ORIGINAL_DATE=%date%   
echo %ORIGINAL_DATE%  

@echo =========日期时间按照YYYY-MM-DD HH:MM:SS格式显示=========  
set CURRENT_DATE_TIME=%date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%    
echo %CURRENT_DATE_TIME%   
pause 
```

## 2. 常用脚本-win

### 2-1. 修改文件的创建和修改时间
```dos
rem 修改文件的创建时间和修改时间
@ECHO OFF
powershell.exe -command "ls 'fold_path\*.*' | foreach-object { $_.LastWriteTime = '2019-05-06 12:55:00' ; $_.CreationTime = '2018/01/01 19:00:00' }"
PAUSE
```

## 3. Linux环境

### 3-1. 获取日期时间

```bash
echo "show date time like format: YYYY-MM-DD HH:MM:SS"  
NOW_DATE_TIME=$(date "+%Y-%m-%d %H:%M:%S")  
echo $NOW_DATE_TIME
echo "====================================================="  

# years,months,days,hours,minutes,seconds
echo "show last day:"  
LAST_DAY=$(date "+%Y-%m-%d %H:%M:%S" --date="-1 days")  
echo $LAST_DAY  
echo "====================================================="  
```





































