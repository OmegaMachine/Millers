class TimeState{
__New(_Load:=0,_Hour24:="",_Min:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	this.SerializableData.Hour24:=_Hour24
	this.SerializableData.Min:=_Min
}
	return this
}
}