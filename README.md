# One-Click Shutdown for Windows

A simple Windows shortcut that immediately shuts down the computer and
force-closes open applications. It bypasses the **"Shut down anyway"** screen.

## Compatibility

- Windows 10
- Windows 11

## Installation

1. Download or clone this repository.
2. Double-click **`INSTALL - One Click Shutdown.cmd`**.
3. A shortcut named **One Click Shutdown** will be created on your Desktop and
   in the Start menu.
4. Open the shortcut whenever you want to shut down immediately.

For a true single click, right-click the shortcut and select **Pin to taskbar**.

## Uninstall

Double-click **`UNINSTALL - One Click Shutdown.cmd`**.

## Warning

The shortcut uses:

```cmd
shutdown.exe /s /f /t 0
```

The `/f` option force-closes all running programs. **Any unsaved documents,
game progress, downloads, or other work may be permanently lost.** Save your
work before using the shortcut.

No administrator permission is normally required. The installer does not
modify the Windows registry or install anything in Program Files.

