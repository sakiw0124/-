@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
::���ͤ@��website+style�ɮײM��A���e���O�o��style�w�g�s�b000_directory.txt�̭�

set directory=VistaIcons.com
set subdir_original=AeroVista
set iconfile=..\..\..\ReviewIcon\filelist\!directory!\!subdir_original!.txt
cd ..\Icon\!directory!\!subdir_original!\
::�Ĥ@���X���h���ɮ�,�~����}�����g�P50�ӥH���զr��g
for /R %%i IN (*.png) DO (
  set pathtemp=%%~si
  set macflag=false
  for /F "usebackq tokens=1" %%i IN (`dir "!pathtemp!"^|find "__MACOSX"`) DO (
      set key=%%i
      IF DEFINED key (
         set macflag=true
      )
  )
  IF !macflag! == false (
    set /A totalcnt=!totalcnt!+1
  )
)
set /A directcnt=!totalcnt!-50

echo [ > !iconfile!
for /R %%i IN (*.png) DO (
  set pathtemp=%%~si

  ::���nMAC�ɮ׶i��, �쥻�n��è�O
  set macflag=false
  for /F "usebackq tokens=1" %%i IN (`dir "!pathtemp!"^|find "__MACOSX"`) DO (
      set key=%%i
      echo !key!
      IF DEFINED key (
         set macflag=true
      )
  )
  IF !macflag! == false (
    ::���i�H��path, �Ĩ������ܼƪ��p�F
    set filepath=!pathtemp:Z:\Picture\����=..!
    set filepath=!filepath:\=/!
    set file=%%~nxi
    IF !cnt! LEQ !directcnt! (
      echo {"header":"!file!","path":"!filepath!"}, >> !iconfile!
    ) ELSE (
      ::���i�H��path, �Ĩ������ܼƪ��p�F
      set filedata=!filedata!{"header":"!file!","path":"!filepath!"},
    )
    set /A cnt=!cnt!+1
  )
)
IF DEFINED filedata (
  echo !filedata:~0,-1! >> !iconfile!
)
echo ] >> !iconfile!
::�S��k�ѨM�r��2047������D
pause