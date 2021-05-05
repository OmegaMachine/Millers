class SerializableClass{
    __New(){
        this.SerializableData:={}
        this.SerializableData.ClassType:=this.__Class
        this.SerializableData.isSerializable:=True
        return this
    }

    toJson(){
        SC:=this.Clone()
        Out("Serializing object <" . SC.SerializableData.ClassType . ">",1)
        for index,item in this.SerializableData
        {
            ;msgbox,% index
            if(isObject(item)){
                if(item.SerializableData.isSerializable){
                        SC[index]:=Item.toJson()
                }else{
                            for index2,item2 in Item
        {
            if(Item2.SerializableData.isSerializable){
                        SC[index][index2]:=Item2.toJson()
                }
        }
                }
            }
        }
return Json_fromobj(this.SerializableData)      
    }


    DeSerialize(_Object){
        Out("Deserializing object <" . _Object.ClassType . ">",1)
SC:=_Object.Clone()
        for index,item in _Object
        {
            ;msgbox,% index
            if(isObject(item)){
                if(item.SerializableData.isSerializable){
                    PT:=Item.SerializableData.ClassType
                   
                        _Object[index]:=new %PT%(Item.SerializableData)
                       ; SC[index]:=Item.Deserialize(Item)
                }else{
                            for index2,item2 in Item
        {
            if(Item2.SerializableData.isSerializable){
                         PT:=Item2.SerializableData.ClassType
                         
                        _Object[index][index2]:=new %PT%(Item2.SerializableData)
 
                }
        }
                }
            }
        }
return _Object     
    }

}