from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.http import Http404, JsonResponse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator
from django.shortcuts import render, redirect
from app.models import *
from app.forms import *
from django.views.decorators.cache import never_cache
from django.contrib import messages
import logging
import re
from django.db.models import ProtectedError

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
    
    
        
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Productos'
        context['crear_url'] = reverse_lazy('app:producto_crear')
        context['entidad'] = 'Producto'
        context['marca'] = Marca.objects.all()  # Asumiendo que tienes un modelo Marca
        context['categoria'] = Categoria.objects.all()  # Asumiendo que tienes un modelo Categoria
        context['presentacion'] = Presentacion.objects.all()  # Asumiendo que tienes un modelo Presentacion
        return context
    
    logger = logging.getLogger(__name__)
    def get_queryset(self):
        queryset = super().get_queryset()

        id = self.request.GET.get('id')
        nombre = self.request.GET.get('nombre')
        marca = self.request.GET.get('marca')
        categoria = self.request.GET.get('categoria')
        presentacion = self.request.GET.get('presentacion')
        
        if id:
            if int(id) >= 1:
                queryset = queryset.filter(id=id)
            else:
                messages.error(self.request, "El ID debe ser un número válido.")

        if nombre:
            if re.match("^[A-Za-z0-9\\s]+$", nombre):  # Solo letras, números y espacios
                queryset = queryset.filter(nombre__icontains=nombre)
            else:
                messages.error(self.request, "El nombre no puede contener caracteres especiales")

        if marca:  # Filtrando por marca usando la clave foránea
            queryset = queryset.filter(marca__id=marca)

        if categoria:  # Filtrando por categoría usando la clave foránea
            queryset = queryset.filter(categoria__id=categoria)

        if presentacion:  # Filtrando por presentación usando la clave foránea
            queryset = queryset.filter(presentacion__id=presentacion)

        return queryset

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
            
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
    
    def form_valid(self, form):
        messages.success(self.request, 'Se agrego el producto correctamente')
        return super().form_valid(form)
    
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
    
    def form_valid(self, form):
        messages.success(self.request, 'Se edito el producto correctamente')
        return super().form_valid(form)
    
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
    
    def post(self, request, *args, **kwargs):
        try:
            response = super().delete(request, *args, **kwargs)
            messages.success(request, 'El producto se eliminó correctamente.')
            return response
        except ProtectedError:
            # Si hay un error por relaciones protegidas, mostrar mensaje de error
            messages.error(request, 'No se puede eliminar porque está relacionado con otros registros.')
            return redirect(self.success_url)

    def get(self, request, *args, **kwargs):
        try:
            return super().get(request, *args, **kwargs)
        except Http404:
            messages.error(request, 'El producto no existe o ya ha sido eliminado.')
            return redirect(self.success_url)
