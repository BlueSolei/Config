@if not defined BatchVerbose (echo off)

rem run this script as administrator
if "%1"=="" (
	Tools\bin\Elevate.exe InstallSoftware.bat elevated
	exit /b %errorlevel%
)

echo Search for 'Chocolatey' package manager ...
where choco > null
if %errorlevel% NEQ 0 (
	echo 'Chocolatey' wasn't found. installing it...
	powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
) else (
	echo 'Chocolatey' package manager was found.
)

rem choco packages:
rem sharpkeys - mapping keys. used to map CapsLock to Esc for vim
echo.
echo Install choco packages:
choco install git python3 pip sharpkeys -y
choco upgrade all -y

rem c++ package manager. 
rem url: https://conanio.readthedocs.io/en/latest/introduction.html
pip install conan

rem semi-offical remote repository for conan packages, e.g. boost.
rem url: https://bincrafters.github.io/
conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan
