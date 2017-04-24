#  <img src="/Images/AppIcon.png" width="48">  App Installer 
  - Automatic Installation of important software to you
  - Supports any kind of installation.
  - Built using the AutoIt script editor.
  - Magic

# Usage
Once compiled, a user will only need to step through the 4 step wizard and select the apps to be installed. the application handles the rest.

Future Dreams:
  - Uninstall capabilities
  - Repair install capabilities
  - Update Capabilities

This is an amazing application, many have been pleased with the results, and naturally those that benefit the most are those that enjoy many cups of coffee throughout the day such as the assistant to the assistant of the President of the Coffee Club who states

> Before, it was never really possible to
> enjoy a really good cup of coffee at the
> office. Thanks to GBOS, we are now able to
> get things done while at the same time
> enjoying a bold cup of coffee without those
> guilty feelings of being unproductive.
> THANK YOU GBOS!

### Configuration

##### End Users
No end user configuration is required. When the user double clicks the application, it will require a local administrators account to run since this is an installer application.

##### Devlelopers

* [AngularJS] - HTML enhanced for web apps!
* [Ace Editor] - awesome web-based text editor


File 1: InstallEngine.au3
```vb
Global $ApplicationList[15] = [ "Base Dev Tools" _
							  , "AQT 10.2" _
							  , "Visual Studio 2017" _
							  , "Ruby DevKit 2.0+" _
					          , "ADDS NEW ITEM HERE" _
					          ]
					          
Func StartInstallation()
   ...
	  Switch $SoftwareItem
        ...
		 Case "ADDS NEW ITEM HERE"
			INSTALLADDNEWITEMHERE()
...
End Function
```
###### File 2: ScriptedInstalls.au3
You shld only have to add a new method that will more than likley call to one of the three methods below. 
```vb
function INSTALLADDNEWITEMHERE()
    RunwaitCommand("/flag","ADDNEWITEMFOLDER")
end if
function RunWaitCommand ($filenameAndFlags , $appFolderName )
    'Argument 1: File Name concatenated with all command switches
    'Argument 2: Child path to main install path. application folder name
end if
    
function InstallMSI($MSIFileName, $flags)
    'Argument 1: The MSI file name including the extension *.msi
    'Argument 2: All switches to use on the request.
end if

function InstallEclipsePlugin($pluginName , $repository)
    'Argument 1: The Name of the plugin
	'Argument 2: All switches to use on the request.
end if
```

### Screen Shots

##### Step 1:
<img src="/Images/Sample%20Screenshots/step1.png" width="640">

##### Step 2:
<img src="/Images/Sample%20Screenshots/step2.png" width="640">

##### Step 3:
<img src="/Images/Sample%20Screenshots/step3.png" width="640">

##### Step 4:
<img src="/Images/Sample%20Screenshots/step4.png" width="640">


License
----

MIT
**Free Software, Hell Yeah!**


   [GBOSimg]: </safsd/adsfsadf>
  
