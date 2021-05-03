class IconManager{
__New(_DLL){
	this.DLLPath:=_DLL
	return this
}
IconIDByName(_Name){
Loop,200
{
	TestN:=GetIconGroupNameByIndex(this.DLLPath, A_Index)
	if(!TestN){
		break
	}
	if(TestN=_Name){
		return A_Index
	}
}
DID:=this.IconIDByName("Default")
if(DID){
	return DID
}
return 0
}


}
