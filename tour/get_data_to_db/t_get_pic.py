# coding:utf8
# __author__ = 'zsdostar'
# __date__ = '2017/8/18 22:13'
# __sys__ = 'Windows 10'
import urllib
import urllib2
import re

imgurl = 'http://gss0.baidu.com/6b1IcTe9R1gBo1vgoIiO_jowehsv/maps/services/thumbnails?width=525&height=295&quality=100&align=middle,middle&src=http://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/lvpics/pic/item/faedab64034f78f0dd0e635279310a55b3191c0d.jpg'
urllib.urlretrieve(imgurl, r'D:\\beijing.jpg')

url = 'https://lvyou.baidu.com/beijing/'
html = urllib2.urlopen(url).read()
re.search('', html)
