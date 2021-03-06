
;Final chunk of autoload section


AutoLoadEnabled:=ListManager.GetData("Autoload",false)
if(AutoLoadEnabled){
    AutoLoadFile:=ListManager.GetData("LastFile","false")
    if(AutoLoadFile){
AutoLoad(AutoLoadFile)
    }else{
        Out("Most recent file could not be found.")
    }
}
return ; End of autoload section




AutoLoad(_FILEPATH){
global
Out("Auto Loading Job. <" . _FILEPATH . ">")

CheckDirectory(A_ScriptDir . "\Jobs")
_JobPath:=_FILEPATH
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

LoadJob(ActiveJobFile,1)
ActiveJob.SaveChanges(ActiveJobFile)
        UnsavedChanges(false)
         SetTitle(APP_NAME . " - " . ActiveJobFile.FileNameNoExt)
;Out("Load Job Success. <" . ActiveJobFile.FileNameNoExt . ">")
return 1
}