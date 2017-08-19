# coding: utf8
import re
from urllib2 import urlopen
from django.shortcuts import render
from django.views.generic import View

from .models import City, Province


# Create your views here.


class TourWayView(View):
    def get(self, request, city_a, city_b):
        city_A = City.objects.get(id=int(city_a))
        city_B = City.objects.get(id=int(city_b))
        return render(request, 'index.html', {
            'city_A': city_A,
            'city_B': city_B,
        })

from math import radians, cos, sin, asin, sqrt


def haversine(lon1, lat1, lon2, lat2): # 经度1，纬度1，经度2，纬度2 （十进制度数）
    """
    Calculate the great circle distance between two points
    on the earth (specified in decimal degrees)
    """
    # 将十进制度数转化为弧度
    lon1, lat1, lon2, lat2 = map(radians, [lon1, lat1, lon2, lat2])

    # haversine公式
    dlon = lon2 - lon1
    dlat = lat2 - lat1
    a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
    c = 2 * asin(sqrt(a))
    r = 6371 # 地球平均半径，单位为公里
    return c * r * 1000


class CityAroundView(View):
    def get(self, request, city_a):
        city_A = City.objects.get(id=int(city_a))
        around_citys = City.objects.filter(province_id=city_A.province_id)
        province = Province.objects.get(id=city_A.province_id)  # 获取该城市所在的省份
        for i in around_citys:
            i.distance = round(haversine(city_A.pointx, city_A.pointy, i.pointx, i.pointy)/1000.0, 1)
        return render(request, 'city_around.html', {
            'city_A': city_A,
            'around_citys': around_citys,
            'province': province
        })
        # if request.META.has_key('HTTP_X_FORWARDED_FOR'):  # 返回访问者当前的ip，由于暂时是开发模式，无法验证是否生效
        #     ip = request.META['HTTP_X_FORWARDED_FOR']
        # else:
        #     ip = request.META['REMOTE_ADDR']

        # for around_city in around_citys:
        #     key = "09eac6b93c89747b5e1571bfd1e4dc70"
        #     x1 = str(city_A.pointx)
        #     y1 = str(city_A.pointy)
        #     x2 = str(around_city.pointx)
        #     y2 = str(around_city.pointy)
        #     url = "http://restapi.amap.com/v3/direction/walking?origin=" + x1 + "," + y1 + "&destination=" + x2 + "," + y2 + "&key=" + key + "&output=xml"
        #     text = urlopen(url).read()
        #     dist = re.search('<distance>([0-9]+)</distance>', text)
        #     if dist:
        #         around_city.distance = float(dist.group(1).format(1.0))/1000.0

        # for around_city in around_citys:
        #     name1 = city_A.name
        #     name2 = around_city.name
        #     url = "https://www.baidu.com/s?wd=" + name1 + "到" + name2 + "多远"
        #     res = re.search('([0-9.]+)[公里|千米]', urlopen(url).read())
        #     if res:
        #         around_city.distance = float(res.group(1))