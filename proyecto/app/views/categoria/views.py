# from django.contrib.auth.decorators import login_required

from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_protect,csrf_exempt
from django.http import JsonResponse
from django.views.generic import ListView, CreateView,UpdateView,DeleteView
from django.utils.decorators import method_decorator
from django.shortcuts import render,redirect
from app.models import *
from app.forms import *

def lista_categoria(request):
    
    nombre = {
        
        'titulo': 'Listado de categorias',
        'categorias': Categoria.objects.all()
    }
    
    return render(request, "categoria/listar.html", nombre)


class CategoriaListView(ListView):
    model = Categoria
    template_name = 'categoria/listar.html'
    
    # @method_decorator(login_required)
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request, *args, **kwargs):
        nombre ={'nombre': 'fabian'}
        return JsonResponse(nombre)
    
    
    def get_context_data(self, **kwargs):
        context= super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Categorias'
        context['crear_url'] = reverse_lazy('app:categoria_crear')
        context['entidad'] = 'Categorías'
        return context
    
class CategoriaCreateView(CreateView):
    model = Categoria
    form_class = CategoriaForm
    template_name = 'categoria/crear.html'
    success_url = reverse_lazy('app:categoria_lista')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Categoria'
        context['entidad'] = 'Categorías'
        context['listar_url'] = reverse_lazy('app:categoria_lista')
        
        return context

class CategoriaUpdateView(UpdateView):
    model = Categoria
    form_class = CategoriaForm
    template_name = 'categoria/crear.html'
    success_url = reverse_lazy('app:categoria_lista')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Categoria'
        context['entidad'] = 'Categorías'
        context['listar_url'] = reverse_lazy('app:categoria_lista')
        
        return context
    
class CategoriaDeleteView(DeleteView):
    model = Categoria
    template_name = 'categoria/eliminar.html'
    success_url = reverse_lazy('app:categoria_lista')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Categoria'
        context['entidad'] = 'Categorías'
        context['listar_url'] = reverse_lazy('app:categoria_lista')
        
        return context