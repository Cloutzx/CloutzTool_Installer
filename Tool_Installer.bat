@echo off
title Tools Installer Menu
mode con: cols=95 lines=30
color 0a

:: ================= WARNING =================
cls
echo =============================================================
echo                  WARNING!
echo.
echo These tools require administrative privileges to run properly.
echo Make sure to run them as administrator when prompted.
echo.
echo Press ENTER to continue to the Tools Installer Menu...
echo =============================================================
pause >nul

:: ================= MAIN MENU =================
:menu
cls
echo =================== TOOLS INSTALLER MENU ===================
echo.
echo 1 - Basic Tools (PC Diagnostics)
echo 2 - Advanced / Mega Tools (PC Stats)
echo 3 - Exit
echo.

choice /c 123 /n /m "Choose an option: "
set sel=%errorlevel%

if %sel%==1 goto download_basic
if %sel%==2 goto download_advanced
if %sel%==3 exit
goto menu

:: ================= DOWNLOAD AND RUN BASIC TOOLS =================
:download_basic
cls
echo Downloading Basic Tools (PC Diagnostics)...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Cloutzx/PC-Diagnostics/refs/heads/main/PC_Diagnostics.bat' -OutFile '%TEMP%\PC_Diagnostics.bat'"
echo.
echo Download complete! Running as administrator...
powershell -Command "Start-Process '%TEMP%\PC_Diagnostics.bat' -Verb RunAs"
pause
goto menu

:: ================= DOWNLOAD AND RUN ADVANCED TOOLS =================
:download_advanced
cls
echo Downloading Advanced / Mega Tools (PC Stats)...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Cloutzx/Pc-Stats/refs/heads/main/PC_Stats.bat' -OutFile '%TEMP%\PC_Stats.bat'"
echo.
echo Download complete! Running as administrator...
powershell -Command "Start-Process '%TEMP%\PC_Stats.bat' -Verb RunAs"
pause
goto menu