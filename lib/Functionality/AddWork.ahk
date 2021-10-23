Show_AddWorkLabel:
Show_AddWork()
return

Context_NewWork:
goto,Show_AddWorkLabel
return

Show_AddWork(){
Global
GuiControl,,_NewWork_Name,
Gui,11: Show, w944 h239, Add New Contract Work
return
}
Hide_AddWork(){
global
Gui,11:Hide

return
}
11GuiClose:
Hide_AddWork()
return

Submit_NewWork:
Gui,11:Submit
ProductDetailsX:={}
ProductDetailsX.Bottom:={}
ProductDetailsX.Bottom.Emulsion:={}
ProductDetailsX.Bottom.Aggregate:={}
ProductDetailsX.Top:={}
ProductDetailsX.Top.Emulsion:={}
ProductDetailsX.Top.Aggregate:={}
ProductDetailsX.SealCoat:={}
ProductDetailsX.SealCoat.Emulsion:={}
ProductDetailsX.SealCoat.Aggregate:={}

ProductDetailsX.Bottom.Emulsion.Type := _NewWork_BottomEmulsion_Type
ProductDetailsX.Bottom.Emulsion.Rate := _NewWork_BottomEmulsion_Rate
ProductDetailsX.Bottom.Emulsion.Source := _NewWork_BottomEmulsion_Source

ProductDetailsX.Top.Emulsion.Type := _NewWork_TopEmulsion_Type
ProductDetailsX.Top.Emulsion.Rate := _NewWork_TopEmulsion_Rate
ProductDetailsX.Top.Emulsion.Source := _NewWork_TopEmulsion_Source

ProductDetailsX.SealCoat.Emulsion.Type := _NewWork_SealCoatEmulsion_Type
ProductDetailsX.SealCoat.Emulsion.Rate := _NewWork_SealCoatEmulsion_Rate
ProductDetailsX.SealCoat.Emulsion.Source := _NewWork_SealCoatEmulsion_Source

ProductDetailsX.Bottom.Aggregate.Type := _NewWork_BottomAgg_Type
ProductDetailsX.Bottom.Aggregate.Rate := _NewWork_BottomAgg_Rate
ProductDetailsX.Bottom.Aggregate.Source := _NewWork_BottomAgg_Source

ProductDetailsX.Top.Aggregate.Type := _NewWork_TopAgg_Type
ProductDetailsX.Top.Aggregate.Rate := _NewWork_TopAgg_Rate
ProductDetailsX.Top.Aggregate.Source := _NewWork_TopAgg_Source

ProductDetailsX.SealCoat.Aggregate.Type := _NewWork_SealCoatAgg_Type
ProductDetailsX.SealCoat.Aggregate.Rate := _NewWork_SealCoatAgg_Rate
ProductDetailsX.SealCoat.Aggregate.Source := _NewWork_SealCoatAgg_Source

Add_ContractWork(_NewWork_Name,_NewWork_Type,_NewWork_HasFog,_NewWork_Length,_NewWork_Width,_NewWork_Area,_NewWork_Notes,ProductDetailsX)
return

Update_Area:
Gui,11:Submit,NoHide
SetFormat, float,0.2
__NewArea:=_NewWork_Length*_NewWork_Width
GuiControl,,_NewWork_Area,%__NewArea%
return



Add_ContractWork(Work_name,Work_Type,Work_HasFog,Work_Length,Work_Width,Work_Area,Work_Notes,ProductDetailsObj){
    global
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
    return 1
}