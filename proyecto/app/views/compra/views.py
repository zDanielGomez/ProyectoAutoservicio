from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.shortcuts import render
from django.views.decorators.cache import never_cache
from django.core.exceptions import ValidationError
from app.models import Compra  # Cambiado de Proveedor a Compra
from app.forms import CompraForm  # Cambiado de ProveedorForm a CompraForm
from app.views import *

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class CompraListView(ListView):
    model = Compra
    template_name = 'compra/listar.html'  # Cambiado de proveedor/listar.html a compra/listar.html

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de compras'  # Cambiado de Listado de proveedores a Listado de compras
        context['entidad'] = 'Listado de compras'  # Cambiado de Listado de proveedores a Listado de compras
        context['listar_url'] = reverse_lazy('app:compra_lista')  # Cambiado de proveedor_lista a compra_lista
        context['crear_url'] = reverse_lazy('app:compra_crear')  # Cambiado de proveedor_crear a compra_crear
        context['has_permission'] = self.request.user.has_perm('app.view_compra')  # Cambiado de view_proveedor a view_compra

        if self.request.user.groups.filter(name='Compra').exists():
            context['can_add'] = False
        else:
            context['can_add'] = self.request.user.has_perm('app.add_compra')  # Cambiado de add_proveedor a add_compra

        return context

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class CompraCreateView(CreateView):
    model = Compra
    form_class = CompraForm  # Cambiado de ProveedorForm a CompraForm
    template_name = 'compra/crear.html'  # Cambiado de proveedor/crear.html a compra/crear.html
    success_url = reverse_lazy('app:compra_lista')  # Cambiado de proveedor_lista a compra_lista

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Registrar compra'  # Cambiado de Registrar proveedor a Registrar compra
        context['entidad'] = 'Registrar compra'  # Cambiado de Registrar proveedor a Registrar compra
        context['listar_url'] = reverse_lazy('app:compra_lista')  # Cambiado de proveedor_lista a compra_lista
        context['has_permission'] = not self.request.user.groups.filter(name='Compra').exists() and self.request.user.has_perm('app.add_compra')  # Cambiado de add_proveedor a add_compra
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.add_compra') or self.request.user.groups.filter(name='Compra').exists():  # Cambiado de add_proveedor a add_compra
            list_context = CompraListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'compra/listar.html', list_context)  # Cambiado de proveedor/listar.html a compra/listar.html
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        try:
            return super().form_valid(form)
        except ValidationError as e:
            form.add_error(None, e)
            return self.form_invalid(form)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class CompraUpdateView(UpdateView):
    model = Compra
    form_class = CompraForm  # Cambiado de ProveedorForm a CompraForm
    template_name = 'compra/crear.html'  # Cambiado de proveedor/crear.html a compra/crear.html
    success_url = reverse_lazy('app:compra_lista')  # Cambiado de proveedor_lista a compra_lista

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar compra'  # Cambiado de Editar proveedor a Editar compra
        context['entidad'] = 'Editar compra'  # Cambiado de Editar proveedor a Editar compra
        context['listar_url'] = reverse_lazy('app:compra_lista')  # Cambiado de proveedor_lista a compra_lista
        context['has_permission'] = not self.request.user.groups.filter(name='Compra').exists() and self.request.user.has_perm('app.change_compra')  # Cambiado de change_proveedor a change_compra
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.change_compra') or self.request.user.groups.filter(name='Compra').exists():  # Cambiado de change_proveedor a change_compra
            list_context = CompraListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'compra/listar.html', list_context)  # Cambiado de proveedor/listar.html a compra/listar.html
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        try:
            return super().form_valid(form)
        except ValidationError as e:
            form.add_error(None, e)
            return self.form_invalid(form)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class CompraDeleteView(DeleteView):
    model = Compra
    template_name = 'compra/eliminar.html'  # Cambiado de proveedor/eliminar.html a compra/eliminar.html
    success_url = reverse_lazy('app:compra_lista')  # Cambiado de proveedor_lista a compra_lista

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar compra'  # Cambiado de Eliminar proveedor a Eliminar compra
        context['entidad'] = 'Eliminar compra'  # Cambiado de Eliminar proveedor a Eliminar compra
        context['listar_url'] = reverse_lazy('app:compra_lista')  # Cambiado de proveedor_lista a compra_lista
        context['has_permission'] = not self.request.user.groups.filter(name='Compra').exists() and self.request.user.has_perm('app.delete_compra')  # Cambiado de delete_proveedor a delete_compra
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.delete_compra') or self.request.user.groups.filter(name='Compra').exists():  # Cambiado de delete_proveedor a delete_compra
            list_context = CompraListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'compra/listar.html', list_context)  # Cambiado de proveedor/listar.html a compra/listar.html
        return super().dispatch(request, *args, **kwargs)
