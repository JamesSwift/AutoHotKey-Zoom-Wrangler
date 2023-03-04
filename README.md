# AutoHotKey-Zoom-Wrangler
This script shows or hides Zoom's "dual monitors" 2nd screen on the specified monitor, triggered by keyboard shortcuts. This is useful when you are displaying content to an audience on a display, and have another application showing pictures and videos on that display too. Using the keyboard shortcuts you can swap between zoom and the media you are displaying seamlessly without having to drag the zoom window onto and off of the secondary monitor or use the taskbar to bring one application on top of the other.

# How to install and use the script
First, install the latest version of <a href="https://www.autohotkey.com/download/ahk-v2.exe">Auto Hot Key V2</a> on your system.

Second, download <a href="https://github.com/JamesSwift/AutoHotKey-Zoom-Wrangler/raw/main/autohotkey-zoom-wrangler.ahk">the script</a> (right click and choose "Save links as...").

You may wish to modify the following line in the script if you want to use a monitor other than number 1. (You can open the script with notepad.exe to modify it.)
```
; Which monitor should zoom be displayed on?
UseMonitor := 2
```

Double click on the downloaded script to run it. You can then use the default keyboard shortcuts to control the zoom window:

- F9: Make the zoom 2nd screen full-screen in front of any other application
- F10: Make the zoom 2nd screen window invisible

You can change which key triggers the shortcuts by modifying `F9::{` and `F10::{` to be some other key, such as
```
F4::{
```
You can find out more about keyboard shortcuts in the <a href="https://www.autohotkey.com/docs/v2/KeyList.htm">documentation</a>.

To stop or reload the script, right click on the green "H" icon in the system tray.

Once you are happy that the script is setup as you would like it, you will probably want to copy it to your startup folder so that it will start automatically every time the PC is turned on. To open the startup folder, press `WIN + R` on your keyboard, then enter `shell:startup` and press OK.

If you are trying to use zoom with JW Library and find that putting any window on top of it causes it to minimize itself, you might want to try this tool which prevents that behavior: https://github.com/AntonyCorbett/JwlMediaWin 

Note that this script will hide the zoom 2nd window a few seconds after you begin the zoom meeting by default - it won't show up in the taskbar, even though it is running. The only way to get it to display is to press F10, or to to stop the script (by right clicking on the green "H" icon in the system tray and pressing exit).
