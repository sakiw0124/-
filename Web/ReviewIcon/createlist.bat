@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
::���[�W�����F��A���U�ܼƳB�z�|�a���A�ܼƭn�אּ!!
::��bat�s�X�@�w�n�OANSI�A�����ͪ�txt�]�|�OANSI�A����Y�D�^�ơA�|�y���ýX
set file=pathlist\website.txt
echo [ > %file%
for /d %%i IN (filelist\*) DO (
  set directory=%%i
  set directory=!directory:~9!
  echo !directory!
  set dirlist=filelist\!directory!\000_directory.txt
  set path=..\Icon\!directory!\*
  ::echo !path!
  for /d %%i IN (!path!) DO (
    set subdirtemp=%%i
    echo !subdirtemp!
    for /F "tokens=1-5 delims=\" %%i IN ('echo !subdirtemp!') DO set subdir_original=%%l
    set subdir=!subdir_original: =_!
    set styles=!styles!{"style":"!subdir!"},

    call createfilelist.bat "!directory!" "!subdir_original!"

  )
  set total=!total!{"website":"!directory!","styles": [!styles:~0,-1!]},
  echo [!styles:~0,-1!] > !dirlist!
  ::�n�M�������ܼơA���M�|�@���[�[�[�W�h
  set styles=!styles:~0,0!
)
echo !total:~0,-1! >> %file%
echo ] >> %file%
::�S��k�ѨM�r��2047������D
pause