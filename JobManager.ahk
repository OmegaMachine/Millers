OnExit,GuiClose
AppResolution:=new ScreenToAppResolution(80) ;This container translates the screens resolution to the app and app controls. It is given a percentage of the screen.
IconManager:=new IconManager(A_ScriptDir . "\resources\Test.dll") ;This container managers a resource only dll containing icons. the icons can be referenced by ID or resource name.
Welcome_FLAG:=false
WelcomeText:="Welcome to JobManager. Load a Project to Continue!"
;This Include organizes the main GUI's menu creation
#Include resources\JobManager\Gui_Menu.ahk 
;This Include organizes the main GUI's creation
#Include resources\JobManager\Gui.ahk

return ; End of autoload section




;This Include organizes the main GUI's labels (Close,Size etc.)
#Include resources\Labels\GUI.ahk
;This Include organizes the main GUI's menu labels
#Include resources\Labels\GUI_Menu.ahk
;This Include organizes functions related to the main gui
#Include resources\Labels\GUI_Functions.ahk




;This Include organizes the programs classes (datatypes)
#Include lib\DataTypes_Manifest.ahk
;This Include organizes the programs containers (AppResoultion,IconManager etc.)
#Include lib\Manager_Manifest.ahk

;This Include handles anchoring controls
#Include lib\External\Anchor.ahk
;This Include handles retrieving the dll resources given name by index
#Include lib\External\GetIconGroupNameByIndex.ahk


Home::
RemoveWelcome()
return

