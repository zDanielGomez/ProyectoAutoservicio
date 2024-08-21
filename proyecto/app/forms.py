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
        }

class ClienteForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['cc_cliente'].widget.attrs['autofocus'] = True
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
        }
        
class VentaForm(ModelForm):
    
    class Meta:
        model = Venta
        fields = '__all__'
        widgets = {
            'cliente': Select(attrs={
                'class': 'form-control select2',
                'style': 'width: 100%'
            }),
            'empleado': Select(attrs={
                'class': 'form-control select2',
                'style': 'width: 100%'
            }),
            'fecha_venta': DateInput(
                format='%Y-%m-%d',
                attrs={
                    'value': datetime.now().strftime('%Y-%m-%d'),
                    'autocomplete': 'off',
                    'class': 'form-control datetimepicker-input',
                    'id': 'date_joined',
                    'data-target': '#date_joined',
                    'data-toggle': 'datetimepicker',
                    'readonly': True,
                }
            ),
            'total_venta': TextInput(attrs={
                'readonly': True,
                'class': 'form-control',
            }),
            # 'fecha_venta': TimeInput(attrs={
            #     'readonly': True,
            #     'class': 'form-control',
            # })
        }


class ProductoForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True
    class Meta:
        model = Producto
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

class CompraForm(ModelForm):
    
    class Meta:
        model = Compra
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
        
class ProveedorForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombres'].widget.attrs['autofocus'] = True
    class Meta:
        model = Proveedor
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
        

class MarcaForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True
    class Meta:
        model = Marca
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

class PresentacionForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['descripcion'].widget.attrs['autofocus'] = True
    class Meta:
        model = Presentacion
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