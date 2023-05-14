	
    
# Linux     
## IP Match
```Shell    
grep --p '^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}$' #ABSOLUTE MATCH
grep --p '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$' #LOOSE MATCH
```
## MAC Match
```Shell
grep --p '^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$' #ABSOLUTE MAC
```
# Windows
[Powershell](/Windows/Powershell)
## IP Match
```Powershell
Get-ChildItem 
```
## MAC Match
```Powershell
Get-ChildItem 
```