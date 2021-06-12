Gui,1: Menu, MainMenu
Gui,1: +Resize +MinSize +LastFound
MAIN_WINDOW:=WinExist()

Gui,1: Add,StatusBar,,% "Welcome! v" . VersionManager.Current() . " loaded!"
;Gui,1: Color, 4E4848
Gui,1: Add, Text,% "w" . AppResolution.Width . " h" . 100 . " x" . 0 . " y" . 0 . " vWelcome_Text +ReadOnly",%WelcomeText%

Gui,1: Add, Tab2,% "w" . AppResolution.Width . " h" . AppResolution.height . " x0" . "" . " y0" . "" . " vMain_TAB +Hidden ", Job Details|Man Hours|Equipment Hours|Roads
;Tab 1
Gui,1: Tab, 1
;Groupbox 1
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Quarter . " h" . AppResolution.Heights.Third . " x" . "m" . " y" . 25 . " vGroupBox_JobDetails ",Job Details
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "50" . " Section vJobDetails_JobNumberText +ReadOnly +Center",Job Number
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "s" . " vJobDetails_JobNumberDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Job_Numbers"),"555555")

Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "p+25" . " vJobDetails_JobOwnerText +ReadOnly +Center",Job Owner
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vJobDetails_JobOwnerDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Job_Owners"),"Mississippi Mills")

Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "p+25" . " vJobDetails_JobDateText +ReadOnly +Center",Job Date
Gui,1: Add, DateTime,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 20 . " x" . "+5" . " y" . "p" . " vJobDetails_JobDateTime +Center gGuiGeneralModify", LongDate
;Groupbox 2
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Quarter . " h" . AppResolution.Heights.Third . " x" . AppResolution.Positions.2ndQuarterPlusPadding . " y" . 25 . " vGroupBox_JobWeather ",Job Weather
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "p+5" . " y" . "50" . " Section vJobWeather_MorningText +ReadOnly +Center",Morning Status
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "s" . " vJobWeather_MorningDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Types"),"SUNNY")
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s" . " y" . "p+25" . " vJobWeather_MorningTempText +ReadOnly +Center",Morning Temp
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vJobWeather_MorningTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s" . " y" . "p+25" . " vJobWeather_LunchText +ReadOnly +Center",Lunch Status
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vJobWeather_LunchDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Types"),"SUNNY")
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s" . " y" . "p+25" . " vJobWeather_LunchTempText +ReadOnly +Center",Lunch Temp
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vJobWeather_LunchTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s" . " y" . "p+25" . " vJobWeather_EveningText +ReadOnly +Center",Evening Status
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vJobWeather_EveningDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Types"),"SUNNY")
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s" . " y" . "p+25" . " vJobWeather_EveningTempText +ReadOnly +Center",Evening Temp
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vJobWeather_EveningTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)

;Tab 4
Gui,1: Tab, 4
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Full . " h" . AppResolution.Heights.Sixteenth . " x" . "m" . " y" . 25 . " vGroupBox_RoadsAdd ",Add Road
Gui,1: Show,% "w" . AppResolution.Width . " h" . AppResolution.height . " x" . AppResolution.x . " y" . AppResolution.y,Job Manager