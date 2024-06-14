from django.db import models

# Create your models here.

class Empleado(models.Model):
    id_empleado = models.AutoField(primary_key=True)
    nombres = models.CharField(max_length=50, verbose_name="Nombres")
    apellidos = models.CharField(max_length=50, verbose_name="Apellidos")
    telefono = models.CharField(unique=True, max_length=10,verbose_name="Telefono")

    class Meta:
        verbose_name = "Empleado"
        verbose_name_plural = "Empleados"
        db_table = "Empleado"


class Marca(models.Model):
    id_marca = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50, verbose_name="Nombre")

    class Meta:
        verbose_name = "Marca"
        verbose_name_plural = "Marcas"
        db_table = "Marca"

class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50, verbose_name="Nombre")

    class Meta:
        verbose_name = "Categoria"
        verbose_name_plural = "Categorias"
        db_table = "Categoria"

class Presentacion(models.Model):
    id_presentacion = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=50, verbose_name="Descripcion")

    class Meta:
        verbose_name = "Presentacion"
        verbose_name_plural = "Presentaciones"
        db_table = "Presentacion"

class Cliente(models.Model):
    cc_cliente = models.IntegerField(primary_key=True)
    nombres = models.CharField(max_length=200, verbose_name="Nombres")
    apellidos = models.CharField(max_length=200, verbose_name="Apellidos")
    telefono = models.CharField(unique=True, max_length=10,verbose_name="Telefono")

    class Meta:
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"
        db_table = "Cliente"

class Proveedor(models.Model):    
    id_proveedor = models.AutoField(primary_key=True)
    nombres = models.CharField(max_length=200, verbose_name="Nombres")
    telefono = models.CharField(unique=True, max_length=10,verbose_name="Telefono")
    correo = models.CharField(max_length=200, verbose_name="Correo")

    class Meta:
        verbose_name = "Proveedor"
        verbose_name_plural = "Proveedores"
        db_table = "Proveedor"