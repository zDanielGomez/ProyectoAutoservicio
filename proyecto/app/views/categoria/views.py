from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_protect,csrf_exempt
from django.http import JsonResponse
from django.views.generic import ListView, CreateView,UpdateView,DeleteView
from django.utils.decorators import method_decorator
from django.shortcuts import render,redirect
from app.models import *
from app.forms import *
from django.views.decorators.cache import never_cache

def lista_categoria(request):
    
    nombre = {
        
        'titulo': 'Listado de categorias',
        'categorias': Categoria.objects.all()
    }
    
    return render(request, "categoria/listar.html", nombre)

@method_decorator(never_cache, name='dispatch')
class CategoriaListView(ListView):
    model = Categoria
    template_name = 'categoria/listar.html'
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)

    
    def get_context_data(self, **kwargs):
        context= super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Categorias'
        context['crear_url'] = reverse_lazy('app:categoria_crear')
        context['entidad'] = 'Categorías'
        return context
  
@method_decorator(never_cache, name='dispatch')  
class CategoriaCreateView(CreateView):
    model = Categoria
    form_class = CategoriaForm
    template_name = 'categoria/crear.html'
    success_url = reverse_lazy('app:categoria_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Categoria'
        context['entidad'] = 'Categorías'
        context['listar_url'] = reverse_lazy('app:categoria_lista')
        
        return context

@method_decorator(never_cache, name='dispatch')
class CategoriaUpdateView(UpdateView):
    model = Categoria
    form_class = CategoriaForm
    template_name = 'categoria/crear.html'
    success_url = reverse_lazy('app:categoria_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Categoria'
        context['entidad'] = 'Categorías'
        context['listar_url'] = reverse_lazy('app:categoria_lista')
        
        return context
 
@method_decorator(never_cache, name='dispatch')   
class CategoriaDeleteView(DeleteView):
    model = Categoria
    template_name = 'categoria/eliminar.html'
    success_url = reverse_lazy('app:categoria_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Categoria'
        context['entidad'] = 'Categorías'
        context['listar_url'] = reverse_lazy('app:categoria_lista')
        
        return context