
from Adafruit_BME280 import *
import time
import datetime
import urllib2
 
station_id = "010"
server_ip="http://172.16.110.45:2101"

def read_all(sensor):
    c_time = str(int(time.mktime(datetime.datetime.now().timetuple())))
    degrees = str(sensor.read_temperature())
    pascals = sensor.read_pressure()
    hectopascals = str(pascals / 100)
    humidity = str(sensor.read_humidity())
    return {'time':c_time,'temp':degrees,'pressure':hectopascals,'humidity':humidity}

def send_all(data={'time':0,'temp':0,'pressure':0,'humidity':0}):
    url=server_ip+"/Weather/commit/"+station_id+"/"+data['time']+"/"+data['temp']+"/"+data['humidity']+"/"+data['pressure']
    print url
    content=urllib2.urlopen(url).read()
    print content

sensor = BME280(mode=BME280_OSAMPLE_8)
while True:
    send_all(read_all(sensor))
    time.sleep(600)