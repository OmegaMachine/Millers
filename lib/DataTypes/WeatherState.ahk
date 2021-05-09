class WeatherState{
__New(_Load:=0,_Temp:="",_Status:="",_Time:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	;We then store any data we want to keep in this.SerializableData
	this.SerializableData.Temperature:=_Temp
	this.SerializableData.Temp:=_Temp
	this.SerializableData.Status:=_Status
	this.SerializableData.Time:=_Time
}
	return this
}
}