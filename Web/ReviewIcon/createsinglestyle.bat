@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
::���ͤ@��website+series�ɮײM��A���e���O�o��series�w�g�s�b000_directory.json�̭�

set directory=Collection
set subdir_original=diagram
set iconfile=..\..\..\ReviewIcon\filelist\!directory!\!subdir_original!.json
cd ..\Icon\!directory!\!subdir_original!\
::�Ĥ@���X���h���ɮ�,�~����}�����g�P50�ӥH���զr��g
for /F "usebackq tokens=1" %%i IN (`dir /S/B *.png^|find /V "__MACOSX"`) DO (
  set /A totalcnt=!totalcnt!+1
)
set /A directcnt=!totalcnt!-50

echo [ > !iconfile!
for /F "usebackq delims=" %%i IN (`dir /S/B *.png^|find /V "__MACOSX"`) DO (
  echo %%~si
  ::�bD�ѤU��ԣ�N����εu���|�O
  set pathtemp=%%~si
  ::���i�H��path, �Ĩ������ܼƪ��p�F�A�U�������|�ƻs����N�����ק�
  set filepath=!pathtemp:D:\Saki\Pictures\����=..!
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

IF DEFINED filedata (
  echo !filedata:~0,-1! >> !iconfile!
)
echo ] >> !iconfile!
::�H�W�i�H�ѨM�r��2047������D�]���j�p�Τ��P�覡�g�Jjson�^
pause