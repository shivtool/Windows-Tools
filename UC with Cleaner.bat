@echo off
:: UTF-8 Support for Hindi and Symbols
chcp 65001 > nul
title Administrator: Multi-Tool Control - @SHIV COMPUTER
mode con: cols=90 lines=30

:menu
cls
color 0B
echo.
echo  [93m==============================================================================[0m
echo  [96m                  🚀 SHIV COMPUTER ALL-IN-ONE SYSTEM TOOLS 🚀                   [0m
echo  [93m==============================================================================[0m
echo.
echo      [91m[1] ⛔ Windows Update को पूरी तरह बंद करें (OFF)[0m
echo      [92m[2] ✅ Windows Update को दोबारा चालू करें (ON)[0m
echo      [93m[3] 🔍 सर्विस का स्टेटस चेक करें (Check Status)[0m
echo      [96m[4] 🧹 जंक फाइल साफ़ करें (Temp, %Temp%, Prefetch, Recent)[0m
echo      [90m[5] 🚪 बाहर निकलें (Exit)[0m
echo.
echo  [93m==============================================================================[0m
echo  [95m                    BRANDING: @SHIV COMPUTER 💻                               [0m
echo  [93m==============================================================================[0m
echo.
set /p choice="[97m👉 कृपया विकल्प चुनें (1-5): [0m"

if %choice%==1 goto DISABLE
if %choice%==2 goto ENABLE
if %choice%==3 goto STATUS
if %choice%==4 goto CLEANER
if %choice%==5 exit
goto menu

:DISABLE
cls
color 0C
echo.
echo [91m[PROCESS] Windows Update सेवाओं को बंद किया जा रहा है...[0m
echo ---------------------------------------------------------
echo ⏳ Stopping Windows Update (wuauserv)...
net stop wuauserv && sc config "wuauserv" start= disabled
echo ⏳ Stopping Update Orchestrator (USOsvc)...
net stop USOsvc && sc config "USOsvc" start= disabled
echo ⏳ Stopping BITS (bits)...
net stop bits && sc config "bits" start= disabled
echo ⏳ Stopping Delivery Optimization (dosvc)...
net stop dosvc && sc config "dosvc" start= disabled
echo.
echo [92m[SUCCESS] सभी अपडेट सेवाएं सफलतापूर्वक बंद कर दी गई हैं! 🛡️[0m
pause
goto menu

:ENABLE
cls
color 0A
echo.
echo [92m[PROCESS] Windows Update सेवाओं को चालू किया जा रहा है...[0m
echo ---------------------------------------------------------
echo ⏳ Starting Windows Update...
sc config "wuauserv" start= auto && net start wuauserv
echo ⏳ Starting Update Orchestrator...
sc config "USOsvc" start= auto && net start USOsvc
echo ⏳ Starting BITS...
sc config "bits" start= auto && net start bits
echo ⏳ Starting Delivery Optimization...
sc config "dosvc" start= auto && net start dosvc
echo.
echo [96m[SUCCESS] सभी अपडेट सेवाएं अब चालू (ON) हैं! 🚀[0m
pause
goto menu

:STATUS
cls
color 0E
echo.
echo [93m[CHECKING] वर्तमान सर्विस स्टेटस:[0m
echo ---------------------------------------------------------
for %%s in (wuauserv USOsvc bits dosvc) do (
    echo [97mChecking %%s:[0m
    sc query %%s | findstr STATE
)
echo ---------------------------------------------------------
pause
goto menu

:CLEANER
cls
color 0D
echo.
echo [95m[CLEANING] जंक फाइल्स को साफ़ किया जा रहा है...[0m
echo ---------------------------------------------------------

echo 🗑️ Cleaning TEMP...
del /s /f /q %temp%\*.* >nul 2>&1
for /d %%i in ("%temp%\*") do rd /s /q "%%i" >nul 2>&1

echo 🗑️ Cleaning Windows TEMP...
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
for /d %%i in ("C:\Windows\Temp\*") do rd /s /q "%%i" >nul 2>&1

echo 🗑️ Cleaning PREFETCH...
del /s /f /q C:\Windows\Prefetch\*.* >nul 2>&1
for /d %%i in ("C:\Windows\Prefetch\*") do rd /s /q "%%i" >nul 2>&1

echo 🗑️ Cleaning RECENT...
del /s /f /q %userprofile%\Recent\*.* >nul 2>&1

echo.
echo [92m✨ बधाई हो! आपका सिस्टम अब साफ़ और तेज़ हो गया है! 🧹🚀[0m
echo ---------------------------------------------------------
pause
goto menu