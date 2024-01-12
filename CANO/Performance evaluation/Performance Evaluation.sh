```shell```
9E:8F:E0:A4:37:F0 
#Use the head to see the comumn breakdown of the files
cat Kismet-20210125-23-13-58-1.csv | egrep 9E:8F:E0:A4:37:F0

#this allows me to see the specific MAC with its traffic
egrep "*Fios" Kismet-20210125-23-13-58-1.csv | awk -F "," '{print $1, $2}'| sort -u | uniq -w +4
egrep "Pooki" Kismet-20210125-23-13-58-1.csv | sort | uniq -w 17

Pulling out location data from Sand123
egrep Sand123 Kismet-20210125-23-13-58-1.csv | awk -F "," '{print "Current_Latitude  " $7,"Current_Longtitude" $8}' Kismet-20210125-23-13-58-1.csv > ./Performance_Evaluation/Sand123_Location_Data.txt

#Using egrip to pull out the specific fields, based on a string that begins with a certain string
egrep "*Fios" Kismet-20210125-23-13-58-1.csv | awk -F "," '{print $2}'| sort -u | wc -l

#see all the uniq SSIDs and Mac Addresses
egrep "*Fios" Kismet-20210125-23-13-58-1.csv | awk -F "," '{print $1, $2}'| sort -u

#using awk t

#################
1. plan Survey
2. Conduct survey
3. Filter Information
4. Locate People






