#Requires AutoHotkey v2.0

; Which monitor should zoom be displayed on?
UseMonitor := 2



; Show zoom fullscreen on the monitor specified when the numpad1 key is pressed.
Numpad1::{
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){		

		WinActivate
		WinMoveTop
		WinGetPos &OutX, &OutY, &OutWidth, &OutHeight

		;If window isn't fullscreen, make it so
		if (OutWidth < MW || OutHeight < MH){
			CoordMode "Mouse", "Screen"
			MouseClick "Left", Round( OutX + (OutWidth / 2) ), Round(OutY + (OutHeight / 2)), 2
		}
		
	}
}

; Move zoom to the back (presumably behind JW Library) when numpad2 is pressed
Numpad2::{
	if WinExist("Zoom ahk_class ZPContentViewWndClass", "", "Zoom Meeting"){		
		WinMoveBottom
	}
}


; -- Startup Setup 

; Confirm the specified monitor exists
try
{
	MonitorGet UseMonitor, &ML, &MT, &MR, &MB
	MW := MR - ML
	MH := MB - MT
}
catch
	MsgBox "Monitor " UseMonitor " doesn't exist. Check the Auto Hot Key config file."
	

; If the window isn't on the correct monitor, make it so
WinWait("Zoom ahk_class ZPContentViewWndClass", "", 0, "Zoom Meeting")
WinGetPos &OutX, &OutY, &OutWidth, &OutHeight
if ( OutX + OutWidth > MR || OutX < ML || OutY + OutHeight > MB || OutY < MT ){
	WinMove (ML + 50), (MB - 300 - 50), 300, 300
	WinMaximize		
}
