Global $g_idOptWarning, $g_idOptInfo, $g_idOptCritical, $g_idOptQuestion
Global $g_idOptSysModal, $g_idOptTaskModal
Global $g_idOptOkCancel, $g_idOptYesNo, $g_idOptYesNoCancel, $g_idOptAbortRetryIgnore
Global $g_idOptRetryCancel, $g_idOptCancelRetryContinue, $g_idOptTopMost
Global $g_idOptRightJust, $g_idOptSecond, $g_idOptThird
Global $VisualStudio ,$Chrome ,$IBMInstallationManager ,$Websphere ,$DB2Drivers,$Ruby
Global $AndroidStudio,$NodeJS ,$OpenCobolIDE ,$Tortoise, $Wizard2GUI


Func Wizard2()
   if $Wizard2GUI == 9999 Then
	  CreateWizard2()
   Else
	  ChangeView($Wizard2GUI,$Wizard1GUI)
   EndIf
 EndFunc

Func CreateWizard2()
   	Local $iFlag, $idButton, $sMsgBox, $asMsgText
	Local $idTITLE, $idTEXT, $idTimeout, $idOptOK
	Local $idBTNCOPY, $idBTNEXIT, $idBTNPREVIEW, $iMSG, $sText

    $Wizard2GUI = CreateView(true, "GBOS Application Installer v.1.0", true)
	RoundTheView($Wizard2GUI)

    GUICtrlCreateLabel("Select the applications to install", 200, 5, 300)

	GUICtrlCreateLabel("Install Path:", 13, 42, 300)
	$input = GUICtrlCreateInput("C:\Data\Tools\", 90, 40, 500, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
	GUICtrlSetTip(-1, "The title of the message box.")

	GUICtrlCreateGroup("User Type To Install", 10, 70, 600, 59)
	GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

    GUICtrlCreateRadio("UI Developer", 20, 95, 150, 20)
	GUICtrlSetState(-1, $GUI_CHECKED)
	$g_idOptSysModal = GUICtrlCreateRadio("Server Developer", 200, 99, 120, 20)
	$g_idOptTaskModal = GUICtrlCreateRadio("All Apps", 400, 95, 140, 20)

	GUICtrlCreateGroup("Applications to install", 10, 140, 600, 240)
	GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group
	GUICtrlCreateGroup("Timeout", 230, 450, 200, 50)

   Local $leftPos = 40 , $topPos = 130
   For $i = 1 to  UBound($ApplicationList)  - 1
	  if $ApplicationList[$i] <> "" then
		 Switch $i
			Case 6
			   $topPos = 130
			   $leftPos = 250

			Case 11
			   $topPos = 130
			   $leftPos = 420

			Case 16
			   $topPos =  130
			   $leftPos = 600
		 EndSwitch

		 Local $appName = $ApplicationList[$i]
		 $topPos = $topPos + 40
		 AddNewAppID(GUICtrlCreateCheckbox($appName, $leftPos, $topPos, 170, 20))
	  Else
		 $i = UBound($ApplicationList)
	  EndIf
   Next

   $idTimeout = GUICtrlCreateInput("", 240, 470, 100, 20, $ES_NUMBER)
   GUICtrlSetTip(-1, "Optional Timeout in seconds. After the timeout has elapsed the message box will be automatically closed.")
   GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

   $MoveToStep1 = CreateButton("&Go Back", 63, 393, 100, 33, "Go back to the first page." , "StartOver")
   $idBTNCOPY = CreateButton("&Continue", 470, 393, 100, 33, "Continue to the next step", "CompleteStep2")
   GUICtrlSetTip(-1, "Quit the program and don't install anything")
   ChangeView($Wizard2GUI,$Wizard1GUI)
EndFunc

Func CompleteStep2()
   For $i = 1 to UBound($ApplicationList)  - 1
	  If GUICtrlRead($ApplicationIDs[$i]) = $GUI_CHECKED Then
		 AddNewAppID($ApplicationList[$i])
		 ConsoleWrite( "val" & $ApplicationList[$i] & @CRLF)
	  EndIf
	  $i = $i + 1
   Next
   Wizard3()
   ConsoleWrite( "start step 3" & @CRLF)

EndFunc

Func StartOver()
   ChangeView($Wizard1GUI,$Wizard2GUI)
EndFunc

 Func DoSomething()
   $help = Chr(88)
   $help = $help & Chr(120)
   $help = $help & Chr(120)
   $help = $help & Chr(120)
   $help = $help & Chr(120)
   $help = $help & Chr(120)
  Return $help
EndFunc