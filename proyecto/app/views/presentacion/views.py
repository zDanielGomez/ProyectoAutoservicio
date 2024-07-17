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

def lista_presentacion(request):
    
    nombre = {
        
        'titulo': 'Listado de Presentaciones',
        'Presentacion': Presentacion.objects.all()
    }
    
    return render(request, "presentacion/listar.html", nombre)


class PresentacionListView(ListView):
    model = Presentacion
    template_name = 'presentacion/listar.html'
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    
    def get_context_data(self, **kwargs):
        context= super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Presentaciones'
        context['crear_url'] = reverse_lazy('app:presentacion_crear')
        context['entidad'] = 'Presentacion'
        return context
    
class PresentacionCreateView(CreateView):
    model = Presentacion
    form_class = PresentacionForm
    template_name = 'presentacion/crear.html'
    success_url = reverse_lazy('app:presentacion_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Presentacion'
        context['entidad'] = 'Presentacion'
        context['listar_url'] = reverse_lazy('app:presentacion_lista')
        
        return context

class PresentacionUpdateView(UpdateView):
    model = Presentacion
    form_class = PresentacionForm
    template_name = 'presentacion/crear.html'
    success_url = reverse_lazy('app:presentacion_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Presentacion'
        context['entidad'] = 'Presentacion'
        context['listar_url'] = reverse_lazy('app:presentacion_lista')
        
        return context
    
class PresentacionDeleteView(DeleteView):
    model = Presentacion
    template_name = 'presentacion/eliminar.html'
    success_url = reverse_lazy('app:presentacion_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Presentacion'
        context['entidad'] = 'Presentacion'
        context['listar_url'] = reverse_lazy('app:presentacion_lista')
        
        return context