class Road{
__New(_Name:="",_JobType:="",_NeedsFog:="",_Length:="",_Width:="",_Aggregate:="",_AggregateApplicationRate:="",_Product:="",_ProductApplicationRate:=""){
	this.Name:=_Name
	this.JobType:=_JobType
	this.NeedsFog:=_NeedsFog
	this.Length:=_Length
	this.Width:=_Width
	this.Aggregate:=_Aggregate
	this.AggregateRate:=_AggregateApplicationRate
	this.Product:=_Product
	this.ProductRate:=_ProductApplicationRate
	
	return this
}
}