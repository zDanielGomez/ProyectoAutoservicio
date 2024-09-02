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

def lista_cliente(request):
    
    nombre = {
        
        'titulo': 'Listado de clientes',
        'clientes': Cliente.objects.all()
    }
    
    return render(request, "cliente/listar.html", nombre)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class ClienteListView(ListView):
    model = Cliente
    template_name = 'cliente/listar.html'
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Clientes'
        context['crear_url'] = reverse_lazy('app:cliente_crear')
        context['entidad'] = 'Clientes'
        return context

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')    
class ClienteCreateView(CreateView):
    model = Cliente
    form_class = ClienteForm
    template_name = 'cliente/crear.html'
    success_url = reverse_lazy('app:cliente_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Cliente'
        context['entidad'] = 'Clientes'
        context['listar_url'] = reverse_lazy('app:cliente_lista')
        
        return context

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class ClienteUpdateView(UpdateView):
    model = Cliente
    form_class = ClienteForm
    template_name = 'cliente/crear.html'
    success_url = reverse_lazy('app:cliente_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Cliente'
        context['entidad'] = 'Clientes'
        context['listar_url'] = reverse_lazy('app:cliente_lista')
        
        return context

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch') 
class ClienteDeleteView(DeleteView):
    model = Cliente
    template_name = 'cliente/eliminar.html'
    success_url = reverse_lazy('app:cliente_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Cliente'
        context['entidad'] = 'Clientes'
        context['listar_url'] = reverse_lazy('app:cliente_lista')
        
        return context
