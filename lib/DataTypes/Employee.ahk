

class Employee extends SerializableClass{
__New(_Load:=0,_FirstName:="",_LastName:="",_EmployeeID:="",_PersonalPhone:="",_WorkPhone:="",_Address:="",_EmergencyContact:=""){
		;We must initiate the base class manually
base.__New()
if(isObject(_Load)){
	this.SerializableData:=this.DeSerialize(_Load)
}else{
	this.SerializableData.FirstName:=_FirstName
	this.SerializableData.LastName:=_LastName
	this.SerializableData.EmployeeID:=_EmployeeID
	this.SerializableData.PersonalPhone:=_PersonalPhone
	this.SerializableData.WorkPhone:=_WorkPhone
	this.SerializableData.Address:=_Address
	this.SerializableData.EmergencyContact:=_EmergencyContact
	
	this.SerializableData.FullName:=_FirstName . " " . _LastName
}
	return this
}
Name(){
	return this.SerializableData.FullName
}
}