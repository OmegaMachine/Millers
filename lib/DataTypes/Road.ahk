class Road extends SerializableClass{
__New(_Load:=0,_Name:="",_JobType:="",_NeedsFog:="",_Length:="",_Width:="",_Aggregate:="",_AggregateApplicationRate:="",_Product:="",_ProductApplicationRate:=""){
	
	
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	;We then store any data we want to keep in this.SerializableData
	this.SerializableData.Name:=_Name
	this.SerializableData.JobType:=_JobType
	this.SerializableData.NeedsFog:=_NeedsFog
	this.SerializableData.Length:=_Length
	this.SerializableData.Width:=_Width
	this.SerializableData.Aggregate:=_Aggregate
	this.SerializableData.AggregateRate:=_AggregateApplicationRate
	this.SerializableData.Product:=_Product
	this.SerializableData.ProductRate:=_ProductApplicationRate
	
}
return this
}
}