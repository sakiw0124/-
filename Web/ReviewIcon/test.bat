@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for %%i in (*) do (
    set A-%%i=%%i
    echo !A-%%i:~0,-2!
)

::Z:\Picture\����\Icon\customicondesign.com\customicondesign-cute1\PNG\96\unlock.png

set directory=VistaIcons.com
set subdir_original=World_Cup_2006_Tux
set iconfile=..\..\..\ReviewIcon\filelist\!directory!\!subdir_original!.txt
cd ..\Icon\!directory!\!subdir_original!\
for /R %%i IN (*.png) DO (
  set pathtemp=%%~si
  echo !pathtemp!
  set macflag=false
  ::���nMAC�ɮ׶i��
  for /F "tokens=1-10 delims=\" %%i IN ("!pathtemp!") DO (
    IF %%i == __MACOSX set macflag=true
    IF %%j == __MACOSX set macflag=true
    IF %%k == __MACOSX set macflag=true
    IF %%l == __MACOSX set macflag=true
    IF %%m == __MACOSX set macflag=true
    IF %%n == __MACOSX set macflag=true
    IF %%o == __MACOSX set macflag=true
    IF %%p == __MACOSX set macflag=true
    IF %%q == __MACOSX set macflag=true
    IF %%r == __MACOSX set macflag=true
  )
  echo !macflag!
  IF !macflag! == false (
  echo in
  set path=!pathtemp:Z:\Picture\����=..!
  set path=!path:\=/!
  set file=%%~nxi
  set filedata=!filedata!{"header":"!file!","path":"!path!"},
  set /A cnt=!cnt!+1
  )
)
IF DEFINED filedata (
  echo [!filedata:~0,-1!] > !iconfile!
  echo !cnt!
) ELSE echo [] > !iconfile!
::�S��k�ѨM�r��2047������D
pause

::call createfilelist.bat "!directory!" "!subdir_original!"