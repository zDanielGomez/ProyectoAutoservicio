import json
from django.http import Http404, JsonResponse
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.shortcuts import render , redirect
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.views.decorators.cache import never_cache
from django.core.exceptions import ValidationError
from app.models import Compra, Det_Compra, Producto  # Cambiado de Proveedor a Compra
from app.forms import CompraForm  # Cambiado de ProveedorForm a CompraForm
from app.views import *
from django.contrib import messages
import re

def lista_compra(request):
    
    nombre = {
        
        'titulo': 'Listado de Compras',
        'empleados': Compra.objects.all()
    }
    
    return render(request, "compra/listar.html", nombre)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class CompraListView(ListView):
    model = Compra
    template_name = 'compra/listar.html'  # Cambiado de proveedor/listar.html a compra/listar.html

    
    
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try: 
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Compra.objects.all():
                    data.append(i.toJSON())
            elif action == "search_details_prod":
                data = []
                for i in Det_Compra.objects.filter(id_compra_id=request.POST['id']):
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        
        print(data)
        return JsonResponse(data, safe=False)
    


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
    
    def get_queryset(self):
        queryset = super().get_queryset()
        # Obtiene los parámetros de consulta de la URL
        id = self.request.GET.get('id')
        fecha = self.request.GET.get('fecha')
        proveedor_nombres = self.request.GET.get('proveedor')

        # Filtra los resultados según los parámetros proporcionados
        if id:
            if int(id) >= 1:  # Verifica que el número sea positivo
                    queryset = queryset.filter(id=id)
            else:
                messages.error(self.request, "El ID debe ser un número positivo.")
        
        if fecha:
            queryset = queryset.filter(fecha_compra__icontains=fecha)
        if proveedor_nombres:
            if re.match("^[A-Za-z0-9\\s]+$", proveedor_nombres):  # Solo letras, números y espacios
                queryset = queryset.filter(proveedor__nombres__icontains=proveedor_nombres)
            else:
                messages.error(self.request, "El nombre no puede contener caracteres especiales.")

        return queryset


@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
class CompraCreateView(CreateView):
    model = Compra
    form_class = CompraForm  # Cambiado de ProveedorForm a CompraForm
    template_name = 'compra/crear.html'  # Cambiado de proveedor/crear.html a compra/crear.html
    success_url = reverse_lazy('app:compra_lista')# Cambiado de proveedor_lista a compra_lista
    url_redirect = success_url

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        if not self.request.user.has_perm('app.add_compra') or self.request.user.groups.filter(name='Compra').exists():  # Cambiado de add_proveedor a add_compra
            list_context = CompraListView.as_view()(request, *args, **kwargs).context_data
            return render(request, 'compra/listar.html', list_context)  # Cambiado de proveedor/listar.html a compra/listar.html
        return super().dispatch(request, *args, **kwargs)
    
    
    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'search_products':
                data = []
                ids_existentes = json.loads(request.POST['ids'])
                print(ids_existentes)
                prods = Producto.objects.filter(nombre__icontains=request.POST['term'],estado="Activo").exclude(id__in=ids_existentes)[0:10]
                for i in prods:
                    item = i.toJSON()
                    item['value'] = i.nombre
                    data.append(item)
            elif action == 'add':
                print(request.POST['compras'])
                compras = json.loads(request.POST['compras'])
                compra = Compra()
                compra.fecha_compra=compras["fecha_compra"]
                compra.proveedor_id =compras["proveedor"]
                compra.total_compra=float(compras["subtotal"])
                compra.save()
                for i in compras['products']:
                    det= Det_Compra()
                    det.id_compra_id = compra.id
                    det.id_producto_id = i['id']
                    det.cantidad = int(i['cant'])
                    det.precio = float(i['precio'])
                    det.subtotal = float(i['subtotal'])
                    det.save()
                    
                    det.id_producto.cantidad+=det.cantidad
                    det.id_producto.save()
            else:
                data['error'] = 'z'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Registrar compra'  # Cambiado de Registrar proveedor a Registrar compra
        context['entidad'] = 'Registrar compra'  # Cambiado de Registrar proveedor a Registrar compra
        context['listar_url'] = reverse_lazy('app:compra_lista')  # Cambiado de proveedor_lista a compra_lista
        context['has_permission'] = not self.request.user.groups.filter(name='Compra').exists() and self.request.user.has_perm('app.add_compra')  # Cambiado de add_proveedor a add_compra
        context['action'] = 'add'
        context['det'] = []
        return context
    
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
    
    def delete(self, request, *args, **kwargs):
        messages.success(request, 'La compra se eliminó correctamente.')
        return super().delete(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        try:
            return super().get(request, *args, **kwargs)
        except Http404:
            messages.error(request, 'La compra no existe o ya ha sido eliminada.')
            return redirect(self.success_url)
