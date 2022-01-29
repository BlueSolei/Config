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
choco install git python3 GoogleChrome jetbrainstoolbox vscode mobaxterm tortoisegit microsoft-windows-terminal adobereader winscp docker-desktop LinkShellExtension asciidoctorj
rem install cmake and add it to the path
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=User'
choco upgrade all 

