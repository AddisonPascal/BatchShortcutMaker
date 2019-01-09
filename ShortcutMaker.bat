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
::if "%shortcutType%"=="2" goto fileShortcut
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
echo Address:
set /p address= "--> "
echo Shortcut Name: 
set /p name="--> "
echo. 
echo Would you like to sto