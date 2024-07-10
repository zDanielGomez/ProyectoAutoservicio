from django.urls import path
from app.views import *
from app.views.categoria.views import *
from app.views.empleado.views import *
from app.views.cliente.views import *

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

]
