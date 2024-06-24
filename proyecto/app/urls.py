from django.urls import path
from app.views import *
from app.views.categoria.views import *

app_name = 'app'
urlpatterns = [
    path ("categoria/listar/", CategoriaListView.as_view()),
    path ("categoria/listar2/", lista_categoria),
    path ("categoria/listar3/", CategoriaCreateView.as_view())
    
    

]
