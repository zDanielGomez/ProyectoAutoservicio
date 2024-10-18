from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_protect,csrf_exempt
from django.http import Http404, JsonResponse
from django.views.generic import ListView, CreateView,UpdateView,DeleteView
from django.utils.decorators import method_decorator
from django.shortcuts import render,redirect
from app.models import *
from app.forms import *
from django.views.decorators.cache import never_cache
from django.contrib import messages
import re
from django.db.models import ProtectedError

def lista_categoria(request):
    
    nombre = {
        
        'titulo': 'Listado de categorias',
        'categorias': Categoria.objects.all()
    }
    
    return render(request, "categoria/listar.html", nombre)

@method_decorator(login_required, name='dispatch')
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
    
    def get_queryset(self):
        queryset = super().get_queryset()

        id = self.request.GET.get('id')
        nombre = self.request.GET.get('nombre')
        estado = self.request.GET.get('estado')

        if id:
            if int(id) >= 1: 
                    queryset = queryset.filter(id=id)
            else:
                messages.error(self.request, "El ID debe ser un número positivo.")
                
        if nombre:
            if re.match("^[A-Za-z0-9\\s]+$", nombre): 
                queryset = queryset.filter(nombre__icontains=nombre)
            else:
                messages.error(self.request, "El nombre no puede contener caracteres especiales.")
        
        if estado:  # Filtrando por presentación usando la clave foránea
            queryset = queryset.filter(estado=estado)

        return queryset
@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')  
class CategoriaCreateView(CreateView):
    model = Categoria
    form_class = CategoriaForm
    template_name = 'categoria/crear.html'
    success_url = reverse_lazy('app:categoria_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def form_valid(self, form):
        messages.success(self.request, 'Se agrego la categoria correctamente')
        return super().form_valid(form)
    
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Categoria'
        context['entidad'] = 'Categorías'
        context['listar_url'] = reverse_lazy('app:categoria_lista')
        
        return context

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class CategoriaUpdateView(UpdateView):
    model = Categoria
    form_class = CategoriaForm
    template_name = 'categoria/crear.html'
    success_url = reverse_lazy('app:categoria_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def form_valid(self, form):
        messages.success(self.request, 'Se edito la categoria correctamente')
        return super().form_valid(form)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Categoria'
        context['entidad'] = 'Categorías'
        context['listar_url'] = reverse_lazy('app:categoria_lista')
        
        return context
    
@method_decorator(login_required, name='dispatch')
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
    
    def post(self, request, *args, **kwargs):
        try:
            # Intentar eliminar la marca
            response = super().delete(request, *args, **kwargs)
            # Si no hay error, mostrar mensaje de éxito
            messages.success(request, 'La categoria se eliminó correctamente.')
            return response
        except ProtectedError:
            # Si hay un error por relaciones protegidas, mostrar mensaje de error
            messages.error(request, 'No se puede eliminar porque está relacionado con otros registros')
            return redirect(self.success_url)

    def get(self, request, *args, **kwargs):
        try:
            return super().get(request, *args, **kwargs)
        except Http404:
            messages.error(request, 'la categoria no existe o ya ha sido eliminada.')
            return redirect(self.success_url)