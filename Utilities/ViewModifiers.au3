
Func CloseApplication()
   GuiDelete($Wizard1GUI)
   GuiDelete($Wizard2GUI)
   GuiDelete($Wizard3GUI)
   GuiDelete($Wizard4GUI)
   ProcessClose(@AutoItPID)
   Exit(0);
   Exit(1);
EndFunc

Func ChangeView($ViewToShow, $ViewToHide)
   Local $aPos = WinGetPos("[ACTIVE]")

   if $ViewToHide <> 9999 then
	  WinMove($ViewToShow, "", $aPos[0], $aPos[1], $aPos[2], $aPos[3])
   endif
   WinSetState($ViewToShow," " ,@SW_SHOW)
   WinSetState($ViewToHide," " ,@SW_HIDE)
   GUISetState(@SW_DISABLE, $ViewToHide)
   GUISetState(@SW_ENABLE, $ViewToShow)
   GUISwitch($ViewToShow)
   GUISetState(@SW_SHOW,$ViewToShow)
   $ActiveView = $ViewToShow
EndFunc
Func GetPositionOfWindow()

EndFunc

Func CreateView($useCurrent, $title, $isChild)
	Local $width = 640 , $height = 440
	Local $x = -1 ,  $y = -1

   if $useCurrent = True Then
	  Local $aPos = WinGetPos("[ACTIVE]")
	  $x = $aPos[0]
	  $y = $aPos[1]
	  ;"Width: " & $aPos[2] & @CRLF & _
      ;"Height: " & $aPos[3])
   EndIf
   Local $Type = $WS_POPUP
   IF $isChild = true then
	  $Type = $Wizard1GUI
   EndIf
     ; will create a dialog box
   return GUICreate($title, 640, 440 ,$x , $y,  $WS_POPUP)

EndFunc   ;==>Example

Func RoundTheView($view)
   Local $iMsg, $hRgn
   Local $aPos = WinGetPos($view) ; get whole window size (no client size defined in GUICreate)
   Local $g_iWidth = $aPos[2]
   Local $g_iHeight = $aPos[3]
   $hRgn = _WinAPI_CreateRoundRectRgn(0, 0, $g_iWidth, $g_iHeight, $g_iWidth / 5, $g_iHeight / 5)
   _WinAPI_SetWindowRgn($view, $hRgn)
EndFunc

Func addVerticalSeparator($x, $y, $h)
    GUICtrlCreateLabel("", $x, $y, 1, $h)
    GUICtrlSetBkColor(-1, 0x999999)
    GUICtrlCreateLabel("", $x + 1, $y, 2, 1)
    GUICtrlSetBkColor(-1, 0x999999)
    GUICtrlCreateLabel("", $x + 1, $y + 1, 2, $h)
    GUICtrlSetBkColor(-1, 0xffffff)
 EndFunc

Func DrawImage($view , $path , $left, $top , $width , $height)
   _GDIPlus_Startup()
   $himg=_GDIPlus_ImageLoadFromFile($path)
   $hbmp=_GDIPlus_BitmapCreateHBITMAPFromBitmap($himg)
   _GDIPlus_ImageDispose($himg)

   $pic=GUICtrlCreatePic("",$left, $top , $width , $height)
   _WinAPI_DeleteObject(GUICtrlSendMsg($pic,$STM_SETIMAGE,$IMAGE_BITMAP,$hbmp))
EndFunc

Func CreateButton($text,  $left, $top , $width , $height ,$toolTip, $clickEvent)
   GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
   $Button1 = GUICtrlCreateLabel($text,  $left, $top , $width , $height , $SS_CENTER)
   SSCtrlHover_Register($Button1, "FnNormal", 0, "FnHover", 0, "FnActive", 0, $clickEvent, 0)

   GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
   GUICtrlSetTip(-1, $toolTip)

   $Button2 = GUICtrlCreateLabel(" ", $left + 1 , $top - 4 , $width + 1 , $height + 2, $SS_BLACKFRAME)
   ;RoundTheView($Button2)
   SSCtrlHover_Register($Button2, "FnNormal", 0, "FnHover", 0, "FnActive", 0, $clickEvent, 0)
   if $clickEvent <> "" then
	  GUICtrlSetOnEvent($Button1, $clickEvent)
   endif

   GUICtrlSetTip(-1, $toolTip)
   return $Button2
EndFunc

Func FnNormal($idCtrl, $hWnd, $vData)
  GUICtrlSetBkColor($idCtrl, 0xe5e5e5)
EndFunc

Func FnHover($idCtrl, $hWnd, $vData)
   GUICtrlSetBkColor($idCtrl, 0xd3d3d3)
EndFunc

Func FnActive($idCtrl, $hWnd, $vData)
   GUICtrlSetBkColor($idCtrl, 0xb2b2b2)
EndFunc

Func FnClick($idCtrl, $hWnd, $vData)
   ConsoleWrite(@CRLF & "CLICK! " & $idCtrl & " - " & $hWnd & " - " & $vData)
EndFunc