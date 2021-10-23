Show_RemoveWorkLabel:
Show_RemoveWork()
return

Context_RemoveWork:
Show_RemoveWork()
Gui,12:Default
GuiControl,ChooseString,_RemoveWork_Name,%RowXText%
return

Show_RemoveWork(){
Global
Gui,12: Show, w400 h100, Remove Contract Work
return
}
Hide_RemoveWork(){
global
Gui,12:Hide

return
}
12GuiClose:
Hide_RemoveWork()
return

Submit_RemoveWork:
Gui,12:Submit
if(_RemoveWork_Name = "None Set"){
NonFatalErrorPrompt("Invalid Work [" . _RemoveWork_Name . "]")
return
}
MsgBox, 262404, Remove Contract Work, Are you sure you would like to remove the contract work - %_RemoveWork_Name% ?
IfMsgBox,Yes
{
Remove_ContractWork(_RemoveWork_Name)
}Else{
    Out("Remove Work Canceled.")
}
return


Remove_ContractWork(Work_name){
    global
    NewList:=[]
     for index,WorkX in ActiveJob.SerializableData.ContractWork
        {
            if(WorkX.Name = Work_Name){
               Continue
            }else{
                NewList.Push(WorkX)
            }
        }
        ActiveJob.SerializableData.ContractWork:=NewList
        Push_ActiveJob(ActiveJob)
        UnsavedChanges(true)
    return 1
}