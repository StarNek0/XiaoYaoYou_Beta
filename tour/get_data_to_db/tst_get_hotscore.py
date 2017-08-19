# coding:utf8
# __author__ = 'zsdostar'
# __date__ = '2017/8/19 10:35'
# __sys__ = 'Windows 10'

import urllib2
import re
import MySQLdb
from pypinyin import lazy_pinyin

__doc__ = "测试代码"

conn = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='klxsxzsdf1',
    db='quickly_page',
    charset='utf8',  # 不加这一行，中文变问号
)

for cityid in range(23, 24):
    cur1 = conn.cursor()
    cur1.execute('select hot,image from tour_city where id=%d;' % cityid)
    a, b = cur1.fetchone()
    print type(a), b
    cur1.close()

conn.commit()
conn.close()
