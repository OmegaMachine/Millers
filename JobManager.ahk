OnExit,GuiClose
Out("Initializing")
AppResolution:=new ScreenToAppResolution(80) ;This container translates the screens resolution to the app and app controls. It is given a percentage of the screen.
IconManager:=new IconManager(A_ScriptDir . "\lib\Test.dll") ;This container manages a resource only dll containing icons. the icons can be referenced by ID or resource name.
ListManager:=new DataManager(A_ScriptDir . "\lib\Data.MDAT") ;this container managesa MDAT files ( a .ini file). it can draw lists of preset information such as weather types or employee data
Serializer:=new Serializer() ;This manager can serialize json strings to objects/arrays and vice versa
Menu, Tray, Icon,% IconManager.DLLPath,% IconManager.IconIDByName("HWC") ;Sets Tray Icon
;msgbox,% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"))
MAIN_WINDOW:=0 ;this gets set to the main guis hwnd when it exists
APP_NAME:="JobManager"
Welcome_FLAG:=false
WelcomeText:="Welcome to JobManager. Load a Project to Continue!"
ActiveJobFile:=0
ActiveJob:=0
UnsavedChanges:=False
;This Include organizes the main GUI's menu creation
#Include lib\JobManager\GUI\Gui_Menu.ahk 
;This Include organizes the main GUI's creation
#Include lib\JobManager\GUI\Gui.ahk

return ; End of autoload section
Home::
ActiveJob.Flush()
return

;This Include organizes the main GUI's labels (Close,Size etc.)
#Include lib\Labels\GUI.ahk
;This Include organizes the main GUI's menu labels
#Include lib\Labels\GUI_Menu.ahk
;This Include organizes functions related to the main gui (Displaying data controls etc)
#Include lib\JobManager\GUI_Functions.ahk
;This include adds debug functions
#include lib\JobManager\Debug.ahk



;This Include organizes the programs classes (datatypes)
#Include lib\DataTypes\Manifest.ahk
;This Include organizes the programs containers (AppResoultion,IconManager etc.)
#Include lib\Managers\Manifest.ahk

;This Include handles anchoring controls
#Include lib\External\Anchor.ahk
;This Include handles retrieving the dll resources given name by index
#Include lib\External\GetIconGroupNameByIndex.ahk
;this include serializes/deserializes arrays or simple objects to a json string or back to an array/object
#Include lib\External\JSON.ahk
;this external allows AES encryption of strings
#Include lib\External\AES.ahk


