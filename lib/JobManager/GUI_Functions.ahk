Remove_Welcome(){
    global
    if(!Welcome_FLAG){
        Out("Hiding Welcome Menu / Showing Job Menu")
        Welcome_FLAG:=true
        GuiControl,Hide,Welcome_text
        GuiControl,Show,Main_TAB
    }
    return 1
}

Show_Welcome(){
    global
    if(Welcome_FLAG){
        Out("Showing Welcome Menu / Hiding Job Menu")
        Welcome_FLAG:=false
        GuiControl,Show,Welcome_text
        GuiControl,Hide,Main_TAB
    }
    return 1
}

SetTitle(_Title){
    global
   ; Out("Setting App Title <" . _Title . ">")
    Gui,1:Show,,%_Title%
    return 1
}

NonFatalErrorPrompt(_Text:=""){
    Out("Throwing nonfatal error. <" . _Text . ">",1)
    MsgBox, 4112, Nonfatal Error,A nonfatal error has occured. The operation will likely be aborted.`n%_Text%
    return 1
}
InfoMessage(_Text:=""){
    MsgBox, 262208, Information,%_Text%
    return 1
}

isValidJobFile(_JobPath){
    _Valid:=True
    SplitPath, _JobPath, FN, FD, FE, FNNE, FD
    if(FE!="JOB"){
        _Valid:=False
    }
    return _Valid
}


UnsavedChanges(_State:=true){
    global
 
       ; Out("Changes Made")
        UnsavedChanges:=_State
        if(_State){
        SetTitle(APP_NAME . " - " . ActiveJobFile.FileNameNoExt . "*")
        }
  
    return 1
}



CheckDirectory(_Dir){
    ifNotExist,%_Dir%
    {
        Out("Creating Directory <" . _Dir . ">")
        FileCreateDir, %_Dir%
        return 1
    }
    return 0
}

Push_GUI(){
    global
    Out("Pushing GUI Details to Job")
    Gui,1:Submit,NoHide
    ActiveJob.SerializableData.JobNumber:=JobDetails_JobNumberDDL
    ActiveJob.SerializableData.JobOwner:=JobDetails_JobOwnerDDL
    ActiveJob.SerializableData.Date.SerializableData.TimeString:=JobDetails_JobDateTime
    ActiveJob.SerializableData.OwnerContact:=JobDetails_JobContactName
    ActiveJob.SerializableData.OwnerPhone:=JobDetails_JobContactPhone
    ActiveJob.SerializableData.GeneralContractor:=JobDetails_JobContractor
    ActiveJob.SerializableData.SubContractor:=JobDetails_JobSubcontractor

/*


    ActiveJob.SerializableData.Weather.Morning.SerializableData.Status:=JobWeather_MorningDDL
    ActiveJob.SerializableData.Weather.Morning.SerializableData.Temperature:=JobWeather_MorningTempDDL

    ActiveJob.SerializableData.Weather.Lunch.SerializableData.Status:=JobWeather_LunchDDL
    ActiveJob.SerializableData.Weather.Lunch.SerializableData.Temperature:=JobWeather_LunchTempDDL

    ActiveJob.SerializableData.Weather.Evening.SerializableData.Status:=JobWeather_EveningDDL
    ActiveJob.SerializableData.Weather.Evening.SerializableData.Temperature:=JobWeather_EveningTempDDL

    ActiveJob.SerializableData.Weather.Humidity:=JobWeather_HumidityDDL
    */
    ActiveJob.SerializableData.Contract_WorkNotes:=Contract_JobWorkNotes


    return 1
}
Push_ActiveJob(_Job){
    global
    Gui,1:Default
    Out("Pushing Job Details to GUI")
    GuiControl,ChooseString,JobDetails_JobNumberDDL,% ActiveJob.SerializableData.JobNumber
    GuiControl,ChooseString,JobDetails_JobOwnerDDL,% ActiveJob.SerializableData.JobOwner
    GuiControl,,JobDetails_JobDateTime,% ActiveJob.SerializableData.Date.SerializableData.TimeString
    GuiControl,,JobDetails_JobContactName,% ActiveJob.SerializableData.OwnerContact
    GuiControl,,JobDetails_JobContactPhone,% ActiveJob.SerializableData.OwnerPhone
    GuiControl,ChooseString,JobDetails_JobContractor,% ActiveJob.SerializableData.GeneralContractor
    GuiControl,ChooseString,JobDetails_JobSubContractor,% ActiveJob.SerializableData.Subcontractor
/*


    GuiControl,ChooseString,JobWeather_MorningDDL,% ActiveJob.SerializableData.Weather.Morning.SerializableData.Status
    GuiControl,ChooseString,JobWeather_MorningTempDDL,% ActiveJob.SerializableData.Weather.Morning.SerializableData.Temperature

    GuiControl,ChooseString,JobWeather_LunchDDL,% ActiveJob.SerializableData.Weather.Lunch.SerializableData.Status
    GuiControl,ChooseString,JobWeather_LunchTempDDL,% ActiveJob.SerializableData.Weather.Lunch.SerializableData.Temperature

    GuiControl,ChooseString,JobWeather_EveningDDL,% ActiveJob.SerializableData.Weather.Evening.SerializableData.Status
    GuiControl,ChooseString,JobWeather_EveningTempDDL,% ActiveJob.SerializableData.Weather.Evening.SerializableData.Temperature

    GuiControl,,JobWeather_HumidityDDL,% ActiveJob.SerializableData.Weather.Humidity
*/

    GuiControl,,Contract_JobWorkNotes,% ActiveJob.SerializableData.Contract_WorkNotes

GuiControl,,DailyLogging_Days,% "|" . ActiveJob.DailyLogsList()
    Gui,1:Listview,GroupBox_JobWorkLV
    GLOBAL_CONTRACTWORKLIST:=[]
    LV_Delete()
      for index,WorkX in ActiveJob.SerializableData.ContractWork
        {
if(index=1){
    _DefaultX:=WorkX.Name
}
GLOBAL_CONTRACTWORKLIST.Push(WorkX.Name)
LV_Add("",WorkX.Name,WorkX.Type,WorkX.HasFog,WorkX.Length,WorkX.Width,WorkX.Area,WorkX.Notes)
        }
GLOBAL_CONTRACTWORKLIST:=ListManager.ListToDelimited(GLOBAL_CONTRACTWORKLIST,_DefaultX)
    ;ActiveJob.SerializableData.Weather.Morning.SerializableData.Status

    Gui,12:Default
    GuiControl,,_RemoveWork_Name,|%GLOBAL_CONTRACTWORKLIST%
    return 1
}




Push_TemplateToFile(_TemplatePath,_FilePath){
    IfExist, %_FilePath%
    {
        Out("Asking Permission to overwrite...")
        MsgBox, 36, File Already Exists, JobManager is trying to overwrite file %_FilePath%`, is this ok?
        IfMsgBox,No
        {
            
            NonFatalErrorPrompt("Operation Aborted. Could not replace file.")
            return 0
        }
        FileCopy,% _TemplatePath,% _FilePath ,1
    }else{
        FileCopy,% _TemplatePath,% _FilePath 
    }
    FileSetTime, ,% _FilePath
;FileMove,% _TemplatePath,% _FilePath 
return _FilePath
}


Excel_SetCell(ExcelObject,Cell,Data,_Sheeet:=1){
ExcelObject.SetCell(Cell,Data,_Sheeet)
FileSetTime, ,% ExcelObject.DocumentPath
return 1
}











