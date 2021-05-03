class Street{
__New(_StreetName:="",_StreetType:="",_StreetNumber:=""){
this.Name:=_StreetName
this.Type:=_StreetType
this.Number:=_StreetNumber

this.Full:=_StreetNumber . " " . _StreetName . " " . _StreetType
	return this
}
}
