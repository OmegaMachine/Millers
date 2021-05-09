

class Address extends SerializableClass{
__New(_Load:=0,_Country:="",_Province:="",_City:="",_Street:="",_PostalCode:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
this.SerializableData.Country:=_Country
this.SerializableData.Province:=_Province
this.SerializableData.City:=_City
this.SerializableData.Street:=_Street
this.SerializableData.PostalCode:=_PostalCode
this.SerializableData.FullAddress:=_Street.Full . "`n" . _City . ", " . _Country.Code . ", " . _PostalCode
}
	return this
}
Address(){
	return this.SerializableData.FullAddress
}
}