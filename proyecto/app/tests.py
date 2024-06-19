# from django.test import TestCase
from pathlib import Path
import sys
sys.path.append(str(Path(__file__).parent.parent))
from proyecto.wsgi import *
from app.models import *



# p = Presentacion(descripcion="Danaasd").save()

# query = Presentacion.objects.all()
# print(query)
# try:
#     p = Producto.objects.get(id_producto=1)
#     print(p.nombre)
#     p.nombre = "Prueba"
#     p.save()
#     print(p)
# except Exception as e:
#     print("Ex")


# query = Producto.objects.all()
# print(query)


# z = Presentacion.objects.get(id_presentacion=1)
# z.delete()

# query = Presentacion.objects.all()
# print(query)

# obj= Producto.objects.filter(nombre__contains="ven").query
# print(obj)

# obj=Producto.objects.filter()

# for i in Producto.objects.filter():
#     print(i)

datos =["Bolsa 3kg", "J"]
z=0
for i in datos:
    c = Presentacion(descripcion=i)
    c.save()
    z+=1
    print(f"Guardado en el registro N{c.id_presentacion} {c.descripcion}")