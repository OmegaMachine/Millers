class Address{
__New(_Country:="",_Province:="",_City:="",_Street:="",_PostalCode:=""){
this.Country:=_Country
this.Province:=_Province
this.City:=_City
this.Street:=_Street
this.PostalCode:=_PostalCode


this.FullAddress:=_Street.Full . "`n" . _City . ", " . _Country.Code . ", " . _PostalCode
	return this
}
}
