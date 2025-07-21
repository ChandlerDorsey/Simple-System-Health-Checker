# SystemHealthCheck.ps1
# Simple System Health Checker script
# Gathers CPU, memory, disk, and network status info and optionally saves report to a file.

# Get CPU Usage
$cpu = Get-Counter '\Processor(_Total)\% Processor Time'
$cpuUsage = [math]::Round($cpu.CounterSamples.CookedValue, 2)

# Get Memory Info
$mem = Get-CimInstance Win32_OperatingSystem
$freeMemMB = [math]::Round($mem.FreePhysicalMemory / 1024, 2)
$totalMemMB = [math]::Round($mem.TotalVisibleMemorySize / 1024, 2)

# Get Disk Info
$disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $freeGB = [math]::Round($_.FreeSpace / 1GB, 2)
    $totalGB = [math]::Round($_.Size / 1GB, 2)
    "Drive $($_.DeviceID): $freeGB GB free / $totalGB GB total"
}

# Get Network Adapter Status
$netAdapters = Get-NetAdapter | ForEach-Object {
    "Adapter $($_.Name): Status $($_.Status)"
}

# Build Report
$report = @()
$report += "System Health Report - $(Get-Date)"
$report += "-------------------------------------"
$report += "CPU Usage: $cpuUsage %"
$report += "Memory: $freeMemMB MB free / $totalMemMB MB total"
$report += ""
$report += "Disk Usage:"
$report += $disks
$report += ""
$report += "Network Adapters:"
$report += $netAdapters
$report += "-------------------------------------"

# Output to Console
$report | ForEach-Object { Write-Output $_ }

# Ask user if they want to save report
$saveFile = Read-Host "Save report to file? (Y/N)"
if ($saveFile -match '^[Yy]') {
    $fileName = "SystemHealthReport_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
    $report | Out-File $fileName
    Write-Output "Report saved as $fileName"
}
