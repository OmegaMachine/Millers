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


}
