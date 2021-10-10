

class Job extends SerializableClass{
    __New(_Load:=0,_JobNumber:="",_JobOwner:="",_Roads:="",_Weather:="",_Times:="",_ActiveEmployees:="",_ActiveEquipment:="",_Date:="",_ContractWork:=""){ ;_Roads:An array of roads
        ;We must initiate the base class manually
        base.__New()
        if(isObject(_Load)){
            this.SerializableData:=this.DeSerialize(_Load)
        }else{
            ;We then store any data we want to keep in this.SerializableData
            this.SerializableData.JobNumber:=_JobNumber
            this.SerializableData.JobOwner:=_JobOwner

            this.SerializableData.OwnerContact:="Doug Smith"
            this.SerializableData.OwnerPhone:="613-555-5555"
            this.SerializableData.GeneralContractor:="Smiths - PPG"
            this.SerializableData.SubContractor:="N/A"
            this.SerializableData.Contract_WorkNotes:="Work Notes"

            this.SerializableData.Emulsion_Bottom_TargetRate:="1.65"
            this.SerializableData.Emulsion_Top_TargetRate:="1.60"
            this.SerializableData.Emulsion_Fog_TargetRate:="0.65"

            this.SerializableData.Emulsion_Bottom_Type:="HF-150P"
            this.SerializableData.Emulsion_Top_Type:="HF-150P"
            this.SerializableData.Emulsion_Fog_Type:="CBC"

            this.SerializableData.Emulsion_Bottom_Source:="McAsphalt"
            this.SerializableData.Emulsion_Top_Source:="McAsphalt"
            this.SerializableData.Emulsion_Fog_Source:="McAsphalt"

            this.SerializableData.Emulsion_Additives:="No"
            this.SerializableData.Emulsion_Specifications:="None"

            this.SerializableData.Aggregate_Bottom_Type:="Class 2"
            this.SerializableData.Aggregate_Top_Type:="Class 6"
            this.SerializableData.Aggregate_Fog_Type:="SAND"

            this.SerializableData.Aggregate_Bottom_Source:="Tackaberry"
            this.SerializableData.Aggregate_Top_Source:="Tackaberry"
            this.SerializableData.Aggregate_Fog_Source:="Crains"

            this.SerializableData.Squares_ExistingWidth:="7 M"
            this.SerializableData.Squares_FinishedWidth:="7.2 M"
            this.SerializableData.Squares_Length:="1KM"

            this.SerializableData.Equipment_Parking_Tankers:="Municipal Yard"
            this.SerializableData.Equipment_Parking_ServiceTrucks:="On Site"
            this.SerializableData.Equipment_Parking_Stockpiles:="N/A"
            this.SerializableData.Equipment_Parking_OtherEquipment:="On Site"
            this.SerializableData.Equipment_Parking_WaterHole:="N/A"

            this.SerializableData.PreConstruction_DistressLocations:="---"
            this.SerializableData.PreConstruction_VisualDiscription:="---"
            this.SerializableData.PreConstruction_Videos:="Yes"

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

            if(!isObject(_ContractWork)){
                this.SerializableData.ContractWork:=[]
            }else{
                this.SerializableData.ContractWork:=_ContractWork
            }

            if(!isObject(_Weather)){
                this.SerializableData.Weather:={}
                this.SerializableData.Weather.Morning:=new WeatherState(0,1,"SUNNY")
                this.SerializableData.Weather.Lunch:=new WeatherState(0,1,"SUNNY")
                this.SerializableData.Weather.Evening:=new WeatherState(0,1,"SUNNY")
                this.SerializableData.Weather.Humidity:=50
            }else{
                this.SerializableData.Weather:=_Weather
            }

            if(!isObject(_Times)){
                this.SerializableData.Times:={}
                this.SerializableData.Times.StartTime:=new TimeState(0,6,30) ;6:30am
                this.SerializableData.Times.EndTime:=new TimeState(0,18,30) ;6:30pm
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