BackgroundColor:="0xB0C7CA" ;gray
BackgroundColor:="0xF2707F" ;contrast red
BackgroundColor:="0xD6AC38" ;Gold
BackgroundColor:="0xFFFDD0" ;Cream
BackgroundColor:="0x6b3a23" ;Brown
BackgroundColor:="0x623f2a" ;Brown2
BackgroundColor:="0xa88464" ;Light Brown
BackgroundColor:="0xac998c" ;Gray Brown

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
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Quarter . " h" . AppResolution.Heights.Quarter . " xm+10" . " y+" . 10 . " vGroupBox_DailyLogWeather Section",Weather
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "p+1" . " yp+" . "15" . "  vDailyLog_MorningText +ReadOnly +Center",Morning Status
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "s+10" . " vDailyLog_MorningDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Types"),"SUNNY")
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+25" . " vDailyLog_MorningTempText +ReadOnly +Center",Morning Temp
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vDailyLog_MorningTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+25" . " vDailyLog_LunchText +ReadOnly +Center",Lunch Status
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vDailyLog_LunchDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Types"),"SUNNY")
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+25" . " vDailyLog_LunchTempText +ReadOnly +Center",Lunch Temp
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vDailyLog_LunchTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+25" . " vDailyLog_EveningText +ReadOnly +Center",Evening Status
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vDailyLog_EveningDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Types"),"SUNNY")
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+25" . " vDailyLog_EveningTempText +ReadOnly +Center",Evening Temp
Gui,1: Add, DropDownList,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 200 . " x" . "+5" . " y" . "p" . " vDailyLog_EveningTempDDL +Center gGuiGeneralModify",% ListManager.ListToDelimited(ListManager.ListByName("Weather_Temperatures"),1)
Gui,1: Add, Text,% "w" . AppResolution.Widths.TenthMinusPadding . " h" . 20 . " x" . "s+1" . " y" . "p+30" . " vDailyLog_HumidityText +ReadOnly +Center",Humidity (`%)
Gui,1: Add, Edit,% "w" . AppResolution.Widths.EigthMinusPadding . " h" . 20 . " x" . "+5" . " y" . "p" . " vDailyLog_HumidityDDL +Center gGuiGeneralModify +Number +Limit2 +Number ",50

;Groupbox Emulsion
Gui,1: Add, GroupBox,% "w" . AppResolution.Widths.Quarter . " h" . AppResolution.Heights.Quarter . " x" . AppResolution.Positions.2ndQuarterPlusPadding+5 . " ys" . " vGroupBox_DailyLogEmulsion ",Vessals && Emulsions

Gui,1: Show,% "w" . AppResolution.Width . " h" . AppResolution.height . " x" . AppResolution.x . " y" . AppResolution.y,Job Manager











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