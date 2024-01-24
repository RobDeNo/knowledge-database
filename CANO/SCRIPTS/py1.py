import requests
import json

url = url = "http://kismet:kismet@0.0.0.0:2501/logging/active.prettyjson"
params = {"kismet_device_base_macaddr":"50:d4:f7:6c:88:2f"}

response = requests.get(url, params=params)

# Process the response as needed
print(response.status_code)
print(response.json())