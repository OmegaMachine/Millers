

class Shift extends SerializableClass{
__New(_Load:=0,_Employee:="",_StartTime:="",_EndTime:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	this.SerializableData.Employee:=""
	this.SerializableData.StartTime:=_StartTme
	this.SerializableData.EndTime:=_EndTime
	
	this.SerializableData.Duration:=_EndTime - _StartTme
}
	return this
}
Duration(){
	return this.SerializableData.Duration
}
}