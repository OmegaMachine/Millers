class Serializer{
    __New(){

        return this
    }
    Serialize(_Object){
return this.toJson(_Object)
    }
    Deserialize(_Json){
return this.toObj(_Json)
    }
    toObj(_Json){
return json_toObj(_Json)
    }
    toJson(_Object){
return Json_fromobj(_Object)      
    }

    DeserializeClass(_Json){
return this.toObj(_Json)
    }
}