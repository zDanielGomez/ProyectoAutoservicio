import re
from django.contrib import messages
from django.http import Http404
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.decorators.cache import never_cache
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.shortcuts import redirect, render
from django.core.exceptions import ValidationError
from app.models import Administrador
from app.forms import AdministradorForm

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class AdministradorListView(ListView):
    model = Administrador
    template_name = 'administrador/listar.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de administradores'
        context['entidad'] = 'Listado de administradores'
        context['listar_url'] = reverse_lazy('app:administrador_lista')
        context['crear_url'] = reverse_lazy('app:administrador_crear')
        context['has_permission'] = self.request.user.has_perm('app.view_administrador')

        if self.request.user.groups.filter(name='Operador').exists():
            context['can_add'] = False
        else:
            context['can_add'] = self.request.user.has_perm('app.add_administrador')

        return context
    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = Administrador.objects.all()

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
            queryset = queryset.filter(tipo_documento=tipo_documento)
            
        # Filtra por Numero de identificacion del administrador
        if numero_documento:
            queryset = queryset.filter(numero_documento__icontains=numero_documento)
                
        # Filtra por telefono del administrador
        if telefono:
            queryset = queryset.filter(telefono__icontains=telefono)

        return queryset

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class AdministradorCreateView(CreateView):
    model = Administrador
    form_class = AdministradorForm
    template_name = 'administrador/crear.html'
    success_url = reverse_lazy('app:administrador_lista')
    
    def form_valid(self, form):
        messages.success(self.request, 'Se agrego el administrador correctamente')
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Registrar administrador'
        context['entidad'] = 'Registrar administrador'
        context['listar_url'] = reverse_lazy('app:administrador_lista')
        context['has_permission'] = not self.request.user.groups.filter(name='Operador').exists() and self.request.user.has_perm('app.add_administrador')
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.add_administrador') or self.request.user.groups.filter(name='Operador').exists():
            list_context = AdministradorListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'administrador/listar.html', list_context)
        return super().dispatch(request, *args, **kwargs)

    

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class AdministradorUpdateView(UpdateView):
    model = Administrador
    form_class = AdministradorForm
    template_name = 'administrador/crear.html'
    success_url = reverse_lazy('app:administrador_lista')
    
    def form_valid(self, form):
        messages.success(self.request, 'Se edito el administrador correctamente')
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Editar administrador'
        context['entidad'] = 'Editar administrador'
        context['listar_url'] = reverse_lazy('app:administrador_lista')
        context['has_permission'] = not self.request.user.groups.filter(name='Operador').exists() and self.request.user.has_perm('app.change_administrador')
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.change_administrador') or self.request.user.groups.filter(name='Operador').exists():
            list_context = AdministradorListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'administrador/listar.html', list_context)
        return super().dispatch(request, *args, **kwargs)


@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class AdministradorDeleteView(DeleteView):
    model = Administrador
    template_name = 'administrador/eliminar.html'
    success_url = reverse_lazy('app:administrador_lista')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar administrador'
        context['entidad'] = 'Eliminar administrador'
        context['listar_url'] = reverse_lazy('app:administrador_lista')
        context['has_permission'] = not self.request.user.groups.filter(name='Operador').exists() and self.request.user.has_perm('app.delete_administrador')
        return context

    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.delete_administrador') or self.request.user.groups.filter(name='Operador').exists():
            list_context = AdministradorListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'administrador/listar.html', list_context)
        return super().dispatch(request, *args, **kwargs)
    
    def delete(self, request, *args, **kwargs):
        messages.success(request, 'El administrador se eliminó correctamente.')
        return super().delete(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        try:
            return super().get(request, *args, **kwargs)
        except Http404:
            messages.error(request, 'El administrador no existe o ya ha sido eliminado.')
            return redirect(self.success_url)