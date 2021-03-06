AddVessal:
Gui,1:Submit,NoHide
Gui,1:Default
 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ ;Get the active Day
                    if(DailyLog_StartingEmulsion_Vessal){ ;If theres a vessal selected in DDL
                        ;Duplicate Check Start
                        ;Array_Gui(DayX.StartingEmulsion)
                         for index2,VessX in DayX.StartingEmulsion
        {
                    if(VessX.Name=DailyLog_StartingEmulsion_Vessal){
                 Out("Vessal already exists in daily log.")
                NonFatalErrorPrompt("Operation Aborted. Vessal already exists in daily log. <" . DailyLog_StartingEmulsion_Vessal . ">")
                return
                    }
        }
                        ;Duplicate Check End
                        NewVessal:={}
                        NewVessal.Name:=DailyLog_StartingEmulsion_Vessal
                        NewVessal.Product:=DailyLog_StartingEmulsion_Product
                        NewVessal.Quantity:=0
                            DayX.StartingEmulsion.Push(NewVessal)
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

SelectVessal:
Enable_StartingEmulsion_Fields()
Gui,1:Listview,DailyLog_StartingEmulsionsLV
LV_GetText(_Sel, LV_GetNext(0, "F"), 1)
LV_GetText(_SelProduct, LV_GetNext(0, "F"), 2)
LV_GetText(_SelProductQuantity, LV_GetNext(0, "F"), 3)
GuiControl,,DailyLog_StartingEmulsion_SelectedVessal,% _Sel
GuiControl,ChooseString,DailyLog_StartingEmulsion_SelectedVessalProductDDL,% _SelProduct
GuiControl,,DailyLog_StartingEmulsion_SelectedVessalProductQuantity,% _SelProductQuantity
Return

DeleteVessal:
Gui,1:Submit,NoHide
if(DailyLog_StartingEmulsion_SelectedVessal="<Select a Vessal>"){
                 Out("No vessal selected.")
                NonFatalErrorPrompt("Operation Aborted. No vessal selected.")
                return
}
if(!DailyLog_StartingEmulsion_SelectedVessal){
                 Out("No vessal selected.")
                NonFatalErrorPrompt("Operation Aborted. No vessal selected.")
                return
}
MsgBox, 547, Delete Vessal from Starting Emulsion?, Are you sure you would like to delete vessal <%DailyLog_StartingEmulsion_SelectedVessal%> from day <%DailyLogging_Days%> starting emulsions? `n`nThis will be updated in the Daily Log immediately unlike adjusting dropdown lists which require hitting the save button at the bottom.
IfMsgBox, Yes
{

;Delete Process
for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ 
                         for index2,VessX in DayX.StartingEmulsion
        {
                    if(VessX.Name=DailyLog_StartingEmulsion_SelectedVessal){
                       ; msgbox,% index2
                       ; Msgbox,% ActiveJob.SerializableData.DailyLogs[index].StartingEmulsion[index2].Name
                        ActiveJob.SerializableData.DailyLogs[index].StartingEmulsion.RemoveAt(index2, 1)
                        GuiControl,,DailyLog_StartingEmulsion_SelectedVessal,<Select a Vessal> ; Reset selected vessal details
                        GuiControl,ChooseString,DailyLog_StartingEmulsion_SelectedVessalProductDDL,N/A
                        GuiControl,,DailyLog_StartingEmulsion_SelectedVessalProductQuantity,0
                        Disable_StartingEmulsion_Fields()
                        ;Update listview after delete
Gui,1:Listview,DailyLog_StartingEmulsionsLV
LV_Delete()
for index2,VessalX in DayX.StartingEmulsion
        {
            LV_Add("",VessalX.Name,VessalX.Product,VessalX.Quantity)
        }
        ;End update listview
                Out("Vessal deleted. <" . DailyLog_StartingEmulsion_SelectedVessal . ">")
                InfoMessage("Vessal <" . DailyLog_StartingEmulsion_SelectedVessal . "> removed.")
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
ImportVessals:

return

SaveVessal:
Gui,1:Submit,NoHide
if(DailyLog_StartingEmulsion_SelectedVessal="<Select a Vessal>"){
                 Out("No vessal selected.")
                NonFatalErrorPrompt("Operation Aborted. No vessal selected.")
                return
}
if(!DailyLog_StartingEmulsion_SelectedVessal){
                 Out("No vessal selected.")
                NonFatalErrorPrompt("Operation Aborted. No vessal selected.")
                return
}
;MsgBox, 547, Update Vessal, Are you sure you would like to update vessal <%DailyLog_StartingEmulsion_SelectedVessal%> from day <%DailyLogging_Days%> starting emulsions?`n`nThis will be updated in the Daily Log immediately unlike adjusting dropdown lists which require hitting the save button at the bottom.
;IfMsgBox, Yes
;{

;Update Process
for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ 
                         for index2,VessX in DayX.StartingEmulsion
        {
                    if(VessX.Name=DailyLog_StartingEmulsion_SelectedVessal){
                    ActiveJob.SerializableData.DailyLogs[index].StartingEmulsion[index2].Product:=DailyLog_StartingEmulsion_SelectedVessalProductDDL
                    ActiveJob.SerializableData.DailyLogs[index].StartingEmulsion[index2].Quantity:=DailyLog_StartingEmulsion_SelectedVessalProductQuantity
                        ;Update listview after update
Gui,1:Listview,DailyLog_StartingEmulsionsLV
LV_Delete()
for index2,VessalX in DayX.StartingEmulsion
        {
            LV_Add("",VessalX.Name,VessalX.Product,VessalX.Quantity)
        }
        ;End update listview
                Out("Vessal updated. <" . DailyLog_StartingEmulsion_SelectedVessal . ">")
                InfoMessage("Vessal <" . DailyLog_StartingEmulsion_SelectedVessal . "> updated.")
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


Disable_StartingEmulsion_Fields(){
    global
    Gui,1:Default
GuiControl,Disable,DailyLog_StartingEmulsion_SelectedVessalProductDDL
GuiControl,Disable,DailyLog_StartingEmulsion_SelectedVessalProductQuantity
GuiControl,Disable,DailyLog_StartingEmulsion_SelectedVessalSaveButton
GuiControl,Disable,DailyLog_StartingEmulsion_SelectedVessalDeleteButton
return 1
}
Enable_StartingEmulsion_Fields(){
    global
    Gui,1:Default
GuiControl,Enable,DailyLog_StartingEmulsion_SelectedVessalProductDDL
GuiControl,Enable,DailyLog_StartingEmulsion_SelectedVessalProductQuantity
GuiControl,Enable,DailyLog_StartingEmulsion_SelectedVessalSaveButton
GuiControl,Enable,DailyLog_StartingEmulsion_SelectedVessalDeleteButton
return 1
}