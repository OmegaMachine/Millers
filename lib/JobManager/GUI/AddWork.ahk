Show_AddWorkLabel:
Show_AddWork()
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
Add_ContractWork(_NewWork_Name,_NewWork_Type,_NewWork_HasFog)
return