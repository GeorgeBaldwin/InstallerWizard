 Func Wizard4()
	ConsoleWrite( "BeginWizard3" & @CRLF)
   if $Wizard4GUI == 9999 Then
	  ConsoleWrite( "create view" & @CRLF)
	  CreateWizard4()
   Else
	  ChangeView($Wizard4GUI,$Wizard3GUI)
   EndIf
 EndFunc

Func CreateWizard4()
   $Wizard4GUI = CreateView(true, "Another One", true)

   RoundTheView($Wizard4GUI)
   addVerticalSeparator(220,0,440)
   DrawImage($Wizard4GUI,@ScriptDir & "\Images\person.png",10,70,55,58)
   GUISetBkColor(0xEEEEEE)
   $Pic1 = GUICtrlCreatePic("C:\DATA\Projects\git\GBOS_Application_Installer\Images\Separator.gif", 200, 0, 1, 433, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
   GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
   $Label3 = GUICtrlCreateLabel("Installation of your software packages has completed. Please wrap up the coffee break and get back to work. ", 247, 50, 330, 100)
   GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
   $Label4 = GUICtrlCreateLabel("Would you like to uninstall all of the software and reinstall again so that you can continue the coffee break?", 247, 165, 330, 100)
   GUICtrlSetFont(-1, 12, 400, 0, "")
   Local $idRadio1 = GUICtrlCreateRadio("No! I am anxious to get coding!", 247, 275, 330, 30)
   GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
   Local $idRadio2 = GUICtrlCreateRadio("Yes! I need another cup of coffee!", 247, 330, 330, 30)
   GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
   GUICtrlSetState($idRadio1, $GUI_CHECKED)
   CreateButton("Finish", 470, 393, 117, 33, "", "ClosePrep")
   ChangeView($Wizard4GUI,$Wizard3GUI)
EndFunc

Func ClosePrep()
   CloseApplication()
EndFunc