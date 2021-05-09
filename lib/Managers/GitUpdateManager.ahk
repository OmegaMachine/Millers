class GitUpdateManager{
__New(_CurrentVersion,_UpdateURL){
	this.currentVersion:=_CurrentVersion
	this.serverVersion:=0
	this.serverURL:=_UpdateURL
	return this
}
needsUpdate(){
	_SV:=this.getServerVersion()
	if(_SV){
		if(_SV!=this.currentVersion){
			return 1
		}
	}else{
		return -1
}
	return 0
}
getServerVersion(){
	
	return -1
}
}