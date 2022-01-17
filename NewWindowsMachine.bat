@if not defined BatchVerbose (echo off)

rem run this script as administrator
if "%1"=="" (
	powershell start -verb runas '%0' AmAdmin 
	exit /b 
)

rem ** Chocolatey
echo Search for 'Chocolatey' package manager ...
where choco > null
if %errorlevel% NEQ 0 (
	echo 'Chocolatey' wasn't found. installing it...
	powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
) else (
	echo 'Chocolatey' package manager was found.
)

rem Phase 1
choco feature enable -n allowGlobalConfirmation

rem choco packages:
rem sharpkeys - mapping keys. used to map CapsLock to Esc for vim
echo.
echo Install choco packages:
choco install git python3 GoogleChrome jetbrainstoolbox vscode mobaxterm tortoisegit microsoft-windows-terminal
choco upgrade all 

rem Phase 2
rem ** Conan
rem c++ package manager. 
rem url: https://conanio.readthedocs.io/en/latest/introduction.html
rem pip install conan

rem ** Gui for bash
rem how to add gui to bash at windows 10
rem  	https://www.pcworld.com/article/3055403/windows/windows-10s-bash-shell-can-run-graphical-linux-applications-with-this-trick.html
rem curl -o %temp%\Xming-6-9-0-31-setup.exe https://iweb.dl.sourceforge.net/project/xming/Xming/6.9.0.31/Xming-6-9-0-31-setup.exe
rem %temp%\Xming-6-9-0-31-setup.exe
