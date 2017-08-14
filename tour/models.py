# coding:utf8
from __future__ import unicode_literals
from django.db import models

# Create your models here.


class City(models.Model):
    city_id = models.IntegerField(verbose_name='城市号')
    name = models.CharField(max_length=10, verbose_name='城市名')
    province_id = models.IntegerField(default=0, verbose_name='省份号')
    pointx = models.FloatField(verbose_name='经度')
    pointy = models.FloatField(verbose_name='纬度')
    desc = models.TextField(verbose_name='城市描述', null=True, blank=True)
    image = models.ImageField(upload_to='city/', default='', verbose_name='logo', max_length=100)
    hot = models.IntegerField(default=0, verbose_name='热门指数')

