Show_AddJobNumberLabel:
Show_AddJobNumber()
return



Show_AddJobNumber(){
Global
;GuiControl,,_NewWork_Name,
Gui,16: Show,, Job Number Manager
return
}
Hide_AddJobNumber(){
global
Gui,16:Hide

return
}
16GuiClose:
Hide_AddJobNumber()
return







Add_JobNumber(JobNumberX){
    global
    /*


    if(!Work_Name){
         NonFatalErrorPrompt("Operation Aborted. File Name Invalid.")
        Out("Invalid Work Name")
        return 0
    }
     for index,WorkX in ActiveJob.SerializableData.ContractWork
        {
            if(WorkX.Name = Work_Name){
                NonFatalErrorPrompt("Operation Aborted. File Name Invalid.")
                Out("Work Name already Exists")
                return 0
            }
        }
    NewWork:={}
    NewWork.Name:=Work_Name
    NewWork.Type:=Work_Type
    NewWork.HasFog:=Work_HasFog
    NewWork.Length:=Work_Length
    NewWork.Width:=Work_Width
    NewWork.Area:=Work_Area
    NewWork.Notes:=Work_Notes
   
    NewWork.BottomEmulsionType:=ProductDetailsObj.Bottom.Emulsion.Type
    NewWork.BottomEmulsionRate:=ProductDetailsObj.Bottom.Emulsion.Rate
    NewWork.BottomEmulsionSource:=ProductDetailsObj.Bottom.Emulsion.Source

    NewWork.TopEmulsionType:=ProductDetailsObj.Top.Emulsion.Type
    NewWork.TopEmulsionRate:=ProductDetailsObj.Top.Emulsion.Rate
    NewWork.TopEmulsionSource:=ProductDetailsObj.Top.Emulsion.Source

    NewWork.SealCoatEmulsionType:=ProductDetailsObj.SealCoat.Emulsion.Type
    NewWork.SealCoatEmulsionRate:=ProductDetailsObj.SealCoat.Emulsion.Rate
    NewWork.SealCoatEmulsionSource:=ProductDetailsObj.SealCoat.Emulsion.Source

    NewWork.BottomAggType:=ProductDetailsObj.Bottom.Aggregate.Type
    NewWork.BottomAggRate:=ProductDetailsObj.Bottom.Aggregate.Rate
    NewWork.BottomAggSource:=ProductDetailsObj.Bottom.Aggregate.Source

    NewWork.TopAggType:=ProductDetailsObj.Top.Aggregate.Type
    NewWork.TopAggRate:=ProductDetailsObj.Top.Aggregate.Rate
    NewWork.TopAggSource:=ProductDetailsObj.Top.Aggregate.Source

    NewWork.SealCoatAggType:=ProductDetailsObj.SealCoat.Aggregate.Type
    NewWork.SealCoatAggRate:=ProductDetailsObj.SealCoat.Aggregate.Rate
    NewWork.SealCoatAggSource:=ProductDetailsObj.SealCoat.Aggregate.Source

ActiveJob.SerializableData.ContractWork.Push(NewWork)
Push_ActiveJob(ActiveJob)
UnsavedChanges(true)
*/
    return 1
}

LB_SelectJobNumber:
Gui,16:Submit,NoHide
if(JobNumber_LB="<Add New>"){
    return
}else{
    if(JobNumber_LB){
        GuiControl,,JobNumber_SelectionText,%JobNumber_LB%
        INTERNAL_JOBNUMBER_SELECTION:=JobNumber_LB
    }
}

return

LB_DeleteJobNumber:
Gui,16:Submit,NoHide
if(!INTERNAL_JOBNUMBER_SELECTION){
    Msgbox,No Job Number Selected
    return
}else{
    ListManager.RemoveValFromList("Job_Numbers",INTERNAL_JOBNUMBER_SELECTION)

    GuiControl,,JobNumber_LB,% "|" . ListManager.ListToDelimited(ListManager.ListByName("Job_Numbers"),"555555")
    Gui,1:Default
        GuiControl,,JobDetails_JobNumberDDL,% "|" . ListManager.ListToDelimited(ListManager.ListByName("Job_Numbers"),"555555")
         GuiControl,ChooseString,JobDetails_JobNumberDDL,% ActiveJob.SerializableData.JobNumber
       Msgbox,Job Number Deleted
       return
}
return

LB_AddJobNumber:
Gui,16:Submit,NoHide
GuiControl,,_NewJobNumber,

ListManager.AddValToList("Job_Numbers",_NewJobNumber)

;JobNumberList:=ListManager.ListByName("Job_Numbers")
;JobNumberList.InsertAt(1, _NewJobNumber)
;ListManager.SetList("Job_Numbers",Serializer.Serialize(JobNumberList))

GuiControl,,JobNumber_LB,% "|" . ListManager.ListToDelimited(ListManager.ListByName("Job_Numbers"),"555555")
 Gui,1:Default
GuiControl,,JobDetails_JobNumberDDL,% "|" . ListManager.ListToDelimited(ListManager.ListByName("Job_Numbers"),"555555")
 GuiControl,ChooseString,JobDetails_JobNumberDDL,% ActiveJob.SerializableData.JobNumber
return