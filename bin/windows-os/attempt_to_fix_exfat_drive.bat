rem running chkdsk to attempt repair
chkdsk e: /f /r /x /v

rem "e" means the drive letter of the partition you want to repair
rem /f means fix any found errors
rem /r means recover any readable information from bad sectors
rem /x means volume will be dismounted before the utility begins a scan
rem /v means verbose (iI think)

rem running system file checker tool to repair missing or corrupted system files
sfc /scannow
