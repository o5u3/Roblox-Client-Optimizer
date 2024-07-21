:: don't mind the ugly code, this was one of my first projects

@echo off
mode 128, 35
title [RCO] Roblox Client Optimizer

echo Locating Roblox...
:: Bloxstrap
if exist "%localappdata%\Bloxstrap\*" (
for /d %%i in ("%localappdata%\Bloxstrap\*") do (
if exist "%%i\ClientSettings" (
    set folder=%%i
    set "rbxdir=Bloxstrap"
    goto retrievefiles
)
)
)

:: Local AppData
if exist "%localappdata%\Roblox\Versions\*" (
for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
if exist "%%i\RobloxPlayerBeta.exe" (
    set folder=%%i
    set "rbxdir=Local AppData"
    goto retrievefiles
)
)
)

:: Program Files
if exist "C:\Program Files\Roblox\Versions\*" (
for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
if exist "%%i\RobloxPlayerBeta.exe" (
    set folder=%%i
    set "rbxdir=Program Files"
    goto retrievefiles
)
)
)

:: Program Files (x86)
if exist "C:\Program Files (x86)\Roblox\Versions\*" (
for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
if exist "%%i\RobloxPlayerBeta.exe" (
    set folder=%%i
    set "rbxdir=Program Files (x86)"
    goto retrievefiles
)
)
)

:: If it can't find neither of these directories, it'll ask for the directory location.
if not exist "%~dp0\settings\robloxdirectory.txt" (
cls
echo Please paste the location of your Roblox folder.
echo.
echo Example: C:\Users\kiwi\AppData\Local\Roblox\Versions\version-56038h23a21
echo.
echo.
set /p folder=

cls

echo Saving folder directory...
if not exist "%~dp0\settings" (
mkdir "%~dp0\settings"
if exist "%folder%\RobloxPlayerBeta.exe" (
    echo %folder%>"%~dp0\settings\robloxdirectory.txt"
) else (
    cls
    echo RobloxPlayerBeta.exe was not found in this directory, try again or make sure the directory has RobloxPlayerBeta.exe
    pause
    rmdir "%~dp0\settings" /s /q
    goto versionchecker
)
)
)

cls

for /f "tokens=*" %%A in (
    settings\robloxdirectory.txt
    ) do (
    set folder=%%A
)

if not exist "%folder%\RobloxPlayerBeta.exe" (
    cls
    echo RobloxPlayerBeta.exe was not found in this directory, your Roblox may have updated.
    pause
    rmdir "%~dp0\settings" /s /q
    goto versionchecker
) else (
    cls
    echo Roblox directory found.
    echo.
    echo %folder%
)

:retrievefiles
cls
echo Retrieving files...
if not exist "%~dp0\Tweaks" (
    mkdir "%~dp0\Tweaks"
)
if exist "%TEMP%\rcoupdfix.cmd" (
    del "%TEMP%\rcoupdfix.cmd"
)
if not exist "%~dp0\Backup" (
    mkdir "%~dp0\Backup"
    if exist "%folder%\ClientSettings" (
    if exist "%folder%\ClientSettings\ClientAppSettings.json" (
        pushd "%folder%\ClientSettings"
            copy "ClientAppSettings.json" "%~dp0\Backup"
        popd
    )
    )
)
goto main

:backupfiles
echo Creating a backup on current FFlags...
if exist "%folder%\ClientSettings" (
    if exist "%folder%\ClientSettings\ClientAppSettings.json" (
        pushd "%folder%\ClientSettings"
            copy "ClientAppSettings.json" "%~dp0\Backup"
        popd
    ) else (
        echo You currently have no FFlags applied.
        pause
    )
)
goto main

:backupanyway
set /p answr="[Y/N]: "
if "%answr%"=="y" goto backupfiles
if "%answr%"=="n" goto main
echo Not a valid option.
echo.
pause
goto backupanyway

:main
mode 65, 52
cls
echo.
echo ^| ---------------------INFO-------------------- ^|
echo ^|         Discord: discord.gg/CZUfHYHtZr        ^|
echo.^|                                               ^|
echo.^|         Roblox Directory: %rbxdir%
echo ^|-----------------------------------------------^|
echo.^|          Roblox Client Optimizations          ^|
echo.^|                                               ^|
echo ^|               [1] High Graphics               ^|
echo.^|                                               ^|
echo ^|   [2] Balanced Graphics  [3] Potato Graphics  ^|
echo.^|                                               ^|
echo ^| --------------------MISC--------------------- ^|
echo.^|                                               ^|
echo ^|           [4] Import ClientSettings           ^|
echo.^|                                               ^|
echo ^|           [5] Export ClientSettings           ^|
echo.^|                                               ^|
echo ^|      [backup] Backup Current ClientSettings   ^|
echo.^|                                               ^|
echo ^|         [revert] Revert ClientSettings        ^|
echo.^|                                               ^|
echo ^| --------------------PAGES-------------------- ^|
echo.^|                                               ^|
echo ^|         [logs] View Latest Update Logs        ^|
echo.^|                                               ^|
echo ^|        [presets] View Community Presets       ^|
echo.^|                                               ^|
echo ^|       [fflags] FFlags Optimization Docs       ^|
echo.^|                                               ^|
echo ^| --------------------------------------------- ^|
echo.^|                                               ^|
echo ^|               Rewritten by Kiwi               ^|
echo.^|                                               ^| 
echo ^|               Copyright Kaiddd.               ^|
echo.^|                                               ^|
echo ^| --------------------------------------------- ^|
echo.
echo.

set /p ans="Enter Option: "
if "%ans%" == "1" (
    goto optimizerblx3
)
if "%ans%" == "2" (
    goto optimizerblx1
)
if "%ans%" == "3" (
    goto optimizerblx2
)
if "%ans%" == "4" (
    goto customfflags
)
if "%ans%" == "5" (
    goto exportfflags
)
if "%ans%" == "fflags" (
    start "" "https://github.com/o5u3/Roblox-Client-Optimizer/tree/performance-fflags"
    goto main
)
if "%ans%" == "revert" (
    goto revert
)
if "%ans%" == "backup" (
    if exist "%~dp0\Backup" (
        if exist "%~dp0\Backup\*.json" (
            mode 128, 35
            cls
            echo FFlags already backed up.
            echo.
            echo Would you like to continue backing up anyway?
            echo.
            echo - THIS WILL OVERWRITE YOUR BACKUP FILE WITH WHATEVER FFLAGS YOU CURRENTLY HAVE ON -
            echo.
            goto backupanyway
        )
    )
)
if "%ans%" == "upd" (
    goto updfflags
)
if "%ans%" == "logs" (
    goto logs
)
if "%ans%" == "presets" (
    goto communitypresets
)
if "%ans%" == "folder" (
    cls
    if exist "%folder%\ClientSettings" (
        start "" "%folder%\ClientSettings"
    ) else (
        start "" "%folder%"
    )
    goto main
)
if "%ans%" == "0" (
    goto exit
)
echo Enter a valid option.
pause
goto main

:communitypresets
mode 65, 52
cls
echo.
echo ^| --------------------------------------------- ^|
echo ^|               Community Presets               ^|
echo ^|  Presets made by the community to boost fps.  ^|
echo.^|                                               ^|
echo.^|   Want your preset added? ^Ping the developer  ^|
echo ^|-----------------------------------------------^|
echo.^|                                               ^|
echo ^|              [bhaggo] @BhaggoYT               ^|
echo.^|                                               ^|
echo ^|      [ogrco] OG Roblox Client Optimizer       ^|
echo.^|                                               ^|
echo ^| --------------------PAGES-------------------- ^|
echo.^|                                               ^|
echo ^|         [back] Returns to previous page       ^|
echo.^|                                               ^|
echo ^| --------------------------------------------- ^|
echo.^|                                               ^|
echo ^|               Rewritten by Kiwi               ^|
echo.^|                                               ^| 
echo ^|               Copyright Kaiddd.               ^|
echo.^|                                               ^|
echo ^| --------------------------------------------- ^|
echo.
echo.

set /p ans="Enter Option: "
if "%ans%" == "bhaggo" (
    goto bhaggofflags
)
if "%ans%" == "ogrco" (
    goto mainpg2
)
if "%ans%" == "back" (
    goto main
)
echo Enter a valid option.
pause
goto communitypresets

:bhaggofflags
mode 65, 55
cls
echo.
echo.* * * * * * * * * * * * * * * * * * * * * * * * * * 
echo.*                                                 *
echo.*            BHAGGO'S FFLAGS (@BhaggoYT)          *
echo.*                                                 *
echo *    [1] Max Graphics  [2] Max FPS (with GPU)     *
echo.*                                                 *
echo *            [3] Max FPS (without GPU)            *
echo.*                                                 *
echo.*                                                 *
echo * *********************EXTRAS******************** *
echo.*                                                 *
echo *       [discord] Bhaggo's Discord Server         *
echo.*                                                 *
echo *                [back] Main Page                *
echo.*                                                 *
echo * *********************************************** *
echo.*                                                 *
echo *                Rewritten by Kiwi                *
echo.*                                                 *
echo.*                 Copyright Kaiddd.               *
echo.*                                                 *
echo * *********************************************** *
echo.

set /p ans="Enter Option: "
if "%ans%" == "1" (
    goto bhaggooptimizerblx1
)
if "%ans%" == "2" (
    goto bhaggooptimizerblx2
)
if "%ans%" == "3" (
    goto bhaggooptimizerblx3
)
if "%ans%" == "discord" (
    cls
    echo.
    echo discord.gg/kmpxvVwS4z
    echo.
    pause
    goto bhaggofflags
)
if "%ans%" == "back" (
    goto communitypresets
)
echo Enter a valid option.
pause
goto bhaggofflags

:logs
mode 65, 25
cls
echo Fetching latest update logs...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/version/banaenae', 'updlogs.txt')"
cls
echo 8888888b.    .d8888b.    .d88888b.  
echo 888   Y88b  d88P  Y88b  d88P" "Y88b 
echo 888    888  888    888  888     888 
echo 888   d88P  888         888     888 
echo 8888888P"   888         888     888"
echo 888 T88b    888    888  888     888 
echo 888  T88b   Y88b  d88P  Y88b. .d88P 
echo 888   T88b   "Y8888P"    "Y88888P"  
echo.
type updlogs.txt
del updlogs.txt
echo.
pause
goto main

:mainpg2
mode 65, 52
cls
echo.
echo ^| ---------------------INFO-------------------- ^|
echo ^|         Discord: discord.gg/CZUfHYHtZr        ^|
echo.^|                                               ^|
echo.^|         Roblox Directory: %rbxdir%
echo ^|-----------------------------------------------^|
echo.^|                                               ^|
echo ^|  [1] Balanced Graphics  [2] Performance ^Mode ^|
echo.^|                                               ^|
echo ^| -------------------EXTRAS-------------------- ^|
echo.^|                                               ^|
echo ^|               [back] Main Page                ^|
echo.^|                                               ^|
echo ^| --------------------------------------------- ^|
echo.^|                                               ^|
echo ^|               Copyright Kaiddd.               ^|
echo.^|                                               ^|
echo ^| --------------------------------------------- ^|
echo.

set /p ans="Enter Option: "
if "%ans%" == "1" (
    goto doptimizerblx1
    )
if "%ans%" == "2" (
    goto doptimizerblx2
    )
if "%ans%" == "3" (
    echo These FFlags were meant for UWP, but this will apply anyways.
    echo.
    pause
    goto doptimizerblx3
    )
if "%ans%" == "back" (
    goto communitypresets
    )
echo Enter a valid option.
pause
goto mainpg2

:optimizerblx1
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
if exist "%~dp0\Tweaks\Balanced.json" (
    xcopy "%~dp0\Tweaks\Balanced.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    del "%~dp0\Tweaks\Balanced.json"
) else (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/Balanced.json', 'Tweaks\Balanced.json')"
    cls
    goto optimizerblx1
)
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:optimizerblx2
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
if exist "%~dp0\Tweaks\Potato.json" (
    xcopy "%~dp0\Tweaks\Potato.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    del "%~dp0\Tweaks\Potato.json"
) else (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/Potato.json', 'Tweaks\Potato.json')"
    cls
    goto optimizerblx1
)
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:optimizerblx3
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
if exist "%~dp0\Tweaks\HighGraphics.json" (
    xcopy "%~dp0\Tweaks\HighGraphics.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    del "%~dp0\Tweaks\HighGraphics.json"
) else (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/HighGraphics.json', 'Tweaks\HighGraphics.json')"
    cls
    goto optimizerblx3
)
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:exportfflags
cls
echo Type the name of your preset.
echo.
set /p presetname="-> "
echo Exporting...
xcopy "%folder%\ClientSettings\ClientAppSettings.json" "%~dp0\%presetname%.json*"
cls
echo Preset exported, check your RCO folder.
echo.
timeout /t 8
goto main

:customfflags
cls
echo Select your .json file that contains your FFlags.
echo.
for /f "delims=" %%I in (
    'powershell -Command "&{[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null;$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog; $OpenFileDialog.ShowDialog()|out-null; $OpenFileDialog.FileName}"'
) do (
    set "customjson=%%I"
)
cls
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
xcopy "%customjson%" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:doptimizerblx1
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
if exist "%~dp0\Tweaks\DBalanced.json" (
    xcopy "%~dp0\Tweaks\DBalanced.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    del "%~dp0\Tweaks\DBalanced.json"
) else (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/community/DBalanced.json', 'Tweaks\DBalanced.json')"
    cls
    goto doptimizerblx1
)
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:doptimizerblx2
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
if exist "%~dp0\Tweaks\DSuperSonic.json" (
    xcopy "%~dp0\Tweaks\DSuperSonic.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    del "%~dp0\Tweaks\DSuperSonic.json"
) else (
    cls
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/community/DSuperSonic.json', 'Tweaks\DSuperSonic.json')"
    goto doptimizerblx2
)
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:doptimizerblx3
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
if exist "%~dp0\Tweaks\DUWP.json" (
    xcopy "%~dp0\Tweaks\DUWP.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    del "%~dp0\Tweaks\DUWP.json"
) else (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/community/DUWP.json', 'Tweaks\DUWP.json')"
    cls
    goto doptimizerblx3
)
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:bhaggooptimizerblx1
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
if exist "%~dp0\Tweaks\BhaggoMaxGraphics.json" (
    xcopy "%~dp0\Tweaks\BhaggoMaxGraphics.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    del "%~dp0\Tweaks\BhaggoMaxGraphics.json"
) else (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/community/BhaggoMaxGraphics.json', 'Tweaks\BhaggoMaxGraphics.json')"
    cls
    goto bhaggooptimizerblx1
)
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:bhaggooptimizerblx2
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
if exist "%~dp0\Tweaks\BhaggoMaxFPSGpu.json" (
    xcopy "%~dp0\Tweaks\BhaggoMaxFPSGpu.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    del "%~dp0\Tweaks\BhaggoMaxFPSGpu.json"
) else (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/community/BhaggoMaxFPSGpu.json', 'Tweaks\BhaggoMaxFPSGpu.json')"
    cls
    goto bhaggooptimizerblx2
)
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:bhaggooptimizerblx3
echo Starting RCO optimization...
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
if exist "%~dp0\Tweaks\BhaggoMaxFPSNoGpu.json" (
    xcopy "%~dp0\Tweaks\BhaggoMaxFPSNoGpu.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    del "%~dp0\Tweaks\BhaggoMaxFPSNoGpu.json"
) else (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/community/BhaggoMaxFPSNoGpu.json', 'Tweaks\BhaggoMaxFPSNoGpu.json')"
    cls
    goto bhaggooptimizerblx3
)
cls
echo RCO installation was successful.
echo.
timeout /t 5
goto main

:revert
cls
echo Retrieving backup file...
if exist "%~dp0\Backup" (
if exist "%folder%\ClientSettings" (
    del "%folder%\ClientSettings\ClientAppSettings.json"
    xcopy "%~dp0\Backup\*.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y
    echo Applied backup file.
) else (
    mkdir "%folder%\ClientSettings"
    xcopy "%~dp0\Backup\*.json" "%folder%\ClientSettings\ClientAppSettings.json*" /A /Y 
    echo Applied backup file.
)
) else (
    echo You don't have any backups.
    pause
    goto main
)
cls
echo Successfully reverted.
timeout /t 5
goto main
