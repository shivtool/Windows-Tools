powershell -Command "$url='https://raw.githubusercontent.com/shivtool/Windows-Tools/refs/heads/main/UC%20with%20Cleaner.bat'; (New-Object Net.WebClient).DownloadFile($url, $file); Start-Process $file -Verb RunAs"

link for CMD window to direct run this tool
