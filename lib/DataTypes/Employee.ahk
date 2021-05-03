class Employee{
__New(_FirstName:="",_LastName:="",_EmployeeID:="",_PersonalPhone:="",_WorkPhone:="",_Address:="",_EmergencyContact:=""){
	this.FirstName:=_FirstName
	this.LastName:=_LastName
	this.EmployeeID:=_EmployeeID
	this.PersonalPhone:=_PersonalPhone
	this.WorkPhone:=_WorkPhone
	this.Address:=_Address
	this.EmergencyContact:=_EmergencyContact
	
	this.FullName:=_FirstName . " " . _LastName
		
	return this
}
}
