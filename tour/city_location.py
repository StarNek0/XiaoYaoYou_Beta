# coding:utf8
# __author__ = 'zsdostar'
# __date__ = '2017/8/17 18:36'
# __sys__ = 'Windows 10'
import re
import MySQLdb
from urllib2 import urlopen, unquote

__doc__ = "这是一个取城市经纬度的模块，调用高德地理编码WebAPI，从数据库取城市名到API查询，获得JSON数据。" \
          "通过正则取出JSON中的location数据，也就是经纬度，存入数据库。" \
          "re在手，什么数据都能干***一炮 :) "

conn = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='klxsxzsdf1',
    db='quickly_page1',
    charset='utf8',  # 不加这一行，中文变问号
)
cur = conn.cursor()

for cityid in xrange(1, 392):
    cur.execute("SELECT name FROM tour_city WHERE id=%d;" % cityid)
    city = "".join(cur.fetchone())

    cur.execute("SELECT pointx, pointy from tour_city where id=%d;" % cityid)
    is_x, is_y = list(cur.fetchall())[0]
    if is_x and is_y:
        continue  # 如果坐标存在则跳过

    # city = city.replace(' ', '')  被垃圾格式的数据统治的绝望
    # cur.execute('UPDATE tour_city set name="%s" WHERE id=%d' % (city, cityid))

    key = "09eac6b93c89747b5e1571bfd1e4dc70"  # API的个人key
    url = "http://restapi.amap.com/v3/geocode/geo?key=" + key + "&address=" + city + "&city=" + city + "&output=XML"
    # print url

    try:
        text = urlopen(str(url)).read()

        ptx = float(re.search('<location>([0-9]+.[0-9]+),([0-9]+.[0-9]+)', text).group(1))
        pty = float(re.search('<location>([0-9]+.[0-9]+),([0-9]+.[0-9]+)', text).group(2))

        cur.execute("update tour_city set pointx=%f, pointy=%f where id=%d;" % (ptx, pty, cityid))
    except Exception as e:
        print e
    finally:
        print cityid

cur.close()
conn.commit()
conn.close()
