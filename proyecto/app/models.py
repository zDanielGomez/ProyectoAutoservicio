from ast import Delete
from django.db import models
from datetime import datetime
from django.forms import ValidationError, model_to_dict
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.contrib.auth.models import User
from django.db.models.signals import post_delete
from django.dispatch import receiver
from django.core.validators import MinLengthValidator, MinValueValidator

def valnumn(valor):
    if valor <= 0:
        raise ValidationError("no se puede ingresar solo 0 ni numeros negativos")


# Se agrego la tabla Empleado con sus atributos y metodos
class Empleado(models.Model):
    class TipoDocumento(models.TextChoices):
        CC = 'CC', 'Cédula de Ciudadanía'
        TI = 'TI', 'Tarjeta de Identidad'
        CE = 'CE', 'Cédula de Extranjería'
        PSP = 'PSP', 'Pasaporte'

    def validar_numero_documento(value):
        if value < 10000000 or value > 9999999999:
            raise ValidationError("El número de documento debe tener entre 8 y 10 dígitos")

    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='Empleado')
    nombre = models.CharField(max_length=50, verbose_name="Nombre")
    tipo_documento = models.CharField(max_length=3, choices=TipoDocumento.choices, default=TipoDocumento.CC, verbose_name="Tipo de documento")
    numero_documento = models.PositiveIntegerField(verbose_name="Número de documento", unique=True, validators=[validar_numero_documento])
    telefono = models.PositiveIntegerField(verbose_name="Teléfono")
    contrasena = models.CharField(max_length=128, validators=[MinLengthValidator(8)], verbose_name="Contraseña")
    conf_contrasena = models.CharField(max_length=128, verbose_name="Confirmación de contraseña", default="")

    def clean(self):
        super().clean()
        if self.contrasena != self.conf_contrasena:
            raise ValidationError({"conf_contrasena": "Las contraseñas no coinciden"})
        
    def toJSON(self):
        item = model_to_dict(self)
        return item

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = "Empleado"
        verbose_name_plural = "Empleados"
        db_table = 'Empleado'

@receiver(post_delete, sender=Empleado)
def eliminar_usuario_relacionado(sender, instance, **kwargs):
    user = instance.user
    if user:
        user.delete()

class Administrador(models.Model):
    class TipoDocumento(models.TextChoices):
        CC = 'CC', 'Cédula de Ciudadanía'
        CE = 'CE', 'Cédula de Extranjería'
        PSP = 'PSP', 'Pasaporte'

    def validar_numero_documento(value):
        if value < 10000000 or value > 9999999999:
            raise ValidationError("El número de documento debe tener entre 8 y 10 dígitos")

    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='administrador')
    nombre = models.CharField(max_length=50, verbose_name="Nombre")
    tipo_documento = models.CharField(max_length=3, choices=TipoDocumento.choices, default=TipoDocumento.CC, verbose_name="Tipo de documento")
    numero_documento = models.PositiveIntegerField(verbose_name="Número de documento", unique=True, validators=[validar_numero_documento])
    telefono = models.PositiveIntegerField(verbose_name="Teléfono")
    contrasena = models.CharField(max_length=128, validators=[MinLengthValidator(8)], verbose_name="Contraseña")
    conf_contrasena = models.CharField(max_length=128, verbose_name="Confirmación de contraseña", default="")

    def clean(self):
        super().clean()
        if self.contrasena != self.conf_contrasena:
            raise ValidationError({"conf_contrasena": "Las contraseñas no coinciden"})

    def save(self, *args, **kwargs):
        if not self.pk or 'user' not in kwargs:
            user, created = User.objects.get_or_create(username=self.user.username)
        else:
            user = self.user

        if self.contrasena:
            user.set_password(self.contrasena)

        user.is_superuser = True
        user.is_staff = True
        user.save()

        self.user = user
        super().save(*args, **kwargs)

    def _str_(self):
        return self.nombre

    class Meta:
        verbose_name = "Administrador"
        verbose_name_plural = "Administradores"
        db_table = 'Administrador'

@receiver(post_delete, sender=Administrador)
def eliminar_usuario_relacionado(sender, instance, **kwargs):
    user = instance.user
    if user:
        user.delete()
# Se agrego la tabla Marca con sus atributos y metodos
class Marca(models.Model):
    nombre = models.CharField(max_length=50, verbose_name="Nombre")
    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = "Marca"
        verbose_name_plural = "Marcas"
        db_table = "Marca"

# Se agrego la tabla Categoria con sus atributos y metodos
class Categoria(models.Model):
    nombre = models.CharField(max_length=50, verbose_name="Nombre", unique=True)

    def toJSON(self):
        item = model_to_dict(self)
        return item
    
    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = "Categoria"
        verbose_name_plural = "Categorias"
        db_table = "Categoria"

# Se agrego la tabla Presentacion con sus atributos y metodos
class Presentacion(models.Model):
    descripcion = models.CharField(max_length=50, verbose_name="Descripcion")
    
    def __str__(self):
        return self.descripcion

    class Meta:
        verbose_name = "Presentacion"
        verbose_name_plural = "Presentaciones"
        db_table = "Presentacion"

# Se agrego la tabla Cliente con sus atributos y metodos
class Cliente(models.Model):
    
    class TipoDocumento(models.TextChoices):
        CC = 'CC', 'Cédula de Ciudadanía'
        CE = 'CE', 'Cédula de Extranjería'
        PSP = 'PSP', 'Pasaporte'

    def validar_numero_documento(value):
        if value < 10000000 or value > 9999999999:
            raise ValidationError("El número de documento debe tener entre 8 y 10 dígitos")
        
    tipo_documento = models.CharField(max_length=3, choices=TipoDocumento.choices, default=TipoDocumento.CC, verbose_name="Tipo de documento")
    cc_cliente = models.PositiveIntegerField(unique=True, validators=[validar_numero_documento])
    nombres = models.CharField(max_length=200, verbose_name="Nombres")
    apellidos = models.CharField(max_length=200, verbose_name="Apellidos")
    telefono = models.PositiveIntegerField(unique=True,verbose_name="Telefono")
    
    def __str__(self):
        return f"{self.cc_cliente}"
    
    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"
        db_table = "Cliente"

# Se agrego la tabla Proveedor con sus atributos y metodos
class Proveedor(models.Model):
    nombres = models.CharField(max_length=200, verbose_name="Nombres")
    telefono = models.PositiveIntegerField(unique=True,verbose_name="Telefono")
    correo = models.CharField(max_length=200, verbose_name="Correo")
    
    def __str__(self):
        return self.nombres

    class Meta:
        verbose_name = "Proveedor"
        verbose_name_plural = "Proveedores"
        db_table = "Proveedor"

# Se agrego la tabla Producto con sus atributos y metodos
class Producto(models.Model):    
    nombre = models.CharField(max_length=200, verbose_name="Nombre")
    cantidad = models.PositiveIntegerField(verbose_name="Cantidad")
    marca = models.ForeignKey(Marca,on_delete=models.PROTECT)
    categoria = models.ForeignKey(Categoria,on_delete=models.PROTECT)
    presentacion = models.ForeignKey(Presentacion,on_delete=models.PROTECT)
    precio = models.DecimalField(default=0.00,max_digits=9 ,decimal_places=2, validators=[valnumn])
    
    
    def __str__(self):
        return self.nombre
    
    def toJSON(self):
        item = model_to_dict(self)
        item['categoria'] = self.categoria.toJSON()
        item['precio'] = format(self.precio, '.2f')
        return item

    class Meta:
        verbose_name = "Producto"
        verbose_name_plural = "Productos"
        db_table = "Producto"

# Se agrego la tabla Venta con sus atributos y metodos
class Venta(models.Model):    
    fecha_venta = models.DateTimeField(default=datetime.now)  
    cliente = models.ForeignKey(Cliente,on_delete=models.PROTECT,verbose_name="Cliente")
    empleado = models.ForeignKey(Empleado,on_delete=models.PROTECT,verbose_name="Empleado")
    total_venta = models.DecimalField(default=0.00,max_digits=15 ,decimal_places=2)
    
    def toJSON(self):
        item = model_to_dict(self)
        item['fecha_venta'] = self.fecha_venta.strftime('%Y-%m-%d %H:%M')
        item['cc_cliente'] = self.cliente.cc_cliente
        item['cliente'] = self.cliente.nombres+" "+self.cliente.apellidos
        item['empleado'] = self.empleado.nombre
        item['total_venta'] = format(self.total_venta, '.2f')
        item['det'] = [i.toJSON() for i in self.det_venta_set.all()]
        return item

    def __str__(self):
        return f"{self.fecha_venta}"
    
    
    def delete(self,using=None, keep_parents=False):
        for det in self.det_venta_set.all():
            print("---------")
            print(det.toJSON() )
            det.id_producto.cantidad += det.cantidad
            det.id_producto.save()
        super(Venta,self).delete()
    
    class Meta:
        verbose_name = "Venta"
        verbose_name_plural = "Ventas"
        db_table = "Venta" 
        

class Det_Venta(models.Model):
    id_venta = models.ForeignKey(Venta, on_delete=models.CASCADE)
    id_producto = models.ForeignKey(Producto, on_delete=models.PROTECT)
    cantidad = models.PositiveIntegerField()
    precio = models.DecimalField(default=0.00, max_digits=9, decimal_places=2)
    subtotal = models.DecimalField(default=0.00, max_digits=15, decimal_places=2)
    
    def toJSON(self):
        item = model_to_dict(self, exclude=['id_venta'])
        item['id_producto'] = self.id_producto.toJSON()
        item['precio'] = format(self.precio, '.2f')
        item['subtotal'] = format(self.subtotal, '.2f')
        return item

    def _str_(self):
        return self.id_producto

    class Meta:
        verbose_name= "Detalle venta"
        verbose_name_plural ='Detalles de ventas'
        db_table ='Detalle_Venta'

# Se agrego la tabla Compra con sus atributos y metodos
class Compra(models.Model):
    fecha_compra = models.DateTimeField(default=datetime.now)  
    proveedor = models.ForeignKey(Proveedor,on_delete=models.PROTECT)
    total_compra = models.DecimalField(default=0.00,max_digits=9 ,decimal_places=2)
    
    def toJSON(self):
        item = model_to_dict(self)
        item['fecha_compra'] = self.fecha_compra.strftime('%Y-%m-%d %H:%M')
        item['proveedor'] = self.proveedor
        item['total_compra'] = format(self.total_compra, '.2f')
        item['det'] = [i.toJSON() for i in self.det_compra_set.all()]
        return item
    
    def delete(self,using=None, keep_parents=False):
        for det in self.det_compra_set.all():
            print("---------")
            print(det.toJSON() )
            det.id_producto.cantidad -= det.cantidad
            det.id_producto.save()
        super(Compra,self).delete()
    
    def __str__(self):
        return f"{self.fecha_compra}"
    
    class Meta:
        verbose_name = "Compra"
        verbose_name_plural = "Compras"
        db_table = "Compra"

class Det_Compra(models.Model):
    id_compra = models.ForeignKey(Compra, on_delete=models.CASCADE)
    id_producto = models.ForeignKey(Producto, on_delete=models.PROTECT)
    cantidad = models.PositiveIntegerField()
    precio = models.DecimalField(default=0.00, max_digits=9, decimal_places=2)
    subtotal = models.DecimalField(default=0.00, max_digits=9, decimal_places=2)
    
    def toJSON(self):
        item = model_to_dict(self, exclude=['id_compra'])
        item['id_producto'] = self.id_producto.toJSON()
        item['precio'] = format(self.precio, '.2f')
        item['subtotal'] = format(self.subtotal, '.2f')
        return item

    def _str_(self):
        return self.id_producto

    class Meta:
        verbose_name= "Detalle Compra"
        verbose_name_plural ='Detalles de Compras'
        db_table ='Detalle_Compra'