from django.db import models

# Create your models here.

class Empleado(models.Model):
    Id_empleado = models.AutoField(primary_key=True)
    Nombres = models.CharField(max_length=50, verbose_name="Nombres")
    Apellidos = models.CharField(max_length=50, verbose_name="Apellidos")
    Telefono = models.CharField(unique=True, max_length=10,verbose_name="Telefono")

    class Meta:
        verbose_name = "Empleado"
        verbose_name_plural = "Empleados"
        db_table = "Empleado"


class Marca(models.Model):
    Id_marca = models.AutoField(primary_key=True)
    Nombre = models.CharField(max_length=50, verbose_name="Nombre")

    class Meta:
        verbose_name = "Marca"
        verbose_name_plural = "Marcas"
        db_table = "Marca"

class Categoria(models.Model):
    Id_categoria = models.AutoField(primary_key=True)
    Nombre = models.CharField(max_length=50, verbose_name="Nombre")

    class Meta:
        verbose_name = "Categoria"
        verbose_name_plural = "Categorias"
        db_table = "Categoria"

class Presentacion(models.Model):
    Id_presentacion = models.AutoField(primary_key=True)
    Descripcion = models.CharField(max_length=50, verbose_name="Descripcion")

    class Meta:
        verbose_name = "Presentacion"
        verbose_name_plural = "Presentaciones"
        db_table = "Presentacion"