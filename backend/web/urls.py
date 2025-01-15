from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("carte", views.carte, name="carte"),
    path("map", views.map, name="map"),
]