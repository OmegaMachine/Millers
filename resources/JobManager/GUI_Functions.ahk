Remove_Welcome(){
    global
    if(!Welcome_FLAG){
        Welcome_FLAG:=true
    GuiControl,Hide,Welcome_text
    GuiControl,Show,Main_TAB
    }
    return 1
}

Show_Welcome(){
    global
    if(Welcome_FLAG){
        Welcome_FLAG:=false
    GuiControl,Show,Welcome_text
    GuiControl,Hide,Main_TAB
    }
    return 1
}