# Name		: PCINFO-Example.psl
# Script URL	:
# Description	: Gets pc information from this machine.
# Version	: 0.0.1
# Author	: Ferhat Kool
# Author URL	: https://www.github.com/ferhatkool

CLS #Clears your screen
$date = Get-Date
$bios = Get-WmiObject Win32_BIOS
Write-Host “--------------------PC INFO--------------------"
Write-Host "Current Date & Time  : $date" 
Write-Host "Computername         : $env:COMPUTERNAME"
Write-Host "Username             : $env:USERNAME"
Write-Host "OS Version           : $env:os"
Write-Host "BIOS Version         :"$bios.BIOSVersion
Write-Host ""
Write-Host “--------------------DISK 0--------------------"
$disk = Get-Disk -Number 0
Write-Host "Disk Type           :"$disk.FriendlyName
Write-Host "Disk Size in bytes  :"$disk.AllocatedSize
Write-Host "Health Status       :"$disk.HealthStatus
Write-Host ""
Write-Host “--------------------DISK 1--------------------"
$disk = Get-Disk -Number 1
Write-Host "Disk Type           :"$disk.FriendlyName
Write-Host "Disk Size in bytes  :"$disk.AllocatedSize
Write-Host "Health Status       :"$disk.HealthStatus
Write-Host ""
Write-Host “--------------------WIFI ADAPTER--------------------"
$wifi = Get-NetAdapter | where-Object {$_.Name -eq "Wi-Fi"}
Write-Host "Name Adapter         :" $wifi.DriverDescription
Write-Host "Driver Date          :" $wifi.DriverDate
Write-Host "MAC Adapter          :" $wifi.MacAddress
Write-Host "Linkspeed            :" $wifi.LinkSpeed
Write-Host "Status Adapter       :" $wifi.Status
Write-Host ""
Write-Host “--------------------GPU 1------------------"
$gpu1 = Get-WmiObject Win32_VideoController | Select-Object -First 1
Write-Host "Graphic Card         :" $gpu1.Description
Write-Host "VRAM                 :" $gpu1.VideoMemoryType "GB"
Write-Host "Driver Version       :" $gpu1.DriverVersion
Write-Host ""
Write-Host “--------------------GPU 2------------------"
$gpu2 = Get-WmiObject Win32_VideoController | Select-Object -Skip 1
Write-Host "Graphic Card         :" $gpu2.Description
Write-Host "VRAM                 :" $gpu2.VideoMemoryType "GB"
Write-Host "Driver Version       :" $gpu2.DriverVersion
Write-Host ""
Write-Host “--------------------CPU------------------"
$cpu = Get-WmiObject Win32_Processor
Write-Host "CPU Name             :" $cpu.Name
Write-Host "Amount of Cores      :" $cpu.NumberOfCores "Cores"
Write-Host "Current Clockspeed   :" $cpu.CurrentClockSpeed "MHz"
Write-Host "Current Vultage      :" $cpu.CurrentVoltage "Watt"
