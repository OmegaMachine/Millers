Gui,1: Menu, MainMenu
Gui,1: +Resize +MinSize

;Gui, Add, Edit, vTheEdit w400 h150, Resize this GUI
;Gui, Add, Button, vAButton w80 x+-80 y+8 Default, Do not click
Gui,1: Add, Text,% "w" . AppResolution.Width . " h" . 100 . " x" . 0  . " y" . 0 . " vWelcome_Text +ReadOnly",%WelcomeText%

Gui,1: Add, Tab3,% "w" . AppResolution.Width . " h" . AppResolution.height . " x0" . ""  . " y0" . "" . " vMain_TAB +Hidden", Job Details|Man Hours|Equipment Hours|Roads
Gui,1: Tab, 1

Gui,1: Show,% "w" . AppResolution.Width . " h" . AppResolution.height . " x" . AppResolution.x  . " y" . AppResolution.y,Job Manager