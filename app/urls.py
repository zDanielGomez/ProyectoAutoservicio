from django import views
from django.urls import path
from app.views import *
from app.views.categoria.views import *
from app.views.empleado.views import *
from app.views.cliente.views import *
from app.views.venta.views import *
from app.views.producto.views import *
from app.views.compra.views import *
from app.views.proveedor.views import *
from app.views.marca.views import *
from app.views.presentacion.views import *
from app.views.administrador.views import *
from app.views.backup.views import *
from app.views.reportes.views import *

app_name = 'app'
urlpatterns = [
    #Urls categoria
    path ("categoria/listar/", CategoriaListView.as_view(), name= 'categoria_lista'),
    path ("categoria/crear/", CategoriaCreateView.as_view(), name= 'categoria_crear'),
    path ("categoria/editar/<int:pk>/", CategoriaUpdateView.as_view(), name= 'categoria_editar'),
    path ("categoria/eliminar/<int:pk>/", CategoriaDeleteView.as_view(), name= 'categoria_eliminar'),

    #Urls empleado
    path('empleado/listar/', EmpleadoListView.as_view(), name='empleado_lista'),
    path('empleado/crear/', EmpleadoCreateView.as_view(), name='empleado_crear'),
    path('empleado/editar/<int:pk>/', EmpleadoUpdateView.as_view(), name='empleado_editar'),
    path('empleado/eliminar/<int:pk>/', EmpleadoDeleteView.as_view(), name='empleado_eliminar'),

    #Urls cliente
    path('cliente/listar/', ClienteListView.as_view(), name='cliente_lista'),
    path('cliente/crear/', ClienteCreateView.as_view(), name='cliente_crear'),
    path('cliente/editar/<int:pk>/', ClienteUpdateView.as_view(), name='cliente_editar'),
    path('cliente/eliminar/<int:pk>/', ClienteDeleteView.as_view(), name='cliente_eliminar'),
    
    #Urls venta
    path('venta/listar/', VentaListView.as_view(), name='venta_lista'),
    path('venta/crear/', VentaCreateView.as_view(), name='venta_crear'),
    path('venta/editar/<int:pk>/', VentaUpdateView.as_view(), name='venta_editar'),
    path('venta/eliminar/<int:pk>/', VentaDeleteView.as_view(), name='venta_eliminar'),
    path('venta/factura/<int:pk>/', VentaFacturaView.as_view(), name='venta_factura'),
    
    #Urls producto
    path('producto/listar/', ProductoListView.as_view(), name='producto_lista'),
    path('producto/crear/', ProductoCreateView.as_view(), name='producto_crear'),
    path('producto/editar/<int:pk>/', ProductoUpdateView.as_view(), name='producto_editar'),
    path('producto/eliminar/<int:pk>/', ProductoDeleteView.as_view(), name='producto_eliminar'),
    
    #Urls compra
    path('compra/listar/', CompraListView.as_view(), name='compra_lista'),
    path('compra/crear/', CompraCreateView.as_view(), name='compra_crear'),
    path('compra/editar/<int:pk>/', CompraUpdateView.as_view(), name='compra_editar'),
    path('compra/eliminar/<int:pk>/', CompraDeleteView.as_view(), name='compra_eliminar'),
    
    #Urls proveedor
    path('proveedor/listar/', ProveedorListView.as_view(), name='proveedor_lista'),
    path('proveedor/crear/', ProveedorCreateView.as_view(), name='proveedor_crear'),
    path('proveedor/editar/<int:pk>/', ProveedorUpdateView.as_view(), name='proveedor_editar'),
    path('proveedor/eliminar/<int:pk>/', ProveedorDeleteView.as_view(), name='proveedor_eliminar'),
    
    #Urls marca
    path('marca/listar/', MarcaListView.as_view(), name='marca_lista'),
    path('marca/crear/', MarcaCreateView.as_view(), name='marca_crear'),
    path('marca/editar/<int:pk>/', MarcaUpdateView.as_view(), name='marca_editar'),
    path('marca/eliminar/<int:pk>/', MarcaDeleteView.as_view(), name='marca_eliminar'),
    
    #Urls presentacion
    path('presentacion/listar/', PresentacionListView.as_view(), name='presentacion_lista'),
    path('presentacion/crear/', PresentacionCreateView.as_view(), name='presentacion_crear'),
    path('presentacion/editar/<int:pk>/', PresentacionUpdateView.as_view(), name='presentacion_editar'),
    path('presentacion/eliminar/<int:pk>/', PresentacionDeleteView.as_view(), name='presentacion_eliminar'),

    #Urls administrador
    path('administrador/listar/', AdministradorListView.as_view(), name='administrador_lista'),
    path('administrador/crear/', AdministradorCreateView.as_view(), name='administrador_crear'),
    path('administrador/editar/<int:pk>/', AdministradorUpdateView.as_view(), name='administrador_editar'),
    path('administrador/eliminar/<int:pk>/', AdministradorDeleteView.as_view(), name='administrador_eliminar'),

    #Urls backup
    path('crear_backup/', BackupDatabaseView.as_view(), name='crear_backup'),
    path('restaurar_backup/', RestoreDatabaseView.as_view(), name='restaurar_backup'),
    path('listar_backup/', BackupListView.as_view(), name='listar_backup'),
    path('eliminar_backup/', BackupDeleteView.as_view(), name='eliminar_backup'),
    
    #Urls reporte ventas
    path('reportes/', ReportesVentasView.as_view(), name='reportes_ventas'),
    
    path('manual/', TemplateView.as_view(template_name='manual.html'), name='manual_usuario'),

]
