import json
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.http import JsonResponse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator
from django.shortcuts import render, redirect
from app.forms import VentaForm, Venta
from django.views.decorators.cache import never_cache
from app.models import Producto , Det_Venta


def lista_venta(request):
    
    nombre = {
        
        'titulo': 'Listado de Ventas',
        'empleados': Venta.objects.all()
    }
    
    return render(request, "venta/listar.html", nombre)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
@method_decorator(never_cache, name='dispatch') 
class VentaListView(ListView):
    model = Venta
    template_name = 'venta/listdetalle.html'
    
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)


    def post(self, request, *args, **kwargs):
        data = {}
        try: 
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Venta.objects.all():
                    data.append(i.toJSON())
            elif action == "search_details_prod":
                data = []
                for i in Det_Venta.objects.filter(id_venta_id=request.POST['id']):
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Listado de Ventas'
        context['crear_url'] = reverse_lazy('app:venta_crear')
        context['entidad'] = 'Venta'
        return context
@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
@method_decorator(never_cache, name='dispatch')     
class VentaCreateView(CreateView):
    model = Venta
    form_class = VentaForm
    template_name = 'venta/crear.html'
    success_url = reverse_lazy('app:venta_lista')
    url_redirect = success_url
    
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'search_products':
                data = []
                prods = Producto.objects.filter(cantidad__gt=0,nombre__icontains=request.POST['term'])[0:10]
                for i in prods:
                    item = i.toJSON()
                    item['value'] = i.nombre
                    data.append(item)
            elif action == 'add':
                print(request.POST['vents'])
                vents = json.loads(request.POST['vents'])
                venta = Venta()
                venta.fecha_venta=vents["fecha_venta"]
                venta.cliente_id =vents["cliente"]
                venta.empleado_id =vents["empleado"]
                venta.total_venta=float(vents["subtotal"])
                venta.save()
                for i in vents['products']:
                    det= Det_Venta()
                    det.id_venta_id = venta.id
                    det.id_producto_id = i['id']
                    det.cantidad = int(i['cant'])
                    det.precio = float(i['precio'])
                    det.subtotal = float(i['subtotal'])
                    det.save()
                    
                    det.id_producto.cantidad-=det.cantidad
                    det.id_producto.save()
            else:
                data['error'] = 'z'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)
    

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Crear Venta'
        context['entidad'] = 'Ventas'
        context['listar_url'] = reverse_lazy('app:venta_lista')
        context['action'] = 'add'
        context['det'] = []

        return context
@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
@method_decorator(never_cache, name='dispatch') 
class VentaUpdateView(UpdateView):
    model = Venta
    form_class = VentaForm
    template_name = 'venta/crear.html'
    success_url = reverse_lazy('app:venta_lista')
    url_redirect = success_url
    
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'search_products':
                data = []
                prods = Producto.objects.filter(cantidad__gt=0,nombre__icontains=request.POST['term'])[0:10]
                for i in prods:
                    item = i.toJSON()
                    item['value'] = i.nombre
                    data.append(item)
            elif action == 'add':
                print(request.POST['vents'])
                vents = json.loads(request.POST['vents'])
                venta = Venta()
                venta.fecha_venta=vents["fecha_venta"]
                venta.cliente_id =vents["cliente"]
                venta.empleado_id =vents["empleado"]
                venta.total_venta=float(vents["subtotal"])
                venta.save()
                for i in vents['products']:
                    det= Det_Venta()
                    det.id_venta_id = venta.id
                    det.id_producto_id = i['id']
                    det.cantidad = int(i['cant'])
                    det.precio = float(i['precio'])
                    det.subtotal = float(i['subtotal'])
                    det.save()
                    
                    det.id_producto.cantidad-=det.cantidad
                    det.id_producto.save()
            else:
                data['error'] = 'z'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)
    
    def get_productos(self):
        data = []
        try:
            for i in Det_Venta.objects.filter(id_venta=self.get_object()):
                print(i)
                item = i.id_producto.toJSON()
                print(item)
                item['cant'] = i.cantidad
                data.append(item)
        except:
            pass
        return data
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Edición Venta'
        context['entidad'] = 'Ventas'
        context['listar_url'] = reverse_lazy('app:venta_lista')
        context['action'] = 'edit'
        context['det'] = json.dumps(self.get_productos())
        return context
@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
@method_decorator(never_cache, name='dispatch') 
class VentaDeleteView(DeleteView):
    model = Venta
    template_name = 'venta/eliminar.html'
    success_url = reverse_lazy('app:venta_lista')
    
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs): 
        return super().dispatch(request, *args, **kwargs)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Eliminar Venta'
        context['entidad'] = 'Ventas'
        context['listar_url'] = reverse_lazy('app:venta_lista')
        
        return context
