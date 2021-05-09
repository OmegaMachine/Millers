Remove_Welcome(){
    global
    if(!Welcome_FLAG){
        Out("Hiding Welcome Menu / Showing Job Menu")
        Welcome_FLAG:=true
    GuiControl,Hide,Welcome_text
    GuiControl,Show,Main_TAB
    }
    return 1
}

Show_Welcome(){
    global
    if(Welcome_FLAG){
        Out("Showing Welcome Menu / Hiding Job Menu")
        Welcome_FLAG:=false
    GuiControl,Show,Welcome_text
    GuiControl,Hide,Main_TAB
    }
    return 1
}

SetTitle(_Title){
    global
    Out("Setting App Title <" . _Title . ">")
Gui,1:Show,,%_Title%
    return 1
}

NonFatalErrorPrompt(_Text:=""){
    Out("Throwing nonfatal error. <" . _Text . ">",1)
MsgBox, 4112, Nonfatal Error,A nonfatal error has occured. The operation will likely be aborted.`n%_Text%
return 1
}



isValidJobFile(_JobPath){
    _Valid:=True
SplitPath, _JobPath, FN, FD, FE, FNNE, FD
if(FE!="JOB"){
    _Valid:=False
}
return _Valid
}


LoadJob(_JobFile){
global
Out("Load Job Success. <" . _JobFile.FileNameNoExt . ">")
Remove_Welcome()
SetTitle(APP_NAME . " - " . _JobFile.FileNameNoExt)
Push_ActiveJob(ActiveJob)
return 1
}


UnsavedChanges(_State:=true){
    global
    if(!INTERNAL_LOADING){
    Out("Changes Made")
    UnsavedChanges:=_State
}
    return 1
}

Create_BlankJobFile(_Dir,_Name){
NewJob:=new Job(0,"144902","Mississippi Mills",0)
FileAppend,% NewJob.toJson(),%_Dir%\%_Name%
;msgbox,% NewJob.toJson()
return 1
}


CheckDirectory(_Dir){
ifNotExist,%_Dir%
{
    Out("Creating Directory <" . _Dir . ">")
    FileCreateDir, %_Dir%
    return 1
}
return 0
}



Push_GUI(){
    global
    Out("Pushing Details to GUI")
    Gui,1:Submit,NoHide
    ActiveJob.SerializableData.JobNumber:=JobDetails_JobNumberEdit
    return 1
}
Push_ActiveJob(_Job){
    global
    Out("Pushing GUI to Job")
    GuiControl,,JobDetails_JobNumberEdit,% ActiveJob.SerializableData.JobNumber
    return 1
}