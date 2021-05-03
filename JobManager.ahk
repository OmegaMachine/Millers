OnExit,GuiClose
AppResolution:=new ScreenToAppResolution(80)
IconManager:=new IconManager(A_ScriptDir . "\resources\Test.dll")


#Include resources\JobManager\Gui_Menu.ahk
#Include resources\JobManager\Gui.ahk

return



LoadJob:

return


GuiClose:
ExitApp
return


GuiSize:
;Anchor("TheEdit", "hw"), Anchor("AButton", "yx")
return







#Include lib\DataTypes_Manifest.ahk
#Include lib\Manager_Manifest.ahk
#Include lib\External\Anchor.ahk