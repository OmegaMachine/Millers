class Aggregate extends SerializableClass{
__New(_Load:=0,_Type:="",_Size:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	this.SerializableData.Type:=_Type
	this.SerializableData.Type:=_Size
}
	return this
}
ID(){
	return this.SerializableData.ID
}
}