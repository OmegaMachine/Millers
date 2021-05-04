




class Job extends SerializableClass{
__New(_Load:=0,_JobNumber:="",_JobOwner:="",_Roads:=""){ ;_Roads:An array of roads
	;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	;We then store any data we want to keep in this.SerializableData
	this.SerializableData.JobNumber:=_JobNumber
	this.SerializableData.JobOwner:=_JobOwner
	
	if(!isObject(_Roads)){
		this.SerializableData.Roads:=[]
	}else{
		this.SerializableData.Roads:=_Roads
}






}
	return this
}

}