import urllib2

json = ''

with open('/tmp/svrinfo.txt', 'r') as f :
    lines = f.readlines()
    for line in lines :
        json = json + line.replace('\n', ' ')
    print(json)

data = json
request = urllib2.Request('http://localhost:8080/ords/aws/aws/json', data, {'Content-Type': 'application/json'})
response = urllib2.urlopen(request)

# print(response.read())

