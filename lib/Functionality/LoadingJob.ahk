FileMenu_LoadJob:
    Out("Loading Job.")
    if(UnsavedChanges){
        MsgBox, 4388, Unsaved Changes, There are unsaved changes to the current job file. would you like to discard them and open a different job?
        IfMsgBox, No
        {
            Out("Load Job Failed. Unsaved Changes.",1)
            return
        }
    }
    CheckDirectory(A_ScriptDir . "\Jobs")
    FileSelectFile, _JobPath, 1, %A_ScriptDir%\Jobs, Select a Job file, Job Files (*.JOB)
    if(!_JobPath){
        Out("Load Job Failed. No File Selected",1)
        return
    }
    IfNotExist,%_JobPath%
    {
        Out("Load Job Failed. Job file does not exist.",1)
        NonFatalErrorPrompt("The job file [" . _JobPath . "] cannot be found.")
        return
    }

    if(!isValidJobFile(_JobPath))
    {
        Out("Load Job Failed. Invalid Job file.",1)
        NonFatalErrorPrompt("The file [" . _JobPath . "] is not a valid job file.")
        return
    }
    ActiveJobFile:=new File(_JobPath)
    ActiveJob:=new Job(Serializer.Deserialize(ActiveJobFile.Read()))
    ;ActiveJob:=Serializer.DeserializeClass(ActiveJobFile.Read())
    
    LoadJob(ActiveJobFile)
   goto,FileMenu_SaveJob
    Out("Load Job Success. <" . ActiveJobFile.FileNameNoExt . ">")
return

LoadJob(_JobFile){
    global
    Out("Load Job Success. <" . _JobFile.FileNameNoExt . ">")
    Remove_Welcome()
    SetTitle(APP_NAME . " - " . _JobFile.FileNameNoExt)
    Push_ActiveJob(ActiveJob)
    ListManager.SetData("LastFile",_JobFile.FullPath)
    return 1
}
