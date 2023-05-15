Alternate Data Stream
NTF file system contains files with attributes
```Powershell
$DATA
" .\ " means the present directory you are in

#This will get the content in a file
get-content .\reminder.txt

#Set content to the string
set-content .\reminder.txt -Value "be you, do what you do" 

#use certutility to hash the file
certutil -hashfile .\reminder2.txt MD5

#set content to the hidden stream called .secret
set-content .\reminder2.txt -Value "but don't tread on me" -stream secret.info
get-content '.\The Fortune Cookie' -Stream none
```
# Finding hidden data stream info
```powershell
get-item .\reminder2.txt -Stream hidden 

#script to get-object on each directory and filter out stream names, get content printm data stream,file name
get-ChildItem -recurse | % { get-item $_.FullName -stream * } | where stream -ne ':$Data' | select filename,stream,@{'name'='identifier';"e"={"$($_.filename):$($_.stream)"}}
#for loop to get hidden data
for
	Get-childitem 'C:\' -rcd 
-->print it out
		Where-object {$_.ADS; $_.Filename; $_-PSChildname}
			get-content $FileName -Stream $Stream Variable
```
# Search for a file
```powershell
Get-ChildItem -recurse | Where-Object {$_.Name -match 'readme'} | Get-Content
```
# force listing of directory 
```powershell
gci -force
Get-content .\saucey	
```
# search drive for file by name
```powershell
Get-ChildItem -recurse -force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match 'site'} | get-content
Get-ChildItem -recurse -force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match 'site'; $_.Name -match 'phish' } | get-content
```
# ACL of file
```powershell
(Get-Acl .\hosts)).access # this will format the ifnormation further
```
# No clude
```powershell
get-service | select -first 5 | format-table servicename,displayname,@{L='cmi name' ;E={$name=$.servicename; (get-ciminstance win32_service | where-object {$_.name -eq $name}).name}},@{L='cim description' ;E={$name=$_.servicename; (get-ciminstance win32_service | whereobject {$_.name -eq $name}).description}}
$processor=(get-ciminstance win32_processor)

```
