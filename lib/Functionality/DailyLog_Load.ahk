GuiDailyLoggingLoadDay:
Gui,1:Submit,NoHide
Gui,1:Default

 for index,DayX in ActiveJob.SerializableData.DailyLogs
        {
            if(DayX.Date = DailyLogging_Days){
                ;Date & Title
GuiControl,,DailyLog_Date,% DayX.Date
GuiControl,,DailyLog_Title,% ActiveJob.SerializableData.JobNumber . " - " . ActiveJob.SerializableData.JobOwner
                ;Weather
;msgbox,% DayX.Weather.Morning_Status
GuiControl,Choose,DailyLog_MorningDDL,% DayX.Weather.Morning_Status
GuiControl,Choose,DailyLog_MorningTempDDL,% DayX.Weather.Morning_Temp
GuiControl,Choose,DailyLog_LunchDDL,% DayX.Weather.Lunch_Status
GuiControl,Choose,DailyLog_LunchTempDDL,% DayX.Weather.Lunch_Temp
GuiControl,Choose,DailyLog_EveningDDL,% DayX.Weather.Evening_Status
GuiControl,Choose,DailyLog_EveningTempDDL,% DayX.Weather.Evening_Temp
GuiControl,,DailyLog_HumidityDDL,% DayX.Weather.Humidity

;Starting Emulsions
Gui,1:Listview,DailyLog_StartingEmulsionsLV
Disable_StartingEmulsion_Fields()
GuiControl,,DailyLog_StartingEmulsion_SelectedVessal,<Select a Vessal>
GuiControl,ChooseString,DailyLog_StartingEmulsion_SelectedVessalProductDDL,N/A
GuiControl,,DailyLog_StartingEmulsion_SelectedVessalProductQuantity,0

LV_Delete()
for index2,VessalX in DayX.StartingEmulsion
        {
            LV_Add("",VessalX.Name,VessalX.Product,VessalX.Quantity)
        }


        ;Recieved Emulsions
Gui,1:Listview,DailyLog_RecievedEmulsionsLV
Disable_RecievedEmulsion_Fields()
GuiControl,,DailyLog_RecievedEmulsion_SelectedTicket,<Select a Ticket>

LV_Delete()
for index2,TicketX in DayX.RecievedEmulsions
        {
            LV_Add("",TicketX.ID,TicketX.Driver,TicketX.TimeOut,TicketX.Products.length())
        }

        ;Ending Emulsions
Gui,1:Listview,DailyLog_EndingEmulsionsLV
Disable_EndingEmulsion_Fields()
GuiControl,,DailyLog_EndingEmulsion_SelectedVessal,<Select a Vessal>
GuiControl,ChooseString,DailyLog_EndingEmulsion_SelectedVessalProductDDL,N/A
GuiControl,,DailyLog_EndingEmulsion_SelectedVessalProductQuantity,0

LV_Delete()
for index2,VessalX in DayX.EndingEmulsion
        {
            LV_Add("",VessalX.Name,VessalX.Product,VessalX.Quantity)
        }


        ;Calculated Emulsions
            ;By Start/End
            Gui,1:Listview,DailyLog_CalculatedEmulsionsLVEnd
            LV_Delete()
            _ProList:=DailyLog_UsedEmulsions_Products(DayX)
            For Index5,_Pro in _ProList
            {
                LV_Add("",_Pro.Product)
            }
            ;By Work
            Gui,1:Listview,DailyLog_CalculatedEmulsionsLVWork
            LV_Delete()

         ;End Calculated Emulsions   
            }
        }
        Enable_VessalsAndEmulsions()
Return



Enable_VessalsAndEmulsions(){
    global
GuiControl,Enable,DailyLog_EndingEmulsion_AddVessalButton
GuiControl,Enable,DailyLog_RecievedEmulsion_AddTicketButton
GuiControl,Enable,DailyLog_StartingEmulsion_AddVessalButton
GuiControl,Enable,DailyLog_EndingEmulsion_ImportButton
GuiControl,Enable,DailyLog_StartingEmulsion_ImportButton
GuiControl,Enable,DailyLog_StartingEmulsionsLV
GuiControl,Enable,DailyLog_EndingEmulsionsLV
GuiControl,Enable,DailyLog_RecievedEmulsionsLV

GuiControl,Enable,DailyLog_StartingEmulsion_Vessal
GuiControl,Enable,DailyLog_StartingEmulsion_Product
GuiControl,Enable,DailyLog_EndingEmulsion_Vessal
GuiControl,Enable,DailyLog_EndingEmulsion_Product
GuiControl,Enable,DailyLog_RecievedEmulsion_ID
GuiControl,Enable,DailyLog_StartingEmulsion_SelectedVessal
GuiControl,Enable,DailyLog_RecievedEmulsion_SelectedTicket
GuiControl,Enable,DailyLog_EndingEmulsion_SelectedVessal
return
}
Disable_VessalsAndEmulsions(){
    global
GuiControl,Disable,DailyLog_EndingEmulsion_AddVessalButton
GuiControl,Disable,DailyLog_RecievedEmulsion_AddTicketButton
GuiControl,Disable,DailyLog_StartingEmulsion_AddVessalButton
GuiControl,Disable,DailyLog_EndingEmulsion_ImportButton
GuiControl,Disable,DailyLog_StartingEmulsion_ImportButton
GuiControl,Disable,DailyLog_StartingEmulsionsLV
GuiControl,Disable,DailyLog_EndingEmulsionsLV
GuiControl,Disable,DailyLog_RecievedEmulsionsLV

GuiControl,Disable,DailyLog_StartingEmulsion_Vessal
GuiControl,Disable,DailyLog_StartingEmulsion_Product
GuiControl,Disable,DailyLog_EndingEmulsion_Vessal
GuiControl,Disable,DailyLog_EndingEmulsion_Product
GuiControl,Disable,DailyLog_RecievedEmulsion_ID
GuiControl,Disable,DailyLog_StartingEmulsion_SelectedVessal
GuiControl,Disable,DailyLog_RecievedEmulsion_SelectedTicket
GuiControl,Disable,DailyLog_EndingEmulsion_SelectedVessal


return
}


DailyLog_UsedEmulsions_Products(_Day){
    _ProductList:=[]
    ;Starting Emulsion
for index2,VessalX in _Day.StartingEmulsion
        {
            ProductExists:=0
            For Index3,Item in _ProductList
            {
                    if(Item.Product=VessalX.Product){
                        ProductExists:=1
                        break
                    }
            }
            if(ProductExists){
continue
            }else{
                _NewP:={}
                _NewP.Product:=VessalX.Product
                _ProductList.Push(_NewP)
            }
        }
        ;Ending Emulsion
        for index2,VessalX in _Day.EndingEmulsion
        {
            ProductExists:=0
            For Index3,Item in _ProductList
            {
                    if(Item.Product=VessalX.Product){
                        ProductExists:=1
                        break
                    }
            }
            if(ProductExists){
continue
            }else{
                _NewP:={}
                _NewP.Product:=VessalX.Product
                _ProductList.Push(_NewP)
            }
        }
                ;Recieved Emulsion
                
        for index2,TicketX in _Day.RecievedEmulsions
        {


 For Index4,_Product in TicketX.Products
            {
ProductExists:=0
                            For Index3,ItemX in _ProductList
            {
                             
                    if(_Product.Product=ItemX.Product){
                        ProductExists:=1
                        break
                    }

            }

 if(ProductExists){
continue
            }else{
                _NewP:={}
                _NewP.Product:=VessalX.Product
                _ProductList.Push(_NewP)
            }

            }
            
        }
        return _ProductList
}