from django.shortcuts import render
from django.http import HttpResponse,JsonResponse
from django.template import Template, Context
from app.models import *

def vista1(request):
    nombre={
        "nombre":"El rincon de los angeles",
        "categorias": Categoria.objects.all()
    }
    return render(request,"body.html", nombre)

def vista2(request):
    
    nombre={
        "nombre":"El rincon de los angeles",
        "categorias": Categoria.objects.all()
    }
    return render(request,"listar.html", nombre)