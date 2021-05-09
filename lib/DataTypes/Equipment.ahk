class Equipment extends SerializableClass{
__New(_Load:=0,_Name:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	this.SerializableData.Name:=_Name
}
	return this
}
Name(){
	return this.SerializableData.Name
}
}