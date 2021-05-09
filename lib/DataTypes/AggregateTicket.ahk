class AggregateTicket extends SerializableClass{
__New(_Load:=0,_ID:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	this.SerializableData.ID:=_ID
}
	return this
}
ID(){
	return this.SerializableData.ID
}
}