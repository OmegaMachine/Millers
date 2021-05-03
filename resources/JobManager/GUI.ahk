Gui,1: Menu, MainMenu
Gui,1: +Resize +MinSize

;Gui, Add, Edit, vTheEdit w400 h150, Resize this GUI
;Gui, Add, Button, vAButton w80 x+-80 y+8 Default, Do not click

Gui,1: Show,% "w" . AppResolution.Width . " h" . AppResolution.height . " x" . AppResolution.x  . " y" . AppResolution.y,Job Manager