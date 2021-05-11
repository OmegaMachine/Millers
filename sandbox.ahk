msgbox,%A_Now%
Gui, Add, DateTime, x102 y59 w150 h30 ggo vtt choose2021042722535320210427225353, 
; Generated using SmartGUI Creator for SciTE
Gui, Show, w479 h379, Untitled GUI
return

GuiClose:
ExitApp
go:
gui,submit,nohide
fileappend,% tt,ok.txt
return