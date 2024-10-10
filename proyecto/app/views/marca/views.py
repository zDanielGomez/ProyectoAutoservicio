from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_protect,csrf_exempt
from django.http import Http404, HttpRequest, HttpResponse, JsonResponse
from django.views.generic import ListView, CreateView,UpdateView,DeleteView
from django.utils.decorators import method_decorator
from django.shortcuts import render,redirect
from app.models import *
from app.forms import *
from django.db.models import ProtectedError
from django.views.decorators.cache import never_cache
from django.contrib import messages
import re

def lista_marca(request):
    
    nombre = {
        
        'titulo': 'Listado de Marcas',
        'Marcas': Marca.objects.all()
    }
    
    return render(request, "marca/listar.html", nombre)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class MarcaListView(ListView):
    model = Marca
    template_name = 'marca/listar.html'
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context= super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Marcas'
        context['crear_url'] = reverse_lazy('app:marca_crear')
        context['entidad'] = 'Marca'
        return context
    
    def get_queryset(self):
        queryset = super().get_queryset()
        # Obtiene los parámetros de consulta de la URL
        id = self.request.GET.get('id')
        nombre = self.request.GET.get('nombre')

        # Filtra los resultados según los parámetros proporcionados
        if id:
            if int(id) >= 1:  # Verifica que el número sea positivo
                    queryset = queryset.filter(id=id)
            else:
                messages.error(self.request, "El ID debe ser un número positivo.")
                
        if nombre:
            if re.match("^[A-Za-z0-9\\s]+$", nombre):  # Solo letras, números y espacios
                queryset = queryset.filter(nombre__icontains=nombre)
            else:
                messages.error(self.request, "El nombre no puede contener caracteres especiales.")

        return queryset

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class MarcaCreateView(CreateView):
    model = Marca
    form_class = MarcaForm
    template_name = 'marca/crear.html'
    success_url = reverse_lazy('app:marca_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def form_valid(self, form):
        messages.success(self.request, 'Se agrego la marca correctamente')
        return super().form_valid(form)
    
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Marca'
        context['entidad'] = 'Marca'
        context['listar_url'] = reverse_lazy('app:marca_lista')
        
        return context


@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class MarcaUpdateView(UpdateView):
    model = Marca
    form_class = MarcaForm
    template_name = 'marca/crear.html'
    success_url = reverse_lazy('app:marca_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def form_valid(self, form):
        messages.success(self.request, 'Se edito la marca correctamente')
        return super().form_valid(form)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Marca'
        context['entidad'] = 'Marca'
        context['listar_url'] = reverse_lazy('app:marca_lista')
        
        return context

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class MarcaDeleteView(DeleteView):
    model = Marca
    template_name = 'marca/eliminar.html'
    success_url = reverse_lazy('app:marca_lista')
    
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Marca'
        context['entidad'] = 'Marca'
        context['listar_url'] = reverse_lazy('app:marca_lista')
        return context
    
    def post(self, request, *args, **kwargs):
        try:
            # Intentar eliminar la marca
            response = super().delete(request, *args, **kwargs)
            # Si no hay error, mostrar mensaje de éxito
            messages.success(request, 'La marca se eliminó correctamente.')
            return response
        except ProtectedError:
            # Si hay un error por relaciones protegidas, mostrar mensaje de error
            messages.error(request, 'No se puede eliminar porque está relacionado con otros registros.')
            return redirect(self.success_url)
    
    def get(self, request, *args, **kwargs):
        try:
            return super().get(request, *args, **kwargs)
        except Http404:
            messages.error(request, 'La marca no existe o ya ha sido eliminada.')
            return redirect(self.success_url)