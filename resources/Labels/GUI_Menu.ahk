
LoadJob:
if(UnsavedChanges){
MsgBox, 4388, Unsaved Changes, There are unsaved changes to the current job file. would you like to discard them and open a different job?
IfMsgBox, No
{
    return
}
}
ifNotExist,%A_ScriptDir%\Jobs
{
    FileCreateDir, %A_ScriptDir%\Jobs
}
FileSelectFile, _JobPath, 1, %A_ScriptDir%\Jobs, Select a Job file, Job Files (*.JOB)
if(!_JobPath){
    return
}
IfNotExist,%_JobPath%
{
NonFatalErrorPrompt("The job file [" . _JobPath . "] cannot be found.")
return
}

if(!isValidJobFile(_JobPath))
{
NonFatalErrorPrompt("The file [" . _JobPath . "] is not a valid job file.")
return
}
ActiveJobFile:=new File(_JobPath)
ActiveJob:=new Job(Serializer.Deserialize(ActiveJobFile.Read()))
;ActiveJob:=Serializer.DeserializeClass(ActiveJobFile.Read())
LoadJob(ActiveJobFile)
return


Test:
Create_BlankJobFile(A_ScriptDir . "\Jobs","NewJob.JOB")
return

Test2:
FileAppend,% ActiveJob.toJson(), ELog.txt
return