@echo on
ipconfig
pause
ipconfig /flushdns
pause
ipconfig /release *con*
ipconfig /renew
pause
