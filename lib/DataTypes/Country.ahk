class Country extends SerializableClass{
__New(_Load:=0,_Name:="",_Code:=""){
	;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	;We then store any data we want to keep in this.SerializableData
	this.SerializableData.Name:=_Name
	this.SerializableData.Code:=_Code
	
}
return this
}

}