rem Shortcut files should not exist
rem outside of the Start Menu (imho).
rem
rem This cmd will find all files with
rem extension .lnk and dump them into 
rem all_shortcuts.txt
cls

dir /s/b *.lnk >> all_shortcuts.txt