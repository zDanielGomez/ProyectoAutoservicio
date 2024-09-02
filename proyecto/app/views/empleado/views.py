from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.shortcuts import render
from django.views.decorators.cache import never_cache
from django.core.exceptions import ValidationError
from app.models import Empleado
from app.forms import EmpleadoForm
from app.views import *

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

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class EmpleadoCreateView(CreateView):
    model = Empleado
    form_class = EmpleadoForm
    template_name = 'empleado/crear.html'
    success_url = reverse_lazy('app:empleado_lista')

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

    def form_valid(self, form):
        try:
            return super().form_valid(form)
        except ValidationError as e:
            form.add_error(None, e)
            return self.form_invalid(form)

@method_decorator(never_cache, name='dispatch')
@method_decorator(login_required, name='dispatch')
class EmpleadoUpdateView(UpdateView):
    model = Empleado
    form_class = EmpleadoForm
    template_name = 'empleado/crear.html'
    success_url = reverse_lazy('app:empleado_lista')

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

    def form_valid(self, form):
        try:
            return super().form_valid(form)
        except ValidationError as e:
            form.add_error(None, e)
            return self.form_invalid(form)

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