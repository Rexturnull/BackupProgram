@echo off
setlocal enabledelayedexpansion

color 0a



echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo "______            _                 ______                                    " 
echo "| ___ \          | |                | ___ \                                   " 
echo "| |_/ / __ _  ___| | ___   _ _ __   | |_/ / __ ___   __ _ _ __ __ _ _ __ ___  " 
echo "| ___ \/ _\`|/ __| |/ / | | | '_ \  |  __/ '__/ _ \ / _\`| '__/ _\`| '_ \`_  \" 
echo "| |_/ / (_| | (__|   <| |_| | |_) | | |  | | | (_) | (_| | | | (_| | | | | | |" 
echo "\____/ \__,_|\___|_|\_\\__,_| .__/  \_|  |_|  \___/ \__, |_|  \__,_|_| |_| |_|" 
echo "                            | |                      __/ |                    " 
echo "                            |_|                     |___/                     " 
echo "                                                                              " 
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo .
echo ================================robocopy version================================
echo .
echo .
echo 1) You should put this bat file on the source directory!!!.
echo 2) Enter the target Destination to Start Backup Program.
echo 3) Enter 'exit' to Exit the program.
echo .


:inputLoop
echo Current directory : %CD%
echo .
set /p targetDestination=Enter the target Destination (e.g., C:/): 

if "!targetDestination!"=="" (
    echo Target path is required. Please enter a valid target path.
    goto inputLoop
)

if "!targetDestination!"=="exit" (
    echo Exiting the Backup program... Bye~~~
	exit /b
)

if not exist "!targetDestination!\" (
    echo The specified path does not exist. Please enter a valid path.
	echo .
    goto inputLoop
)
echo .
echo ===== Start your backup at %date% %time% =====
echo .
echo %CD% back up to !targetDestination!...
robocopy . !targetDestination! /MIR /R:5 /W:3 /MT:100 *.*
echo ===== End Differential backup at %date% %time% =====
echo Enter 'exit' to Exit the program.
echo .

goto inputLoop



PAUSE