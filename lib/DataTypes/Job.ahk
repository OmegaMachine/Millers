

class Job extends SerializableClass{
    __New(_Load:=0,_JobNumber:="",_JobOwner:="",_Roads:="",_Weather:="",_Times:="",_ActiveEmployees:="",_ActiveEquipment:="",_Date:=""){ ;_Roads:An array of roads
        ;We must initiate the base class manually
        base.__New()
        if(isObject(_Load)){
            this.SerializableData:=this.DeSerialize(_Load)
        }else{
            ;We then store any data we want to keep in this.SerializableData
            this.SerializableData.JobNumber:=_JobNumber
            this.SerializableData.JobOwner:=_JobOwner

            if(!isObject(_Date)){
                this.SerializableData.Date:=new DateTime(0,A_NOW)
            }else{
                this.SerializableData.Date:=_Date
            }

            if(!isObject(_Roads)){
                this.SerializableData.Roads:=[]
            }else{
                this.SerializableData.Roads:=_Roads
            }

            if(!isObject(_Weather)){
                this.SerializableData.Weather:={}
                this.SerializableData.Weather.Morning:=new WeatherState(0,1,"SUNNY")
                this.SerializableData.Weather.Lunch:=new WeatherState(0,1,"SUNNY")
                this.SerializableData.Weather.Evening:=new WeatherState(0,1,"SUNNY")
            }else{
                this.SerializableData.Weather:=_Weather
            }

            if(!isObject(_Times)){
                this.SerializableData.Times:={}
                this.SerializableData.Times.StartTime:=new TimeState(0,6,30) ;6:30am
            }else{
                this.SerializableData.Times:=_Times
            }

            if(!isObject(_ActiveEmployees)){
                this.SerializableData.Employees:=[]
            }else{
                this.SerializableData.Employees:=_ActiveEmployees
            }

            if(!isObject(_ActiveEquipment)){
                this.SerializableData.Equipment:=[]
            }else{
                this.SerializableData.Equipment:=_ActiveEquipment
            }

        }
        return this
    }
    SaveChanges(_JobFile){
        Out("Saving Job <" . _JobFile.FullPath . ">")
        Out("Deleting Old Copy")
        FileDelete,% _JobFile.FullPath
        Out("Appending New Data")
        FileAppend,% this.toJson(),% _JobFile.FullPath
        Out("Save Job Complete")
        return 1
    }
}