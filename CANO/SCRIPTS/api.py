import requests
import json

url = "http://kismet:kismet@0.0.0.0:2501/logging/active.prettyjson"
params = {"kismet.log.type_driver"}
payload = "grep kismet"
headers = {}
response = requests.request("GET", url, headers=headers, data=payload)
print(response.text)