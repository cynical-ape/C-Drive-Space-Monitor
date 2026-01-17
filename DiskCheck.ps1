# Clear the screen
cls

# 1. Get Disk Information for C: Drive
$disk = Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object DeviceID -EQ 'C:'

# 2. Calculate Space in GB (Rounded to 2 decimal places)
$totalspace = [math]::Round($disk.Size / 1GB, 2)
$freespace  = [math]::Round($disk.FreeSpace / 1GB, 2)
$used       = [math]::Round($totalspace - $freespace, 2)

# 3. Calculate Percentage of Used Space
$usedbyper = [math]::Round(($used / $totalspace) * 100, 2)

# 4. Display the Results
Write-Host "--- Disk Space Report ---" -ForegroundColor Cyan
Write-Host "Total space: $totalspace GB"
Write-Host "Free space:  $freespace GB"
Write-Host "Used space:  $used GB"
Write-Host "Used by percentage: $usedbyper %"
Write-Host "-------------------------"

# 5. Check if used space is greater than 75%
if ($usedbyper -ge 75) {
    Write-Host "Warning: You have low space!" -ForegroundColor Red
}
else {
    Write-Host "Status: You have plenty of space." -ForegroundColor Green
}