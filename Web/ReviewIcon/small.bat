@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo �ܼƤ��ܼ�
for %%i in (*) do (
    set A-%%i=%%i
    echo !A-%%i:~0,-2!
)

echo �P�_�r��O�_����
IF DEFINED total (
  echo ���O�Ū�
) ELSE (
  echo �Ū�
)
pause