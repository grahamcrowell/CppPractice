@echo off

set /p repo_name="Repo Name: "

REM copy repo_name to clipboard
powershell -command "& {&'Set-Clipboard' %repo_name%}"

REM create repo directory
md "../%repo_name%"
cd "../%repo_name%"

REM create repo on github
REM explorer "https://github.com/new"
REM pause

REM create repo
REM git init
REM echo # %repo_name% >> README.md
REM git add README.md
REM git commit -m "first commit"
REM git remote add origin https://github.com/grahamcrowell/%repo_name%.git
REM git push -u origin master

REM copy template files
copy "../VS-Code-Cpp-Template/build.bat" "build.bat"
md .vscode
REM cd .vscode
REM copy "%~dp0/.vscode/*.*" "."
echo %~dp0
echo %cd%
copy %~dp0vscode/*.* "%cd%/.vscode"
dir
REM cd "../VS-Code-Cpp-Template"


REM git add .
REM git commit -m"commit comment"
REM git push -u origin master
REM git pull origin master


