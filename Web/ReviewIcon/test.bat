@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo �ն]���ͤ@��website+style�ɮײM��
set directory=customicondesign.com
::iconspedia.com
set subdir_original=customicondesign-flatastic4
::Archigraphs_Comic
set iconfile=..\..\..\ReviewIcon\filelist\!directory!\!subdir_original!.txt
cd ..\Icon\!directory!\!subdir_original!\
::�o�˪���k�|�[�JMACOSX�����ɮ�
::for /f "tokens=1" %%i in ('dir *.png/s^|find "���ɮ�"') do set total=%%i
::�⦸�j��w���ܺC
for /R %%i IN (*.png) DO (
  set pathtemp=%%~si
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
echo Total:!totalcnt!

set /A directcnt=!totalcnt!-50
echo !directcnt!

echo [ > !iconfile!
for /R %%i IN (*.png) DO (
  set pathtemp=%%~si
  echo !pathtemp!

  ::���nMAC�ɮ׶i��, �쥻�n��è�O
  set macflag=false
  for /F "usebackq tokens=1" %%i IN (`dir "!pathtemp!"^|find "__MACOSX"`) DO (
      set key=%%i
      echo !key!
      IF DEFINED key (
         set macflag=true
      )
  )
  echo !macflag!
  IF !macflag! == false (
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
echo !cnt!
echo ] >> !iconfile!
::�S��k�ѨM�r��2047������D
pause