@echo off
title [RCO] Roblox Client Optimizer
echo Locating Roblox...
for /d %%v in ("%localappdata%\Bloxstrap\*") do (
if exist "%%i\ClientSettings" (
    set rblxfolder=%%v
    goto installjson
) else (
    echo Roblox not found in Bloxstrap.
)
)

for /d %%v in ("%localappdata%\Roblox\Versions\*") do (
if exist "%%v\RobloxPlayerBeta.exe" (
    set rblxfolder=%%v
    goto installjson
) else (
    echo Roblox not found in AppData.
)
)

for /d %%v in ("C:\Program Files\Roblox\Versions\*") do (
if exist "%%v\RobloxPlayerBeta.exe" (
    set rblxfolder=%%v
    goto installjson
) else (
    echo Roblox not found in Program Files.
)
)

for /d %%v in ("C:\Program Files (x86)\Roblox\Versions\*") do (
if exist "%%i\RobloxPlayerBeta.exe" (
    set rblxfolder=%%v
    goto installjson
) else (
    echo Roblox not found in Program Files (x86).
)
)
cls
echo Roblox was not found installed. Make sure you have Roblox installed before using RCO.
pause
start "" https://www.roblox.com/download
goto exit

:main
mode 65, 52
cls
echo.
echo ^| --------------------------------------------- ^|
echo ^|            / discord.gg/CZUfHYHtZr \          ^|
echo ^|-----------------------------------------------^|
echo ^|       8888888b.    .d8888b.    .d88888b.      ^|
echo ^|       888   Y88b  d88P  Y88b  d88P" "Y88b     ^|
echo ^|       888    888  888    888  888     888     ^|
echo ^|       888   d88P  888         888     888     ^|
echo ^|       8888888P"   888         888     888"    ^|
echo ^|       888 T88b    888    888  888     888     ^|
echo ^|       888  T88b   Y88b  d88P  Y88b. .d88P     ^|
echo ^|       888   T88b   "Y8888P"    "Y88888P"      ^|
echo.^|                                               ^|
echo.^|                                               ^|
echo ^|             [1] Optimize Roblox               ^|
echo.^|                  (Balanced)                   ^|
echo.^|                                               ^|
echo ^|          [2] Ultra Optimize Roblox            ^|
echo.^|                   (Potato)                    ^|
echo.^|                                               ^|
echo.^|                                               ^|
echo ^| -------------------EXTRAS-------------------- ^|
echo.^|                                               ^|
echo ^|            [uninstall] Uninstall RCO          ^|
echo.^|                                               ^|
echo.^|                                               ^|
echo.^|                                               ^|
echo ^|     [page2] Deprecated RCO Optimizations      ^|
echo ^|                                               ^|
echo ^|                  [0] Close                    ^|
echo.^|                                               ^|
echo ^| --------------------------------------------- ^|
echo.^|                                               ^|
echo ^| Copyright 2020 ilyKiwi. All rights reserved.  ^|
echo.^|                                               ^|
echo ^| --------------------------------------------- ^|
echo.
set /p ans="Enter Option: "
if "%ans%" == "1" (
    goto optimizerblx1
)
if "%ans%" == "2" (
    goto optimizerblx2
)
if "%ans%" == "page2" (
    goto mainpg2
)
if "%ans%" == "uninstall" (
    goto removecs
)
if "%ans%" == "0" (
    goto exit
)
echo Enter a valid option.
pause
goto main

:mainpg2
mode 65, 52
cls
echo.
echo ^| --------------------------------------------- ^|
echo ^|            / discord.gg/CZUfHYHtZr \          ^|
echo ^|-----------------------------------------------^|
echo ^|       8888888b.    .d8888b.    .d88888b.      ^|
echo ^|       888   Y88b  d88P  Y88b  d88P" "Y88b     ^|
echo ^|       888    888  888    888  888     888     ^|
echo ^|       888   d88P  888         888     888     ^|
echo ^|       8888888P"   888         888     888"    ^|
echo ^|       888 T88b    888    888  888     888     ^|
echo ^|       888  T88b   Y88b  d88P  Y88b. .d88P     ^|
echo ^|       888   T88b   "Y8888P"    "Y88888P"      ^|
echo.^|                                               ^|
echo.^|                                               ^|
echo ^|                 [1] Balanced                  ^|
echo.^|                                               ^|
echo ^|                [2] Super Sonic                ^|
echo.^|                                               ^|
echo ^|                   [3] UWP                     ^|
echo.^|                                               ^|
echo.^|                                               ^|
echo ^| -------------------EXTRAS-------------------- ^|
echo.^|                                               ^|
echo ^|               [page1] Main Page               ^|
echo ^|                                               ^|
echo ^|                  [0] Close                    ^|
echo.^|                                               ^|
echo ^| --------------------------------------------- ^|
echo.^|                                               ^|
echo ^| Copyright 2020 ilyKiwi. All rights reserved.  ^|
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
    goto doptimizerblx3
)
if "%ans%" == "page1" (
    goto main
)
if "%ans%" == "0" (
    goto exit
)
echo Enter a valid option.
pause
goto mainpg2

:installjson
if exist "%~dp0\Tweaks" (
    if exist "%~dp0\Tweaks\*.json" (
        echo Tweaks folder already made
    ) else (
:: Main RCO
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/Potato.json', 'Tweaks\Potato.json')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/Balanced.json', 'Tweaks\Balanced.json')"

:: Deprecated RCO
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/DBalanced.json', 'Tweaks\DBalanced.json')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/DSuperSonic.json', 'Tweaks\DSuperSonic.json')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/DUWP.json', 'Tweaks\DUWP.json')"
    )
) else (
    mkdir "%~dp0\Tweaks"
:: Main RCO
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/Potato.json', 'Tweaks\Potato.json')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/Balanced.json', 'Tweaks\Balanced.json')"

:: Deprecated RCO
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/DBalanced.json', 'Tweaks\DBalanced.json')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/DSuperSonic.json', 'Tweaks\DSuperSonic.json')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/o5u3/Roblox-Client-Optimizer/ClientSettings/DUWP.json', 'Tweaks\DUWP.json')"
)
goto main

:optimizerblx1
cls
echo Starting RCO optimization...
if exist "%~dp0\Tweaks\Balanced.json" (
    xcopy "%~dp0\Tweaks\Balanced.json" "%rblxfolder%\ClientSettings\ClientAppSettings.json*" /A /Y
) else (
    echo Failed to retrieve ClientAppSettings.json, make sure you went through the installation correctly.
    pause
    goto exit
)
cls
echo RCO installation was successful.
echo.
pause
goto main

:optimizerblx2
cls
echo Starting RCO optimization...
if exist "%~dp0\Tweaks\Potato.json" (
    xcopy "%~dp0\Tweaks\Potato.json" "%rblxfolder%\ClientSettings\ClientAppSettings.json*" /A /Y
) else (
    echo Failed to retrieve ClientAppSettings.json, make sure you went through the installation correctly.
    pause
    goto exit
)
cls
echo RCO installation was successful.
echo.
pause
goto main

:doptimizerblx1
cls
echo Starting RCO optimization...
if exist "%~dp0\Tweaks\DBalanced.json" (
    xcopy "%~dp0\Tweaks\DBalanced.json" "%rblxfolder%\ClientSettings\ClientAppSettings.json*" /A /Y
) else (
    echo Failed to retrieve ClientAppSettings.json, make sure you went through the installation correctly.
    pause
    goto exit
)
cls
echo RCO installation was successful.
echo.
pause
goto main

:doptimizerblx2
cls
echo Starting RCO optimization...
if exist "%~dp0\Tweaks\DSuperSonic.json" (
    xcopy "%~dp0\Tweaks\DSuperSonic.json" "%rblxfolder%\ClientSettings\ClientAppSettings.json*" /A /Y
) else (
    echo Failed to retrieve ClientAppSettings.json, make sure you went through the installation correctly.
    pause
    goto exit
)
cls
echo RCO installation was successful.
echo.
pause
goto main

:doptimizerblx3
cls
echo Starting RCO optimization...
if exist "%~dp0\Tweaks\DUWP.json" (
    xcopy "%~dp0\Tweaks\DUWP.json" "%rblxfolder%\ClientSettings\ClientAppSettings.json*" /A /Y
) else (
    echo Failed to retrieve ClientAppSettings.json, make sure you went through the installation correctly.
    pause
    goto exit
)
cls
echo RCO installation was successful.
echo.
pause
goto main

:removecs
cls
echo Removing Client Settings...
if exist "%rblxfolder%\ClientSettings" (
    rmdir "%rblxfolder%\ClientSettings" /s /q
)
cls
echo Removed Client Settings.
pause
goto main

:quit
exit
