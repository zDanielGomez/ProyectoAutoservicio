from django.http import Http404
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.shortcuts import render, redirect
from django.views.decorators.cache import never_cache
from django.core.exceptions import ValidationError
from app.models import Empleado
from app.forms import EmpleadoForm
from app.views import *
from django.contrib import messages
import re
from django.db.models import ProtectedError

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class EmpleadoListView(ListView):
    model = Empleado
    template_name = 'empleado/listar.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de empleados'
        context['entidad'] = 'Listado de empleados'
        context['listar_url'] = reverse_lazy('app:empleado_lista')
        context['crear_url'] = reverse_lazy('app:empleado_crear')
        context['has_permission'] = self.request.user.has_perm('app.view_empleado')

        if self.request.user.groups.filter(name='Empleado').exists():
            context['can_add'] = False
        else:
            context['can_add'] = self.request.user.has_perm('app.add_empleado')

        return context
    
    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = Empleado.objects.all()

        # Captura los parámetros de la URL
        id = self.request.GET.get('id')
        user = self.request.GET.get('user')
        nombre = self.request.GET.get('nombre')
        numero_documento = self.request.GET.get('numero_documento')
        telefono = self.request.GET.get('telefono')
        tipo_documento = self.request.GET.get('tipo_documento')

        if id:
            if int(id) >= 1:  # Verifica que el número sea positivo
                    queryset = queryset.filter(id=id)
            else:
                messages.error(self.request, "El ID no es válido.")

        # Filtra por nombre del cliente
        if user:
            if re.match("^[A-Za-zÀ-ÿ\\s]+$", user):  # Verifica que solo tenga letras (incluye acentos)
                queryset = queryset.filter(user__username__icontains=user)
            else:
                messages.error(self.request, "El nombre solo debe contener letras")
        
        # Validación para apellido (solo letras)
        if nombre:
            if re.match("^[A-Za-zÀ-ÿ\\s]+$", nombre):  # Verifica que solo tenga letras (incluye acentos)
                queryset = queryset.filter(nombre__icontains=nombre)
            else:
                messages.error(self.request, "El nombre solo debe contener letras")
                
        # Filtra por tipo de identificacion (ForeignKey)
        if tipo_documento:
            queryset = queryset.filter(tipo_documento__icontains=tipo_documento)
            
        # Filtra por Numero de identificacion del administrador
        if numero_documento:
            queryset = queryset.filter(numero_documento__icontains=numero_documento)
                
        # Filtra por telefono del administrador
        if telefono:
            queryset = queryset.filter(telefono__icontains=telefono)

        return queryset


@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class EmpleadoCreateView(CreateView):
    model = Empleado
    form_class = EmpleadoForm
    template_name = 'empleado/crear.html'
    success_url = reverse_lazy('app:empleado_lista')
    
    def form_valid(self, form):
        messages.success(self.request, 'Se agrego el empleado correctamente')
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Registrar empleado'
        context['entidad'] = 'Registrar empleado'
        context['listar_url'] = reverse_lazy('app:empleado_lista')
        context['has_permission'] = not self.request.user.groups.filter(name='Empleado').exists() and self.request.user.has_perm('app.add_empleado')
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.add_empleado') or self.request.user.groups.filter(name='Empleado').exists():
            list_context = EmpleadoListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'empleado/listar.html', list_context)
        return super().dispatch(request, *args, **kwargs)

    

@method_decorator(never_cache, name='dispatch')
@method_decorator(login_required, name='dispatch')
class EmpleadoUpdateView(UpdateView):
    model = Empleado
    form_class = EmpleadoForm
    template_name = 'empleado/crear.html'
    success_url = reverse_lazy('app:empleado_lista')
    
    def form_valid(self, form):
        messages.success(self.request, 'Se edito el empleado correctamente')
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar empleado'
        context['entidad'] = 'Editar empleado'
        context['listar_url'] = reverse_lazy('app:empleado_lista')
        context['has_permission'] = not self.request.user.groups.filter(name='Empleado').exists() and self.request.user.has_perm('app.change_empleado')
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.change_empleado') or self.request.user.groups.filter(name='Empleado').exists():
            list_context = EmpleadoListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'empleado/listar.html', list_context)
        return super().dispatch(request, *args, **kwargs)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class EmpleadoDeleteView(DeleteView):
    model = Empleado
    template_name = 'empleado/eliminar.html'
    success_url = reverse_lazy('app:empleado_lista')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar empleado'
        context['entidad'] = 'Eliminar empleado'
        context['listar_url'] = reverse_lazy('app:empleado_lista')
        context['has_permission'] = not self.request.user.groups.filter(name='Empleado').exists() and self.request.user.has_perm('app.delete_empleado')
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.delete_empleado') or self.request.user.groups.filter(name='Empleado').exists():
            list_context = EmpleadoListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'empleado/listar.html', list_context)
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request, *args, **kwargs):
        try:
            # Intentar eliminar la marca
            response = super().delete(request, *args, **kwargs)
            # Si no hay error, mostrar mensaje de éxito
            messages.success(request, 'El empleado se eliminó correctamente.')
            return response
        except ProtectedError:
            # Si hay un error por relaciones protegidas, mostrar mensaje de error
            messages.error(request, 'No se puede eliminar porque está relacionado con otros registros.')
            return redirect(self.success_url)

    def get(self, request, *args, **kwargs):
        try:
            return super().get(request, *args, **kwargs)
        except Http404:
            messages.error(request, 'El empleado no existe o ya ha sido eliminado.')
            return redirect(self.success_url)