#Requires AutoHotkey v2.0

; AutoHotKey-Zoom-Wrangler
; Version 0.0.1
; Created by James Swift
; https://github.com/JamesSwift/AutoHotKey-Zoom-Wrangler


; Which monitor should zoom be displayed on?
UseMonitor := 2


; Show zoom fullscreen on the monitor specified when the numpad1 key is pressed.
F9::{
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){		
		WinShow
		WinActivate
		WinMoveTop
		WinGetPos &OutX, &OutY, &OutWidth, &OutHeight

		;If window isn't fullscreen, make it so
		if (OutWidth < MW || OutHeight < MH){
			CoordMode "Mouse", "Screen"
			MouseGetPos &StartX, &StartY
			MouseClick "Left", Round( OutX + (OutWidth / 2) ), Round(OutY + (OutHeight / 2)), 2
			MouseMove StartX, StartY
		}
	}
}

; Move zoom behind other applications when numpad2 is pressed
F10::{
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){		
		WinMoveBottom
		WinHide
	}
}


; -- Startup Setup 

; Confirm the specified monitor exists
try
{
	DetectHiddenWindows 1
	MonitorGet UseMonitor, &ML, &MT, &MR, &MB
	MW := MR - ML
	MH := MB - MT

	; If the window isn't on the correct monitor, make it so
	WinWait("Zoom ahk_class ZPContentViewWndClass", "", , "Zoom Meeting")
	Sleep 5000
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){
		WinMoveBottom	
		WinGetPos &OutX, &OutY, &OutWidth, &OutHeight
		if ( OutX + OutWidth > MR || OutX < ML || OutY + OutHeight > MB || OutY < MT ){
			WinMove (ML + 50), (MB - 300 - 50), 300, 300
			WinMaximize	
			WinMoveBottom	
		}
		WinHide
	}	
}
catch
	MsgBox "Monitor " UseMonitor " doesn't exist. Check the Auto Hot Key config file."
	

OnExit ExitFunc
Persistent
ExitFunc(ExitReason, ExitCode){
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){
		WinShow
	}
}
