
class WorkbookWrapper{
__New(_FilePath,_ActiveSheet:=1,_CreateIfNonexistent:=true,_SaveWhenSettingData:=true,_Visible:=false){
	this.DocumentPath:= _FilePath
	this.ExcelObject:=ComObjCreate("Excel.Application")
	this.ExcelObject.Visible := _Visible
	IfExist,%_FilePath%
	{
		this.ExcelWorkbook := this.ExcelObject.Workbooks.Open(this.DocumentPath)
	}else{
		if(_CreateIfNonexistent){
			this.ExcelWorkbook:=this.ExcelObject.Workbooks.Add()
			this.ExcelWorkbook.SaveAs(_FilePath)
		}else{
			return 0
	}

}
	
	this.ActiveSheet:=_ActiveSheet
	this.SaveWhenSettingData:=_SaveWhenSettingData
	return this
}
SaveWorkbook(){
	this.ExcelWorkbook.Save()
}
CloseExcel(){
	this.ExcelObject.Quit()
}
SaveAndClose(){
	this.SaveWorkbook()
	this.CloseExcel()
}
Cell(_CellID,_Sheet:=0){
	if(!_Sheet){
		_Sheet:=this.ActiveSheet
	}
	return this.ExcelWorkbook.Sheets(_Sheet).Range(_CellID).Value
}

SetCell(_CellID,_Data,_Sheet:=0){
	if(!_Sheet){
		_Sheet:=this.ActiveSheet
	}
	this.ExcelWorkbook.Sheets(_Sheet).Range(_CellID).Value:=_Data
	if(this.SaveWhenSettingData){
		this.SaveWorkbook()
	}
	return 1
}
SetCellFormula(_CellID,_Formula,_Sheet:=0){
	if(!_Sheet){
		_Sheet:=this.ActiveSheet
	}
	;oExcel.Range("A3").Formula := "=SUM(A1:A2)"
	this.ExcelWorkbook.Sheets(_Sheet).Range(_CellID).Formula:=_Formula
	if(this.SaveWhenSettingData){
		this.SaveWorkbook()
	}
	return 1
}
CreateTable(_TableName,_StartCell,_EndCell,_Sheet:=0){
		if(!_Sheet){
		_Sheet:=this.ActiveSheet
	}
;this.ExcelWorkbook.Sheets(_Sheet).Range("A:D").Select
this.ExcelWorkbook.ActiveSheet.ListObjects.Add(1, this.ExcelWorkbook.Sheets(_Sheet).Range(_StartCell . ":" . _EndCell),_, 1).Name := _TableName
;this.ExcelWorkbook.Sheets(_Sheet).Range("MyTestTable2[[#All]]").Select
this.ExcelWorkbook.ActiveSheet.ListObjects(_TableName).TableStyle := "TableStyleMedium2"
;this.ExcelWorkbook.Sheets(_Sheet).Range("A1").Select
}
_CellIDByColRow(_CellCol,_CellRow){
	_CellID:=_CellCol . _CellRow
	return _CellID
}
CellObj(_CellID){
pos := Regexmatch(_CellID, "(\w+?)(\d+)", match)
Cell:={}
Cell.Row:=Match2
Cell.Col:=Match1
Cell.ID:=_CellID
return Cell
}
CellIDFromDigits(_Col,_Row){
	_CellID:=this.ExcelWorkBook.ActiveSheet.Cells(_Row,_Col).Address[0,0]
	return _CellID
}
CellObjFromDigits(_Col,_Row){
	_CellID:=this.CellIDFromDigits(_Col,_Row)
pos := Regexmatch(_CellID, "(\w+?)(\d+)", match)
Cell:={}
Cell.Row:=Match2
Cell.Col:=Match1
Cell.ID:=_CellID
return Cell
}
Add_ToTableFromDigits(_TableStartCol,_TableStartRow,_Data){
	_TableStart:=this.CellIDFromDigits(_TableStartCol,_TableStartRow)
NewRow:=this.GetNewTableRow(_TableStart)
NewRow:=this.CellObj(NewRow)
CCount:=_TableStartCol
for index, DataPieces in _Data
{
	this.SetCell(this.CellObjFromDigits(CCount,NewRow.Row).Col . this.CellObjFromDigits(CCount,NewRow.Row).Row,_Data[index])
	CCount++
}
;MyDoc.SetCell(MyDoc.CellObjFromDigits(1,NewRow.Row).Col . MyDoc.CellObjFromDigits(1,NewRow.Row).Row,_Name)
;MyDoc.SetCell(MyDoc.CellObjFromDigits(2,NewRow.Row).Col . MyDoc.CellObjFromDigits(2,NewRow.Row).Row,_Price)
;MyDoc.SetCell(MyDoc.CellObjFromDigits(3,NewRow.Row).Col . MyDoc.CellObjFromDigits(3,NewRow.Row).Row,_Desc)
return 1
}
Remove_RowFromTable(_RowID,_Sheet:=0){
			if(!_Sheet){
		_Sheet:=this.ActiveSheet
	}
this.ExcelWorkbook.Sheets(_Sheet).Range(_RowID).Rows.Delete
return 1
}
SetActiveSheet(_SheetNumber){
this.ActiveSheet:=_SheetNumber
return 1
}
GetActiveSheet(){
	return this.ActiveSheet
}
GetNewTableRow(StartingCell,SheetNumber:=0,XL_Visible := false,_MaxChecks:=500){
	if(!SheetNumber){
		SheetNumber:=this.ActiveSheet
	}
CellObj:=this.CellObj(StartingCell)
	Loop,%_MaxChecks%
	{
		
		_Cell:=CellObj.Col . CellObj.Row
		CellObj.Row++
		if(!this.ExcelWorkbook.Sheets(SheetNumber).Range(_Cell).Value){
			return _Cell
			break
		}
	}
}




TTT(_CellID,_Sheet:=0){
	msgbox,% _CellID
	if(!_Sheet){
		_Sheet:=this.ActiveSheet
	}
	return this.ExcelWorkbook.Sheets(_Sheet).Range(_CellID).Value
	
}

CellP(_CellID,_Sheet:=0){
	X1:=new this.CellO(_CellID,_Sheet)
	;msgbox,% X1.CellID
	return X1
}
CellT(P){
	Msgbox,%P% JJ
	Msgbox,% this.Cell(P) . " FFFFFFFFFFFFFF"
}

class CellO{
__New(_CellID,_Sheet:=0){

	local parent:=RegExReplace(A_ThisFunc, "i)(.*)\..*\.__new","$1") ; 	These 2 lines serialize the parent object
	this.parent := %parent%	;	
			if(!_Sheet){
		_Sheet:=this.parent.GetActiveSheet()
	}
	;this.Col:=this.parent.ExcelWorkbook.Sheets(1).range(_CellID).column
	;this.Row:=this.parent.ExcelWorkbook.Sheets(1).range(_CellID).row
	this.CellID:=_CellID
	this.Sheet:=_Sheet
	return this
}
Get(){
	;msgbox,% this.parent.Test2()
;	msgbox,% this.parent.Cell(this.CellID)
	
	X:=this.parent.TTT(this.CellID)
	msgbox,% X
return X
}
}


/*



*/










}

