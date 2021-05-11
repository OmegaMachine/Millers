class DateTime extends SerializableClass{
__New(_Load:=0,_TimeString:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	
	if(!_TimeString){
		this.SerializableData.TimeString:=A_NOW
	}else{
		this.SerializableData.TimeString:=_TimeString
}

}
	return this
}
DateString(){
	return this.SerializableData.TimeString
}
}