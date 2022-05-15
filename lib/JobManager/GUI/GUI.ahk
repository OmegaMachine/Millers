BackgroundColor:="0xB0C7CA" ;gray
BackgroundColor:="0xF2707F" ;contrast red
BackgroundColor:="0xD6AC38" ;Gold
BackgroundColor:="0xFFFDD0" ;Cream
BackgroundColor:="0x6b3a23" ;Brown
BackgroundColor:="0x623f2a" ;Brown2
BackgroundColor:="0xa88464" ;Light Brown
BackgroundColor:="0xac998c" ;Gray Brown
BackgroundColor:="0x9999cc" ;light purple
BackgroundColor:="0x89abe3" ;light blue
BackgroundColor:="0xC0C0C0"
Gui,1: Menu, MainMenu
Gui,1: +Resize +MinSize +LastFound
MAIN_WINDOW:=WinExist()
Gui,1: Color, %BackgroundColor%
Gui,1: Add,StatusBar,,% "Welcome! v" . VersionManager.Current() . " loaded!"
;Gui,1: Color, 4E4848
Gui,1: Add, Text,% "w" . AppResolution.Width . " h" . 100 . " x" . 0 . " y" . 0 . " vWelcome_Text +ReadOnly",%WelcomeText%

Gui,1: Add, Tab2,% "w" . AppResolution.Width . " h" . AppResolution.height . " x0" . "" . " y0" . "" . " vMain_TAB +Hidden ", Contract Details | Daily Logging ;|Man Hours|Equipment Hours|Roads
;Tab 1
Gui,1: Tab, 1
;Groupbox 1
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Quarter . " h" . AppResolution.Heights.Third . " x" . "m" . " y" . 25 . " vGroupBox_JobDetails ",Contract Details
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "50" . " Section vJobDetails_JobNumberText +ReadOnly +Center",Job Number
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "s" . " vJobDetails_JobNumberDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Job_Numbers"),"555555")

Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "p+25" . " vJobDetails_JobOwnerText +ReadOnly +Center",Job Owner
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vJobDetails_JobOwnerDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Job_Owners"),"Mississippi Mills")

Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "p+25" . " vJobDetails_JobDateText +ReadOnly +Center",Tentative Work Date
Gui,1: Add, DateTime,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 20 . " x" . "+5" . " y" . "p" . " vJobDetails_JobDateTime +Center gGuiGeneralModify", LongDate

Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "p+25" . " vJobDetails_JobContactNameText +ReadOnly +Center",Contact name
Gui,1: Add, Edit,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 20 . " x" . "+5" . " y" . "p" . " vJobDetails_JobContactName +Center gGuiGeneralModify",John Doe

Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "p+25" . " vJobDetails_JobContactPhoneText +ReadOnly +Center",Contact Phone
Gui,1: Add, Edit,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 20 . " x" . "+5" . " y" . "p" . " vJobDetails_JobContactPhone +Center gGuiGeneralModify",613-555-2000

Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "p+25" . " vJobDetails_JobContractorText +ReadOnly +Center",General Contractor
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vJobDetails_JobContractor +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("GeneralContractors"),"Smith's - PPG")

Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "m+5" . " y" . "p+25" . " vJobDetails_JobSubcontractorText +ReadOnly +Center",Subcontractor
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vJobDetails_JobSubcontractor +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("SubContractors"),"N/A")

Gui,1: Add, Button,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 20 . " x" . "m+" . AppResolution.Widths.Quarter-AppResolution.Widths.EigthMinusPadding-5 . " y" . AppResolution.Heights.Third . " vCopyDetailsButton +Center gLoad_JobDetailsFromJob", Import Contract Details
;Groupbox 2
/*

Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Quarter . " h" . AppResolution.Heights.Third . " x" . AppResolution.Positions.2ndQuarterPlusPadding . " y" . 25 . " vGroupBox_JobWeather ",Daily Weather
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
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s" . " y" . "p+45" . " vJobWeather_HumidityText +ReadOnly +Center",Humidity(`%)
Gui,1: Add, Edit,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 20 . " x" . "+5" . " y" . "p" . " vJobWeather_HumidityDDL +Center gGuiGeneralModify +Number",50
*/
;Groupbox 3
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Full . " h" . AppResolution.Heights.Third*2-65 . " x" . "m" . " y" . AppResolution.Positions.2ndThirdPlusPadding . " vGroupBox_JobWork ",Contract Work
Gui,1: Add, ListView,% "w" . AppResolution.Widths.FullMinusPadding . " h" . AppResolution.Heights.ThirdMinusPadding+50 . " x" . "m+10" . " y" . AppResolution.Positions.2ndThirdPlusPadding2 . " vGroupBox_JobWorkLV ",Work Name|Work Type|Has Seal Coat?|Length (m)|Width (m)|Area (m2)|Notes
Gui,1: Add, Edit,% "w" . AppResolution.Widths.FullMinusPadding . " h" . AppResolution.Heights.ThirdMinusPadding2 . " x" . "m+10" . " y+5" . " vContract_JobWorkNotes gGuiGeneralModify",

;Tab 1 - Bottom Button Bar
Gui,1: Add, Button,% "w" . "120" . " h" . "20" . " x" . AppResolution.Width-140 . " y" . AppResolution.Height-50 . " vButton_PrintContractSummary gCreate_WorkSummary",Create Work Summary

;Tab 2
Gui,1: Tab, 2

Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Full . " h" . AppResolution.Heights.Full . " x" . "m" . " y" . 25 . " vGroupBox_DailyLogging ",Daily Logging
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Third+100 . " h" . AppResolution.Heights.Sixteenth . " xp+" . 5 . " yp+" . 25 . " vGroupBox_LoadLog ",Load Day
VX:=AppResolution.Widths.Third + 100
Gui,1: Add, GroupBox,% "w" . VX . " h" . AppResolution.Heights.Sixteenth . " xp+" . AppResolution.Widths.Third+105 . " yp" . " vGroupBox_NewLog ",New Day
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.ThirdMinusPadding . " h" . 200 . " x20" . " y" . "p+20" . " vDailyLogging_Days +Center gGuiDailyLoggingLoadDayAuto",
VX:=AppResolution.Widths.Third + 125
Gui,1: Add, Button,% "w90" . " h20" . " x+5" . " y" . "p" . " vDailyLogging_LoadButton +Center gGuiDailyLoggingLoadDay",Load
Gui,1: Add, DateTime,% "w" . AppResolution.Widths.ThirdMinusPadding . " h" . 20 . " x" . VX . " y" . "p" . " vDailyLogging_Cal +Center ",LongDate
Gui,1: Add, Button,% "w90" . " h20" . " x+5" . " y" . "p" . " vDailyLogging_NewButton +Center gGuiDailyLoggingNewDay",New Day
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Full-10 . " h" . AppResolution.Heights.Full-80 . " xm+5" . " yp+30 vGroupBox_DailyLog",Daily Log
Gui,1: Add, Edit,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 20 . " xp" . "+5" . " y" . "p+15" . " vDailyLog_Date +Center +ReadOnly +BackgroundTrans" . BackgroundColor,<No Day Loaded>
Gui,1: Add, Edit,% "w" . AppResolution.Widths.Full-195 . " h" . 20 . " x" . "+5" . " y" . "p" . " vDailyLog_Title +Center +ReadOnly +BackgroundTrans" . BackgroundColor,<No Day Loaded>
;Groupbox Weather
Weather_SizeOffset:=75
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Quarter . " h" . AppResolution.Heights.Quarter-Weather_SizeOffset . " xm+10" . " y+" . 10 . " vGroupBox_DailyLogWeather Section",Weather
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "p+1" . " yp+" . "15" . "  vDailyLog_MorningText +ReadOnly +Center ",Morning Status
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.Sixtenth . " h" . 200 . " x" . "+5" . " y" . "s+10" . " vDailyLog_MorningDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Types"),"SUNNY")
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.Sixtenth . " h" . 200 . " x" . "+1" . " y" . "p" . " vDailyLog_MorningTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)
;Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+25" . " vDailyLog_MorningTempText +ReadOnly +Center",Morning Temp
;Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.Sixtenth . " h" . 200 . " x" . "+5" . " y" . "p" . " vDailyLog_MorningTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+25" . " vDailyLog_LunchText +ReadOnly +Center",Lunch Status
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.Sixtenth . " h" . 200 . " x" . "+5" . " y" . "p" . " vDailyLog_LunchDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Types"),"SUNNY")
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.Sixtenth . " h" . 200 . " x" . "+1" . " y" . "p" . " vDailyLog_LunchTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+25" . " vDailyLog_EveningText +ReadOnly +Center",Evening Status
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.Sixtenth . " h" . 200 . " x" . "+5" . " y" . "p" . " vDailyLog_EveningDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Types"),"SUNNY")
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.Sixtenth . " h" . 200 . " x" . "+1" . " y" . "p" . " vDailyLog_EveningTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+30" . " vDailyLog_HumidityText +ReadOnly +Center",Humidity (`%)
Gui,1: Add, Edit,% "w" . AppResolution.Widths.SixtenthMinusPadding . " h" . 20 . " x" . "+5" . " y" . "p" . " vDailyLog_HumidityDDL +Center gGuiGeneralModify +Number +Limit2 +Number ",50

;Groupbox Emulsion
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Full-25 . " h" . AppResolution.Heights.Quarter+2 . " xm+" . 10 . " ys+" . AppResolution.Heights.Quarter-Weather_SizeOffset . " vGroupBox_DailyLogEmulsion Section",Vessals && Emulsions

;Starting Emulsion
Gui,1: Add, GroupBox,% "w" . (AppResolution.Widths.Full/5)+5 . " h" . AppResolution.Heights.Quarter-18 . " xs+5 ys+15 +Center",Starting Emulsion

Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/6) . " h20 xs+10 ys+35 vDailyLog_StartingEmulsion_ImportButton",Import...

Gui,1: Add, DropDownList,% "w" . (AppResolution.Widths.Full/5/3)+10 . " h200 x+1" . " yp +Center vDailyLog_StartingEmulsion_Vessal",% ListManager.ListToDelimited(ListManager.ListByName("Vessals"),1)
Gui,1: Add, DropDownList,% "w" . (AppResolution.Widths.Full/5/5)+10 . " h200 x+0" . " yp +Center vDailyLog_StartingEmulsion_Product",% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)
Gui,1: Add, Listview,% "w" . (AppResolution.Widths.Full/5)-3 . " h80 xs+10 ys+55 vDailyLog_StartingEmulsionsLV GSelectVessal",Vessal|Product|Quantity

Gui,1: Add, Edit,% "w" . (AppResolution.Widths.Full/5)-((AppResolution.Widths.Full/5/3)) . " h18 xs+10 ys+135 +Center +ReadOnly vDailyLog_StartingEmulsion_SelectedVessal",<Select a Vessal>

Gui,1: Add, Text,% "w" . (AppResolution.Widths.Full/5/6) . " h20 xs+10 ys+155 ",Quantity
Gui,1: Add, Edit,% "w" . ((AppResolution.Widths.Full/5)/3) . " h20 x+m" . " yp +Center +Number vDailyLog_StartingEmulsion_SelectedVessalProductQuantity",0

Gui,1: Add, Text,% "w" . (AppResolution.Widths.Full/5/6) . " h18 xs+10 y+1",Product
Gui,1: Add, DropDownList,% "w" . (AppResolution.Widths.Full/5/3) . " h200 x+m" . " yp +Center vDailyLog_StartingEmulsion_SelectedVessalProductDDL",% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)

Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-10 . " h18 x+45" . " yp gSavevessal vDailyLog_StartingEmulsion_SelectedVessalSaveButton",Save Vessal
Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-35 . " h18 xp+25" . " ys+35 gAddVessal vDailyLog_StartingEmulsion_AddVessalButton",Add...
Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-10 . " h18 xp-25" . " ys+135 gDeleteVessal vDailyLog_StartingEmulsion_SelectedVessalDeleteButton",Delete Vessal

;Recieved Emulsion
Gui,1: Add, GroupBox,% "w" . (AppResolution.Widths.Full/5)+5 . " h" . AppResolution.Heights.Quarter-18 . " x+10 ys+15 +Center Section",Recieved Emulsion

Gui,1: Add, Text,% "w" . (AppResolution.Widths.Full/5/6)+10 . " h20 xs+1" . " ys+20 +Center ",ID
Gui,1: Add, Edit,% "w" . (AppResolution.Widths.Full/5/5)+10 . " h20 x+0" . " yp +Center vDailyLog_RecievedEmulsion_ID",00000
Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-35 . " h18 x+5" . " yp gAddTicketRecieved vDailyLog_RecievedEmulsion_AddTicketButton",Add...
Gui,1: Add, Listview,% "w" . (AppResolution.Widths.Full/5)-3 . " h80 xs+10 ys+40 vDailyLog_RecievedEmulsionsLV GSelectTicketRecieved",ID|Driver|Time Out|Product Count

Gui,1: Add, Edit,% "w" . (AppResolution.Widths.Full/5)-((AppResolution.Widths.Full/5/3)) . " h18 xs+10 ys+120 +Center +ReadOnly vDailyLog_RecievedEmulsion_SelectedTicket",<Select a Ticket>

Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-10 . " h18 x+5" . " yp gEditTicketRecieved vDailyLog_RecievedEmulsion_SelectedTicketEditButton",Edit Ticket
Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-10 . " h18 xp" . " yp+40 gDeleteTicketRecieved vDailyLog_RecievedEmulsion_SelectedTicketDeleteButton",Delete Ticket

;Ending Emulsion
Gui,1: Add, GroupBox,% "w" . (AppResolution.Widths.Full/5)+5 . " h" . AppResolution.Heights.Quarter-18 . " xs+" . (AppResolution.Widths.Full/5)+5+5 . " ys +Center Section",Ending Emulsion

Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/6) . " h20 xs+10 ys+20 vDailyLog_EndingEmulsion_ImportButton",Import...

Gui,1: Add, DropDownList,% "w" . (AppResolution.Widths.Full/5/3)+10 . " h200 x+1" . " yp +Center vDailyLog_EndingEmulsion_Vessal",% ListManager.ListToDelimited(ListManager.ListByName("Vessals"),1)
Gui,1: Add, DropDownList,% "w" . (AppResolution.Widths.Full/5/5)+10 . " h200 x+0" . " yp +Center vDailyLog_EndingEmulsion_Product",% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)
Gui,1: Add, Listview,% "w" . (AppResolution.Widths.Full/5)-3 . " h80 xs+10 ys+40 vDailyLog_EndingEmulsionsLV GSelectVessalEnding",Vessal|Product|Quantity

Gui,1: Add, Edit,% "w" . (AppResolution.Widths.Full/5)-((AppResolution.Widths.Full/5/3)) . " h18 xs+10 ys+120 +Center +ReadOnly vDailyLog_EndingEmulsion_SelectedVessal",<Select a Vessal>

Gui,1: Add, Text,% "w" . (AppResolution.Widths.Full/5/6) . " h20 xs+10 ys+140 ",Quantity
Gui,1: Add, Edit,% "w" . ((AppResolution.Widths.Full/5)/3) . " h20 x+m" . " yp +Center +Number vDailyLog_EndingEmulsion_SelectedVessalProductQuantity",0

Gui,1: Add, Text,% "w" . (AppResolution.Widths.Full/5/6) . " h18 xs+10 y+1",Product
Gui,1: Add, DropDownList,% "w" . (AppResolution.Widths.Full/5/3) . " h200 x+m" . " yp +Center vDailyLog_EndingEmulsion_SelectedVessalProductDDL",% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)

Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-10 . " h18 x+45" . " yp gSavevessalEnding vDailyLog_EndingEmulsion_SelectedVessalSaveButton",Save Vessal
Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-35 . " h18 xp+25" . " ys+20 gAddVessalEnding vDailyLog_EndingEmulsion_AddVessalButton",Add...
Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-10 . " h18 xp-25" . " ys+120 gDeleteVessalEnding vDailyLog_EndingEmulsion_SelectedVessalDeleteButton",Delete Vessal

;Calculcated Emulsions

Gui,1: Add, GroupBox,% "w" . (AppResolution.Widths.Full/3)+30 . " h" . AppResolution.Heights.Quarter-18 . " xs+" . (AppResolution.Widths.Full/5)+5+5 . " ys +Center Section",Calculated Emulsions Used


Gui,1: Add, GroupBox,% "w" . (AppResolution.Widths.Full/6)+10 . " h" . AppResolution.Heights.Quarter-37 . " xs+" . 5 . " ys+15 +Center ",Calculated by Start/End Emulsions
Gui,1: Add, Listview,% "w" . (AppResolution.Widths.Full/6) . " h" . 100 . " xs+" . 10 . " ys+40 vDailyLog_CalculatedEmulsionsLVEnd ",Product|Quantity
Gui,1: Add, GroupBox,% "w" . (AppResolution.Widths.Full/6)+10 . " h" . AppResolution.Heights.Quarter-37 . " xs+" . (AppResolution.Widths.Full/6)+15 . " ys+15 +Center ",Calculated by Work Completed
Gui,1: Add, Listview,% "w" . (AppResolution.Widths.Full/6) . " h" . 100 . " xp+" . 5 . " ys+40 vDailyLog_CalculatedEmulsionsLVWork ",Product|Quantity

;Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/6) . " h20 xs+10 ys+20 vDailyLog_EndingEmulsion_ImportButton",Import...

;Gui,1: Add, DropDownList,% "w" . (AppResolution.Widths.Full/5/3)+10 . " h200 x+1" . " yp +Center vDailyLog_EndingEmulsion_Vessal",% ListManager.ListToDelimited(ListManager.ListByName("Vessals"),1)
;Gui,1: Add, DropDownList,% "w" . (AppResolution.Widths.Full/5/5)+10 . " h200 x+0" . " yp +Center vDailyLog_EndingEmulsion_Product",% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)
;Gui,1: Add, Listview,% "w" . (AppResolution.Widths.Full/5)-3 . " h80 xs+10 ys+40 vDailyLog_EndingEmulsionsLV GSelectVessalEnding",Vessal|Product|Quantity

;Gui,1: Add, Edit,% "w" . (AppResolution.Widths.Full/5)-((AppResolution.Widths.Full/5/3)) . " h18 xs+10 ys+120 +Center +ReadOnly vDailyLog_EndingEmulsion_SelectedVessal",<Select a Vessal>

;Gui,1: Add, Text,% "w" . (AppResolution.Widths.Full/5/6) . " h20 xs+10 ys+140 ",Quantity
;Gui,1: Add, Edit,% "w" . ((AppResolution.Widths.Full/5)/3) . " h20 x+m" . " yp +Center +Number vDailyLog_EndingEmulsion_SelectedVessalProductQuantity",0

;Gui,1: Add, Text,% "w" . (AppResolution.Widths.Full/5/6) . " h18 xs+10 y+1",Product
;Gui,1: Add, DropDownList,% "w" . (AppResolution.Widths.Full/5/3) . " h200 x+m" . " yp +Center vDailyLog_EndingEmulsion_SelectedVessalProductDDL",% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)

;Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-10 . " h18 x+45" . " yp gSavevessalEnding vDailyLog_EndingEmulsion_SelectedVessalSaveButton",Save Vessal
;Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-35 . " h18 xp+25" . " ys+20 gAddVessalEnding vDailyLog_EndingEmulsion_AddVessalButton",Add...
;Gui,1: Add, Button,% "w" . (AppResolution.Widths.Full/5/3)-10 . " h18 xp-25" . " ys+120 gDeleteVessalEnding vDailyLog_EndingEmulsion_SelectedVessalDeleteButton",Delete Vessal




/*


WWH:=(AppResolution.Widths.Half/5)
Gui,1: Add, Text,% "w" . (AppResolution.Widths.Half/5) . " h20 xs+" . WWH . " ys+20 +Center",Recieved Emulsion
Gui,1: Add, Button,% "w" . (AppResolution.Widths.Half/10) . " h20 xs+" . WWH+10 . " ys+40",Import
Gui,1: Add, Listview,% "w" . (AppResolution.Widths.Half/5) . " h80 xs+" . WWH+10 . " ys+60",Product|Quantity
Gui,1: Add, Edit,% "w" . (AppResolution.Widths.Half/5) . " h18 xs+" . WWH+10 . " ys+142 +Center +ReadOnly -E0x200",Select a Product
Gui,1: Add, Text,% "w" . (AppResolution.Widths.Half/10) . " h20 xs+" . WWH+10 . " ys+160",Quantity
WW:=(AppResolution.Widths.Half/10)+10
Gui,1: Add, Edit,% "w" . (AppResolution.Widths.Half/10) . " h20 xs+" . WWH+WW . " ys+160 +Center +Number",0
Gui,1: Add, Button,% "w" . (AppResolution.Widths.Half/10) . " h20 xs+" . WWH+WW . " ys+180",Save
*/
Gui,1: Add, Button,% "w" . "120" . " h" . "20" . " x" . AppResolution.Width-140 . " y" . AppResolution.Height-60 . " vButton_SaveDailyLog gDailyLog_Save",Save Log

Gui,1: Show,% "w" . AppResolution.Width . " h" . AppResolution.height . " x" . AppResolution.x . " y" . AppResolution.y,Job Manager

Disable_StartingEmulsion_Fields()
Disable_EndingEmulsion_Fields()
Disable_RecievedEmulsion_Fields()

Disable_VessalsAndEmulsions()





Gui,11: +Owner1
Gui,11: Add, GroupBox, x12 y9 w920 h220 , New Contract Work Details
Gui,11: Add, Button, x822 y199 w100 h20 gSubmit_NewWork, Add Work
Gui,11: Add, Text, x22 y29 w90 h20 , Work Name
Gui,11: Add, Edit, x22 y49 w90 h20 v_NewWork_Name,
Gui,11: Add, Text, x122 y29 w90 h20 , Work Type
Gui,11: Add, DropDownList, x122 y49 w90 h200 v_NewWork_Type,% ListManager.ListToDelimited(ListManager.ListByName("Work_Types"),1)
Gui,11: Add, Text, x222 y29 w60 h20 , Fog Seal?
Gui,11: Add, DropDownList, x222 y49 w60 h200 v_NewWork_HasFog,% ListManager.ListToDelimited(ListManager.ListByName("YesNo"),2)
Gui,11: Add, Text, x292 y29 w60 h20 , Length (m)
Gui,11: Add, Edit, x292 y49 w60 h20 v_NewWork_Length gUpdate_Area, 0
Gui,11: Add, Text, x362 y29 w60 h20 , Width (m)
Gui,11: Add, Edit, x362 y49 w60 h20 v_NewWork_Width gUpdate_Area, 0
Gui,11: Add, Text, x432 y29 w60 h20 , Area (m2)
Gui,11: Add, Edit, x432 y49 w60 h20 v_NewWork_Area +ReadOnly, 0

Gui,11: Add, Text, x22 y69 w90 h20 , Notes
Gui,11: Add, Edit, x22 y89 w350 h100 v_NewWork_Notes,

Gui,11: Add, GroupBox, x502 y29 w210 h150 , Emulsion
Gui,11: Add, Text, x512 y49 w60 h20 , Base Type
Gui,11: Add, DropDownList, x512 y69 w60 h200 v_NewWork_BottomEmulsion_Type,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)
Gui,11: Add, Text, x512 y89 w60 h20 , Target Rate
Gui,11: Add, Edit, x512 y109 w60 h20 v_NewWork_BottomEmulsion_Rate, 1.6
Gui,11: Add, Text, x572 y49 w60 h20 , Top Type
Gui,11: Add, DropDownList, x572 y69 w60 h200 v_NewWork_TopEmulsion_Type,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)
Gui,11: Add, Text, x572 y89 w60 h20 , Target Rate
Gui,11: Add, Edit, x572 y109 w60 h20 v_NewWork_TopEmulsion_Rate, 1.6
Gui,11: Add, Text, x632 y49 w60 h20 , Seal Type
Gui,11: Add, DropDownList, x632 y69 w60 h200 v_NewWork_SealCoatEmulsion_Type,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)
Gui,11: Add, Text, x632 y89 w60 h20 , Target Rate
Gui,11: Add, Edit, x632 y109 w60 h20 v_NewWork_SealCoatEmulsion_Rate, 0.7
Gui,11: Add, Text, x512 y129 w60 h20 , Source
Gui,11: Add, DropDownList, x512 y149 w60 h200 v_NewWork_BottomEmulsion_Source,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Sources"),1)
Gui,11: Add, Text, x572 y129 w60 h20 , Source
Gui,11: Add, DropDownList, x572 y149 w60 h200 v_NewWork_TopEmulsion_Source,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Sources"),1)
Gui,11: Add, Text, x632 y129 w60 h20 , Source
Gui,11: Add, DropDownList, x632 y149 w60 h200 v_NewWork_SealCoatEmulsion_Source,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Sources"),1)
Gui,11: Add, GroupBox, x712 y29 w210 h150 , Aggregate
Gui,11: Add, Text, x722 y49 w60 h20 , Base Type
Gui,11: Add, DropDownList, x722 y69 w60 h200 v_NewWork_BottomAgg_Type,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Types"),1)
Gui,11: Add, Text, x722 y89 w60 h20 , Target Rate
Gui,11: Add, Edit, x722 y109 w60 h20 v_NewWork_BottomAgg_Rate,17
Gui,11: Add, Text, x722 y129 w60 h20 , Source
Gui,11: Add, DropDownList, x722 y149 w60 h200 v_NewWork_BottomAgg_Source,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Sources"),1)
Gui,11: Add, Text, x782 y49 w60 h20 , Top Type
Gui,11: Add, DropDownList, x782 y69 w60 h200 v_NewWork_TopAgg_Type,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Types"),1)
Gui,11: Add, Text, x782 y89 w60 h20 , Target Rate
Gui,11: Add, Edit, x782 y109 w60 h20 v_NewWork_TopAgg_Rate, 19
Gui,11: Add, Text, x782 y129 w60 h20 , Source
Gui,11: Add, DropDownList, x782 y149 w60 h200 v_NewWork_TopAgg_Source,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Sources"),1)
Gui,11: Add, Text, x842 y49 w60 h20 , Seal Type
Gui,11: Add, DropDownList, x842 y69 w60 h200 v_NewWork_SealCoatAgg_Type,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Types"),1)
Gui,11: Add, Text, x842 y89 w60 h20 , Target Rate
Gui,11: Add, Edit, x842 y109 w60 h20 v_NewWork_SealCoatAgg_Rate, 2
Gui,11: Add, Text, x842 y129 w60 h20 , Source
Gui,11: Add, DropDownList, x842 y149 w60 h200 v_NewWork_SealCoatAgg_Source,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Sources"),1)








;Remove Contract Work
Gui,12: +Owner1
Gui,12: Add, GroupBox, x12 y9 w380 h80 ,Contract Work Name
Gui,12: Add, Button, x280 y50 w100 h20 gSubmit_RemoveWork, Remove Work
Gui,12: Add, Text, x22 y29 w90 h20 , Work Name
Gui,12: Add, DropDownList, x22 y49 w200 h200 v_RemoveWork_Name,

;Edit Work
Gui,13: +Owner1
Gui,13: Add, GroupBox, x12 y9 w920 h220 , Contract Work Details
Gui,13: Add, Button, x822 y199 w100 h20 gSubmit_EditWork, Save
Gui,13: Add, Text, x22 y29 w90 h20 , Work Name
Gui,13: Add, Edit, x22 y49 w90 h20 v_EditWork_Name,
Gui,13: Add, Text, x122 y29 w90 h20 , Work Type
Gui,13: Add, DropDownList, x122 y49 w90 h200 v_EditWork_Type,% ListManager.ListToDelimited(ListManager.ListByName("Work_Types"),1)
Gui,13: Add, Text, x222 y29 w60 h20 , Fog Seal?
Gui,13: Add, DropDownList, x222 y49 w60 h200 v_EditWork_HasFog,% ListManager.ListToDelimited(ListManager.ListByName("YesNo"),2)
Gui,13: Add, Text, x292 y29 w60 h20 , Length (m)
Gui,13: Add, Edit, x292 y49 w60 h20 v_EditWork_Length gUpdate_AreaEdit, 0
Gui,13: Add, Text, x362 y29 w60 h20 , Width (m)
Gui,13: Add, Edit, x362 y49 w60 h20 v_EditWork_Width gUpdate_AreaEdit, 0
Gui,13: Add, Text, x432 y29 w60 h20 , Area (m2)
Gui,13: Add, Edit, x432 y49 w60 h20 v_EditWork_Area +ReadOnly, 0

Gui,13: Add, Text, x22 y69 w90 h20 , Notes
Gui,13: Add, Edit, x22 y89 w350 h100 v_EditWork_Notes,

Gui,13: Add, GroupBox, x502 y29 w210 h150 , Emulsion
Gui,13: Add, Text, x512 y49 w60 h20 , Base Type
Gui,13: Add, DropDownList, x512 y69 w60 h200 v_EditWork_BottomEmulsion_Type ,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)
Gui,13: Add, Text, x512 y89 w60 h20 , Target Rate
Gui,13: Add, Edit, x512 y109 w60 h20 v_EditWork_BottomEmulsion_Rate, 1.6
Gui,13: Add, Text, x572 y49 w60 h20 , Top Type
Gui,13: Add, DropDownList, x572 y69 w60 h200 v_EditWork_TopEmulsion_Type ,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)
Gui,13: Add, Text, x572 y89 w60 h20 , Target Rate
Gui,13: Add, Edit, x572 y109 w60 h20 v_EditWork_TopEmulsion_Rate, 1.6
Gui,13: Add, Text, x632 y49 w60 h20 , Seal Type
Gui,13: Add, DropDownList, x632 y69 w60 h200 v_EditWork_SealCoatEmulsion_Type,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Types"),1)
Gui,13: Add, Text, x632 y89 w60 h20 , Target Rate
Gui,13: Add, Edit, x632 y109 w60 h20 v_EditWork_SealCoatEmulsion_Rate, 0.7
Gui,13: Add, Text, x512 y129 w60 h20 , Source
Gui,13: Add, DropDownList, x512 y149 w60 h200 v_EditWork_BottomEmulsion_Source,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Sources"),1)
Gui,13: Add, Text, x572 y129 w60 h20 , Source
Gui,13: Add, DropDownList, x572 y149 w60 h200 v_EditWork_TopEmulsion_Source,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Sources"),1)
Gui,13: Add, Text, x632 y129 w60 h20 , Source
Gui,13: Add, DropDownList, x632 y149 w60 h200 v_EditWork_SealCoatEmulsion_Source,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Sources"),1)
Gui,13: Add, GroupBox, x712 y29 w210 h150 , Aggregate
Gui,13: Add, Text, x722 y49 w60 h20 , Base Type
Gui,13: Add, DropDownList, x722 y69 w60 h200 v_EditWork_BottomAgg_Type,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Types"),1)
Gui,13: Add, Text, x722 y89 w60 h20 , Target Rate
Gui,13: Add, Edit, x722 y109 w60 h20 v_EditWork_BottomAgg_Rate,17
Gui,13: Add, Text, x722 y129 w60 h20 , Source
Gui,13: Add, DropDownList, x722 y149 w60 h200 v_EditWork_BottomAgg_Source,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Sources"),1)
Gui,13: Add, Text, x782 y49 w60 h20 , Top Type
Gui,13: Add, DropDownList, x782 y69 w60 h200 v_EditWork_TopAgg_Type,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Types"),1)
Gui,13: Add, Text, x782 y89 w60 h20 , Target Rate
Gui,13: Add, Edit, x782 y109 w60 h20 v_EditWork_TopAgg_Rate, 19
Gui,13: Add, Text, x782 y129 w60 h20 , Source
Gui,13: Add, DropDownList, x782 y149 w60 h200 v_EditWork_TopAgg_Source,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Sources"),1)
Gui,13: Add, Text, x842 y49 w60 h20 , Seal Type
Gui,13: Add, DropDownList, x842 y69 w60 h200 v_EditWork_SealCoatAgg_Type,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Types"),1)
Gui,13: Add, Text, x842 y89 w60 h20 , Target Rate
Gui,13: Add, Edit, x842 y109 w60 h20 v_EditWork_SealCoatAgg_Rate, 2
Gui,13: Add, Text, x842 y129 w60 h20 , Source
Gui,13: Add, DropDownList, x842 y149 w60 h200 v_EditWork_SealCoatAgg_Source,% ListManager.ListToDelimited(ListManager.ListByName("Aggregate_Sources"),1)

;Add job Number
Gui,16: +Owner1
Gui,16: Add, GroupBox, x2 y0 w290 h170 , Job Numbers
Gui,16: Add, ListBox, x12 y19 w180 h130 vJobNumber_LB gLB_SelectJobNumber,% ListManager.ListToDelimited(ListManager.ListByName("Job_Numbers"))
Gui,16: Add, Edit, x12 y149 w100 h20 v_NewJobNumber,
Gui,16: Add, Button, x112 y149 w80 h20 gLB_AddJobNumber, Add New
Gui,16: Add, Button, x202 y39 w80 h20 gLB_DeleteJobNumber, Delete
Gui,16: Add, Text, x202 y9 w80 h20 +Center vJobNumber_SelectionText, <Select>


;Ticket Editor
Gui,22: +Owner1
Gui,22:  Add, GroupBox, x2 y-1 w570 h90 vTicketEditor_Groupbox, Ticket Details
Gui,22:  Add, Text, x22 y19 w60 h20 , Ticket ID
Gui,22:  Add, Edit, x82 y19 w100 h20 vTicketEditor_ID,
Gui,22:  Add, Text, x22 y39 w60 h20 , Driver
Gui,22:  Add, DropDownList, x82 y39 w100 h200  vTicketEditor_DriverDDL,% ListManager.ListToDelimited(ListManager.ListByName("Drivers_Emulsion"),1)
Gui,22:  Add, Text, x202 y19 w60 h20 , Time In
Gui,22:  Add, Edit, x262 y19 w100 h20  vTicketEditor_TimeIn,
Gui,22:  Add, Text, x202 y39 w60 h20 , Time Out
Gui,22:  Add, Edit, x262 y39 w100 h20  vTicketEditor_TimeOut,
Gui,22:  Add, Text, x382 y19 w60 h20 , Source
Gui,22:  Add, DropDownList, x442 y19 w120 h200 vTicketEditor_SourceDDL,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_Sources"),1)
Gui,22:  Add, Text, x22 y59 w60 h20 , Job PO
Gui,22:  Add, DropDownList, x82 y59 w100 h200 vTicketEditor_JobPODDL,% ListManager.ListToDelimited(ListManager.ListByName("Job_PO"),1)
Gui,22:  Add, Text, x202 y59 w60 h20 , Emulsion PO
Gui,22:  Add, DropDownList, x262 y59 w100 h200 vTicketEditor_EmulsionPODDL,% ListManager.ListToDelimited(ListManager.ListByName("Emulsion_PO"),1)
Gui,22:  Add, Text, x382 y39 w60 h20 , Date
Gui,22:  Add, DateTime, x442 y39 w120 h20  vTicketEditor_Date, 
Gui,22:  Add, Button, x472 y59 w90 h20 gTicketEditor_SaveDetails, Save Details

Gui,22:  Add, GroupBox, x2 y99 w570 h320 , Products

Gui,22:  Add, GroupBox, x12 y119 w550 h170 , Viewer
Gui,22:  Add, ListView, x22 y139 w530 h140 , Vessal|Product|Quantity (L)|Gross (KG)|Tare (KG)|Net (KG)

Gui,22:  Add, GroupBox, x12 y289 w550 h100 , Edit Product (<Select a Product>)
Gui,22:  Add, Text, x22 y309 w60 h20 , Vessal
Gui,22:  Add, Edit, x82 y309 w100 h20 vTicketEditor_ProductVessal,
Gui,22:  Add, Text, x202 y309 w60 h20 , Product
Gui,22:  Add, Edit, x262 y309 w100 h20 vTicketEditor_ProductProduct,
Gui,22:  Add, Text, x382 y309 w60 h20 , Quantity (L)
Gui,22:  Add, Edit, x442 y309 w100 h20 vTicketEditor_ProductQuantity,
Gui,22:  Add, Text, x22 y329 w60 h20 , Gross (KG)
Gui,22:  Add, Edit, x82 y329 w100 h20 vTicketEditor_ProductGross,
Gui,22:  Add, Text, x202 y329 w60 h20 , Tare (KG)
Gui,22:  Add, Edit, x262 y329 w100 h20 vTicketEditor_ProductTare,
Gui,22:  Add, Text, x382 y329 w60 h20 , Net (KG)
Gui,22:  Add, Edit, x442 y329 w100 h20 vTicketEditor_ProductNet,
Gui,22:  Add, Text, x22 y349 w60 h20 , Temp (C)
Gui,22:  Add, Edit, x82 y349 w100 h20 vTicketEditor_ProductTemp,
Gui,22:  Add, Button, x462 y359 w80 h20 vTicketEditor_ProductSave, Save Product
Gui,22:  Add, Button, x372 y359 w80 h20 vTicketEditor_ProductDelete, Delete Product
Gui,22:  Add, Button, x12 y389 w100 h20 , Add New Product
Gui,22:  Add, Button, x372 y59 w100 h20 gTicketEditor_Delete, Delete Ticket

/*

Gui,16: Add, Button, x280 y50 w100 h20 gSubmit_RemoveWork, Remove Work
Gui,16: Add, Text, x22 y29 w90 h20 , Work Name
Gui,16: Add, DropDownList, x22 y49 w200 h200 v_RemoveWork_Name,
*/