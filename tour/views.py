from django.shortcuts import render
from django.shortcuts import render
from django.views.generic import View

from .models import City
# Create your views here.


class TourWayView(View):
    def get(self, request, city_a, city_b):
        city_A = City.objects.get(id=int(city_a))
        city_B = City.objects.get(id=int(city_b))
        return render(request, 'index.html', {
            'city_A': city_A,
            'city_B': city_B,
        })


class CityAroundView(View):
    def get(self, request, city_a):
        city_A = City.objects.get(id=int(city_a))
        around_citys = City.objects.filter(province_id=city_A.province_id)
        return render(request, 'city_around.html', {
            'city_A': city_A,
            'around_citys': around_citys,
        })
