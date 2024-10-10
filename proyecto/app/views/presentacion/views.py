import re
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
from django.db.models import ProtectedError

def lista_presentacion(request):
    
    nombre = {
        
        'titulo': 'Listado de Presentaciones',
        'Presentacion': Presentacion.objects.all()
    }
    
    return render(request, "presentacion/listar.html", nombre)


@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
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
    
    def get_queryset(self):
        queryset = super().get_queryset()
        # Obtiene los parámetros de consulta de la URL
        id = self.request.GET.get('id')
        descripcion = self.request.GET.get('descripcion')

        # Filtra los resultados según los parámetros proporcionados
        if id:
            if int(id) >= 1:  # Verifica que el número sea positivo
                    queryset = queryset.filter(id=id)
            else:
                messages.error(self.request, "El ID debe ser un número positivo.")
                
        if descripcion:
            if re.match("^[A-Za-z0-9\\s]+$", descripcion):  # Solo letras, números y espacios
                queryset = queryset.filter(descripcion__icontains=descripcion)
            else:
                messages.error(self.request, "La descripcion no puede contener caracteres especiales.")

        return queryset

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')  
class PresentacionCreateView(CreateView):
    model = Presentacion
    form_class = PresentacionForm
    template_name = 'presentacion/crear.html'
    success_url = reverse_lazy('app:presentacion_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def form_valid(self, form):
        messages.success(self.request, 'Se agrego la presentacion correctamente')
        return super().form_valid(form)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Presentacion'
        context['entidad'] = 'Presentacion'
        context['listar_url'] = reverse_lazy('app:presentacion_lista')
        
        return context

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class PresentacionUpdateView(UpdateView):
    model = Presentacion
    form_class = PresentacionForm
    template_name = 'presentacion/crear.html'
    success_url = reverse_lazy('app:presentacion_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def form_valid(self, form):
        messages.success(self.request, 'Se edito la presentacion correctamente')
        return super().form_valid(form)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar Presentacion'
        context['entidad'] = 'Presentacion'
        context['listar_url'] = reverse_lazy('app:presentacion_lista')
        
        return context
  
@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch') 
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
    
    def post(self, request, *args, **kwargs):
        try:
            # Intentar eliminar la marca
            response = super().delete(request, *args, **kwargs)
            # Si no hay error, mostrar mensaje de éxito
            messages.success(request, 'La presentacion se eliminó correctamente.')
            return response
        except ProtectedError:
            # Si hay un error por relaciones protegidas, mostrar mensaje de error
            messages.error(request, 'No se puede eliminar porque está relacionado con otros registros.')
            return redirect(self.success_url)

    def get(self, request, *args, **kwargs):
        try:
            return super().get(request, *args, **kwargs)
        except Http404:
            messages.error(request, 'La presentacion no existe o ya ha sido eliminada.')
            return redirect(self.success_url)