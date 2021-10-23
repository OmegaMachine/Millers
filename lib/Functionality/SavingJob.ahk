FileMenu_SaveJob:
    if(ActiveJob){
        Out("Saving Job")
        Push_GUI()
        ActiveJob.SaveChanges(ActiveJobFile)
        UnsavedChanges(false)
         SetTitle(APP_NAME . " - " . ActiveJobFile.FileNameNoExt)
    }else{
        Out("Save - No Active Job")
    }
return

FileMenu_SaveJobAs:
    if(ActiveJob){
        Out("Saving Job")
        Push_GUI()
         CheckDirectory(A_ScriptDir . "\Jobs")
    FileSelectFile, _JobPathData, 8, %A_ScriptDir%\Jobs, Select a Job file, Job Files (*.JOB)
    if(!_JobPathData){
        Out("Load Job Data Failed. No File Selected",1)
        return
    }


    if(!isValidJobFile(_JobPathData))
    {
        Out("Load Job Data Failed. Invalid Job file.",1)
        NonFatalErrorPrompt("The file [" . _JobPathData . "] is not a valid job file.")
        return
    }
      
    FileCopy,% ActiveJobFile.FullPath ,% _JobPathData
        UnsavedChanges(false)
        
    }else{
        Out("Save - No Active Job")
    }
return