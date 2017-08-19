# coding:utf8
# __author__ = 'zsdostar'
# __date__ = '2017/8/19 9:09'
# __sys__ = 'Windows 10'

import urllib2
import re
import MySQLdb
from pypinyin import lazy_pinyin

__doc__ = "这是一个爬取与存储城市热门指数的模块，数据来源为百度旅游的城市旅游评价次数"

conn = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='klxsxzsdf1',
    db='quickly_page',
    charset='utf8',  # 不加这一行，中文变问号
)

for cityid in range(1, 392):

    cur1 = conn.cursor()
    cur1.execute('select hot, image from tour_city where id=%d;' % cityid)
    a, b = cur1.fetchone()
    if a != 0L or b == u'':  # 如果该城市在百度旅游查询不到或者是热门指数已经存在数据库则跳过
        print '--Jump cityid=%d hot score--' % cityid
        cur1.close()
        continue
    cur1.close()

    cur = conn.cursor()
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
        score = re.search('([0-9]+)条点评', html).group(1)

        cur.execute('update tour_city set hot=%d where id=%d;' % (int(score), cityid))

    except Exception as e:
        print e
    finally:
        cur.close()
        conn.commit()

conn.close()
