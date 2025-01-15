from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("historique", views.historique, name="historique"),
    path("map", views.map, name="map")
    path("historique", views.historique, name="historique"),
]