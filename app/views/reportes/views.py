import json
import os
from pipes import Template
from django.db.models import Sum, DecimalField
from django.db.models.functions import Coalesce
import django
import django.conf
from django.contrib.staticfiles import finders
from django.templatetags.static import static
from django.db.models import ProtectedError, Q
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views import View
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView , TemplateView
from django.utils.decorators import method_decorator
from django.shortcuts import render, redirect
from app.forms import ReportesForm, VentaForm, Venta
from django.views.decorators.cache import never_cache
from app.models import Producto , Det_Venta
from django.conf import settings
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa
from django.contrib.staticfiles import finders
from django.contrib import messages
import re

def lista_venta(request):
    
    nombre = {
        
        'titulo': 'Listado de Ventas',
        'empleados': Venta.objects.all()
    }
    
    return render(request, "venta/listar.html", nombre)

@method_decorator(login_required, name='dispatch')
@method_decorator(never_cache, name='dispatch')
@method_decorator(never_cache, name='dispatch') 
class ReportesVentasView(TemplateView):
    template_name = 'reportes/reportes.html'
    
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'buscar_reporte':
                data = []
                fecha1 = request.POST.get('fecha1')
                fecha2 = request.POST.get('fecha2')
                print(fecha1 + "soy la fecha 1")
                print(fecha2 + "soy la fecha 2")
                buscador = Venta.objects.all()
                if len(fecha1) and len(fecha2):
                    buscador = buscador.filter(fecha_venta__date__gte=fecha1, fecha_venta__date__lte=fecha2)
                    print("aaaa")
                    print(" resultados :", fecha1, "y", fecha2)
                    print(buscador)
                for z in buscador:
                    data.append([
                        z.id,
                        z.fecha_venta.strftime('%Y-%m-%d %H:%M'),
                        z.cliente.cc_cliente,
                        f"{z.cliente.nombres} {z.cliente.apellidos}",
                        format(z.total_venta,".2f"),
                    ])
                total = buscador.aggregate(r=Coalesce(Sum('total_venta'), 0, output_field=DecimalField())).get("r")
                print(total)
                data.append([
                    "",
                    "",
                    "",
                    "",
                    format(total,".2f")
                ])
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)
    
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['titulo'] = 'Reporte de Ventas'
        context['entidad'] = 'Reportes'
        context['listar_url'] = reverse_lazy('app:reportes_ventas')
        context['form'] = ReportesForm()
        return context

    def get_queryset(self):
        queryset = super().get_queryset()

        # Captura los parámetros de la URL
        id = self.request.GET.get('id')
        cc_cliente = self.request.GET.get('cc_cliente')
        cliente_nombres_o_apellidos = self.request.GET.get('cliente')
        empleado = self.request.GET.get('empleado')
        telefono = self.request.GET.get('telefono')

        if id:
            if int(id) >= 1: 
                    queryset = queryset.filter(id=id)
            else:
                messages.error(self.request, "El ID debe ser un número positivo.")
        if cliente_nombres_o_apellidos:
            if re.match("^[A-Za-zÀ-ÿ\\s]+$", cliente_nombres_o_apellidos): 
                queryset = queryset.filter(
                    Q(cliente__nombres__icontains=cliente_nombres_o_apellidos) |
                    Q(cliente__apellidos__icontains=cliente_nombres_o_apellidos)
                )
            else:
                messages.error(self.request, "El nombre del cliente solo debe contener letras")

        if cc_cliente:
            queryset = queryset.filter(cc_cliente__icontains=cc_cliente)
        if telefono:
            queryset = queryset.filter(telefono__icontains=telefono)
            
        if empleado:
            queryset = queryset.filter(empleado__icontains=empleado)
        
        return queryset