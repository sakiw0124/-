@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
::���[�W�����F��A���U�ܼƳB�z�|�a���A�ܼƭn�אּ!!
set file=pathlist\website.txt
echo [ > %file%
for /d %%i IN (filelist\*) DO (
  set A=%%i
  set directory=..\Icon\!A:~9!\*
  echo !directory!
  for /d %%i IN (!directory!) DO (
    set subdirtemp=%%i
    echo !subdirtemp!
    for /F "tokens=1-5 delims=\" %%i IN ('echo !subdirtemp!') DO set subdir=%%l
    set subdir=!subdir: =_!
    set iconfile=filelist\!A:~9!\!subdir!.txt
    echo [{"header":"add1.png","path":"../Icon/customicondesign.com/customicondesign-office1-reflection/png/add1.png","classid":"col_img_size256"}] > !iconfile!
    set styles=!styles!{"style":"!subdir!"},
  )
  set total=!total!{"website":"!A:~9!","styles": [!styles:~0,-1!]},
  ::�n�M�������ܼơA���M�|�@���[�[�[�W�h
  set styles=!styles:~0,0!
)
echo !total:~0,-1! >> %file%
echo ] >> %file%
::��u���T�ӰաA���h�ìO�r�꦳����Acustomicondesign.com�̭��Ӧh�F��F
pause