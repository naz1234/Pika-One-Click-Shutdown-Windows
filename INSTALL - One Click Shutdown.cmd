@echo off
setlocal
title One Click Shutdown - Installer

set "PS_SCRIPT=%TEMP%\OneClickShutdown_Install_%RANDOM%.ps1"

> "%PS_SCRIPT%" (
    echo $ErrorActionPreference = 'Stop'
    echo $desktop = [Environment]::GetFolderPath^('Desktop'^)
    echo $startMenu = Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs'
    echo $shell = New-Object -ComObject WScript.Shell
    echo foreach ^($folder in @^($desktop, $startMenu^)^) {
    echo     $shortcutPath = Join-Path $folder 'One Click Shutdown.lnk'
    echo     $shortcut = $shell.CreateShortcut^($shortcutPath^)
    echo     $shortcut.TargetPath = Join-Path $env:SystemRoot 'System32\shutdown.exe'
    echo     $shortcut.Arguments = '/s /f /t 0'
    echo     $shortcut.WorkingDirectory = Join-Path $env:SystemRoot 'System32'
    echo     $shortcut.Description = 'Immediately shut down this PC and force-close open apps'
    echo     $shortcut.IconLocation = ^(Join-Path $env:SystemRoot 'System32\shell32.dll'^) + ',27'
    echo     $shortcut.Save^(^)
    echo }
)

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"
set "RESULT=%ERRORLEVEL%"
del "%PS_SCRIPT%" >nul 2>&1

if not "%RESULT%"=="0" (
    echo.
    echo Installation failed. No shutdown shortcut was created.
    echo.
    pause
    exit /b %RESULT%
)

echo.
echo Installed successfully.
echo.
echo A shortcut named "One Click Shutdown" is now on your Desktop
echo and in your Start menu.
echo.
echo WARNING: It force-closes all open apps. Unsaved work will be lost.
echo.
pause

