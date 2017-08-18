# coding:utf8
# __author__ = 'zsdostar'
# __date__ = '2017/8/18 20:53'
# __sys__ = 'Windows 10'
import MySQLdb
import re
import urllib2
import urllib
from urllib2 import urlopen
from pypinyin import lazy_pinyin

conn = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='klxsxzsdf1',
    db='quickly_page',
    charset='utf8',  # 不加这一行，中文变问号
)
cur = conn.cursor()
for cityid in range(1, 5):
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
        print urlopen(url).read()
    except Exception as e:
        print '--', e, '--'

cur.close()
conn.commit()
conn.close()
