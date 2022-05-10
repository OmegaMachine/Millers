
VersionManager:=new VersionManager(0,1,2,7) ; (Release,GUI,Functionality,Bugs)
Out("Initializing v" . VersionManager.Current())
UpdateManager:=new GitUpdateManager(VersionManager.current(),_UpdateURL)
AppResolution:=new ScreenToAppResolution(75) ;This container translates the screens resolution to the app and app controls. It is given a percentage of the screen.
IconManager:=new IconManager(A_ScriptDir . "\lib\Test.dll") ;This container manages a resource only dll containing icons. the icons can be referenced by ID or resource name.
ListManager:=new DataManager(A_ScriptDir . "\lib\Data.MDAT") ;this container manages MDAT files ( a .ini file). it can draw lists of preset information such as weather types or employee data. as well as basic program settings
Serializer:=new Serializer() ;This manager can serialize json strings to objects/arrays and vice versa
Menu, Tray, Icon,% IconManager.DLLPath,% IconManager.IconIDByName("HWC") ;Sets Tray Icon
;msgbox,% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"))
MAIN_WINDOW:=0 ;this gets set to the main guis hwnd when it exists
APP_NAME:="QC Systems - Daily Logging"
Welcome_FLAG:=false
WelcomeText:="Welcome to QC Systems. Load a Project to Continue!"
ActiveJobFile:=0
ActiveJob:=0
UnsavedChanges:=False
INTERNAL_LOADING:=true
CONTEXTMENU_CREATED:=False
;This Include organizes the main GUI's menu creation
#Include lib\JobManager\GUI\Gui_Menu.ahk 
;This Include organizes the main GUI's creation
#Include lib\JobManager\GUI\Gui.ahk

;This determines if the program should automatically load a job file when initiating
#Include lib\Functionality\Autoload.ahk

return ; End of autoload section (Also returns in Autoload)
Home::
WinSet Top,, ahk_id %GroupBox_DailyLogging%
return
;This Include organizes the main GUI's labels (Close,Size etc.)
#Include lib\Labels\GUI.ahk
;This Include organizes the main GUI's menu labels and other program functionality
#Include lib\Labels\GUI_Menu.ahk
#Include lib\Functionality\AddWork.ahk
#Include lib\Functionality\RemoveWork.ahk
#Include lib\Functionality\CopyWork.ahk
#Include lib\Functionality\EditWork.ahk
#Include lib\Functionality\NewBlankJob.ahk
#Include lib\Functionality\SavingJob.ahk
#Include lib\Functionality\LoadingJob.ahk
#Include lib\Functionality\AddDailyLog.ahk
#Include lib\Functionality\AddJobNumber.ahk
#Include lib\Functionality\DailyLog_Save.ahk
#Include lib\Functionality\DailyLog_Load.ahk
#Include lib\Functionality\DailyLog_StartingEmulsion.ahk
#Include lib\Functionality\DailyLog_EndingEmulsion.ahk
#Include lib\JobManager\GUI\GUI_Context.ahk 
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
#Include lib\External\WorkbookWrapper.ahk
;this include serializes/deserializes arrays or simple objects to a json string or back to an array/object
#Include lib\External\JSON.ahk
;this external allows AES encryption of strings
#Include lib\External\AES.ahk
#Include lib\External\Array_GUI.ahk

