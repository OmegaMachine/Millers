class ScreenToAppResolution{
__New(_Scale:=50){
	this.Scale:=_Scale
	this.ScaleRate:=_Scale/100
	this.Width:=A_ScreenWidth * this.ScaleRate
	this.Height:=A_ScreenHeight * this.ScaleRate
	this.X:=A_ScreenWidth * ((1-this.ScaleRate)/2)
	this.Y:=A_ScreenHeight * ((1-this.ScaleRate)/2)
	return this
}
}