Remove_Welcome(){
    global
    if(!Welcome_FLAG){
        Welcome_FLAG:=true
    GuiControl,Hide,Welcome_text
    GuiControl,Show,Main_TAB
    }
    return 1
}

Show_Welcome(){
    global
    if(Welcome_FLAG){
        Welcome_FLAG:=false
    GuiControl,Show,Welcome_text
    GuiControl,Hide,Main_TAB
    }
    return 1
}

SetTitle(_Title){
    global
Gui,1:Show,,%_Title%
    return 1
}

NonFatalErrorPrompt(_Text:=""){
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
Remove_Welcome()
SetTitle(APP_NAME . " - " . _JobFile.FileNameNoExt)
return 1
}


UnsavedChanges(_State:=true){
    global UnsavedChanges
    UnsavedChanges:=_State
    return 1
}

Create_BlankJobFile(_Dir,_Name){
NewJob:=new Job(0,"144902","Mississippi Mills",0)
FileAppend,% NewJob.toJson(),%_Dir%\%_Name%
;msgbox,% NewJob.toJson()
return 1
}