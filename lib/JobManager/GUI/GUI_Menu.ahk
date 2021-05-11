Menu, FileMenu, Add, Load Job, FileMenu_LoadJob
Menu, FileMenu, Icon, Load Job,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
Menu, FileMenu, Add, Save Job, FileMenu_SaveJob
Menu, FileMenu, Icon, Save Job,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
Menu, FileMenu, Add, New Blank Job, FileMenu_New_Blank_Job
Menu, FileMenu, Icon, New Blank Job,% IconManager.DLLPath,% IconManager.IconIDByName("Project")

Menu, DebugMenu, Add, Test, DebugMenu_Test1
Menu, DebugMenu, Icon, Test,% IconManager.DLLPath,% IconManager.IconIDByName("Project")
Menu, DebugMenu, Add, Flush Active Job, DebugMenu_Flush_Active_Job
Menu, DebugMenu, Icon, Flush Active Job,% IconManager.DLLPath,% IconManager.IconIDByName("CFORM")

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
   

;Menu, ErrorCheckMenu, Add, Flush Active Job, DebugMenu_Flush_Active_Job
;Menu, ErrorCheckMenu, Icon, Flush Active Job,% IconManager.DLLPath,% IconManager.IconIDByName("CFORM")

Menu, MainMenu, Add, &File, :FileMenu
Menu, MainMenu, Add, &Error Checking, :ErrorCheckMenu
Menu, MainMenu, Add, &Debug, :DebugMenu

