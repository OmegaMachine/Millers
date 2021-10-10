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

