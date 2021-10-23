


DebugMenu_Test1:
    ;Create_BlankJobFile(A_ScriptDir . "\Jobs","NewJob.JOB")
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


Conversion_ActiveJob_toTender:
LastDailyLog:=new File(Push_TemplateToFile(A_ScriptDir . "\templates\WorkTenderPDF.xlsx",A_ScriptDir . "\Conversions\Tenders\Work Tender (" . ActiveJobFile.FileName . ").xlsx"))
if(!LastDailyLog){
Out("Conversion Failed")
}else{
    Out("Creating Tender...")
 Excel_NewTender:=new WorkbookWrapper(LastDailyLog.FullPath,1)

 Excel_SetCell(Excel_NewTender,"C2",ListManager.GetData("Signature","---"),1)
  Excel_SetCell(Excel_NewTender,"H2",ActiveJob.SerializableData.JobNumber,1)
  Excel_SetCell(Excel_NewTender,"C3",ActiveJob.SerializableData.JobOwner,1)
  Excel_SetCell(Excel_NewTender,"H3",ActiveJob.SerializableData.OwnerContact,1)
FormatTime, VD , % ActiveJob.SerializableData.Date.DateString(), M/d/yyyy
  Excel_SetCell(Excel_NewTender,"C4",VD,1)
  Excel_SetCell(Excel_NewTender,"H4",ActiveJob.SerializableData.OwnerPhone,1)
    Excel_SetCell(Excel_NewTender,"C5",ActiveJob.SerializableData.GeneralContractor,1)
  Excel_SetCell(Excel_NewTender,"H5",ActiveJob.SerializableData.Subcontractor,1)
 Excel_NewTender.SaveAndClose()
 Out("Conversion Complete - " . A_ScriptDir . "\Conversions\Tenders\Work Tender (" . ActiveJobFile.FileName . ").xlsx")
}
return


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

ToggleAutoSave:
Menu, SettingsMenu,ToggleCheck,Autoload Most Recent File
ALState:=ListManager.GetData("Autoload",false)
ListManager.SetData("Autoload",!ALState)
return

ToggleAutoloadDailylog:
Menu, SettingsMenu,ToggleCheck,Autoload Dailylog on Select
ALDLState:=ListManager.GetData("AutoloadDailyLogDropdown",false)
ListManager.SetData("AutoloadDailyLogDropdown",!ALDLState)
return