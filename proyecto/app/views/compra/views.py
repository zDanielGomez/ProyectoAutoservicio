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

def lista_compra(request):
    
    nombre = {
        
        'titulo': 'Listado de clientes',
        'clientes': Compra.objects.all()
    }
    
    return render(request, "compra/listar.html", nombre)

@method_decorator(never_cache, name='dispatch')
class CompraListView(ListView):
    model = Compra
    template_name = 'compra/listar.html'
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Compra'
        context['crear_url'] = reverse_lazy('app:compra_crear')
        context['entidad'] = 'Compra'
        return context
    
@method_decorator(never_cache, name='dispatch')
class CompraCreateView(CreateView):
    model = Compra
    form_class = CompraForm
    template_name = 'compra/crear.html'
    success_url = reverse_lazy('app:compra_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Compra'
        context['entidad'] = 'Compra'
        context['listar_url'] = reverse_lazy('app:compra_lista')
        
        return context

@method_decorator(never_cache, name='dispatch')
class CompraUpdateView(UpdateView):
    model = Compra
    form_class = CompraForm
    template_name = 'compra/crear.html'
    success_url = reverse_lazy('app:compra_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Compra'
        context['entidad'] = 'Compra'
        context['listar_url'] = reverse_lazy('app:compra_lista')
        
        return context

@method_decorator(never_cache, name='dispatch')  
class CompraDeleteView(DeleteView):
    model = Compra
    template_name = 'compra/eliminar.html'
    success_url = reverse_lazy('app:compra_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Compra'
        context['entidad'] = 'Compra'
        context['listar_url'] = reverse_lazy('app:compra_lista')
        
        return context

