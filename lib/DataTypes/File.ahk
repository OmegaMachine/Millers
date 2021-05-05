class File{
__New(_FilePath){
    this.FullPath:=_FilePath
     SplitPath, _FilePath, _FileName, _FileDir, _FileExt, _FileNameNoExt, _FileDrive
    this.Exists:=true
    this.FileName:=_FileName
    this.FileDir:=_FileDir
    this.FileExt:=_FileExt
    this.FileNameNoExt:=_FileNameNoExt
    this.FileDrive:=_FileDrive
    IfExist,% this.FullPath
    {
        this.Exists:=true
}else{
    this.Exists:=false
}
    return this
}
Read(){
    FileRead, _File,% this.FullPath
    return _File
}
Create(){
    Out("Creating File <" . this.FullPath . ">")
    if(!this.Exists){
        
        FileAppend,,% this.FullPath
        this.Exists:=true
        Out("Success",1)
    }else{
        Out("File Already Exists <" . this.FullPath . ">",1)
        this.Exists:=true
    }
    return 1
}
}