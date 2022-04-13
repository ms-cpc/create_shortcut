@echo off
::CREATE DESKTOP SHORTCUT
::This created a shortcut ATAB.LNK pointing to ATAB.cmd in a folder with variable %pwd&
for %%0 in (.) do set pwd=%%~dpn0
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs

::Replace ATAB with name of your choice
echo sLinkFile = "%USERPROFILE%\Desktop\ATAB.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs

:: Replace %pwd%\ATAB.cmd  with path to your file, or replace with %1 and click drag file to this batch
echo oLink.TargetPath = "%pwd%\ATAB.cmd" >> CreateShortcut.vbs
echo oLink.IconLocation = "%SystemRoot%\system32\SHELL32.dll,24" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%pwd%" >> CreateShortcut.vbs
echo oLink.HotKey = "CTRL+SHIFT+A" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript /nologo CreateShortcut.vbs
del CreateShortcut.vbs