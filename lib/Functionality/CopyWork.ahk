Context_CopyWork:

 for index,Road in ActiveJob.SerializableData.ContractWork
        {
            if(Road.Name = RowXText){
                RoadCopy:=Road.Clone()
                RoadCopy.Name:=RoadCopy.Name . " - Copy"
                ActiveJob.SerializableData.ContractWork.Push(RoadCopy)
                Push_ActiveJob(ActiveJob)
                UnsavedChanges(true)
                
            }

        }
return