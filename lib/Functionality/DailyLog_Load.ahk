GuiDailyLoggingLoadDay:
Gui,1:Submit,NoHide
Gui,1:Default

 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){
                ;Date & Title
GuiControl,,DailyLog_Date,% DayX.Date
GuiControl,,DailyLog_Title,% ActiveJob.SerializableData.JobNumber . " - " . ActiveJob.SerializableData.JobOwner
                ;Weather
;msgbox,% DayX.Weather.Morning_Status
GuiControl,Choose,DailyLog_MorningDDL,% DayX.Weather.Morning_Status
GuiControl,Choose,DailyLog_MorningTempDDL,% DayX.Weather.Morning_Temp
GuiControl,Choose,DailyLog_LunchDDL,% DayX.Weather.Lunch_Status
GuiControl,Choose,DailyLog_LunchTempDDL,% DayX.Weather.Lunch_Temp
GuiControl,Choose,DailyLog_EveningDDL,% DayX.Weather.Evening_Status
GuiControl,Choose,DailyLog_EveningTempDDL,% DayX.Weather.Evening_Temp
GuiControl,,DailyLog_HumidityDDL,% DayX.Weather.Humidity

;Starting Emulsions
Gui,1:Listview,DailyLog_StartingEmulsionsLV
Disable_StartingEmulsion_Fields()
GuiControl,,DailyLog_StartingEmulsion_SelectedVessal,<Select a Vessal>
GuiControl,ChooseString,DailyLog_StartingEmulsion_SelectedVessalProductDDL,N/A
GuiControl,,DailyLog_StartingEmulsion_SelectedVessalProductQuantity,0

LV_Delete()
for index2,VessalX in DayX.StartingEmulsion
        {
            LV_Add("",VessalX.Name,VessalX.Product,VessalX.Quantity)
        }

        ;Ending Emulsions
Gui,1:Listview,DailyLog_EndingEmulsionsLV
Disable_EndingEmulsion_Fields()
GuiControl,,DailyLog_EndingEmulsion_SelectedVessal,<Select a Vessal>
GuiControl,ChooseString,DailyLog_EndingEmulsion_SelectedVessalProductDDL,N/A
GuiControl,,DailyLog_EndingEmulsion_SelectedVessalProductQuantity,0

LV_Delete()
for index2,VessalX in DayX.EndingEmulsion
        {
            LV_Add("",VessalX.Name,VessalX.Product,VessalX.Quantity)
        }

            }
        }
Return