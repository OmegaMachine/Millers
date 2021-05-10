Out(_T,_Layer:=0){

loop,%_Layer%
{
_Layers:=_Layers . A_Tab
}
_Str:=_Layers . ">" . _T
    OutputDebug,%_Str%
}

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
INTERNAL_LOADING:=true
LoadJob(ActiveJobFile)
INTERNAL_LOADING:=false
return 1
}