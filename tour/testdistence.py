# coding:utf8
# __author__ = 'zsdostar'
# __date__ = '2017/8/17 21:42'
# __sys__ = 'Windows 10'
import re
from urllib2 import urlopen

key = "09eac6b93c89747b5e1571bfd1e4dc70"
x1 = "116.481028"
y1 = "39.989643"
x2 = "116.434446"
y2 = "39.90816"
url = "http://restapi.amap.com/v3/direction/walking?origin=" + x1 + "," + y1 + "&destination=" + x2 + "," + y2 + "&key=" + key + "&output=xml"
text = urlopen(url).read()
dist = re.search('<distance>([0-9]+)</distance>', text).group(1)
print type(dist)