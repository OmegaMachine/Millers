EditTicketRecieved:

Gui,1:Submit,NoHide
Gui,1:Default
 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ ;Get the active Day

                    if(DailyLog_RecievedEmulsion_SelectedTicket){ ;If theres an ID input into the edit field
                    Launch_TicketEditor(DayX,DailyLog_RecievedEmulsion_SelectedTicket)
                    }

            }

        }


Return
DeleteTicketRecieved:
Gui,1:Submit,NoHide
Gui,1:Default
 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ ;Get the active Day

                    if(DailyLog_RecievedEmulsion_SelectedTicket){ ;If theres an ID input into the edit field
                    MsgBox, 547, Delete Ticket,% "Are you sure you would like to delete ticket <" . DailyLog_RecievedEmulsion_SelectedTicket . ">"
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
InfoMessage("Ticket Deleted.")

                    }
                   ; Launch_TicketEditor(DayX,DailyLog_RecievedEmulsion_SelectedTicket)
                    }

            }

        }
Return
AddTicketRecieved:

Gui,1:Submit,NoHide
Gui,1:Default
 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){ ;Get the active Day
                    if(DailyLog_RecievedEmulsion_ID){ ;If theres an ID input into the edit field
                        ;Duplicate Check Start
                        ;Array_Gui(DayX.EndingEmulsion)
                         for index2,TicketX in DayX.RecievedEmulsions
        {
                    if(TicketX.ID=DailyLog_RecievedEmulsion_ID){
                 Out("Ticket already exists in daily log.")
                NonFatalErrorPrompt("Operation Aborted. Ticket already exists in daily log. <" . DailyLog_RecievedEmulsion_ID . ">")
                return
                    }
        }
                        ;Duplicate Check End
                        NewTicket:={}
                        NewTicket.ID:=DailyLog_RecievedEmulsion_ID
                        NewTicket.Date:=DayX.Date
                        NewTicket.Driver:="None Set"
                        NewTicket.TimeIn:="None Set"
                        NewTicket.TimeOut:="None Set"
                        NewTicket.Source:="N/A"
                        NewTicket.EmulsionPO:="None Set"
                        NewTicket.JobPO:="None Set"

                        NewTicket.Products:=[]
                        NewTicket.Vessals:=[]

                            DayX.RecievedEmulsions.Push(NewTicket)
                            break
                    }else{
                        Out("Invalid ID.")
                NonFatalErrorPrompt("Operation Failed. <" . DailyLog_RecievedEmulsion_ID . "> is an invalid ID.")
                return
                    }
            }else{
                Out("No daily log in context.")
                NonFatalErrorPrompt("Operation Failed. There i no daily log in context.")
                return
            }

        }
        goto,GuiDailyLoggingLoadDay
return


SelectTicketRecieved:
Gui,1:Listview,DailyLog_RecievedEmulsionsLV
LV_GetText(_SelID, LV_GetNext(0, "F"), 1)

if(_SelID){
GuiControl,,DailyLog_RecievedEmulsion_SelectedTicket,% _SelID
Enable_RecievedEmulsion_Fields()
}
return

Enable_RecievedEmulsion_Fields(){
    global
GuiControl,Enable,DailyLog_RecievedEmulsion_SelectedTicketEditButton
GuiControl,Enable,DailyLog_RecievedEmulsion_SelectedTicketDeleteButton
return 1
}
Disable_RecievedEmulsion_Fields(){
    global
GuiControl,Disable,DailyLog_RecievedEmulsion_SelectedTicketEditButton
GuiControl,Disable,DailyLog_RecievedEmulsion_SelectedTicketDeleteButton
return 1
}