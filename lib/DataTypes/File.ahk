class File{
__New(_FilePath){
    this.FullPath:=_FilePath
    SplitPath, _FilePath, _FileName, _FileDir, _FileExt, _FileNameNoExt, _FileDrive
    this.FileName:=_FileName
    this.FileDir:=_FileDir
    this.FileExt:=_FileExt
    this.FileNameNoExt:=_FileNameNoExt
    this.FileDrive:=_FileDrive
    return this
}
Read(){
    FileRead, _File,% this.FullPath
    return _File
}
}