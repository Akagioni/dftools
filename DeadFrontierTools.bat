@echo off
title Achef's Dead Frontier Tools v1.3
color 02
//:dfrunchk
//cls
//echo Searching for DeadFrontier.exe
//timeout /t 2 /nobreak >nul
//qprocess "DeadFrontier.exe">nul
//if %errorlevel% equ 0 goto mmenu
//if %errorlevel% equ 1 goto dfnrun
//:dfnrun
//cls
//echo DeadFrontier.exe is not running
//echo To use this tool the game client must be open.
//echo Retrying...
//timeout /t 2 /nobreak >nul
//goto dfrunchk
//pause
//exit
:mmenu
title Achef's Dead Frontier Tools v1.3 - Main Menu
cls
echo %DATE% - %TIME%
echo Welcome to this simple tool.
echo.
echo Supports: AMD and Intel CPUs.
echo.
echo.
echo DISCLAIMER: If you obtained this script from a source outside
echo Dead Frontier Forums, do not proceed. I take no responsibility
echo for any damage caused from not using official sources.
echo =============================================================
echo.
echo What would you like to do?
echo 1- Set process priority and affinity menu
echo 2- View system information
echo 3- Connection test
echo 4- Credits
echo 5- Exit program
echo.
echo Press the number for the desired option.
echo =============================================================
choice /c 12345 /n
if %errorlevel%==1 goto pamenu
if %errorlevel%==2 goto sysinfo
if %errorlevel%==3 goto nettest
if %errorlevel%==4 goto creds
if %errorlevel%==5 goto texit
:pamenu
title Achef's Dead Frontier Tools v1.3 - Priority Menu
cls
echo Game priority and afinnity menu
echo =============================================================
echo In this menu you can select your desired setting.
echo Affinity is set to CPU 0 and CPU 1 (dual-core) in all options.
echo Not sure what to choose? Automatic will do the job for you.
echo =============================================================
echo.
echo 1- Automatic
echo 2- Normal
echo 3- Above Normal
echo 4- High
echo 5- Return to main menu
echo 6- Exit program
echo.
echo Press the number for the desired option.
choice /c 123456 /n
if %errorlevel%==1 goto sauto
if %errorlevel%==2 goto snorm
if %errorlevel%==3 goto sanorm
if %errorlevel%==4 goto shigh
if %errorlevel%==5 goto mmenu
if %errorlevel%==6 goto texit
:sauto
cls
wmic process where name="DeadFrontier.exe" CALL setpriority "above normal"
PowerShell "get-process DeadFrontier | foreach { $_.ProcessorAffinity=0x003 }"
echo Priority for Dead Frontier's executable set Automatically to Above Normal.
echo Returning to main menu.
timeout /t 5 /nobreak >nul
goto mmenu
pause
exit
:snorm
cls
wmic process where name="DeadFrontier.exe" CALL setpriority "normal"
PowerShell "get-process DeadFrontier | foreach { $_.ProcessorAffinity=0x003 }"
echo Priority for Dead Frontier's executable set to Normal.
echo Returning to main menu.
timeout /t 5 /nobreak >nul
goto mmenu
pause
exit
:sanorm
cls
wmic process where name="DeadFrontier.exe" CALL setpriority "above normal"
PowerShell "get-process DeadFrontier | foreach { $_.ProcessorAffinity=0x003 }"
echo Priority for Dead Frontier's executable set to Above Normal.
echo Returning to main menu.
timeout /t 5 /nobreak >nul
goto mmenu
pause
exit
:shigh
cls
wmic process where name="DeadFrontier.exe" CALL setpriority "high"
PowerShell "get-process DeadFrontier | foreach { $_.ProcessorAffinity=0x003 }"
echo Priority for Dead Frontier's executable set to High.
echo Returning to main menu.
timeout /t 5 /nobreak >nul
goto mmenu
pause
exit
:sysinfo
cls
title Achef's Dead Frontier Tools v1.3 - System Information
cls
echo =============================================================
echo In this menu you'll see the information of your system (computer)
echo this is useful to report errors to the developers of the game
echo or this tool in order to improve compatibility.
echo =============================================================
echo.
echo Operative System
PowerShell "Get-WmiObject Win32_OperatingSystem | Select-Object -Property Name, OSArchitecture, Version"
echo CPU
PowerShell "Get-WmiObject -Class Win32_Processor | Select-Object -Property Name, Number*"
echo GPU
PowerShell "Get-WmiObject -Class Win32_VideoController | Select-Object -Property Name, Status, CurrentRefreshRate, CurrentHorizontalResolution, CurrentVerticalResolution, DriverVersion"
echo RAM ($_.Capacity line shows total RAM in GB, and yes it's a faulty line on display)
PowerShell "Get-WmiObject Win32_PhysicalMemory | Select-Object -Property DeviceLocator, Manufacturer, PartNumber, Speed, Capacity, {$_.Capacity / 1GB}"
echo Motherboard
PowerShell "Get-WmiObject Win32_Baseboard | Select-Object -Property Manufacturer, Product"
echo.
echo.
echo Take your time to screenshot or write down the information.
echo Once you are done proceed to the menu.
echo.
echo Return to menu?
echo 1- Yes
choice /c 1 /n
if %errorlevel%==1 goto mmenu
pause
exit
:nettest
title Achef's Dead Frontier Tools v1.3 - Network Test
cls
echo Select the test type
echo ===================================================================
echo 1- Ping
echo 2- Trace Route
echo 3- Tutorial
echo 4- Return to main menu
echo ===================================================================
echo.
echo Press the number for the desired option
choice /c 1234 /n
if %errorlevel%==1 goto pingts
if %errorlevel%==2 goto trts
if %errorlevel%==3 goto ntsttut
if %errorlevel%==4 goto mmenu
:pingts
cls
echo Executing ping test to Dead Frontier's website
ping www.deadfrontier.com
echo Returning to main menu
timeout /t 5 /nobreak >nul
goto nettest
pause
exit
:trts
cls
echo Executing Trace Route to Dead Frontier's website
tracert www.deadfrontier.com
echo Returning to main menu
timeout /t 5 /nobreak >nul
goto nettest
pause
exit
:ntsttut
title Achef's Dead Frontier Tools v1.3 - Net Test Tutorial
cls
echo Here there's a simple explanation to what Ping and Trace Route functions do.
echo.
echo.
echo Ping
echo ===================================================================
echo The Ping function sends a group of test data packages to a specific target,
echo this case being a website and awaits a reply.
echo If any of the packages sent or received (Usually 4 packages) doesn't arrive it's destination,
echo this is an indicator of a network problem,
echo this could be for example, a network congestion or faulty network devices (old routers/modems).
echo ===================================================================
echo.
echo Traceroute
echo ===================================================================
echo The Traceroute function, follows a group of test data packages from sender to target, recording the hops needed 
echo from your computer to the host.
echo The hops are the routers the data goes through to reach it's target, if you can't connect or have issues to connect 
echo to a website/server, this can
echo help to determine where the problem is located.
echo If during the test, the data sent to one of the hops returns a value of * * * Request timed out. 
echo (Each asterisk represents a timeout), instead of a time,
echo this means there is a problem connecting to that hop, 
echo could be a temporary problem (retry to verify) or said router (hop) could be out of service if timeout persists.
echo ===================================================================
echo.
echo 1- Return to previous menu
choice /c 1 /n
if %errorlevel%==1 goto nettest
:creds
title Achef's Dead Frontier Tools v1.3 - Credits
cls
echo This program is not developed by Dead Frontier or Creaky Corpse.
echo Created by Achef as a small tool to help users with instability problems.
echo.
echo Tool version: 1.3
echo Last updated: 2021-07-10
echo.
echo Contact
echo Discord: Achef#1507
echo Or through the game through forum post.
echo.
echo.
echo DISCLAIMER
echo If you've obtained this from a source outside Dead Frontier Forums
echo do not trust it, I take no responsibility for damages caused for
echo not using official sources.
timeout /t 5 /nobreak >nul
echo Returning to Main menu.
timeout /t 2 /nobreak >nul
goto mmenu
pause
exit
:texit
cls
echo Thank you for using this tool, happy hunting!
timeout /t 2 /nobreak >nul
exit

pause
exit