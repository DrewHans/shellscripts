rem running chkdsk to attempt repair
chkdsk e: /f /r /x

rem "e" means the drive letter of the partition you want to repair
rem /f is running to fix any found errors
rem /r is running to locate for bad sectors and recover any readable information
rem /x is running to force the volume you're about to check to be dismounted before the utility begins a scan

rem running system file checker tool to repair missing or corrupted system files
sfc /scannow
