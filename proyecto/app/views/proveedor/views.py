from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.views.decorators.cache import never_cache
from django.utils.decorators import method_decorator
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.shortcuts import render
from django.core.exceptions import ValidationError
from app.models import Proveedor  # Cambiado de Empleado a Proveedor
from app.forms import ProveedorForm  # Cambiado de EmpleadoForm a ProveedorForm
from app.views import *

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class ProveedorListView(ListView):
    model = Proveedor
    template_name = 'proveedor/listar.html'  # Cambiado de empleado/listar.html a proveedor/listar.html

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de proveedores'  # Cambiado de empleados a proveedores
        context['entidad'] = 'Listado de proveedores'  # Cambiado de empleados a proveedores
        context['listar_url'] = reverse_lazy('app:proveedor_lista')  # Cambiado de empleado_lista a proveedor_lista
        context['crear_url'] = reverse_lazy('app:proveedor_crear')  # Cambiado de empleado_crear a proveedor_crear
        context['has_permission'] = self.request.user.has_perm('app.view_proveedor')  # Cambiado de view_empleado a view_proveedor

        if self.request.user.groups.filter(name='Proveedor').exists():
            context['can_add'] = False
        else:
            context['can_add'] = self.request.user.has_perm('app.add_proveedor')  # Cambiado de add_empleado a add_proveedor

        return context

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class ProveedorCreateView(CreateView):
    model = Proveedor
    form_class = ProveedorForm  # Cambiado de EmpleadoForm a ProveedorForm
    template_name = 'proveedor/crear.html'  # Cambiado de empleado/crear.html a proveedor/crear.html
    success_url = reverse_lazy('app:proveedor_lista')  # Cambiado de empleado_lista a proveedor_lista

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Registrar proveedor'  # Cambiado de Registrar empleado a Registrar proveedor
        context['entidad'] = 'Registrar proveedor'  # Cambiado de Registrar empleado a Registrar proveedor
        context['listar_url'] = reverse_lazy('app:proveedor_lista')  # Cambiado de empleado_lista a proveedor_lista
        context['has_permission'] = not self.request.user.groups.filter(name='Proveedor').exists() and self.request.user.has_perm('app.add_proveedor')  # Cambiado de add_empleado a add_proveedor
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.add_proveedor') or self.request.user.groups.filter(name='Proveedor').exists():  # Cambiado de add_empleado a add_proveedor
            list_context = ProveedorListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'proveedor/listar.html', list_context)  # Cambiado de empleado/listar.html a proveedor/listar.html
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        try:
            return super().form_valid(form)
        except ValidationError as e:
            form.add_error(None, e)
            return self.form_invalid(form)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class ProveedorUpdateView(UpdateView):
    model = Proveedor
    form_class = ProveedorForm  # Cambiado de EmpleadoForm a ProveedorForm
    template_name = 'proveedor/crear.html'  # Cambiado de empleado/crear.html a proveedor/crear.html
    success_url = reverse_lazy('app:proveedor_lista')  # Cambiado de empleado_lista a proveedor_lista

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar proveedor'  # Cambiado de Editar empleado a Editar proveedor
        context['entidad'] = 'Editar proveedor'  # Cambiado de Editar empleado a Editar proveedor
        context['listar_url'] = reverse_lazy('app:proveedor_lista')  # Cambiado de empleado_lista a proveedor_lista
        context['has_permission'] = not self.request.user.groups.filter(name='Proveedor').exists() and self.request.user.has_perm('app.change_proveedor')  # Cambiado de change_empleado a change_proveedor
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.change_proveedor') or self.request.user.groups.filter(name='Proveedor').exists():  # Cambiado de change_empleado a change_proveedor
            list_context = ProveedorListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'proveedor/listar.html', list_context)  # Cambiado de empleado/listar.html a proveedor/listar.html
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        try:
            return super().form_valid(form)
        except ValidationError as e:
            form.add_error(None, e)
            return self.form_invalid(form)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class ProveedorDeleteView(DeleteView):
    model = Proveedor
    template_name = 'proveedor/eliminar.html'  # Cambiado de empleado/eliminar.html a proveedor/eliminar.html
    success_url = reverse_lazy('app:proveedor_lista')  # Cambiado de empleado_lista a proveedor_lista

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar proveedor'  # Cambiado de Eliminar empleado a Eliminar proveedor
        context['entidad'] = 'Eliminar proveedor'  # Cambiado de Eliminar empleado a Eliminar proveedor
        context['listar_url'] = reverse_lazy('app:proveedor_lista')  # Cambiado de empleado_lista a proveedor_lista
        context['has_permission'] = not self.request.user.groups.filter(name='Proveedor').exists() and self.request.user.has_perm('app.delete_proveedor')  # Cambiado de delete_empleado a delete_proveedor
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.delete_proveedor') or self.request.user.groups.filter(name='Proveedor').exists():  # Cambiado de delete_empleado a delete_proveedor
            list_context = ProveedorListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'proveedor/listar.html', list_context)  # Cambiado de empleado/listar.html a proveedor/listar.html
        return super().dispatch(request, *args, **kwargs)
