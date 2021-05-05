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


Menu, MainMenu, Add, &File, :FileMenu
Menu, MainMenu, Add, &Debug, :DebugMenu

