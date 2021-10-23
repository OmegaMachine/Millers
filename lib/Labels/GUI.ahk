GuiContextMenu:
if(A_GuiControl="GroupBox_JobWorkLV"){
    RowX:=LV_GetNext()
    LV_GetText(RowXText, RowX, 1)
if(RowX){
    Menu, EditContractWorkMenu, Add, Edit, EditWork
    Menu, EditContractWorkMenu, Add, Remove, Context_RemoveWork
    Menu, EditContractWorkMenu, Add, New Contract Work, Context_NewWork
    Menu, EditContractWorkMenu, Show
}else{
    Menu, WorkMenuContext, Add, New Contract Work, Context_NewWork
    Menu, WorkMenuContext, Show
}

}
return
GuiClose:
    if(UnsavedChanges){
        MsgBox, 4388, Unsaved Changes, There are unsaved changes to the current job file. would you like to discard them and close the active job?
        IfMsgBox, No
        {
            Out("Close Job Failed. Unsaved Changes.",1)
            return
        }
    }
exitapp
return

GuiSize:
    ;Anchor("Main_TAB", "hw"), Anchor("AButton", "yx")

    Anchor("Welcome_Text", "hw")
    Anchor("Main_TAB", "hw")
        ;Tab 1
    ;Groupbox 1
    /*


    ;Anchor("GroupBox_JobDetails","w0.25h0.3")
    Anchor("JobDetails_JobNumberText","x0.05")
    Anchor("JobDetails_JobNumberDDL","w0.125x0.1")
    Anchor("JobDetails_JobOwnerText","x0.05")
    Anchor("JobDetails_JobOwnerDDL","w0.125x0.1")
    Anchor("JobDetails_JobDateText","x0.05")
    Anchor("JobDetails_JobDateTime","w0.125x0.1")
    Anchor("JobDetails_JobContactNameText","w0.125x0.1")
    Anchor("JobDetails_JobContactName","w0.125x0.1")
    Anchor("JobDetails_JobContactPhoneText","w0.125x0.1")
    Anchor("JobDetails_JobContactPhone","w0.125x0.1")
    Anchor("JobDetails_JobContractorText","w0.125x0.1")
    Anchor("JobDetails_JobContractor","w0.125x0.1")
    Anchor("JobDetails_JobSubcontractorText","w0.125x0.1")
    Anchor("JobDetails_JobSubcontractor","w0.125x0.1")
       
    ;Groupbox 2
    Anchor("GroupBox_JobWeather","w0.25h0.3x0.3")
    Anchor("JobWeather_MorningText","x0.3")
    Anchor("JobWeather_MorningDDL","w0.125x0.3")
    Anchor("JobWeather_MorningTempText","x0.3")
    Anchor("JobWeather_MorningTempDDL","w0.125x0.3")

    Anchor("JobWeather_LunchText","x0.3")
    Anchor("JobWeather_LunchDDL","w0.125x0.3")
    Anchor("JobWeather_LunchTempText","x0.3")
    Anchor("JobWeather_LunchTempDDL","w0.125x0.3")

    Anchor("JobWeather_EveningText","x0.3")
    Anchor("JobWeather_EveningDDL","w0.125x0.3")
    Anchor("JobWeather_EveningTempText","x0.3")
    Anchor("JobWeather_EveningTempDDL","w0.125x0.3")

    Anchor("JobWeather_HumidityText","x0.3")
    Anchor("JobWeather_HumidityDDL","w0.125x0.3")

    Anchor("CopyDetailsButton","x0.25y0.3")
    */
    ;Groupbox 3
     Anchor("GroupBox_JobWork","w1h1")
     Anchor("GroupBox_JobWorkLV","w1")
     Anchor("Contract_JobWorkNotes","w1h1")
     
     ;Tab 1 - Bottom Button Bar
     Anchor("Button_PrintContractSummary","xy")
        ;Tab 2
    ;Groupbox 1 (Add)
    Anchor("GroupBox_DailyLogging","w1h1")
    Anchor("GroupBox_DailyLog","w1h1")
    Anchor("DailyLog_Title","w1")
    
    CurrHeight:=A_GuiHeight
    CurrWidth:=A_GUIWidth
return

GuiGeneralModify:
    UnsavedChanges()
   if(A_GuiControl="JobDetails_JobNumberDDL"){
       Gui,1:Submit,NoHide
       if(JobDetails_JobNumberDDL = "<Add New>"){
           GuiControl,ChooseString,JobDetails_JobNumberDDL,% ActiveJob.SerializableData.JobNumber
           msgbox,Adding New Job Number **Incomplete
       }
   }
return
GuiDailyLoggingLoadDayAuto:
if(ListManager.GetData("AutoloadDailyLogDropdown",false)){
    Goto,GuiDailyLoggingLoadDay
}
Return
GuiDailyLoggingLoadDay:
Gui,1:Submit,NoHide
 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){
GuiControl,,DailyLog_Date,% DayX.Date
GuiControl,,DailyLog_Title,% ActiveJob.SerializableData.JobNumber . " - " . ActiveJob.SerializableData.JobOwner
            }
        }

Return

GuiDailyLoggingNewDay:
Gui,1:Submit,NoHide
FormatTime, DailyLogging_CalModified , %DailyLogging_Cal%, M/d/yyyy
if(Add_DailyLog(DailyLogging_CalModified)){
InfoMessage("New daily log has been added.")
}
Return

Load_JobDetailsFromJob:
UnsavedChanges()
  Out("Loading Job Data.")

        MsgBox, 4388, Contract Information, This will overwrite the current jobs contract details, including contract work, do you want to continue?
        IfMsgBox, No
        {
            Out("Load Job Data Failed..",1)
            return
        }
    
    CheckDirectory(A_ScriptDir . "\Jobs")
    FileSelectFile, _JobPathData, 1, %A_ScriptDir%\Jobs, Select a Job file, Job Files (*.JOB)
    if(!_JobPathData){
        Out("Load Job Data Failed. No File Selected",1)
        return
    }
    IfNotExist,%_JobPathData%
    {
        Out("Load Job Data Failed. Job file does not exist.",1)
        NonFatalErrorPrompt("The job file [" . _JobPathData . "] cannot be found.")
        return
    }

    if(!isValidJobFile(_JobPathData))
    {
        Out("Load Job Data Failed. Invalid Job file.",1)
        NonFatalErrorPrompt("The file [" . _JobPathData . "] is not a valid job file.")
        return
    }
    ActiveDataFile:=new File(_JobPathData)
    ActiveOpenData:=new Job(Serializer.Deserialize(ActiveDataFile.Read()))

;Msgbox,% "Other Job " . ActiveOpenData.SerializableData.OwnerContact
;Msgbox,% "This Job " . ActiveJob.SerializableData.OwnerContact



ActiveJob.SerializableData.OwnerContact:=ActiveOpenData.SerializableData.OwnerContact
ActiveJob.SerializableData.OwnerPhone:=ActiveOpenData.SerializableData.OwnerPhone
ActiveJob.SerializableData.JobNumber:=ActiveOpenData.SerializableData.JobNumber
ActiveJob.SerializableData.JobOwner:=ActiveOpenData.SerializableData.JobOwner
ActiveJob.SerializableData.Date:=ActiveOpenData.SerializableData.Date
ActiveJob.SerializableData.GeneralContractor:=ActiveOpenData.SerializableData.GeneralContractor
ActiveJob.SerializableData.SubContractor:=ActiveOpenData.SerializableData.SubContractor
ActiveJob.SerializableData.ContractWork:=ActiveOpenData.SerializableData.ContractWork
ActiveJob.SerializableData.Contract_WorkNotes:=ActiveOpenData.SerializableData.Contract_WorkNotes


ActiveDataFile:=0
ActiveOpenData:=0
Push_ActiveJob(ActiveJob)
Out("Job Details Copied.",1)
return

Create_WorkSummary:
Out("Not Implemented")
return