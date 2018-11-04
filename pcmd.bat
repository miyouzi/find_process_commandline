@mode con cols=63 lines=200
@echo off
chcp 65001 >nul
title 查询进程命令参数v1.0 By 米柚子
if "%~1"=="" (
	echo 【没有输入待查询的进程名，3s后退出】
	choice /t 3 /d 9 /c 98 /n >nul
	exit
	)
set "var=%~1"
set "var2=%~2"
call :getadmin
REM 精确查询
REM wmic process where caption="%var%" get caption,commandline /value
REM 模糊查询
if "%var2%"=="" (
	REM 默认查询以关键字开头的进程
	wmic process where "(caption LIKE '%var%%%')" get caption,commandline /value
	) else (
	REM 存在第二参数查询则包含关键字的进程
	wmic process where "(caption LIKE '%%%var%%%')" get caption,commandline /value
	)

echo 【查询结束，按任意键退出】
pause >nul
exit


REM =============================检查并尝试获取管理员权限==============================
REM 借鉴 https://sites.google.com/site/eneerge/home/BatchGotAdmin
:getadmin
	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if '%errorlevel%' NEQ '0' (
		echo 【正在尝试获取管理员权限】
		mshta vbscript:"<html style=background:buttonface><title>BatchGetAdmin</title><body><script language=vbscript>Set UAC = CreateObject(""Shell.Application""):UAC.ShellExecute ""%~s0"", ""%var% %var2%"", """", ""runas"", 1:self.close</script></body></html>"
		exit
	)
goto :eof
REM ==================================================================================