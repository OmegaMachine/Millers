Add_DailyLog(__Day){
    global
    if(!__Day){
         NonFatalErrorPrompt("Operation Aborted. Date is Invalid.")
        Out("Invalid Date")
        return 0
    }
     for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = __Day){
                NonFatalErrorPrompt("Operation Aborted. Work Date Already Exists in Job.")
                Out("Work Date already Exists")
                return 0
            }
        }
        NewDailyLog:={}
        NewDailyLog.Date:=__Day

        NewDailyLog.Vessals:=[]
        NewDailyLog.WorkCompleted:=[]
        NewDailyLog.MasterAggregates:=[]
        NewDailyLog.MasterBOL:=[]
        NewDailyLog.Weather:={}
        NewDailyLog.Weather.Morning_Status:=Sunny
        NewDailyLog.Weather.Morning_Temp:=1
        NewDailyLog.Weather.Lunch_Status:=Sunny
        NewDailyLog.Weather.Lunch_Temp:=1
        NewDailyLog.Weather.Evening_Status:=Sunny
        NewDailyLog.Weather.Evening_Temp:=1
        NewDailyLog.Weather.Humidity:=50
        

        ActiveJob.SerializableData.DailyLogs.Push(NewDailyLog)
        Push_ActiveJob(ActiveJob)
UnsavedChanges(true)
    return 1
}