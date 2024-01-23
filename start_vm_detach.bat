@echo off

setlocal EnableDelayedExpansion

echo Start run virtual machines
set i=0

echo Read vm_uuids.txt
for /f "tokens=* delims=" %%a in (vm_uuids.txt) do (
    set /a i+=1
    set "uuid[!i!]=%%a"
    echo Reading line - %%a
)

cd C:\Program Files\Oracle\VirtualBox

for /l %%i in (1,1,%i%) do (
	echo Start !uuid[%%i]! 
	VBoxManage.exe startvm {!uuid[%%i]!} --type headless
)

endlocal