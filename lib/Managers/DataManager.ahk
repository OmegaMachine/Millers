class DataManager{
__New(_MDAT){
	this.MDATPath:=_MDAT
	return this
}
ListByName(_Name){
    _List:=0
    IniRead, _Str, % this.MDATPath, Lists, % _Name,0
    if(_Str){
       _List:=json_toobj(_Str) 
    }
    return _List
}
ListToDelimited(_List,_Default:=""){
_DelimitedList:=0
if(_List.length() > 1){

for index,item in _List
{
    if(!_DelimitedList){
_DelimitedList:=Item . "|"
    }else{
_DelimitedList:=_DelimitedList . "|" . Item
    }
}
}else{
    if(_List.length()=1){
        _DelimitedList:=_List[1] . "||"
    }else{
        _DelimitedList:="None Set||"
    }
}


    return _DelimitedList
}

GetData(_DataName,_DefaultVal:=0){
IniRead, _Val, % this.MDATPath, Data, %_DataName%,%_DefaultVal%
return _Val
}
SetData(_DataName,_Val){
Iniwrite,%_Val%, % this.MDATPath, Data, %_DataName%
return 1
}
SetList(_DataName,_Val){
Iniwrite,%_Val%, % this.MDATPath, Lists, %_DataName%
return 1
}
AddValToList(_ListName,_NewVal){
CurrentListX:=this.ListByName(_ListName)
CurrentListX.InsertAt(1, _NewVal)

this.SetList(_ListName,Serializer.Serialize(CurrentListX))
return 1
}
RemoveValFromList(_ListName,_RemoveVal){
CurrentListX:=this.ListByName(_ListName)
for index,valx in CurrentListX
{
if(valx=_RemoveVal)
{
    CurrentListX.RemoveAt(index, 1)
}

}
this.SetList(_ListName,Serializer.Serialize(CurrentListX))
return 1
}

}
