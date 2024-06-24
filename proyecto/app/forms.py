from dataclasses import fields 
from django.forms import ModelForm
from app.models import *

class CategoriaForm(ModelForm):
    class Meta:
        model = Categoria
        fields = '__all__'