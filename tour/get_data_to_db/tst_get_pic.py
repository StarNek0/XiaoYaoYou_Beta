# coding:utf8
# __author__ = 'zsdostar'
# __date__ = '2017/8/18 22:13'
# __sys__ = 'Windows 10'
import urllib
import urllib2
import re
from lxml import etree

__doc__ = "测试代码"

# 存储图片示例
img_url = 'http://gss0.baidu.com/6b1IcTe9R1gBo1vgoIiO_jowehsv/maps/services/thumbnails?width=525&height=295&quality=100&align=middle,middle&src=http://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/lvpics/pic/item/faedab64034f78f0dd0e635279310a55b3191c0d.jpg'
urllib.urlretrieve(img_url, r'D:\\beijing.jpg')

url = 'https://lvyou.baidu.com/daqing/'
html = urllib2.urlopen(url).read()

# 提取图片url
imgurl = re.search('//gss0.baidu.com/.+.jpg"', html).group()
print imgurl

# xpath提取文字内容
html = html.decode('utf8')
html = etree.HTML(html)
text = html.xpath('//p[@class="main-desc-p"]/text()')
text.remove('\n')
text[0].replace('\n', '')
print text[0][1:len(text[0]) - 1]
