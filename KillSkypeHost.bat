REM --> Check for permissions

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"

echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"

exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"

@ECHO OFF
ECHO
takeown /f "C:\Program Files\WindowsApps\Microsoft.Messaging_2.12.15004.0_x86__8wekyb3d8bbwe\SkypeHost.exe"
icacls "C:\Program Files\WindowsApps\Microsoft.Messaging_2.12.15004.0_x86__8wekyb3d8bbwe\SkypeHost.exe" /grant administrators:f
move "C:\Program Files\WindowsApps\Microsoft.Messaging_2.12.15004.0_x86__8wekyb3d8bbwe\SkypeHost.exe" "%userprofile%\desktop"
ren "%userprofile%\desktop\SkypeHost.exe" "SkypeHost3.exe"
del "%userprofile%\desktop\SkypeHost3.exe"
pause