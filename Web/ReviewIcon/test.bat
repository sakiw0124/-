@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for %%i in (*) do (
    set A-%%i=%%i
    echo !A-%%i:~0,-2!
)

::Z:\Picture\����\Icon\customicondesign.com\customicondesign-cute1\PNG\96\unlock.png

set directory=Double-JDesign
set subdir_original=Button Fest
set iconfile=..\..\..\ReviewIcon\filelist\!directory!\!subdir_original!.txt
cd ..\Icon\!directory!\!subdir_original!\
for /R %%i IN (*.png) DO (
  set pathtemp=%%i
  set path=!pathtemp:Z:\Picture\����=..!
  set path=!path:\=/!
  set file=%%~nxi
  set filedata=!filedata!{"header":"!file!","path":"!path!"},
)
echo [!filedata:~0,-1!] > !iconfile!
::�S��k�ѨM�r��2047������D
pause

call createfilelist.bat "!directory!" "!subdir_original!"