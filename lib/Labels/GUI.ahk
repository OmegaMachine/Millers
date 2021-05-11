
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
    ;Groupbox 1
    Anchor("GroupBox_JobDetails","w0.25h0.3")
    Anchor("JobDetails_JobNumberText","x0.05")
    Anchor("JobDetails_JobNumberDDL","w0.125x0.1")
    Anchor("JobDetails_JobOwnerText","x0.05")
    Anchor("JobDetails_JobOwnerDDL","w0.125x0.1")
    Anchor("JobDetails_JobDateText","x0.05")
    Anchor("JobDetails_JobDateTime","w0.125x0.1")
    ;Groupbox 2
    Anchor("GroupBox_JobWeather","w0.25h0.3x0.3")
    Anchor("JobWeather_MorningText","x0.3")
    Anchor("JobWeather_MorningDDL","w0.125x0.3")
    Anchor("JobWeather_MorningTempText","x0.3")
    Anchor("JobWeather_MorningTempDDL","w0.125x0.3")

    Anchor("JobWeather_LunchText","x0.3")
    Anchor("JobWeather_LunchDDL","w0.125x0.3")
    Anchor("JobWeather_LunchTempText","x0.3")
    Anchor("JobWeather_LunchTempDDL","w0.125x0.3")

    Anchor("JobWeather_EveningText","x0.3")
    Anchor("JobWeather_EveningDDL","w0.125x0.3")
    Anchor("JobWeather_EveningTempText","x0.3")
    Anchor("JobWeather_EveningTempDDL","w0.125x0.3")
return

GuiGeneralModify:
    UnsavedChanges() 
return