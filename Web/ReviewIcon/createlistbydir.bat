@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
::�ΨӲ��ͷs���@�Ӻ�����Ƨ����Ҧ�series���ɮײM��A�n����website��Ƨ��إ߰_��
::���Fwebsite.json�o���ɡA�٬O�ݭn�]dirpath���j��A���ϥ�website2.json�N�i�H���]�ٮɶ�

set dodirectory=Collection

for /d %%i IN (filelist\*) DO (
  set directory=%%i
  set directory=!directory:~9!
  echo !directory!
  set dirlist=filelist\!directory!\000_directory.json
  set dirpath=..\Icon\!directory!\*
  ::echo !dirpath!
  for /d %%i IN (!dirpath!) DO (
    set subdirtemp=%%i
    ::echo !subdirtemp!
    for /F "tokens=1-5 delims=\" %%i IN ('echo !subdirtemp!') DO set subdir_original=%%l
    set subdir=!subdir_original: =_!
    set series=!series!{"series":"!subdir!"},
    IF !directory! == !dodirectory! (
      call createfilelist.bat "!directory!" "!subdir_original!"
    )
  )

  set total=!total!{"website":"!directory!","series": [!series:~0,-1!]},
  set total2=!total2!{"website":"!directory!"},
  IF DEFINED series (
    echo [!series:~0,-1!] > !dirlist!
    ::�n�M�������ܼơA���M�|�@���[�[�[�W�h
    set series=!series:~0,0!
  ) ELSE echo [] > !dirlist!
)
IF DEFINED total (
  echo [!total:~0,-1!] > pathlist\website.json
) ELSE echo [] > pathlist\website.json
IF DEFINED total2 (
  echo [!total2:~0,-1!] > pathlist\website2.json
) ELSE echo [] > pathlist\website2.json
::�S��k�ѨM�r��2047������D
pause