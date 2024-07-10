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

def lista_marca(request):
    
    nombre = {
        
        'titulo': 'Listado de Marcas',
        'Marcas': Marca.objects.all()
    }
    
    return render(request, "marca/listar.html", nombre)


class MarcaListView(ListView):
    model = Marca
    template_name = 'categoria/listar.html'
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request, *args, **kwargs):
        nombre ={'nombre': 'fabian'}
        return JsonResponse(nombre)
    
    def get_context_data(self, **kwargs):
        context= super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Marcas'
        context['crear_url'] = reverse_lazy('app:marca_crear')
        context['entidad'] = 'Marca'
        return context
    
class MarcaCreateView(CreateView):
    model = Marca
    form_class = MarcaForm
    template_name = 'marca/crear.html'
    success_url = reverse_lazy('app:marca_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Marca'
        context['entidad'] = 'Marca'
        context['listar_url'] = reverse_lazy('app:marca_lista')
        
        return context

class MarcaUpdateView(UpdateView):
    model = Marca
    form_class = Marca
    template_name = 'marca/crear.html'
    success_url = reverse_lazy('app:marca_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Marca'
        context['entidad'] = 'Marca'
        context['listar_url'] = reverse_lazy('app:marca_lista')
        
        return context
    
class MarcaDeleteView(DeleteView):
    model = Marca
    template_name = 'marca/eliminar.html'
    success_url = reverse_lazy('app:marca_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Marca'
        context['entidad'] = 'Marca'
        context['listar_url'] = reverse_lazy('app:marca_lista')
        
        return context