Local $percentValue

Func Wizard3($filesToInstall)
   ConsoleWrite( "BeginWizard3" & @CRLF)
   if $Wizard3GUI == 9999 Then
	  ConsoleWrite( "create view" & @CRLF)
	  CreateWizard3()
   Else
	  ChangeView($Wizard3GUI,$Wizard2GUI)
   EndIf
EndFunc

Func CreateWizard3()
   $Wizard3GUI = CreateView(true, "GBOS Application Installer v.1.0", true)
   ConsoleWrite( "rOUNDING vIEW" & @CRLF)
   RoundTheView($Wizard3GUI)
   DrawImage($Wizard1GUI,@ScriptDir & "\Images\break.png",170,0,200,50)
   DrawImage($Wizard1GUI,@ScriptDir & "\Images\coffee.png",15,45,30,51)
   GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
   $percentValue = GUICtrlCreateLabel("0%", 320, 375, 350, 40)
   GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
   $installProgress = GUICtrlCreateProgress(145, 330, 350, 40,$PBS_SMOOTH)
   GUICtrlSetColor(-1, 32250);
   GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
   $Label3 = GUICtrlCreateLabel("GBOS is hard at work installing software for you.", 300, 110, 300, 50)
   GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
   $Label4 = GUICtrlCreateLabel("Please have a cofee break and check back soon.", 300, 225, 300, 50)
   GUICtrlSetFont(-1, 12, 400, 0, "")
   ConsoleWrite( "Change View" & @CRLF)
   ChangeView($Wizard3GUI,$Wizard2GUI)
   StartInstallation()
EndFunc

Func ProcessProgress($progress, $currentApp)
   while $i > -1
	  GUICtrlSetData($currentAppInstalling,$currentApp )
	  GUICtrlSetData($installProgress, $progress)
	  GUICtrlSetData($percentValue, $progress & "%")
	  $i = $i - 10
   Wend
   Wizard4()
EndFunc

Func DemoProgress()
   $i = 100
   while $i > -1
	  ;GUICtrlSetData($currentAppInstalling,$currentApp )
	  GUICtrlSetData($installProgress, (100 - $i))
	  GUICtrlSetData($percentValue, (100 - $i) & "%")
	  $i = $i - 10
	  sleep(1000)
   Wend
   Wizard4()
EndFunc

Func MoveToStep2()
   ChangeView($Wizard2GUI,$Wizard3GUI)
EndFunc