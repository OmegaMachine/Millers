class ScreenToAppResolution{
    __New(_Scale:=50){
        this.Scale:=_Scale
        this.ScaleRate:=_Scale/100
        this.Width:=A_ScreenWidth * this.ScaleRate
        this.Height:=A_ScreenHeight * this.ScaleRate
        this.X:=A_ScreenWidth * ((1-this.ScaleRate)/2)
        this.Y:=A_ScreenHeight * ((1-this.ScaleRate)/2)
        this.Padding:=10
        this.Widths:={}
        this.Widths.Full:=Floor((this.Width) - (this.Padding * 2))
        this.Widths.Tenth := Floor((this.Width / 10))
        this.Widths.TenthMinusPadding := Floor((this.Width / 10)) - this.Padding
        this.Widths.Eigth := Floor((this.Width / 8))
        this.Widths.EigthMinusPadding := Floor((this.Width / 8)) - this.Padding
        this.Widths.Sixth := Floor((this.Width / 6))
        this.Widths.SixthMinusPadding := Floor((this.Width / 6)) - this.Padding
        this.Widths.Fifth := Floor((this.Width / 5))
        this.Widths.Quarter := Floor((this.Width / 4))
        this.Widths.QuarterMinusPadding := Floor((this.Width / 4)) - this.Padding
        this.Widths.Third := Floor((this.Width / 3))
        this.Widths.Half := Floor((this.Width / 2))

        this.Heights:={}
        this.Heights.Line:=20
        this.Heights.Tenth := Floor((this.Height / 10))
        this.Heights.TenthMinusPadding := Floor((this.Height / 10)) - this.Padding
        this.Heights.Eigth := Floor((this.Height / 8))
        this.Heights.EigthMinusPadding := Floor((this.Height / 8)) - this.Padding
        this.Heights.Sixth := Floor((this.Height / 6))
        this.Heights.SixthMinusPadding := Floor((this.Height / 6)) - this.Padding
        this.Heights.Fifth := Floor((this.Height / 5))
        this.Heights.Quarter := Floor((this.Height / 4))
        this.Heights.QuarterMinusPadding := Floor((this.Height / 4)) - this.Padding
        this.Heights.Third := Floor((this.Height / 3))
        this.Heights.Half := Floor((this.Height / 2))

        this.Positions:={}
        this.Positions.2ndQuarter := Floor((this.Widths.Quarter * 1))
        this.Positions.2ndQuarterPlusPadding := Floor((this.Widths.Quarter * 1)) + ( this.Padding * 2 )

        return this
    }
}