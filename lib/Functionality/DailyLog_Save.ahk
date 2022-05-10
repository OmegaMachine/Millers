DailyLog_Save:
Gui,1:Submit,NoHide
 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){
;Out("Saving... [" . DayX.Date . "] " . DayX.Weather.Morning_Status . " -> " . DailyLog_MorningDDL)
DayX.Weather.Morning_Status:=DailyLog_MorningDDL
DayX.Weather.Morning_Temp:=DailyLog_MorningTempDDL
DayX.Weather.Lunch_Status:=DailyLog_LunchDDL
DayX.Weather.Lunch_Temp:=DailyLog_LunchTempDDL
DayX.Weather.Evening_Status:=DailyLog_EveningDDL
DayX.Weather.Evening_Temp:=DailyLog_EveningTempDDL
DayX.Weather.Humidity:=DailyLog_HumidityDDL
            }
        }
;
return