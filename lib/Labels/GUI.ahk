
GuiClose:
if(UnsavedChanges){
MsgBox, 4388, Unsaved Changes, There are unsaved changes to the current job file. would you like to discard them and close the active job?
IfMsgBox, No
{
    Out("Close Job Failed. Unsaved Changes.",1)
    return
}
}
exitapp
return


GuiSize:
;Anchor("Main_TAB", "hw"), Anchor("AButton", "yx")

Anchor("Welcome_Text", "hw")
Anchor("Main_TAB", "hw")

Anchor("GroupBox_JobDetails","w0.25h0.3")
Anchor("JobDetails_JobNumberText","x0.05")
Anchor("JobDetails_JobNumberDDL","w0.125x0.1")
Anchor("JobDetails_JobOwnerText","x0.05")
Anchor("JobDetails_JobOwnerDDL","w0.125x0.1")

Anchor("GroupBox_JobWeather","w0.25h0.3x0.3")
Anchor("JobWeather_MorningText","x0.3")
Anchor("JobWeather_MorningDDL","w0.125x0.3")

return

GuiGeneralModify:
   UnsavedChanges() 
return