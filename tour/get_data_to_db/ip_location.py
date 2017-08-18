# coding:utf8
# __author__ = 'zsdostar'
# __date__ = '2017/8/17 20:56'
# __sys__ = 'Windows 10'
import urllib2
import re

__doc__ = "API发送请求，返回访问者的所在城市"


def ip_location():
    key = "09eac6b93c89747b5e1571bfd1e4dc70"
    url = "http://restapi.amap.com/v3/ip?&output=xml&key=" + key
    text = urllib2.urlopen(url).read()

    return re.search("<city>(.*)</city>", text).group(1)


if __name__ == "__main__":
    print ip_location()
