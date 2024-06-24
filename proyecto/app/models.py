from django.db import models
from datetime import datetime

# Se agrego la tabla Empleado con sus atributos y metodos
class Empleado(models.Model):
    id_empleado = models.AutoField(primary_key=True)
    nombres = models.CharField(max_length=50, verbose_name="Nombres")
    apellidos = models.CharField(max_length=50, verbose_name="Apellidos")
    telefono = models.CharField(unique=True, max_length=10,verbose_name="Telefono")
    
    def __str__(self):
        return self.nombres

    class Meta:
        verbose_name = "Empleado"
        verbose_name_plural = "Empleados"
        db_table = "Empleado"

# Se agrego la tabla Marca con sus atributos y metodos
class Marca(models.Model):
    id_marca = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50, verbose_name="Nombre")
    
    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = "Marca"
        verbose_name_plural = "Marcas"
        db_table = "Marca"

# Se agrego la tabla Categoria con sus atributos y metodos
class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50, verbose_name="Nombre", unique=True)
    descripcion = models.CharField(max_length=200, verbose_name="Descripcion", blank=True, null=True)

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = "Categoria"
        verbose_name_plural = "Categorias"
        db_table = "Categoria"

# Se agrego la tabla Presentacion con sus atributos y metodos
class Presentacion(models.Model):
    id_presentacion = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=50, verbose_name="Descripcion")
    
    def __str__(self):
        return self.descripcion

    class Meta:
        verbose_name = "Presentacion"
        verbose_name_plural = "Presentaciones"
        db_table = "Presentacion"

# Se agrego la tabla Cliente con sus atributos y metodos
class Cliente(models.Model):
    cc_cliente = models.IntegerField(primary_key=True)
    nombres = models.CharField(max_length=200, verbose_name="Nombres")
    apellidos = models.CharField(max_length=200, verbose_name="Apellidos")
    telefono = models.CharField(unique=True, max_length=10,verbose_name="Telefono")
    
    def __str__(self):
        return self.nombres

    class Meta:
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"
        db_table = "Cliente"

# Se agrego la tabla Proveedor con sus atributos y metodos
class Proveedor(models.Model):    
    id_proveedor = models.AutoField(primary_key=True)
    nombres = models.CharField(max_length=200, verbose_name="Nombres")
    telefono = models.CharField(unique=True, max_length=10,verbose_name="Telefono")
    correo = models.CharField(max_length=200, verbose_name="Correo")
    
    def __str__(self):
        return self.nombres

    class Meta:
        verbose_name = "Proveedor"
        verbose_name_plural = "Proveedores"
        db_table = "Proveedor"

# Se agrego la tabla Producto con sus atributos y metodos
class Producto(models.Model):    
    id_producto = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=200, verbose_name="Nombre")
    descripcion = models.CharField(max_length=50, verbose_name="Descripcion")
    cantidad = models.IntegerField(verbose_name="Cantidad")
    id_marca = models.ForeignKey(Marca,on_delete=models.CASCADE)
    id_categoria = models.ForeignKey(Categoria,on_delete=models.CASCADE)
    id_presentacion = models.ForeignKey(Presentacion,on_delete=models.CASCADE)
    precio = models.DecimalField(default=0.00,max_digits=9 ,decimal_places=2)
    
    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = "Producto"
        verbose_name_plural = "Productos"
        db_table = "Producto"

# Se agrego la tabla Venta con sus atributos y metodos
class Venta(models.Model):    
    id_venta = models.AutoField(primary_key=True)
    fecha_venta = models.DateField(default=datetime.now)  
    cc_cliente = models.ForeignKey(Cliente,on_delete=models.CASCADE,verbose_name="Cliente")
    id_empleado = models.ForeignKey(Empleado,on_delete=models.CASCADE,verbose_name="Empleado")
    id_producto = models.ForeignKey(Producto,on_delete=models.CASCADE)
    total_venta = models.DecimalField(default=0.00,max_digits=9 ,decimal_places=2)
    
    def __str__(self):
        return f"{self.id_venta}"
    
    class Meta:
        verbose_name = "Venta"
        verbose_name_plural = "Ventas"
        db_table = "Venta"

# Se agrego la tabla Compra con sus atributos y metodos
class Compra(models.Model):
    id_compra = models.AutoField(primary_key=True)
    fecha_compra = models.DateField(default=datetime.now)  
    id_proveedor = models.ForeignKey(Proveedor,on_delete=models.CASCADE)
    id_producto = models.ForeignKey(Producto,on_delete=models.CASCADE)
    total_compra = models.DecimalField(default=0.00,max_digits=9 ,decimal_places=2)
    
    def __str__(self):
        return f"{self.id_compra}"
    
    class Meta:
        verbose_name = "Compra"
        verbose_name_plural = "Compras"
        db_table = "Compra"