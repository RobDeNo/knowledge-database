[Linux Subsystem for Windows](https://windowsloop.com/install-linux-subsystem-windows-10/#:~:text=Control%20Panel%20Options%20to%20Install%20Linux%20Subsystem%201,necessary%20files%20and%20installs%20Linux%20subsystem.%20More%20items)
# Enable / disable Via Gui
1. Open start menu search " Turn Windows Features on or off"
2. Scroll down to "Windows Subsystem for Linux",  check box.
3. Windows will update, now restart your system
4. Go to MS Store and find the Linux OS and install it.
# Enable via Powershell
1. Open powershell as administrator and execute the below command
```Powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```
2. Restart computer
3. 3. Search MS Store for linux and install