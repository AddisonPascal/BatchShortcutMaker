@echo off
title Batch Shortcut Maker v0.1
goto home

:home
cls
echo 1= Make Shortcut
echo 2= Exit
set/p option="--> "
if "%option%"=="1" goto makeShortcut
exit

:makeShortcut
cls
echo Pick a type of shortcut: 
echo 1= Internet Shortcut
::echo 2= File Shortcut
set /p shortcutType= "--> "
if "%shortcutType%"=="1" goto internetShortcut
if "%shortcutType%"=="2" goto fileShortcut
goto makeShortcut

:internetShortcut
cls
echo Address:
set/p address= "--> "
echo Shortcut Name: 
set/p name="--> "
(
@echo off
echo start iexplore "%address%"
)>"%name%.link.bat"
cls
echo Done!
echo Press any key to exit. 
pause>nul
exit

:fileShortcut
cls
echo Address (no quotes):
set /p address= "--> "
echo Shortcut Name: 
set /p name="--> "
echo Would you like to automatically store backups of the target of this shortcut? Folders within folders will not be backed up.
echo 1= Yes
echo 2= No
set/p backupSet="--> "
set backup=false
if "%backupSet%"=="1" set backup=true
if not exist "%address%" (
echo Warning! File does not exist. However, link will still be created.
pause
)
set linkID=%random%%random%%random%
md "%appdata%\BatchShortcutMaker"
md "%appdata%\BatchShortcutMaker\%linkID%"
(
@echo off
echo @echo off
echo title %name% - Shortcut
echo md "%appdata%\BatchShortcutMaker"
echo if not exist "%address%" goto notexist
echo explorer "%address%"
echo if %backup%==false exit
echo cls
echo Backing up file, please wait...
echo rd /s /q "%appdata%\BatchShortcutMaker\%linkID%"
echo md "%appdata%\BatchShortcutMaker\%linkID%"
echo copy "%address%" "%appdata%\BatchShortcutMaker\%linkID%"
echo exit
echo :notexist
echo cls
echo echo File not found. 
echo if exist "%appdata%\BatchShortcutMaker\%linkID%" (
echo echo Backup was found!
echo echo Open backup?
echo pause
echo explorer "%appdata%\BatchShortcutMaker\%linkID%"
echo exit
echo ^)
echo echo Sorry, backup was not found. 
echo pause
echo exit
)>"%name%.link.bat"
cls
echo Done!
echo Press any key to exit...
pause>nul
exit