from django.shortcuts import render

# Create your views here.

def home(request):
    return render(request, "base.html")

def carte(request):
    return render(request, "carte.html")