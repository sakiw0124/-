route print|find "10.0.2"
route print|find "�ѪO�q��"
::�ڤ����D��?����浲�G��J�ܼơA�u�n��ܥX�ӵ��Akey
set /p i=�п�Jinterface:
set /p g=�п�Jgateway:
echo route delete 10.0.0.0 > "D:\Saki\Documents\My Work\19. �L�A��\����q��\99. �}�o����\robamroute.bat"
echo route add 172.18.0.0 mask 255.255.0.0 %g% if %i% metric 59 >> "D:\Saki\Documents\My Work\19. �L�A��\����q��\99. �}�o����\robamroute.bat"
echo pause >> "D:\Saki\Documents\My Work\19. �L�A��\����q��\99. �}�o����\robamroute.bat"
pause