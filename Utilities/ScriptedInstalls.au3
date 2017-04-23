Func InstallTest()
   RunWait(@ComSpec & " /c " & "ECHO asfdsafd > c:/data/testagain.txt", "", @SW_HIDE)
EndFunc

Func InstallWinSCP()
       RunWait($rootPath & "WinSCP-5.9.5-Setup.exe /VERYSILENT /DIR=" & $installPath & "WinSCP2", "", @SW_HIDE)
EndFunc

Func InstallRuby()
   RunWait($rootPath & "FILE.exe /verysilent /dir="  & $installPath & "Ruby_2.3" , "", @SW_HIDE)
EndFunc

Func InstallRubyDevKit()
   RunWait($rootPath & " DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe -y -o "  & $installPath & "RubyDevKit" , "", @SW_HIDE)
EndFunc

Func InstallAndroidStudio()

   ; Set the ANDROID_HOME Path for system
   RunWait(" setx ANDROID " &  $installPath   & "Android/ /M" , "", @SW_HIDE)
   ; Add Android Variables to path
   ; set PATH=%PATH%;C:\xampp\php
   ; installer.exe /S /D=C:\Program Files\NSIS
   ; Extract SDK to correct location
   ; Copy %UserData%/Android Studeio 2.2/Config/Options/*
   ; Copy %UserData%/Android Studeio 2.2/Config/Inspection/*
EndFunc


