from dataclasses import fields 
from django.forms import *
from app.models import *
from dataclasses import fields
from django.forms import ModelForm
from django.core.exceptions import ValidationError
from django import forms
from django.forms import *
from app.models import *
from django import forms
from django.contrib.auth.models import User
from django.forms import ModelForm, TextInput, Select, NumberInput, EmailInput, PasswordInput
from app.models import Administrador
from app.models import Empleado

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
class AdministradorForm(ModelForm):
    username = forms.CharField(
        label="Nombre de usuario",
        max_length=150,
        widget=TextInput(attrs={"placeholder": "Nombre de usuario"})
    )
    email = forms.EmailField(
        label="Email",
        max_length=150,
        widget=EmailInput(attrs={"placeholder": "Correo electrónico"})
    )
    password = forms.CharField(
        label="Contraseña",
        widget=PasswordInput(attrs={"placeholder": "Contraseña"}),
        required=False  
    )
    conf_password = forms.CharField(
        label="Confirmar contraseña",
        widget=PasswordInput(attrs={"placeholder": "Confirmar contraseña"}),
        required=False 
    )

    def _init_(self, *args, **kwargs):
        super()._init_(*args, **kwargs)
        if self.instance and self.instance.pk:
            self.fields['username'].initial = self.instance.user.username
            self.fields['email'].initial = self.instance.user.email
        self.fields["username"].widget.attrs["autofocus"] = True

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data.get('username')
        email = cleaned_data.get('email')
        password1 = cleaned_data.get("password")
        password2 = cleaned_data.get("conf_password")
    
        errors = {}

        if User.objects.filter(username=username).exclude(pk=self.instance.user.pk if self.instance and self.instance.pk else None).exists():
            errors['username'] = "Este nombre de usuario ya está en uso.  "
        
        if User.objects.filter(email=email).exclude(pk=self.instance.user.pk if self.instance and self.instance.pk else None).exists():
            errors['email'] = "Este correo electrónico ya está en uso."
        
        if password1 and password2 and password1 != password2:
            errors['password'] = "Las contraseñas no coinciden."
    
        if errors:
            raise ValidationError(errors)
    
        return cleaned_data

    def save(self, commit=True):
        cleaned_data = self.cleaned_data
        username = cleaned_data.get('username')
        email = cleaned_data.get('email')
        password = cleaned_data.get('password')

        if self.instance.pk:
            user = self.instance.user
            if username and user.username != username:
                user.username = username
            if email and user.email != email:
                user.email = email
            if password:
                user.set_password(password)
            user.save()
        else:
            user = User.objects.create_user(
                username=username,
                email=email,
                password=password
            )
        
        administrador = super().save(commit=False)
        administrador.user = user
        if commit:
            administrador.save()
        return administrador

    class Meta:
        model = Administrador
        fields = ["username", "email", "nombre", "tipo_documento", "numero_documento", "telefono", "password", "conf_password"]
        widgets = {
            "nombre": TextInput(attrs={"placeholder": "Nombre del administrador"}),
            "tipo_documento": Select(attrs={"placeholder": "Tipo de documento"}),
            "numero_documento": NumberInput(attrs={"min": 8, "placeholder": "Número de documento"}),
            "telefono": NumberInput(attrs={"min": 1, "placeholder": "Teléfono"}),
            "password": PasswordInput(attrs={"min": 1, "placeholder": "Contraseña"}),
            "conf_password": PasswordInput(attrs={"min": 1, "placeholder": "Confirme su contraseña"})
        }