Out(_T,_Layer:=0){

loop,%_Layer%
{
_Layers:=_Layers . A_Tab
}
_Str:=_Layers . ">" . _T
    OutputDebug,%_Str%
    SB_SetText(_Str)
}

