url = 'http://kismet:kismet@0.0.0.0:2501/logging/active.json'
uid = kismet.logfile.uuid(url)
for release in releases:
    print(uid)