# coding:utf8
# __author__ = 'zsdostar'
# __date__ = '2017/8/18 20:53'
# __sys__ = 'Windows 10'
import MySQLdb
import re
import urllib2
import urllib
from lxml import etree
from urllib2 import urlopen
from pypinyin import lazy_pinyin

__doc__ = "这是一个爬取与存储城市描述及其图片的模块"

conn = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='klxsxzsdf1',
    db='quickly_page',
    charset='utf8',  # 不加这一行，中文变问号
)
cur = conn.cursor()
for cityid in range(1, 392):
    cur1 = conn.cursor()
    cur1.execute('select `desc` from tour_city WHERE id=%d;' % cityid)
    if cur1.fetchone():
        cur1.close()
        continue
    cur1.close()  # 以上判断是否需要存数据

    cur.execute('SELECT name FROM tour_city WHERE id=%d;' % cityid)
    cityname = "".join(cur.fetchone())  # 数据库数据转换为字符串

    if len(cityname) > 5:
        cityname = cityname[:2]  # 自治州、特别行政区全只留简写
    else:
        cityname = cityname[:len(cityname) - 1]  # xx市去掉市

    cityname = str(''.join(lazy_pinyin(cityname)))  # 汉字转拼音
    print cityname
    url = 'https://lvyou.baidu.com/' + cityname
    try:
        html = urllib2.urlopen(url).read()
        imgurl = re.search('//gss0.baidu.com/.+.jpg', html).group(0)  # 分析出图片的url
        imgurl = 'http:' + imgurl
        urllib.urlretrieve(imgurl,
                           r'D:\Python_projects\djangoProject\Quickly_Page\media\city\%s.jpg' % cityname)  # 存储图片
        cur.execute(
            'update tour_city set image="%s" where id=%d;' % ('city/' + cityname + '.jpg', cityid))  # 数据库中存储图片位置

        # 以下是分析并存储城市描述的代码
        html = html.decode('utf8')
        html = etree.HTML(html)
        text = html.xpath('//p[@class="main-desc-p"]/text()')
        text.remove('\n')
        text[0].replace(r'\\n', '')
        description = text[0][1:len(text[0]) - 1]
        # print description

        cur.execute('update tour_city set `desc`="%s" WHERE id=%d;' % (description, cityid))
    except Exception as e:
        print e

cur.close()
conn.commit()
conn.close()
