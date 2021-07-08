Menu, FileMenu, Add, Load Job, FileMenu_LoadJob
Menu, FileMenu, Icon, Load Job,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
Menu, FileMenu, Add, Save Job, FileMenu_SaveJob
Menu, FileMenu, Icon, Save Job,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
Menu, FileMenu, Add, Save Job As, FileMenu_SaveJobAs
Menu, FileMenu, Icon, Save Job As,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
Menu, FileMenu, Add, New Blank Job, FileMenu_New_Blank_Job
Menu, FileMenu, Icon, New Blank Job,% IconManager.DLLPath,% IconManager.IconIDByName("Project")

Menu, DebugMenu, Add, Test, DebugMenu_Test1
Menu, DebugMenu, Icon, Test,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
Menu, DebugMenu, Add, Flush Active Job, DebugMenu_Flush_Active_Job
Menu, DebugMenu, Icon, Flush Active Job,% IconManager.DLLPath,% IconManager.IconIDByName("CFORM")

Menu, ImportMenu, Add, Import Contract Details, Load_JobDetailsFromJob
Menu, ImportMenu, Icon, Import Contract Details,% IconManager.DLLPath,% IconManager.IconIDByName("Project")

Menu, ContractMenu, Add, Add Contract Work, Show_AddWorkLabel
Menu, ContractMenu, Icon, Add Contract Work,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
Menu, ImportMenu, Add, Import Contract Details, Load_JobDetailsFromJob
Menu, ImportMenu, Icon, Import Contract Details,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
;enu, ImportMenu, Add, Flush Active Job, DebugMenu_Flush_Active_Job
;Menu, ImportMenu, Icon, Flush Active Job,% IconManager.DLLPath,% IconManager.IconIDByName("CFORM")

Menu, ErrorCheckMenu, Add,Job,ErrorCheck_ActiveJob
Menu, ErrorCheckMenu, Icon, Job,% IconManager.DLLPath,% IconManager.IconIDByName("CFORM")
Menu, ErrorCheckMenu_JOB, Add, Check Whole Job, ErrorCheck_ActiveJob
Menu, ErrorCheckMenu_JOB, Icon, Check Whole Job,% IconManager.DLLPath,% IconManager.IconIDByName("DEFAULT")
Menu, ErrorCheckMenu_JOB, Add, Check Roads, ErrorCheck_Roads
Menu, ErrorCheckMenu_JOB, Icon, Check Roads,% IconManager.DLLPath,% IconManager.IconIDByName("DEFAULT")
Menu, ErrorCheckMenu, Add,Job,:ErrorCheckMenu_JOB
Menu, ErrorCheckMenu, Add,Hours,ErrorCheck_Hours
Menu, ErrorCheckMenu, Icon, Hours,% IconManager.DLLPath,% IconManager.IconIDByName("CFORM")
Menu, ErrorCheckMenu_Hours, Add, Man Hours, ErrorCheck_Hours
Menu, ErrorCheckMenu_Hours, Icon, Man Hours,% IconManager.DLLPath,% IconManager.IconIDByName("DEFAULT")
Menu, ErrorCheckMenu_Hours, Add, Equipment Hours, ErrorCheck_Hours
Menu, ErrorCheckMenu_Hours, Icon, Equipment Hours,% IconManager.DLLPath,% IconManager.IconIDByName("DEFAULT")
Menu, ErrorCheckMenu, Add,Hours,:ErrorCheckMenu_Hours

Menu, ConversionMenu, Add, Create Daily Work Log, Conversion_ActiveJob_toDailyLog
Menu, ConversionMenu, Icon, Create Daily Work Log,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
Menu, ConversionMenu, Add, Create Weekly Payroll, Conversion_ActiveJob_toPayroll
Menu, ConversionMenu, Icon, Create Weekly Payroll,% IconManager.DLLPath,% IconManager.IconIDByName("CFORM")
Menu, ConversionMenu, Add, Create Work Summary, Create_WorkSummary
Menu, ConversionMenu, Icon, Create Work Summary,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
;Menu, ErrorCheckMenu, Add, Flush Active Job, DebugMenu_Flush_Active_Job
;Menu, ErrorCheckMenu, Icon, Flush Active Job,% IconManager.DLLPath,% IconManager.IconIDByName("CFORM")
Menu, SettingsMenu,Add,Autoload Most Recent File,ToggleAutoSave
if(ListManager.GetData("Autoload",false)){
Menu, SettingsMenu,Check,Autoload Most Recent File
}else{
Menu, SettingsMenu,uncheck,Autoload Most Recent File
}

Menu, MainMenu, Add, &File, :FileMenu
Menu, MainMenu, Add, &Contract, :ContractMenu
Menu, MainMenu, Add, &Import, :ImportMenu
Menu, MainMenu, Add, &Error Checking, :ErrorCheckMenu
Menu, MainMenu, Add, &Conversions, :ConversionMenu
Menu, MainMenu, Add, &Settings, :SettingsMenu
;Menu, MainMenu, Add, &Debug, :DebugMenu

