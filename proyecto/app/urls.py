from django.urls import path
from app.views import *
from app.views.categoria.views import *

app_name = 'app'
urlpatterns = [
    path ("categoria/listar/", CategoriaListView.as_view(), name= 'categoria_lista'),
    path ("categoria/listar2/", lista_categoria, name= 'categoria_lista2'),
    path ("categoria/crear/", CategoriaCreateView.as_view(), name= 'categoria_crear')

]
