::�ڪ��D������浲�G��J�ѼƤF!
for /F "usebackq delims=." %%i IN (`route print^|find "�ѪO�q��"`) DO set interface=%%i
set interface=%interface:~1,2%
for /F "usebackq tokens=1-5" %%i IN (`route print^|find "10.0.2."`) DO set gateway=%%l
echo route delete 10.0.0.0 > "D:\Saki\Documents\My Work\19. �L�A��\����q��\99. �}�o����\robamroute.bat"
echo route add 172.18.0.0 mask 255.255.0.0 %gateway% if %interface% metric 59 >> "D:\Saki\Documents\My Work\19. �L�A��\����q��\99. �}�o����\robamroute.bat"
echo pause >> "D:\Saki\Documents\My Work\19. �L�A��\����q��\99. �}�o����\robamroute.bat"

call "D:\Saki\Documents\My Work\19. �L�A��\����q��\99. �}�o����\robamroute.bat"
pause