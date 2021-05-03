RemoveWelcome(){
    global
    if(!Welcome_FLAG){
        Welcome_FLAG:=true
    GuiControl,Hide,Welcome_text
    GuiControl,Show,Main_TAB
    }
    return 1
}