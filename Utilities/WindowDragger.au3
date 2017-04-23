#include <SendMessage.au3>  ; <<<<<<<<<<<<<<<<<<<<<<<<<

GUISetOnEvent($GUI_EVENT_PRIMARYDOWN, "Drag_Window")  ; <<<<<<<<<<<<<<<<<<<<<<<<<

 Func On_Drag($UIView)
     Local $aCurInfo = GUIGetCursorInfo($UIView)
     If $aCurInfo[4] = 0 Then ; Mouse not over a control
         DllCall("user32.dll", "int", "ReleaseCapture")
         _SendMessage($UIView, $WM_NCLBUTTONDOWN, $HTCAPTION, 0)
     EndIf
 EndFunc   ;==>On_Drag