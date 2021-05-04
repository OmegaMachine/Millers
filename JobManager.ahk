OnExit,GuiClose

AppResolution:=new ScreenToAppResolution(80) ;This container translates the screens resolution to the app and app controls. It is given a percentage of the screen.
IconManager:=new IconManager(A_ScriptDir . "\resources\Test.dll") ;This container manages a resource only dll containing icons. the icons can be referenced by ID or resource name.
ListManager:=new DataManager(A_ScriptDir . "\resources\Data.MDAT") ;this container managesa MDAT files ( a .ini file). it can draw lists of preset information such as weather types or employee data
Serializer:=new Serializer()
Menu, Tray, Icon,% IconManager.DLLPath,% IconManager.IconIDByName("HWC")
;msgbox,% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"))
MAIN_WINDOW:=0 ;this gets set to the main guis hwnd when it exists
APP_NAME:="JobManager"
Welcome_FLAG:=false
WelcomeText:="Welcome to JobManager. Load a Project to Continue!"
ActiveJobFile:=0
ActiveJob:=0
UnsavedChanges:=False
;This Include organizes the main GUI's menu creation
#Include resources\JobManager\Gui_Menu.ahk 
;This Include organizes the main GUI's creation
#Include resources\JobManager\Gui.ahk

return ; End of autoload section
home::
UnsavedChanges()
return



;This Include organizes the main GUI's labels (Close,Size etc.)
#Include resources\Labels\GUI.ahk
;This Include organizes the main GUI's menu labels
#Include resources\Labels\GUI_Menu.ahk
;This Include organizes functions related to the main gui
#Include resources\JobManager\GUI_Functions.ahk




;This Include organizes the programs classes (datatypes)
#Include lib\DataTypes_Manifest.ahk
;This Include organizes the programs containers (AppResoultion,IconManager etc.)
#Include lib\Manager_Manifest.ahk

;This Include handles anchoring controls
#Include lib\External\Anchor.ahk
;This Include handles retrieving the dll resources given name by index
#Include lib\External\GetIconGroupNameByIndex.ahk
;this include serializes/deserializes arrays or simple objects to a json string or back to an array/object
#Include lib\External\JSON.ahk



