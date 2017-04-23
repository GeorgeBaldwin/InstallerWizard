;#include "ScriptedInstalls.au3"
;, "SenchaCMD 6.0.29"	 _
;, "7Zip"								  _
;, "IBM Installation Manager"	_
;, "Websphere 8.5.5"	_
;, "DB2 Drivers"	_
;, "Ruby Runtime 2.3.3"_

Global $ApplicationList[15] = [ "Required Files" _
							  , "AQT 10.2" _
							  , "Visual Studio 2017" _
							  , "Ruby DevKit 2.0+" _
							  , "Android Studio" _
							  , "Chrome" _
							  , "Node JS" _
							  , "OpenCobolIDE" _
							  , "ISPW Plugin" _
							  , "Tortoise SVN"]
Global $ApplicationIDs[0]
Global $AppListToInstall[0]
Global $rootPath = @ComSpec & " /c " & @ScriptDir & "\Packages\"

Func StartInstallation()
   $totalAppCount = UBound($AppListToInstall) - 1
   For $i = 1 to $totalAppCount
	  $SoftwareItem = $AppListToInstall[$i]
	  ProcessProgress( $i / $totalAppCount * 100 , "Now installing " & $SoftwareItem)
	  Switch $SoftwareItem
		 case "Required Files"
			InstallRuby()

			InstallWinSCP()
		 Case "WinSCP 5.9.5"

		 Case "Ruby DevKit 2.0+"
			InstallRubyDevKit()


	  EndSwitch
   Next
EndFunc

Func AddNewAppID($appId)
   ReDim $ApplicationIDs[UBound($ApplicationIDs) + 1] ;
   $ApplicationIDs[UBound($ApplicationIDs) - 1] = $appId
EndFunc

Func AddAppToInstall($app)
   ReDim $AppListToInstall[UBound($AppListToInstall) + 1] ;
   $AppListToInstall[UBound($AppListToInstall) - 1] = $app
EndFunc
