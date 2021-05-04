class Product extends SerializableClass{
__New(_Load:=0,_Type:=""){
	;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	;We then store any data we want to keep in this.SerializableData
	this.SerializableData.Type:=_Type
	
}
return this
}

}