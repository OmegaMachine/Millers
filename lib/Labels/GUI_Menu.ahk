
FileMenu_LoadJob:
    Out("Loading Job.")
    if(UnsavedChanges){
        MsgBox, 4388, Unsaved Changes, There are unsaved changes to the current job file. would you like to discard them and open a different job?
        IfMsgBox, No
        {
            Out("Load Job Failed. Unsaved Changes.",1)
            return
        }
    }
    CheckDirectory(A_ScriptDir . "\Jobs")
    FileSelectFile, _JobPath, 1, %A_ScriptDir%\Jobs, Select a Job file, Job Files (*.JOB)
    if(!_JobPath){
        Out("Load Job Failed. No File Selected",1)
        return
    }
    IfNotExist,%_JobPath%
    {
        Out("Load Job Failed. Job file does not exist.",1)
        NonFatalErrorPrompt("The job file [" . _JobPath . "] cannot be found.")
        return
    }

    if(!isValidJobFile(_JobPath))
    {
        Out("Load Job Failed. Invalid Job file.",1)
        NonFatalErrorPrompt("The file [" . _JobPath . "] is not a valid job file.")
        return
    }
    ActiveJobFile:=new File(_JobPath)
    ActiveJob:=new Job(Serializer.Deserialize(ActiveJobFile.Read()))
    ;ActiveJob:=Serializer.DeserializeClass(ActiveJobFile.Read())
    INTERNAL_LOADING:=true
    LoadJob(ActiveJobFile)
    INTERNAL_LOADING:=false
return

DebugMenu_Test1:
    ;Create_BlankJobFile(A_ScriptDir . "\Jobs","NewJob.JOB")
return

FileMenu_New_Blank_Job:
    Out("Creating new job")
    CheckDirectory(A_ScriptDir . "\Jobs")
    FileSelectFile, NewFilePath, S8, %A_ScriptDir%\Jobs, Enter a Name for the Job, JOBs (*.JOB)

    if(NewFilePath){
        Out("Name Valid",1)
        StringRight, checkvar, NewFilePath, 4
        if(checkvar!=".JOB"){
            Out("Ext invalid,modifying.",1)
            NewFilePath:=NewFilePath . ".JOB"
        }else{
            Out("Ext Valid",1)
        }
        NewFile:=new File(NewFilePath)
        Create_BlankJobFile(NewFile.FileDir,NewFile.FileName)
    }else{
        Out("Aborted.",1)
    }
return

FileMenu_SaveJob:
    if(ActiveJob){
        Out("Saving Job")
        Push_GUI()
        ActiveJob.SaveChanges(ActiveJobFile)
        UnsavedChanges(false)
    }else{
        Out("Save - No Active Job")
    }
return

DebugMenu_Flush_Active_Job:
    if(ActiveJob){
        Out("Flushing Active Job")
        ActiveJob.Flush()
    }else{
        Out("Flush - No Active Job")
    }
return

ErrorCheck_ActiveJob:
    Out("Nothing")
Return
ErrorCheck_Roads:
    Out("Nothing")
Return
ErrorCheck_Hours:
    Out("Nothing")
Return
Conversion_ActiveJob_toDailyLog:
if(ActiveJob){
    Out("Converting to daily log...")
LastDailyLog:=new File(Push_TemplateToFile(A_ScriptDir . "\templates\template_dailylog.xlsm",A_ScriptDir . "\Conversions\DailyLogs\DailyLog (" . ActiveJobFile.FileName . ").xlsm"))
if(!LastDailyLog){
Out("Conversion Failed")
}else{

    Excel_NewDailyLog:=new WorkbookWrapper(LastDailyLog.FullPath,1)
   
    Excel_SetCell(Excel_NewDailyLog,"C4",ActiveJob.SerializableData.JobOwner,1)
    Excel_SetCell(Excel_NewDailyLog,"C6",ActiveJob.SerializableData.GeneralContractor,1)
    Excel_SetCell(Excel_NewDailyLog,"C10",ActiveJob.SerializableData.Emulsion_Bottom_TargetRate,1)
    Excel_SetCell(Excel_NewDailyLog,"C11",ActiveJob.SerializableData.Emulsion_Top_TargetRate,1)
    Excel_SetCell(Excel_NewDailyLog,"C12",ActiveJob.SerializableData.Emulsion_Fog_TargetRate,1)
    Excel_SetCell(Excel_NewDailyLog,"H10",ActiveJob.SerializableData.Squares_ExistingWidth,1)
    Excel_SetCell(Excel_NewDailyLog,"H11",ActiveJob.SerializableData.Squares_FinishedWidth,1)
    Excel_SetCell(Excel_NewDailyLog,"H12",ActiveJob.SerializableData.Squares_Length,1)
    Excel_SetCell(Excel_NewDailyLog,"C16",ActiveJob.SerializableData.Emulsion_Bottom_Type,1)
    Excel_SetCell(Excel_NewDailyLog,"D16",ActiveJob.SerializableData.Emulsion_Top_Type,1)
    Excel_SetCell(Excel_NewDailyLog,"E16",ActiveJob.SerializableData.Emulsion_Fog_Type,1)
    Excel_SetCell(Excel_NewDailyLog,"C17",ActiveJob.SerializableData.Emulsion_Bottom_Source,1)
    Excel_SetCell(Excel_NewDailyLog,"D17",ActiveJob.SerializableData.Emulsion_Top_Source,1)
    Excel_SetCell(Excel_NewDailyLog,"E17",ActiveJob.SerializableData.Emulsion_Fog_Source,1)
    Excel_SetCell(Excel_NewDailyLog,"C18",ActiveJob.SerializableData.Emulsion_Additives,1)
    Excel_SetCell(Excel_NewDailyLog,"C19",ActiveJob.SerializableData.Emulsion_Specifications,1)
    Excel_SetCell(Excel_NewDailyLog,"H16",ActiveJob.SerializableData.Aggregate_Bottom_Type,1)
    Excel_SetCell(Excel_NewDailyLog,"I16",ActiveJob.SerializableData.Aggregate_Top_Type,1)
    Excel_SetCell(Excel_NewDailyLog,"J16",ActiveJob.SerializableData.Aggregate_Fog_Type,1)
    Excel_SetCell(Excel_NewDailyLog,"H17",ActiveJob.SerializableData.Aggregate_Bottom_Source,1)
    Excel_SetCell(Excel_NewDailyLog,"I17",ActiveJob.SerializableData.Aggregate_Top_Source,1)
    Excel_SetCell(Excel_NewDailyLog,"J17",ActiveJob.SerializableData.Aggregate_Fog_Source,1)
    Excel_SetCell(Excel_NewDailyLog,"C23",ActiveJob.SerializableData.Equipment_Parking_Tankers,1)
    Excel_SetCell(Excel_NewDailyLog,"C24",ActiveJob.SerializableData.Equipment_Parking_ServiceTrucks,1)
    Excel_SetCell(Excel_NewDailyLog,"C25",ActiveJob.SerializableData.Equipment_Parking_Stockpiles,1)
    Excel_SetCell(Excel_NewDailyLog,"C26",ActiveJob.SerializableData.Equipment_Parking_OtherEquipment,1)
    Excel_SetCell(Excel_NewDailyLog,"C27",ActiveJob.SerializableData.Equipment_Parking_WaterHole,1)
    Excel_SetCell(Excel_NewDailyLog,"E32",ActiveJob.SerializableData.PreConstruction_DistressLocations,1)
    Excel_SetCell(Excel_NewDailyLog,"E31",ActiveJob.SerializableData.PreConstruction_VisualDiscription,1)
    Excel_SetCell(Excel_NewDailyLog,"E33",ActiveJob.SerializableData.PreConstruction_Videos,1)
    ;Excel_SetCell(Excel_NewDailyLog,"B8","116",2)
    Excel_NewDailyLog.SaveAndClose()

Out("Conversion Complete - " . A_ScriptDir . "\Conversions\DailyLogs\DailyLog (" . ActiveJobFile.FileName . ").xlsx")
}






    return
MyDoc:=new WorkbookWrapper(A_ScriptDir . "\Conversions\DailyLogs\DailyLog (" . ActiveJobFile.FileName . ").xlsx",1)
MyDoc.SetCell("A1","Job Number")
MyDoc.SetCell("B1",ActiveJob.SerializableData.JobNumber)
MyDoc.SetCell("A2","Job Owner")
MyDoc.SetCell("B2",ActiveJob.SerializableData.JobOwner)
MyDoc.SaveAndClose()
Out("Conversion Complete")
MsgBox, 64, Conversion Complete,% "Conversion Complete " . A_ScriptDir . "\DailyLog (" . ActiveJobFile.FileName . ").xlsx"
}else{
    Out("convert to daily log failed. No active job.")
MsgBox, 16, No Active Job, No Active Job
}
return
Conversion_ActiveJob_toPayroll:

return