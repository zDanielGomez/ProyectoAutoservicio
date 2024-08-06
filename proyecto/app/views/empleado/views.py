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

def lista_empleado(request):
    
    nombre = {
        
        'titulo': 'Listado de empleados',
        'empleados': Empleado.objects.all()
    }
    
    return render(request, "empleado/listar.html", nombre)

@method_decorator(never_cache, name='dispatch')
class EmpleadoListView(ListView):
    model = Empleado
    template_name = 'empleado/listar.html'
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Empleados'
        context['crear_url'] = reverse_lazy('app:empleado_crear')
        context['entidad'] = 'Empleados'
        return context

@method_decorator(never_cache, name='dispatch') 
class EmpleadoCreateView(CreateView):
    model = Empleado
    form_class = EmpleadoForm
    template_name = 'empleado/crear.html'
    success_url = reverse_lazy('app:empleado_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Empleado'
        context['entidad'] = 'Empleados'
        context['listar_url'] = reverse_lazy('app:empleado_lista')
        
        return context

@method_decorator(never_cache, name='dispatch')
class EmpleadoUpdateView(UpdateView):
    model = Empleado
    form_class = EmpleadoForm
    template_name = 'empleado/crear.html'
    success_url = reverse_lazy('app:empleado_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Empleado'
        context['entidad'] = 'Empleados'
        context['listar_url'] = reverse_lazy('app:empleado_lista')
        
        return context

@method_decorator(never_cache, name='dispatch') 
class EmpleadoDeleteView(DeleteView):
    model = Empleado
    template_name = 'empleado/eliminar.html'
    success_url = reverse_lazy('app:empleado_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Empleado'
        context['entidad'] = 'Empleados'
        context['listar_url'] = reverse_lazy('app:empleado_lista')
        
        return context
