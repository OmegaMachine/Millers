
Launch_TicketEditor(_DayG,_TicketID){
global
TicketContext:=0
                         for index,TicketX in _DayG.RecievedEmulsions
                     {
                    if(TicketX.ID=_TicketID){
                            TicketContext:=TicketX
                    }
                     }

if(TicketContext){

    Gui,22:Default
GuiControl,,TicketEditor_Groupbox,% "Ticket Details (" . TicketContext.ID . ")"
GuiControl,,TicketEditor_ID,% TicketContext.ID
GuiControl,,TicketEditor_TimeIn,% TicketContext.TimeIn
GuiControl,,TicketEditor_TimeOut,% TicketContext.TimeOut
GuiControl,ChooseString,TicketEditor_DriverDDL,% TicketContext.Driver
GuiControl,ChooseString,TicketEditor_SourceDDL,% TicketContext.Source
GuiControl,ChooseString,TicketEditor_EmulsionPODDL,% TicketContext.EmulsionPO
GuiControl,ChooseString,TicketEditor_JobPODDL,% TicketContext.JobPO
GuiControl,,TicketEditor_Date,% TicketContext.Date
Disable_TicketEditor_ProductEditor()
Gui,22:Listview,TicketEditor_ProductLV
LV_Delete()
For index9, _Product in TicketContext.Products
{
    LV_Add("",_Product.Vessal,_Product.Product,_Product.Quantity,_Product.Gross,_Product.Tare,_Product.Net,_Product.Temp)
}
 Gui,22: Show, w581 h427, Ticket Editor
 Gui,1:Default
 return 1
}else{

    return 0 
}
}


TicketEditor_SaveDetails:
Gui,22:Submit,NoHide
Gui,1:Submit,NoHide
Gui,1:Default
 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ ;Get the active Day
  for index2,TicketX in DayX.RecievedEmulsions
        {
                    if(TicketX.ID=TicketContext.ID){
                        ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions[index2].Driver:=TicketEditor_DriverDDL
                        ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions[index2].TimeIn:=TicketEditor_TimeIn
                        ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions[index2].TimeOut:=TicketEditor_TimeOut
                        ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions[index2].EmulsionPO:=TicketEditor_EmulsionPODDL
                        ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions[index2].JobPO:=TicketEditor_JobPODDL
                        ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions[index2].Source:=TicketEditor_SourceDDL
                        ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions[index2].Date:=TicketEditor_Date
                        ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions[index2].ID:=TicketEditor_ID
                        

                        Gui,22:Default
                        ;GuiControl,,TicketEditor_GroupBox,% "Ticket Details (" . TicketEditor_ID . ")"
                        Gui,1:Default
                        Launch_TicketEditor(DayX,TicketEditor_ID) ;reloads innter details and context
                        ;reload emulsion tickets in daily log
                        Gui,1:Listview,DailyLog_RecievedEmulsionsLV
Disable_RecievedEmulsion_Fields()
GuiControl,,DailyLog_RecievedEmulsion_SelectedTicket,<Select a Ticket>

LV_Delete()
for index2,TicketX in DayX.RecievedEmulsions
        {
            LV_Add("",TicketX.ID,TicketX.Driver,TicketX.TimeOut,TicketX.Products.length())
        }
        ;end reload emulsion tickets in daily log
                            Msgbox,Details Saved
                    }
            }
            }
        }
return


TicketEditor_Delete:
Gui,1:Submit,NoHide
Gui,1:Default
 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ ;Get the active Day

                    if(TicketContext.ID){ ;If theres an ID input into the edit field
                    MsgBox, 547, Delete Ticket,% "Are you sure you would like to delete ticket <" . TicketContext.ID . ">"
                    ifMsgbox,Yes
                    {
                         for index7,TickX in DayX.RecievedEmulsions
                         {
                             if(TickX.ID=DailyLog_RecievedEmulsion_SelectedTicket){
                                 ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions.RemoveAt(index7)
                                ; DayX.RemoveAt(index7)
                             }
                         }
        {

        }
                        ;reload emulsion tickets in daily log
                        Gui,1:Listview,DailyLog_RecievedEmulsionsLV
Disable_RecievedEmulsion_Fields()
GuiControl,,DailyLog_RecievedEmulsion_SelectedTicket,<Select a Ticket>

LV_Delete()
for index2,TicketX in DayX.RecievedEmulsions
        {
            LV_Add("",TicketX.ID,TicketX.Driver,TicketX.TimeOut,TicketX.Products.length())
        }
        ;end reload emulsion tickets in daily log
        Gui,22:Hide
InfoMessage("Ticket Deleted.")

                    }
                   ; Launch_TicketEditor(DayX,DailyLog_RecievedEmulsion_SelectedTicket)
                    }

            }

        }
Return






return

 MsgBox, 547, Delete Ticket,% "Are you sure you would like to delete ticket <" . TicketContext.ID . ">"
                    ifMsgbox,Yes
                    {
                         for index7,TickX in DayX.RecievedEmulsions
                         {
                             if(TickX.ID=DailyLog_RecievedEmulsion_SelectedTicket){
                                 ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions.RemoveAt(index7)
                                ; DayX.RemoveAt(index7)
                             }
                         }
                    }

return

Disable_TicketEditor_ProductEditor(){
global
Gui,22:Default
GuiControl,Disable,TicketEditor_ProductVessal
GuiControl,Disable,TicketEditor_ProductProduct
GuiControl,Disable,TicketEditor_ProductQuantity
GuiControl,Disable,TicketEditor_ProductGross
GuiControl,Disable,TicketEditor_ProductTare
GuiControl,Disable,TicketEditor_ProductNet
GuiControl,Disable,TicketEditor_ProductTemp
GuiControl,Disable,TicketEditor_ProductSave
GuiControl,Disable,TicketEditor_ProductDelete
return 1
}
Enable_TicketEditor_ProductEditor(){
global
Gui,22:Default
GuiControl,Enable,TicketEditor_ProductVessal
GuiControl,Enable,TicketEditor_ProductProduct
GuiControl,Enable,TicketEditor_ProductQuantity
GuiControl,Enable,TicketEditor_ProductGross
GuiControl,Enable,TicketEditor_ProductTare
GuiControl,Enable,TicketEditor_ProductNet
GuiControl,Enable,TicketEditor_ProductTemp
GuiControl,Enable,TicketEditor_ProductSave
GuiControl,Enable,TicketEditor_ProductDelete
return 1
}


TicketEditor_AddProduct:
NewProduct:={}
NewProduct.Vessal:="None Set"
NewProduct.Product:="None Set"
NewProduct.Quantity:=0
NewProduct.Gross:=0
NewProduct.Tare:=0
NewProduct.Net:=0
NewProduct.Temp:=0
for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ ;Get the active Day
             if(TicketContext.ID){ ;If theres an ticket in context
             for index7,TickX in DayX.RecievedEmulsions
                         {
                             if(TickX.ID=TicketContext.ID){
                                 ActiveJob.SerializableData.DailyLogs[index].RecievedEmulsions[index7].Products.push(NewProduct)
                                 ;update LV
                                 Gui,22:Listview,TicketEditor_ProductLV
LV_Delete()
For index9, _Product in TicketContext.Products
{
    LV_Add("",_Product.Vessal,_Product.Product,_Product.Quantity,_Product.Gross,_Product.Tare,_Product.Net,_Product.Temp)
}
;End update LV
                        ;reload emulsion tickets in daily log
                        Gui,1:Listview,DailyLog_RecievedEmulsionsLV
                        Gui,1:Default
Disable_RecievedEmulsion_Fields()
GuiControl,,DailyLog_RecievedEmulsion_SelectedTicket,<Select a Ticket>

LV_Delete()
for index2,TicketX in DayX.RecievedEmulsions
        {
            LV_Add("",TicketX.ID,TicketX.Driver,TicketX.TimeOut,TicketX.Products.length())
        }
        ;end reload emulsion tickets in daily log

                             }
                         }
             }

            }
        }
return



TicketEditor_SelectProduct:
;gui,22:Submit,NoHide
Gui,22:Listview,TicketEditor_ProductLV
LV_GetText(_SelVessal, LV_GetNext(0, "F"), 1)
LV_GetText(_SelProduct, LV_GetNext(0, "F"), 2)
if(_SelVessal){
GuiControl,ChooseString,TicketEditor_ProductVessal,% _SelVessal
GuiControl,ChooseString,TicketEditor_ProductProduct,% _SelProduct
GuiControl,,TicketEditor_ProductQuantity,0
Enable_TicketEditor_ProductEditor()
}
Return

