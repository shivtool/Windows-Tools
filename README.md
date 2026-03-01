powershell -Command "$url='https://raw.githubusercontent.com/8090155304/Windows-Tools/refs/heads/main/UC%20with%20Cleaner.bat'; $file='%TEMP%\shivtool.bat'; (New-Object Net.WebClient).DownloadFile($url, $file); Start-Process $file -Verb RunAs"

link for CMD window to direct run this tool
