@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
::�ΨӲ��ͷs���@�Ӻ�����Ƨ����Ҧ�Style���ɮײM��A�n����website��Ƨ��إ߰_��
::���Fwebsite.txt�o���ɡA�٬O�ݭn�]dirpath���j��A���ϥ�website2.txt�N�i�H���]�ٮɶ�

set dodirectory=Fasticon.com

for /d %%i IN (filelist\*) DO (
  set directory=%%i
  set directory=!directory:~9!
  echo !directory!
  set dirlist=filelist\!directory!\000_directory.txt
  set dirpath=..\Icon\!directory!\*
  ::echo !dirpath!
  for /d %%i IN (!dirpath!) DO (
    set subdirtemp=%%i
    ::echo !subdirtemp!
    for /F "tokens=1-5 delims=\" %%i IN ('echo !subdirtemp!') DO set subdir_original=%%l
    set subdir=!subdir_original: =_!
    set styles=!styles!{"style":"!subdir!"},
    IF !directory! == !dodirectory! (
      call createfilelist.bat "!directory!" "!subdir_original!"
    )
  )

  set total=!total!{"website":"!directory!","styles": [!styles:~0,-1!]},
  set total2=!total2!{"website":"!directory!"},
  IF DEFINED styles (
    echo [!styles:~0,-1!] > !dirlist!
    ::�n�M�������ܼơA���M�|�@���[�[�[�W�h
    set styles=!styles:~0,0!
  ) ELSE echo [] > !dirlist!
)
IF DEFINED total (
  echo [!total:~0,-1!] > pathlist\website.txt
) ELSE echo [] > pathlist\website.txt
IF DEFINED total2 (
  echo [!total2:~0,-1!] > pathlist\website2.txt
) ELSE echo [] > pathlist\website2.txt
::�S��k�ѨM�r��2047������D
pause