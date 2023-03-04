# AutoHotKey-Zoom-Wrangler
This script shows or hides Zoom's "dual monitors" 2nd screen on a specified monitor using keyboard shortcuts. This is useful when you are displaying content to an audience on a display, and have another application showing pictures and videos on that display too. Using the keyboard shortcuts you can decide which application will be on top without having to drag the zoom window around, or use the taskbar to bring on application on top of the other.

# To use the script
First, install the latest version of <a href="https://www.autohotkey.com/download/ahk-v2.exe">Auto Hot Key V2</a> on your system.

Second, download <a href="https://github.com/JamesSwift/AutoHotKey-Zoom-Wrangler/blob/main/autohotkey-zoom-wrangler.ahk">the script</a>.

You may wish to modify the following line if you want to use a monitor other than 2.
```
; Which monitor should zoom be displayed on?
UseMonitor := 2
```

Double click on the script to run it. You can then use the default keyboard shortcuts to control the zoom window:

- Numberpad 1: Make the zoom 2nd screen full-screen in front of any other application
- Numberpad 2: Send the zoom 2nd screen window behind any other windows on that monitor.

You can change which key triggers the shortcuts by modifying `Numpad1::{` and `Numpad2::{` to be some other key, such as
```
F4::{
```
You can find out more about keyboard shortcuts in the <a href="https://www.autohotkey.com/docs/v2/KeyList.htm">documentation</a>.

Once you are happy that the script is setup as you would like it, you will probably want to copy it to your startup folder so it will start automatically every time the PC is turned on. To find the startup folder, press `WIN + R` on your keyboard, then enter `shell:startup` and press OK.
