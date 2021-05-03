




class Job{
__New(_JobNumber:="",_JobOwner:="",_Roads:=""){ ;_Roads:An array of roads
	this.JobNumber:=_JobNumber
	this.JobOwner:=_JobOwner
	
	if(!isObject(_Roads)){
		this.Roads:=[]
	}else{
		this.Roads:=_Roads
}
	return this
}
}