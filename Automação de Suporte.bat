@echo off
:menu

echo [1] - IP [RELEASE & RENEW]
echo [2] - Remover Atualizacoes da Impressora
echo [3] - SAIR!

choice /c 123 /N

IF errorlevel == 3 goto :sair
IF errorlevel == 2 goto :impressora 
IF errorlevel == 1 goto :rede

:: IP RELEASE E IP RENEW - RESTAURA AS CONFIGURAÇÕES DE REDE
:rede
ipconfig/release
ipconfig/renew
timeout /t 5
cls
goto menu


:: faz a remoção das atualizações que comprometem o funcionamento das impressoras.
:impressora
color 81

title DESINSTALANDO ATUALIZACOES QUE COMPROMETEM A IMPRESSORA
echo APERTE QUALQUER TECLA PARA PROSSEGUIR COM O PROCEDIMENTO
pause
echo -------------------------------
echo INICIANDO DESINSTALACAO DAS ATUALIZACOES
echo -------------------------------
timeout /t 3

title REMOCAO EM ANDAMENTO!
echo -------------------------------
echo REMOCAO EM ANDAMENTO!
echo -------------------------------
wusa /uninstall /kb:5005565

wusa /uninstall /kb:50006670

echo -------------------------------
echo REMOCAO FINALIZADA
echo -------------------------------
echo -------------------------------
echo REINICIE O COMPUTADOR!
echo -------------------------------

timeout /t 3
cls
goto menu


:: ENCERRA O PROGRAMA
:sair
echo -------------------------------
echo FECHANDO O PROGRAMA
echo -------------------------------
timeout /t 5
exit
