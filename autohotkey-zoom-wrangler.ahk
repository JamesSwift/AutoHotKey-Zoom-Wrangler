#Requires AutoHotkey v2.0

; AutoHotKey-Zoom-Wrangler
; Version 0.0.2
; Created by James Swift
; https://github.com/JamesSwift/AutoHotKey-Zoom-Wrangler


; Which monitor should zoom be displayed on?
UseMonitor := 1


; Show zoom fullscreen on the monitor specified when the key is pressed.
F9::{
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){		
		WinShow
		WinActivate
		WinMoveTop
		MakeFullscreen()		
	}
}

; Move zoom behind other applications when the key is pressed
F10::{
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){		
		WinMoveBottom
		WinHide
	}
}


MakeFullscreen(){
	; If window isn't fullscreen, make it so
	WinGetPos &OutX, &OutY, &OutWidth, &OutHeight
	if (OutWidth < MW || OutHeight < MH){
		CoordMode "Mouse", "Screen"
		MouseGetPos &StartX, &StartY
		MouseClick "Left", Round( OutX + (OutWidth / 2) ), Round(OutY + (OutHeight / 2)), 2
		MouseMove StartX, StartY
	}
}


; ------------ Startup Setup ----------------

try
{
	DetectHiddenWindows 1
	MonitorGet UseMonitor, &ML, &MT, &MR, &MB
	MW := MR - ML
	MH := MB - MT

	; Gve zoom a chance to settle down
	WinWait("Zoom ahk_class ZPContentViewWndClass", "", , "Zoom Meeting")
	Sleep 5000

	; If the window isn't on the correct monitor, make it so
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){
		
		WinGetPos &OutX, &OutY, &OutWidth, &OutHeight
		if ( OutX + OutWidth > MR || OutX < ML || OutY + OutHeight > MB || OutY < MT ){
			WinMove (ML + 50), (MB - 300 - 50), 300, 300	
		}

		; Make the window maximized, then fullscreen it. Sleep required while zoom sorts itself out.
		WinMaximize	
		Sleep 1000
		MakeFullscreen()
		Sleep 1000
	}

	; Hide the window by default
	WinWait("Zoom ahk_class ZPContentViewWndClass", "", , "Zoom Meeting")
	WinMoveBottom
	WinHide
	
}
catch
	MsgBox "An error occured with autohotkey-zoom-wrangler. Perhaps monitor " UseMonitor " doesn't exist? Check the config file."
	

Persistent
OnExit ExitFunc
ExitFunc(ExitReason, ExitCode){
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){
		WinShow
	}
}

