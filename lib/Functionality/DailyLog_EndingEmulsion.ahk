AddVessalEnding:
Gui,1:Submit,NoHide
Gui,1:Default
 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ ;Get the active Day
                    if(DailyLog_EndingEmulsion_Vessal){ ;If theres a vessal selected in DDL
                        ;Duplicate Check Start
                        ;Array_Gui(DayX.EndingEmulsion)
                         for index2,VessX in DayX.EndingEmulsion
        {
                    if(VessX.Name=DailyLog_EndingEmulsion_Vessal){
                 Out("Vessal already exists in daily log ending emulsions.")
                NonFatalErrorPrompt("Operation Aborted. Vessal already exists in daily log ending emulsions. <" . DailyLog_EndingEmulsion_Vessal . ">")
                return
                    }
        }
                        ;Duplicate Check End
                        NewVessal:={}
                        NewVessal.Name:=DailyLog_EndingEmulsion_Vessal
                        NewVessal.Product:=DailyLog_EndingEmulsion_Product
                        NewVessal.Quantity:=0
                            DayX.EndingEmulsion.Push(NewVessal)
                            break
                    }
            }else{
                Out("No daily log in context.")
                NonFatalErrorPrompt("Operation Failed. There i no daily log in context.")
                return
            }

        }
        goto,GuiDailyLoggingLoadDay
return

SelectVessalEnding:
Enable_EndingEmulsion_Fields()
Gui,1:Listview,DailyLog_EndingEmulsionsLV
LV_GetText(_Sel, LV_GetNext(0, "F"), 1)
LV_GetText(_SelProduct, LV_GetNext(0, "F"), 2)
LV_GetText(_SelProductQuantity, LV_GetNext(0, "F"), 3)
GuiControl,,DailyLog_EndingEmulsion_SelectedVessal,% _Sel
GuiControl,ChooseString,DailyLog_EndingEmulsion_SelectedVessalProductDDL,% _SelProduct
GuiControl,,DailyLog_EndingEmulsion_SelectedVessalProductQuantity,% _SelProductQuantity
Return

DeleteVessalEnding:
Gui,1:Submit,NoHide
if(DailyLog_EndingEmulsion_SelectedVessal="<Select a Vessal>"){
                 Out("No vessal selected.")
                NonFatalErrorPrompt("Operation Aborted. No vessal selected.")
                return
}
if(!DailyLog_EndingEmulsion_SelectedVessal){
                 Out("No vessal selected.")
                NonFatalErrorPrompt("Operation Aborted. No vessal selected.")
                return
}
MsgBox, 547, Delete Vessal from Ending Emulsion?, Are you sure you would like to delete vessal <%DailyLog_EndingEmulsion_SelectedVessal%> from day <%DailyLogging_Days%> Ending emulsions? `n`nThis will be updated in the Daily Log immediately unlike adjusting dropdown lists which require hitting the save button at the bottom.
IfMsgBox, Yes
{

;Delete Process
for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ 
                         for index2,VessX in DayX.EndingEmulsion
        {
                    if(VessX.Name=DailyLog_EndingEmulsion_SelectedVessal){
                       ; msgbox,% index2
                       ; Msgbox,% ActiveJob.SerializableData.DailyLogs[index].EndingEmulsion[index2].Name
                        ActiveJob.SerializableData.DailyLogs[index].EndingEmulsion.RemoveAt(index2, 1)
                        GuiControl,,DailyLog_EndingEmulsion_SelectedVessal,<Select a Vessal> ; Reset selected vessal details
                        GuiControl,ChooseString,DailyLog_EndingEmulsion_SelectedVessalProductDDL,N/A
                        GuiControl,,DailyLog_EndingEmulsion_SelectedVessalProductQuantity,0
                        Disable_EndingEmulsion_Fields()
                        ;Update listview after delete
Gui,1:Listview,DailyLog_EndingEmulsionsLV
LV_Delete()
for index2,VessalX in DayX.EndingEmulsion
        {
            LV_Add("",VessalX.Name,VessalX.Product,VessalX.Quantity)
        }
        ;End update listview
                Out("Vessal deleted. <" . DailyLog_EndingEmulsion_SelectedVessal . ">")
                InfoMessage("Vessal <" . DailyLog_EndingEmulsion_SelectedVessal . "> removed.")
                return
                    }
        }
            }

        }
;End Delete process

                return 
}else{
                Out("Delete vessal operation aborted.")
                InfoMessage("Operation Aborted. No vessal removed.")
                return 
}
Return
ImportVessalsEnding:

return

SaveVessalEnding:
Gui,1:Submit,NoHide
if(DailyLog_EndingEmulsion_SelectedVessal="<Select a Vessal>"){
                 Out("No vessal selected.")
                NonFatalErrorPrompt("Operation Aborted. No vessal selected.")
                return
}
if(!DailyLog_EndingEmulsion_SelectedVessal){
                 Out("No vessal selected.")
                NonFatalErrorPrompt("Operation Aborted. No vessal selected.")
                return
}
;MsgBox, 547, Update Vessal, Are you sure you would like to update vessal <%DailyLog_EndingEmulsion_SelectedVessal%> from day <%DailyLogging_Days%> Ending emulsions?`n`nThis will be updated in the Daily Log immediately unlike adjusting dropdown lists which require hitting the save button at the bottom.
;IfMsgBox, Yes
;{

;Update Process
for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ 
                         for index2,VessX in DayX.EndingEmulsion
        {
                    if(VessX.Name=DailyLog_EndingEmulsion_SelectedVessal){
                    ActiveJob.SerializableData.DailyLogs[index].EndingEmulsion[index2].Product:=DailyLog_EndingEmulsion_SelectedVessalProductDDL
                    ActiveJob.SerializableData.DailyLogs[index].EndingEmulsion[index2].Quantity:=DailyLog_EndingEmulsion_SelectedVessalProductQuantity
                        ;Update listview after update
Gui,1:Listview,DailyLog_EndingEmulsionsLV
LV_Delete()
for index2,VessalX in DayX.EndingEmulsion
        {
            LV_Add("",VessalX.Name,VessalX.Product,VessalX.Quantity)
        }
        ;End update listview
                Out("Vessal updated. <" . DailyLog_EndingEmulsion_SelectedVessal . ">")
                InfoMessage("Vessal <" . DailyLog_EndingEmulsion_SelectedVessal . "> updated.")
                return
                    }
        }
            }

        }
;End Update process

                return 
;}else{
                ;Out("Update vessal operation aborted.")
               ; InfoMessage("Operation Aborted. No vessal updated.")
                ;return 
;}
Return


Disable_EndingEmulsion_Fields(){
    global
    Gui,1:Default
GuiControl,Disable,DailyLog_EndingEmulsion_SelectedVessalProductDDL
GuiControl,Disable,DailyLog_EndingEmulsion_SelectedVessalProductQuantity
GuiControl,Disable,DailyLog_EndingEmulsion_SelectedVessalSaveButton
GuiControl,Disable,DailyLog_EndingEmulsion_SelectedVessalDeleteButton
return 1
}
Enable_EndingEmulsion_Fields(){
    global
    Gui,1:Default
GuiControl,Enable,DailyLog_EndingEmulsion_SelectedVessalProductDDL
GuiControl,Enable,DailyLog_EndingEmulsion_SelectedVessalProductQuantity
GuiControl,Enable,DailyLog_EndingEmulsion_SelectedVessalSaveButton
GuiControl,Enable,DailyLog_EndingEmulsion_SelectedVessalDeleteButton
return 1
}