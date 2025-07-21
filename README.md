# Simple System Health Checker 

A PowerShell script that provides a quick overview of your system’s health, including CPU usage, memory status, disk space, and network adapter status.

The script pulls live data from built-in PowerShell commands like Get-CimInstance and Get-PSDrive, processes the output, and displays it cleanly in the terminal. It also gives the option to export the results to a timestamped .txt file, which is useful for logging or audits.



---

## 🔧 Features

- ✅ Displays CPU usage percentage  
- ✅ Shows free and total physical memory  
- ✅ Reports disk space (free and total) for all local drives  
- ✅ Lists network adapter names and statuses (Up/Down)  
- ✅ Optionally saves a timestamped report to a `.txt` file  

---

## ▶️ How to Use

1. **Download the Script**
   - Click the green **Code** button on this GitHub page.
   - Select **Download ZIP**.
   - Extract the ZIP to any folder (e.g., your `Documents`).

2. **Move the Script to a Clean Folder**
   - Create a new folder like this:
     ```
     C:\Users\YourUsername\Documents\Simple System Health Checker
     ```
   - Move `SystemHealthCheck.ps1` into that folder.

3. **Open PowerShell**
   - Press the **Windows key**, type `PowerShell`, and hit **Enter**.

4. **Navigate to the Script Folder**

   Replace `Chandler` with your Windows username if different:

   ```powershell
   cd "C:\Users\Chandler\Documents\Simple System Health Checker"
   ```
5. **Run the Script**
```powershell
   .\SystemHealthCheck.ps1
```
6. Save the Report (Optional)

   When prompted, type **Y** to save the report as a .txt file

   Or type **N** to display the results in the PowerShell window only

## 📝 Example Output
   
System Health Report - 07/20/2025 23:56:04
-------------------------------------
CPU Usage: 2.68 %
Memory: 5466.8 MB free / 15711.49 MB total

Disk Usage:
Drive C:: 423.39 GB free / 476.2 GB total

Network Adapters:
Adapter Bluetooth Network Connection: Status Disconnected
Adapter Wi-Fi: Status Up


## ⚠️ Troubleshooting
**❌ Script is Not Digitally Signed**

If you see this error:

```
.\SystemHealthCheck.ps1 cannot be loaded because it is not digitally signed.
```
🔧 Run this to allow the script temporarily:

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
Then re-run the script:

```
.\SystemHealthCheck.ps1
```

 This change only affects the current PowerShell session and does not permanently reduce system security.
