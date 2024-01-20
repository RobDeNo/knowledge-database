install tools
sudo apt install wireguard
sudo apt install git
sudo apt install scrapy
sudo apt install bully
sudo apt install wifite
#scrappy
pip install Scrapy
sudo apt install python3-Scrapy
scrapy startproject wordlist_scrappe
### aircrack-ng
# aircrack-ng.org forum
sudo apt install aircrack-ng
#hashcat
get lists from country agency
##kismet API calling
GET http://kismet:kismet@0.0.0.0:2501/gps/all_gps.prettyjson
  "description.kismet.gps.uuid": "uuid, UUID",
  "kismet.gps.uuid": "17180436-0000-0000-0000-0000F5D11357",
/gps/by-uuid/17180436-0000-0000-0000-0000F5D11357/location.prettyjson
GET http://kismet:kismet@0.0.0.0:2501/gps/by-uuid/17180436-0000-0000-0000-0000F5D11357/location.prettyjson
curl -i -s -k -X $'GET' \
    -H $'Host: 0.0.0.0:2501' -H $'Accept: */*' -H $'X-Requested-With: XMLHttpRequest' -H $'Authorization: Basic a2lzbWV0Omtpc21ldA==' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.216 Safari/537.36' -H $'Referer: http://0.0.0.0:2501/' -H $'Accept-Encoding: gzip, deflate, br' -H $'Accept-Language: en-US,en;q=0.9' -H $'If-Modified-Since: Thu, 18 Jan 2024 16:29:58 GMT' -H $'Connection: close' \
    -b $'KISMET=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXUyJ9.eyJjcmVhdGVkIjoxNzA1NTk1Mzc4LCJleHBpcmVzIjoxNzA1NjgxNzc4LCJpc3MiOiJraXNtZXQiLCJuYW1lIjoid2ViIGxvZ29uIiwicm9sZSI6ImFkbWluIn0.Ob1Th1P6h7Yhs2WksAOKkUMsqOsq8wpYgB9L5vFC8z0' \
    $'http://0.0.0.0:2501/alerts/by-id/286725952/alert.json'

## rsync
rsync --daemon
ps x | grep rsync
#reaver
sudo reaver -i wlx00c0cab46234 -b 74:DA:88:59:96:A9 -c 10 -K -S -vvv | tee output.txt
#wifite
sudo apt install wifite
sudo wifite --wps-only #this will onyl go after wps stuff
#burpsuite used to find where web is pulling data from

#cloning  a repo
git clone https://github.com/t6x/reaver-wps-fork-t6x.git
CTRL + SHIFT + V
sudo apt -y install build-essential libpcap-dev aircrack-ng pixiewps


MAC=$(curl -s https://api.coindesk.com/v1/bpi/currentprice.json | gron | grep EUR.rate_float | cut -d ' ' -f 3 | tr -d ';')
GET http://kismet:kismet@0.0.0.0:2501/datasource/by-uuid/5FE308BD-0000-0000-0000-00C0CAB46234/source.json | gron | grep kismet.datasource.interface

WGET -O- http://kismet:kismet@10.211.55.14:2501/datasource/by-uuid/5E600813-0000-0000-0000-0000945808A4/source.prettyjson | gron
WGET -O- http://kismet:kismet@10.211.55.14:2501/devices/views/all/devices.json | gron | grep kismet.device.base.name
json = {};
  json["kismet.datasource.type_driver"]["description.kismet.datasource.driver.type"]
  json["kismet.datasource.uuid"]

POST -O- http://kismet:kismet@10.211.55.14:2501/auth/apikey/generate.cmd