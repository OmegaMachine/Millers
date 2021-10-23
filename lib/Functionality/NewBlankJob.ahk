FileMenu_New_Blank_Job:
    Out("Creating new job")
    CheckDirectory(A_ScriptDir . "\Jobs")
    FileSelectFile, NewFilePath, S8, %A_ScriptDir%\Jobs, Enter a Name for the Job, JOBs (*.JOB)

    if(NewFilePath){
        Out("Name Valid",1)
        StringRight, checkvar, NewFilePath, 4
        if(checkvar!=".JOB"){
            Out("Ext invalid,modifying.",1)
            NewFilePath:=NewFilePath . ".JOB"
        }else{
            Out("Ext Valid",1)
        }
        NewFile:=new File(NewFilePath)
        Create_BlankJobFile(NewFile.FileDir,NewFile.FileName)
    }else{
        Out("Aborted.",1)
    }
return

Create_BlankJobFile(_Dir,_Name){
    NewJob:=new Job(0,"555555","Mississippi Mills",0)
    FileAppend,% NewJob.toJson(),%_Dir%\%_Name%
    ;msgbox,% NewJob.toJson()
    return 1
}