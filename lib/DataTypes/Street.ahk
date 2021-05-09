

class Street extends SerializableClass{
__New(_Load:=0,_StreetName:="",_StreetType:="",_StreetNumber:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	this.SerializableData.Name:=_StreetName
this.SerializableData.Type:=_StreetType
this.SerializableData.Number:=_StreetNumber

this.SerializableData.Full:=_StreetNumber . " " . _StreetName . " " . _StreetType
}
	return this
}
Full(){
	return this.SerializableData.Full
}
}