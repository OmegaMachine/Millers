EditWork:
Show_EditWork()
;msgbox,% RowXText
return


Show_EditWork(){
Global
;GuiControl,,_NewWork_Name,
Gui,13: Show, w944 h239, Edit Contract Work - %RowXText%
Gui,13:Default
GuiControl,,_EditWork_Name,%RowXText%
  for index,WorkX in ActiveJob.SerializableData.ContractWork
        {
            if(WorkX.Name = RowXText){       
    GuiControl,ChooseString,_EditWork_Type,% WorkX.Type
    ;GuiControl,,_EditWork_HasFog,% WorkX.HasFog
    GuiControl,ChooseString,_EditWork_HasFog,% WorkX.HasFog
    GuiControl,,_EditWork_Length,% WorkX.Length
    GuiControl,,_EditWork_Width,% WorkX.Width
    GuiControl,,_EditWork_Area,% WorkX.Area
    GuiControl,,_EditWork_Notes,% WorkX.Notes

    GuiControl,ChooseString,_EditWork_BottomEmulsion_Type,% WorkX.BottomEmulsionType
    GuiControl,,_EditWork_BottomEmulsion_Rate,% WorkX.BottomEmulsionRate
    GuiControl,ChooseString,_EditWork_BottomEmulsion_Source,% WorkX.BottomEmulsionSource

    GuiControl,ChooseString,_EditWork_TopEmulsion_Type,% WorkX.TopEmulsionType
    GuiControl,,_EditWork_TopEmulsion_Rate,% WorkX.TopEmulsionRate
    GuiControl,ChooseString,_EditWork_TopEmulsion_Source,% WorkX.TopEmulsionSource

    GuiControl,ChooseString,_EditWork_SealCoatEmulsion_Type,% WorkX.SealCoatEmulsionType
    GuiControl,,_EditWork_SealCoatEmulsion_Rate,% WorkX.SealCoatEmulsionRate
    GuiControl,ChooseString,_EditWork_SealCoatEmulsion_Source,% WorkX.SealCoatEmulsionSource

    GuiControl,ChooseString,_EditWork_BottomAgg_Type,% WorkX.BottomAggType
    GuiControl,,_EditWork_BottomAgg_Rate,% WorkX.BottomAggRate
    GuiControl,ChooseString,_EditWork_BottomAgg_Source,% WorkX.BottomAggSource

    GuiControl,ChooseString,_EditWork_TopAgg_Type,% WorkX.TopAggType
    GuiControl,,_EditWork_TopAgg_Rate,% WorkX.TopAggRate
    GuiControl,ChooseString,_EditWork_TopAgg_Source,% WorkX.TopAggSource

    GuiControl,ChooseString,_EditWork_SealCoatAgg_Type,% WorkX.SealCoatAggType
    GuiControl,,_EditWork_SealCoatAgg_Rate,% WorkX.SealCoatAggRate
    GuiControl,ChooseString,_EditWork_SealCoatAgg_Source,% WorkX.SealCoatAggSource
            }
        }
return
}
Hide_EditWork(){
global
Gui,13:Hide

return
}

13GuiClose:
Hide_EditWork()
return

Submit_EditWork:
Gui,13:Submit
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

ProductDetailsX.Bottom.Emulsion.Type := _EditWork_BottomEmulsion_Type
ProductDetailsX.Bottom.Emulsion.Rate := _EditWork_BottomEmulsion_Rate
ProductDetailsX.Bottom.Emulsion.Source := _EditWork_BottomEmulsion_Source

ProductDetailsX.Top.Emulsion.Type := _EditWork_TopEmulsion_Type
ProductDetailsX.Top.Emulsion.Rate := _EditWork_TopEmulsion_Rate
ProductDetailsX.Top.Emulsion.Source := _EditWork_TopEmulsion_Source

ProductDetailsX.SealCoat.Emulsion.Type := _EditWork_SealCoatEmulsion_Type
ProductDetailsX.SealCoat.Emulsion.Rate := _EditWork_SealCoatEmulsion_Rate
ProductDetailsX.SealCoat.Emulsion.Source := _EditWork_SealCoatEmulsion_Source

ProductDetailsX.Bottom.Aggregate.Type := _EditWork_BottomAgg_Type
ProductDetailsX.Bottom.Aggregate.Rate := _EditWork_BottomAgg_Rate
ProductDetailsX.Bottom.Aggregate.Source := _EditWork_BottomAgg_Source

ProductDetailsX.Top.Aggregate.Type := _EditWork_TopAgg_Type
ProductDetailsX.Top.Aggregate.Rate := _EditWork_TopAgg_Rate
ProductDetailsX.Top.Aggregate.Source := _EditWork_TopAgg_Source

ProductDetailsX.SealCoat.Aggregate.Type := _EditWork_SealCoatAgg_Type
ProductDetailsX.SealCoat.Aggregate.Rate := _EditWork_SealCoatAgg_Rate
ProductDetailsX.SealCoat.Aggregate.Source := _EditWork_SealCoatAgg_Source
Edit_ContractWork(RowXText,_EditWork_Name,_EditWork_Type,_EditWork_HasFog,_EditWork_Length,_EditWork_Width,_EditWork_Area,_EditWork_Notes,ProductDetailsX)
return

Update_AreaEdit:
Gui,13:Submit,NoHide
SetFormat, float,0.2
__NewArea:=_EditWork_Length*_EditWork_Width
GuiControl,,_EditWork_Area,%__NewArea%
return