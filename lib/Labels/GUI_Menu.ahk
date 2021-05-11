
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
INTERNAL_LOADING:=true
LoadJob(ActiveJobFile)
INTERNAL_LOADING:=false
return


DebugMenu_Test1:
;Create_BlankJobFile(A_ScriptDir . "\Jobs","NewJob.JOB")
return


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

FileMenu_SaveJob:
if(ActiveJob){
Out("Saving Job")
Push_GUI()
ActiveJob.SaveChanges(ActiveJobFile)
UnsavedChanges(false)
}else{
    Out("Save - No Active Job")
}
return

DebugMenu_Flush_Active_Job:
if(ActiveJob){
Out("Flushing Active Job")
ActiveJob.Flush()
}else{
    Out("Flush - No Active Job")
}
return

ErrorCheck_ActiveJob:
Out("Nothing")
Return
ErrorCheck_Roads:
Out("Nothing")
Return
ErrorCheck_Hours:
Out("Nothing")
Return
Conversion_ActiveJob_toDailyLog:

return
Conversion_ActiveJob_toPayroll:

return