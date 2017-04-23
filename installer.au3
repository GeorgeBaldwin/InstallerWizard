; ===============================================================================
;
; Program Name:     GBOS Application Installer
; Description:      Will allow the user to choose from any number of programs that
;                   is available to install from. This application will install
;					all of the programs automatically for said user.
; Requirement(s):   Computer Science Degree
; Return Value(s):  None
; Author(s):        George Baldwin
;
; ===============================================================================
#include <EditConstants.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <WinAPI.au3>
#include <GDIPlus.au3>
#include "Utilities/SSCtrlHover_v3.au3"
#include "Utilities/WindowDragger.au3"
#include "Utilities/ViewModifiers.au3"
#include "WizardSteps/WizardStep1.au3"
#include "WizardSteps/WizardStep2.au3"
#include "WizardSteps/WizardStep3.au3"
#include "WizardSteps/WizardStep4.au3"
#include "Utilities/InstallEngine.au3"
Opt("GUIOnEventMode", 1)
Global $Wizard1GUI, $Wizard2GUI = 9999, $Wizard3GUI = 9999, $Wizard4GUI = 9999, $ActiveView
Global $installProgress , $installPath = "C:\Data\Tools\"


If Not IsAdmin() Then
   ; ShellExecute(@AutoItExe, "", "", "runas")
   ; ProcessClose(@AutoItPID)
   ; Exit
 EndIf

StartWizard()

While 1
   Sleep(10)
   On_Drag($ActiveView)
WEnd