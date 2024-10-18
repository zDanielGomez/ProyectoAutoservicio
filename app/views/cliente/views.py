import re
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
from django.db.models import ProtectedError

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
    
    def get_queryset(self):
        queryset = super().get_queryset()

        # Captura los parámetros de la URL
        id = self.request.GET.get('id')
        tipo_documento = self.request.GET.get('tipo_documento')
        cc_cliente = self.request.GET.get('cc_cliente')
        nombres = self.request.GET.get('nombres')
        apellidos = self.request.GET.get('apellidos')
        telefono = self.request.GET.get('telefono')
        estado = self.request.GET.get('estado')

        if id:
            if int(id) >= 1: 
                    queryset = queryset.filter(id=id)
            else:
                messages.error(self.request, "El ID debe ser un número positivo.")
        if nombres:
            if re.match("^[A-Za-z0-9\\s]+$", nombres):  
                queryset = queryset.filter(nombres__icontains=nombres)
            else:
                messages.error(self.request, "El nombre solo debe contener letras")
        if apellidos:
            if re.match("^[A-Za-z0-9\\s]+$", apellidos):
                queryset = queryset.filter(apellidos__icontains=apellidos)
            else:
                messages.error(self.request, "El apellido solo debe contener letras")
        if cc_cliente:
            queryset = queryset.filter(cc_cliente__icontains=cc_cliente)
        if telefono:
            queryset = queryset.filter(telefono__icontains=telefono)
            
        if estado:  # Filtrando por presentación usando la clave foránea
            queryset = queryset.filter(estado=estado)
            
        if tipo_documento:  # Filtrando por presentación usando la clave foránea
            queryset = queryset.filter(tipo_documento=tipo_documento)
        
        return queryset

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
    
    
    def form_valid(self, form):
        messages.success(self.request, 'Se agrego el cliente correctamente')
        return super().form_valid(form)
    
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
    
    def form_valid(self, form):
        messages.success(self.request, 'Se edito el cliente correctamente')
        return super().form_valid(form)
    
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
    
    def post(self, request, *args, **kwargs):
        try:
            # Intentar eliminar la marca
            response = super().delete(request, *args, **kwargs)
            # Si no hay error, mostrar mensaje de éxito
            messages.success(request, 'El cliente se eliminó correctamente.')
            return response
        except ProtectedError:
            # Si hay un error por relaciones protegidas, mostrar mensaje de error
            messages.error(request, 'No se puede eliminar porque está relacionado con otros registros.')
            return redirect(self.success_url)

    def get(self, request, *args, **kwargs):
        try:
            return super().get(request, *args, **kwargs)
        except Http404:
            messages.error(request, 'El cliente no existe o ya ha sido eliminado.')
            return redirect(self.success_url)
