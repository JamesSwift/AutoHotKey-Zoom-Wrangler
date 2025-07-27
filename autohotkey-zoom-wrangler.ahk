#Requires AutoHotkey v2.0

; AutoHotKey-Zoom-Wrangler
; Version 0.0.3
; Created by James Swift
; https://github.com/JamesSwift/AutoHotKey-Zoom-Wrangler


; Which monitor should zoom be displayed on?
UseMonitor := 1

; How big is the top bar of the zoom window?
ZoomTitleHeight := 60


; Show zoom fullscreen on the monitor specified when the key is pressed.
F9::{
	DetectHiddenWindows 1
	if WinExist("Zoom Workplace ahk_class ConfMultiTabContentWndClass"){		
		WinShow
		WinActivate
		WinMoveTop
		MakeFullscreen()		
	}
}

; Move zoom behind other applications when the key is pressed
F10::{
	DetectHiddenWindows 1
	if WinExist("Zoom Workplace ahk_class ConfMultiTabContentWndClass"){		
		WinMoveBottom
		WinHide
	}
}


MakeFullscreen(){
	; If window isn't fullscreen, make it so
	WinGetPos &OutX, &OutY, &OutWidth, &OutHeight
	if (OutWidth < MW || OutHeight < MH){
		; CoordMode "Mouse", "Screen"
		; MouseGetPos &StartX, &StartY
		; MouseClick "Left", Round( OutX + (OutWidth / 2) ), Round(OutY + (OutHeight / 2)), 2
		; MouseMove StartX, StartY
		WinRestore
		WinMove ML, (MT - ZoomTitleHeight), MW, (MH + ZoomTitleHeight)
		
	}
}


; ------------ Startup Setup ----------------

try
{
	MonitorGet UseMonitor, &ML, &MT, &MR, &MB
	MW := MR - ML
	MH := MB - MT

	; Gve zoom a chance to settle down
	DetectHiddenWindows 1
	WinWait("Zoom Workplace ahk_class ConfMultiTabContentWndClass")
	Sleep 4000

	; If the window isn't on the correct monitor, make it so
	if WinExist("Zoom Workplace ahk_class ConfMultiTabContentWndClass"){
	
		WinRestore

		; WinGetPos &OutX, &OutY, &OutWidth, &OutHeight
		; if ( OutX + OutWidth > MR || OutX < ML || OutY + OutHeight > MB || OutY < MT ){
		; 	WinMove (ML + 50), (MB - 300 - 50), 300, 300	
		; }

		MakeFullscreen()
		Sleep 500
	}

	; Hide the window by default
	WinWait("Zoom Workplace ahk_class ConfMultiTabContentWndClass")
	WinMoveBottom
	WinHide

	; Hide the splash zoom window 
	if WinExist("Zoom Workplace ahk_class ZPPTMainFrmWndClassEx"){
		WinMoveBottom
		WinMinimize
	}
	
} catch as err {
	MsgBox "An error occurred with AutoHotKey-Zoom-Wrangler.nError: " err.Message " Line: " err.Line 
}

Persistent
OnExit ExitFunc
ExitFunc(ExitReason, ExitCode){
	DetectHiddenWindows 1
	if WinExist("Zoom Workplace ahk_class ConfMultiTabContentWndClass", "", "Zoom Workplace"){
		WinShow
	}
}

