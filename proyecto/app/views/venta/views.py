import json
import os
import django
import django.conf
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views import View
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator
from django.shortcuts import render, redirect
from app.forms import VentaForm, Venta
from django.views.decorators.cache import never_cache
from app.models import Producto , Det_Venta
from django.conf import settings
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa
from django.contrib.staticfiles import finders



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
                ids_existentes = json.loads(request.POST['ids'])
                print(ids_existentes)
                prods = Producto.objects.filter(cantidad__gt=0,nombre__icontains=request.POST['term']).exclude(id__in=ids_existentes)[0:10]
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

class VentaFacturaView(View):
    def link_callback(self,uri, rel):
            """
            Convert HTML URIs to absolute system paths so xhtml2pdf can access those
            resources
            """
            result = finders.find(uri)
            if result:
                    if not isinstance(result, (list, tuple)):
                            result = [result]
                    result = list(os.path.realpath(path) for path in result)
                    path=result[0]
            else:
                    sUrl = settings.STATIC_URL        # Typically /static/
                    sRoot = settings.STATIC_ROOT      # Typically /home/userX/project_static/
                    mUrl = settings.MEDIA_URL         # Typically /media/
                    mRoot = settings.MEDIA_ROOT       # Typically /home/userX/project_static/media/

                    if uri.startswith(mUrl):
                            path = os.path.join(mRoot, uri.replace(mUrl, ""))
                    elif uri.startswith(sUrl):
                            path = os.path.join(sRoot, uri.replace(sUrl, ""))
                    else:
                            return uri

            # make sure that file exists
            if not os.path.isfile(path):
                    raise RuntimeError(
                            'media URI must start with %s or %s' % (sUrl, mUrl)
                    )
            return path
    def get(self,request,*arg,**kwargs):
        try:
            template = get_template("venta/factura.html")
            context = {
                'venta': Venta.objects.get(pk=self.kwargs['pk']),
                'autoservicio': {
                    'nombre':'Autoservicio el rincon de los angeles',
                    'nit':"123456",
                    'direccion': "Sogamoso"
                    },
                'logo':'{}{}'.format(settings.STATIC_URL, 'img/backup.png' )
                
                }
            html = template.render(context)
            response = HttpResponse(content_type='application/pdf')
            pisa_status = pisa.CreatePDF(
                html, dest=response,
                link_callback=self.link_callback
                )
            if pisa_status.err:
                return HttpResponse('We had some errors <pre>' + html + '</pre>')
            return response
        except:
            pass
        return HttpResponseRedirect(reverse_lazy('app:venta_lista'))
    