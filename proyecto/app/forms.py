from dataclasses import fields 
from django.forms import *
from app.models import *

class CategoriaForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True
    class Meta:
        model = Categoria
        fields = '__all__'
        widgets = {
            'nombre' : TextInput(
                attrs= {
                    'placeholder' : 'Ingrese un nombre',
                }
            ),
            'descripcion' : Textarea(
                attrs= {
                    'placeholder' : 'Ingrese una descripcion',
                    'rows' : 3,
                    'cols' : 3
                }
            ),
            
            
        }
        
class EmpleadoForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombres'].widget.attrs['autofocus'] = True
    class Meta:
        model = Empleado
        fields = '__all__'
        widgets = {
            'nombres' : TextInput(
                attrs= {
                    'placeholder' : 'Ingrese los nombres',
                }
            ),
            'apellidos' : TextInput(
                attrs= {
                    'placeholder' : 'Ingrese los apellidos',
                }
            ),
            'telefono' : TextInput(
                attrs= {
                    'placeholder' : 'Ingrese el telefono',
                }
            ),     
        }

class ClienteForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombres'].widget.attrs['autofocus'] = True
    class Meta:
        model = Cliente
        fields = '__all__'
        widgets = {
            'nombres' : TextInput(
                attrs= {
                    'placeholder' : 'Ingrese los nombres',
                }
            ),
            'apellidos' : TextInput(
                attrs= {
                    'placeholder' : 'Ingrese los apellidos',
                }
            ),
            'telefono' : TextInput(
                attrs= {
                    'placeholder' : 'Ingrese el telefono',
                }
            ),     
        }