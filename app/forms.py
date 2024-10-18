from dataclasses import fields 
from django.forms import *
from app.models import *
from dataclasses import fields
from django.forms import ModelForm
from django.core.exceptions import ValidationError
from django.core.validators import MinLengthValidator, RegexValidator, MinValueValidator
from django import forms
from django.forms import *
from app.models import *
from django import forms
from django.contrib.auth.models import User
from django.forms import ModelForm, TextInput, Select, NumberInput, EmailInput, PasswordInput

class CategoriaForm(forms.ModelForm):
    nombre = forms.CharField(
        label="Nombre",
        max_length=100,  # Ajusta el tamaño máximo si es necesario
        widget=forms.TextInput(attrs={
            'placeholder': 'Ingrese un nombre',
            'autofocus': True
        }),
        validators=[
            RegexValidator(
                regex=r'^[A-Za-z\s]+$',  # Solo letras y espacios permitidos
                message='El nombre solo puede contener letras y espacios.'
            )
        ]
    )

    class Meta:
        model = Categoria
        fields = '__all__'
        widgets = {
            'nombre': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese un nombre',
                }
            ),
        }
        
class EmpleadoForm(ModelForm):
    username = forms.CharField(
        label="Nombre de usuario",
        max_length=150,
        widget=TextInput(attrs={"placeholder": "Nombre de usuario"}),
        error_messages={"required": "Este campo es obligatorio."},
        validators=[
            RegexValidator(
                regex=r'^[A-Za-z\s]+$',  # Solo letras y espacios permitidos
                message='El nombre de usuario solo puede contener letras y espacios.'
            )
        ]
    )
    nombre = forms.CharField(
        label="Nombre de Empleado",
        max_length=150,
        widget=TextInput(attrs={"placeholder": "Nombre de empleado"}),
        error_messages={"required": "Este campo es obligatorio."},
        validators=[
            RegexValidator(
                regex=r'^[A-Za-z\s]+$',  # Solo letras y espacios permitidos
                message='El nombre del empleado solo puede contener letras y espacios.'
            )
        ]
    )
    email = forms.EmailField(
        label="Email",
        max_length=150,
        widget=EmailInput(attrs={"placeholder": "Correo electrónico"}),
        error_messages={
            "required": "Este campo es obligatorio.",
            "invalid": "Ingrese un correo electrónico válido."
        }
    )
    telefono = forms.CharField(
        label="Teléfono",
        widget=TextInput(attrs={"placeholder": "Ingrese su teléfono"}),
        error_messages={"required": "Este campo es obligatorio."},
        validators=[
            RegexValidator(
                regex=r'^\d{10}$',  # Solo 10 dígitos
                message='El teléfono debe tener exactamente 10 dígitos.'
            )
        ],
        
    )

    password = forms.CharField(
        label="Contraseña",
        widget=PasswordInput(attrs={"placeholder": "Contraseña"}),
        required=False,
        error_messages={"required": "La contraseña es obligatoria."}
    )
    conf_password = forms.CharField(
        label="Confirmar contraseña",
        widget=PasswordInput(attrs={"placeholder": "Confirmar contraseña"}),
        required=False,
        error_messages={"required": "Por favor, confirme su contraseña."}
    )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance and self.instance.pk and hasattr(self.instance, 'user'):
            self.fields['username'].initial = self.instance.user.username
            self.fields['email'].initial = self.instance.user.email
        self.fields["username"].widget.attrs["autofocus"] = True

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data.get('username')
        email = cleaned_data.get('email')
        password1 = cleaned_data.get("password")
        password2 = cleaned_data.get("conf_password")
        numero_documento = cleaned_data.get('numero_documento')

        # Validar contraseñas
        if not password1 or not password2:
            self.add_error('password', 'La contraseña es obligatoria.')
            self.add_error('conf_password', 'Por favor, confirme su contraseña.')
        elif password1 != password2:
            self.add_error('conf_password', 'Las contraseñas no coinciden.')
        elif len(password1) < 6 or not any(char.isupper() for char in password1) or not any(char.isdigit() for char in password1):
            self.add_error('password', 'La contraseña debe tener al menos 6 caracteres, incluir una letra mayúscula y un número.')

        # Validar nombre de usuario único
        if User.objects.filter(username=username).exclude(pk=self.instance.user.pk if self.instance and self.instance.pk else None).exists():
            self.add_error('username', 'Este nombre de usuario ya está en uso.')

        # Validar correo electrónico único
        if User.objects.filter(email=email).exclude(pk=self.instance.user.pk if self.instance and self.instance.pk else None).exists():
            self.add_error('email', 'Este correo electrónico ya está en uso.')

        # Validar número de documento único
        if Empleado.objects.filter(numero_documento=numero_documento).exclude(pk=self.instance.pk if self.instance and self.instance.pk else None).exists():
            self.add_error('numero_documento', 'Este número de documento ya está registrado.')

        return cleaned_data
    
    def save(self, commit=True):
        cleaned_data = self.cleaned_data
        username = cleaned_data.get('username')
        email = cleaned_data.get('email')
        password = cleaned_data.get('password')

        if self.instance.pk and hasattr(self.instance, 'user'):
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
            self.instance.user = user 

        empleado = super().save(commit=False)
        empleado.contrasena = password if password else empleado.contrasena
        empleado.conf_contrasena = cleaned_data.get('conf_password') if password else empleado.conf_contrasena
        if commit:
            empleado.save()
        return empleado

    class Meta:
        model = Empleado
        fields = ["username", "email", "nombre", "tipo_documento", "numero_documento", "telefono", "password", "conf_password"]
        widgets = {
            "nombre": TextInput(attrs={"placeholder": "Nombre del Empleado"}),
            "tipo_documento": Select(attrs={"placeholder": "Tipo de documento"}),
            "numero_documento": NumberInput(attrs={"min": 8, "placeholder": "Número de documento"}),
            "telefono": NumberInput(attrs={"min": 1, "placeholder": "Teléfono"}),
            "password": PasswordInput(attrs={"placeholder": "Contraseña"}),
            "conf_password": PasswordInput(attrs={"placeholder": "Confirme su contraseña"})
        }

class ClienteForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['cc_cliente'].widget.attrs['autofocus'] = True
        
    nombres = forms.CharField(
        label="Nombres Cliente",
        max_length=150,
        widget=TextInput(attrs={"placeholder": "Nombre cliente"}),
        error_messages={"required": "Este campo es obligatorio."},
        validators=[
            RegexValidator(
                regex=r'^[A-Za-z\s]+$',  # Solo letras y espacios permitidos
                message='los nombres del cliente solo puede contener letras y espacios.'
            )
        ]
    )
    apellidos = forms.CharField(
        label="Apellidos Cliente",
        max_length=150,
        widget=TextInput(attrs={"placeholder": "Nombre de cliente"}),
        error_messages={"required": "Este campo es obligatorio."},
        validators=[
            RegexValidator(
                regex=r'^[A-Za-z\s]+$',  # Solo letras y espacios permitidos
                message='Los apellidos del cliente solo puede contener letras y espacios.'
            )
        ]
    )
    telefono = forms.CharField(
        label="Teléfono",
        widget=TextInput(attrs={"placeholder": "Ingrese su teléfono"}),
        error_messages={"required": "Este campo es obligatorio."},
        validators=[
            RegexValidator(
                regex=r'^\d{10}$',  # Solo 10 dígitos
                message='El teléfono debe tener exactamente 10 dígitos.'
            )
        ],
        
    )
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
        
        
class ReportesForm(Form):
    
    date_range = CharField(widget=TextInput(attrs={
        'class': 'form-control',
        'autocomplete' : 'off'
    }))
class VentaForm(ModelForm):
    
    class Meta:
        model = Venta
        fields = '__all__'
        widgets = {
            'cliente': Select(attrs={
                'class': 'form-control select2',
                'style': 'width: 100%'
            }),
            'fecha_venta': DateInput(
                format='%Y-%m-%d %H:%M',
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
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['cliente'].queryset = Cliente.objects.filter(estado='Activo')


class ProductoForm(forms.ModelForm):

    nombre = forms.CharField(
        label="Nombre",
        max_length=100,
        widget=forms.TextInput(attrs={
            'placeholder': 'Ingrese el nombre del producto',
            'autofocus': True
        }),
        validators=[
            
        ]
    )

    precio = forms.DecimalField(
        label="Precio",
        max_digits=10,
        decimal_places=2,
        widget=forms.NumberInput(attrs={
            'placeholder': 'Ingrese el precio',
        }),
        validators=[
            MinValueValidator(0, 'El precio debe ser un número positivo.')
        ]
    )

    class Meta:
        model = Producto
        fields = '__all__'
        widgets = {
            'marca': Select(attrs={
                'class': 'form-control select2',
                'style': 'width: 100%'
            }),
            'categoria': Select(attrs={
                'class': 'form-control select2',
                'style': 'width: 100%'
            }),
            'presentacion': Select(attrs={
                'class': 'form-control select2',
                'style': 'width: 100%'
            }),
            'cantidad': TextInput(attrs={
                'readonly': True,
                'class': 'form-control',
            }),
            'nombre': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre',
                }
            ),
            'precio': forms.NumberInput(
                attrs={
                    'placeholder': 'Ingrese el precio',
                }
            ),
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['marca'].queryset = Marca.objects.filter(estado='Activo')
        self.fields['categoria'].queryset = Categoria.objects.filter(estado='Activo')
        self.fields['presentacion'].queryset = Presentacion.objects.filter(estado='Activo')

class CompraForm(ModelForm):
    
    class Meta:
        model = Compra
        fields = '__all__'
        widgets = {
            'proveedor': Select(attrs={
                'class': 'form-control select2',
                'style': 'width: 100%'
            }),
            
            'fecha_compra': DateInput(
                format='%Y-%m-%d %H:%M',
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
            'total_compra': TextInput(attrs={
                'readonly': True,
                'class': 'form-control',
            }),
            # 'total_compra': TimeInput(attrs={
            #     'readonly': True,
            #     'class': 'form-control',
            # })
        }
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['proveedor'].queryset = Proveedor.objects.filter(estado='Activo')
        
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

class AdministradorForm(forms.ModelForm):
    username = forms.CharField(
        label="Nombre de usuario",
        max_length=150,
        widget=forms.TextInput(attrs={"placeholder": "Nombre de usuario"}),
        error_messages={"required": "Este campo es obligatorio."},
        validators=[
            RegexValidator(
                regex=r'^[A-Za-z\s]+$',  # Solo letras y espacios permitidos
                message='El nombre de usuario solo puede contener letras y espacios.'
            )
        ]
    )
    nombre = forms.CharField(
        label="Nombre de Administrador",
        max_length=150,
        widget=TextInput(attrs={"placeholder": "Nombre de administrador"}),
        error_messages={"required": "Este campo es obligatorio."},
        validators=[
            RegexValidator(
                regex=r'^[A-Za-z\s]+$',  # Solo letras y espacios permitidos
                message='El nombre del administrador solo puede contener letras y espacios.'
            )
        ]
    )
    telefono = forms.CharField(
        label="Teléfono",
        widget=TextInput(attrs={"placeholder": "Ingrese su teléfono"}),
        error_messages={"required": "Este campo es obligatorio."},
        validators=[
            RegexValidator(
                regex=r'^\d{10}$',  # Solo 10 dígitos
                message='El teléfono debe tener exactamente 10 dígitos.'
            )
        ],
        
    )
    email = forms.EmailField(
        label="Email",
        max_length=150,
        widget=forms.EmailInput(attrs={"placeholder": "Correo electrónico"}),
        error_messages={
            "required": "Este campo es obligatorio.",
            "invalid": "Ingrese un correo electrónico válido."
        }
    )
    password = forms.CharField(
        label="Contraseña",
        widget=forms.PasswordInput(attrs={"placeholder": "Contraseña"}),
        required=False,
        error_messages={"required": "La contraseña es obligatoria."}
    )
    conf_password = forms.CharField(
        label="Confirmar contraseña",
        widget=forms.PasswordInput(attrs={"placeholder": "Confirmar contraseña"}),
        required=False,
        error_messages={"required": "Por favor, confirme su contraseña."}
    )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance and self.instance.pk:
            self.fields['username'].initial = self.instance.user.username
            self.fields['email'].initial = self.instance.user.email
        self.fields["username"].widget.attrs["autofocus"] = True

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data.get('username')
        email = cleaned_data.get('email')
        password1 = cleaned_data.get('password')
        password2 = cleaned_data.get('conf_password')
        numero_documento = cleaned_data.get('numero_documento')

        # Validar contraseñas
        if not password1 or not password2:
            self.add_error('password', 'La contraseña es obligatoria.')
            self.add_error('conf_password', 'Por favor, confirme su contraseña.')
        elif password1 != password2:
            self.add_error('conf_password', 'Las contraseñas no coinciden.')
        elif len(password1) < 6 or not any(char.isupper() for char in password1) or not any(char.isdigit() for char in password1):
            self.add_error('password', 'La contraseña debe tener al menos 6 caracteres, incluir una letra mayúscula y un número.')

        # Validar nombre de usuario único
        if User.objects.filter(username=username).exclude(pk=self.instance.user.pk if self.instance and self.instance.pk else None).exists():
            self.add_error('username', 'Este nombre de usuario ya está en uso.')

        # Validar correo electrónico único
        if User.objects.filter(email=email).exclude(pk=self.instance.user.pk if self.instance and self.instance.pk else None).exists():
            self.add_error('email', 'Este correo electrónico ya está en uso.')

        # Validar número de documento único
        if Administrador.objects.filter(numero_documento=numero_documento).exclude(pk=self.instance.pk if self.instance and self.instance.pk else None).exists():
            self.add_error('numero_documento', 'Este número de documento ya está registrado.')

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
            "nombre": forms.TextInput(attrs={"placeholder": "Nombre del administrador"}),
            "tipo_documento": forms.Select(attrs={"placeholder": "Tipo de documento"}),
            "numero_documento": forms.NumberInput(attrs={"min": 8, "placeholder": "Número de documento"}),
            "telefono": forms.NumberInput(attrs={"min": 1, "placeholder": "Teléfono"}),
            "password": forms.PasswordInput(attrs={"placeholder": "Contraseña"}),
            "conf_password": forms.PasswordInput(attrs={"placeholder": "Confirme su contraseña"})
        }
