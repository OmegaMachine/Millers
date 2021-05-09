class VersionManager{
__New(_Major,_Minor,_UI,_Bugs){
	this.Major:=_Major
	this.Minor:=_Minor
	this.UI:=_UI
	this.Bugs:=_Bugs
	this.Version:=this.Major . "." . this.Minor . "." . this.UI . "." . this.Bugs
	return this
}
Current(){
	return this.Version
}
}