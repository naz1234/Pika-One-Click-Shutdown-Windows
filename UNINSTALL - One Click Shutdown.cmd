@echo off
setlocal
title One Click Shutdown - Uninstaller

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$desktop = [Environment]::GetFolderPath('Desktop'); $startMenu = Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs'; Remove-Item -LiteralPath (Join-Path $desktop 'One Click Shutdown.lnk') -Force -ErrorAction SilentlyContinue; Remove-Item -LiteralPath (Join-Path $startMenu 'One Click Shutdown.lnk') -Force -ErrorAction SilentlyContinue"

if errorlevel 1 (
    echo.
    echo Uninstall failed. You can delete "One Click Shutdown" manually
    echo from your Desktop and Start menu.
    echo.
    pause
    exit /b 1
)

echo.
echo One Click Shutdown was removed successfully.
echo.
pause

