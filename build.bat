@echo off

REM delete old files (force a full recompile each build)
echo CLEANING...
DEL /F main.exe
DEL /F main.ilk
DEL /F main.obj
DEL /F main.pbd

echo BUILDING...
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64     
set compilerflags=/Od /Zi /EHsc
set linkerflags=/OUT:main.exe
cl.exe %compilerflags% main.cpp /link %linkerflags%

echo RUNNING...
start main.exe
main.exe < stdin.txt
call main.exe < stdin.txt