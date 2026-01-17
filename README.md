C-Drive Space Monitor
Description
This is a PowerShell script that monitors the storage health of your system's main drive (C:). It calculates the total, used, and free space and provides a visual warning if the disk is getting full.

How It Works
The script follows a clear logical path:

Data Collection: It uses Get-CimInstance to retrieve hardware data from the Win32_LogicalDisk class.

Filtering: It specifically targets the C: drive using Where-Object.

Data Conversion: Since Windows stores size in bytes, the script divides the values by 1GB to make them human-readable.

Logic & Comparison: It calculates the percentage of space used. If the usage is 75% or higher, it triggers a warning.

How to Run
Open your GitHub repository and copy the code from DiskCheck.ps1.

Right-click the Start button and open PowerShell.

Paste the code into the window and press Enter.

Key Features
Precision: Uses [math]::Round to limit decimals to 2 places for a cleaner look.

Visual Feedback: Uses -ForegroundColor to display status messages in Green (Healthy) or Red (Low Space).

Efficiency: Saves disk data into a single variable to reduce system queries.

Future Goals
Modify the script to scan all connected drives (D:, E:, etc.) automatically.

Export the results to a CSV file for long-term tracking.

Automate the script to run every morning using Windows Task Scheduler.
