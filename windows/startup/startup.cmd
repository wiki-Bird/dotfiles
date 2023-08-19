PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\StartupLog.txt" 2>&1
PowerShell %USERPROFILE%\.config\startup\launch_komorebi.ps1 >> "%TEMP%\StartupLog.txt" 2>&1C

PowerShell %USERPROFILE%\.config\startup\launch_yasb.ps1 >> "%TEMP%\StartupLog.txt" 2>&1C