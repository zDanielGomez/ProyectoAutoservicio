from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.http import JsonResponse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator
from django.shortcuts import render, redirect
from app.models import *
from app.forms import *
from django.views.decorators.cache import never_cache

def lista_producto(request):
    
    nombre = {
        
        'titulo': 'Listado de producto',
        'producto': Producto.objects.all()
    }
    
    return render(request, "producto/listar.html", nombre)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class ProductoListView(ListView):
    model = Producto
    template_name = 'producto/listar.html'
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
        
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Productos'
        context['crear_url'] = reverse_lazy('app:producto_crear')
        context['entidad'] = 'Producto'
        return context
  
@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class ProductoCreateView(CreateView):
    model = Producto
    form_class = ProductoForm
    template_name = 'producto/crear.html'
    success_url = reverse_lazy('app:producto_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Producto'
        context['entidad'] = 'Producto'
        context['listar_url'] = reverse_lazy('app:producto_lista')
        return context
  
@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class ProductoUpdateView(UpdateView):
    model = Producto
    form_class = ProductoForm
    template_name = 'producto/crear.html'
    success_url = reverse_lazy('app:producto_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Producto'
        context['entidad'] = 'Producto'
        context['listar_url'] = reverse_lazy('app:producto_lista')
        
        return context
  
@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')   
class ProductoDeleteView(DeleteView):
    model = Producto
    template_name = 'Producto/eliminar.html'
    success_url = reverse_lazy('app:producto_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Producto'
        context['entidad'] = 'Producto'
        context['listar_url'] = reverse_lazy('app:producto_lista')
        
        return context
