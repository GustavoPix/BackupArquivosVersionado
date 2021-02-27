::Backup de pastas
::Criado por Gustavo Carvalho
::https://gustavo-carvalho.com


@echo off

::Local onde sera salvo os backups
set destination="C:\Users\gusta\Desktop\saida"


::pastas a serem salvas, colocar o numeral para identificar, o numeral comeca em 0
set folders[0].name=Name
set folders[0].source="C:\Users\gusta\Desktop\entrada\folder1"

::==================================================================================================
::Nao alterar a partir daqui
echo ==================Criando backups==================
echo.
echo.
echo.


setlocal EnableDelayedExpansion
for /f %%a in ('powershell -Command "Get-Date -format yyyy_MM_dd-HH_mm"') do set dateFolder=%%a

set /a i = 0
:loop
if defined folders[%i%].name (

    echo ==================!folders[%i%].name!==================
    mkdir %destination%\!folders[%i%].name!\%dateFolder%
    copy !folders[%i%].source!\* %destination%\!folders[%i%].name!\%dateFolder%
    echo ==================!folders[%i%].name!==================
    echo.

    set /a i=%i% + 1
    GOTO :loop
)

echo.
echo.
echo.
echo ==================Backup finalizado==================

