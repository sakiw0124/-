@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo ���o�ؿ����h�ֲŦX��ܪ��ɮ׼ƶq, �¤�k��O�ɶ�
set directory=iconshock.com
::iconshock.com
set subdir_original=MATERIAL
::MATERIAL
set iconfile=..\..\..\ReviewIcon\filelist\!directory!\!subdir_original!.txt
cd ..\Icon\!directory!\!subdir_original!\
::�o�˪���k�|�[�JMACOSX�����ɮ�
::for /f "tokens=1" %%i in ('dir *.png/s^|find "���ɮ�"') do set total=%%i

set starttime=%time%
echo Start:!starttime!
for /R %%i IN (*.png) DO (
  set pathtemp=%%~si
  echo !pathtemp!
  set macflag=false
  for /F "usebackq tokens=1" %%i IN (`dir "!pathtemp!"^|find "__MACOSX"`) DO (
      set key=%%i
      echo !key!
      IF DEFINED key (
         set macflag=true
      )
  )
  IF !macflag! == false (
    set /A totalcnt=!totalcnt!+1
  )
)
set endtime=%time%
echo End:!endtime!
echo Total:!totalcnt!
pause