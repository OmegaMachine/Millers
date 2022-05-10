GuiContextMenu:
Switch A_GuiControl
{
case "GroupBox_JobWorkLV":
RowX:=LV_GetNext()
LV_GetText(RowXText, RowX, 1)
if(CONTEXTMENU_CREATED){
    Menu,ContextMenu,Delete
}
if(RowX){
    Menu, ContextMenu, Add, Edit - %RowXText%, EditWork
    Menu, ContextMenu, Add, Copy - %RowXText%, Context_CopyWork
    Menu, ContextMenu, Add, Remove - %RowXText%, Context_RemoveWork

    Menu, ContextMenu, Add, New Contract Work, Context_NewWork

    ;Menu, MainContext, Add,%RowXText%, :EditContractWorkMenu
    Menu, ContextMenu, Show
    CONTEXTMENU_CREATED:=True
}else{
    Menu, ContextMenu, Add, New Contract Work, Context_NewWork
    Menu, ContextMenu, Show
    CONTEXTMENU_CREATED:=True
}
return
Default:
return
}

return



