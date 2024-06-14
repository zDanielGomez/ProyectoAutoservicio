# Generated by Django 5.0.6 on 2024-06-14 13:59

import datetime
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_cliente_proveedor_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Producto',
            fields=[
                ('id_producto', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=200, verbose_name='Nombre')),
                ('descripcion', models.CharField(max_length=50, verbose_name='Descripcion')),
                ('cantidad', models.IntegerField(verbose_name='Cantidad')),
                ('precio', models.IntegerField(default=0.0)),
                ('id_categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.categoria')),
                ('id_marca', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.marca')),
                ('id_presentacion', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.presentacion')),
            ],
            options={
                'verbose_name': 'Producto',
                'verbose_name_plural': 'Productos',
                'db_table': 'Producto',
            },
        ),
        migrations.CreateModel(
            name='Compra',
            fields=[
                ('id_compra', models.AutoField(primary_key=True, serialize=False)),
                ('total_compra', models.IntegerField(default=0.0)),
                ('id_proveedor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.proveedor')),
                ('id_producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.producto')),
            ],
            options={
                'verbose_name': 'Compra',
                'verbose_name_plural': 'Compras',
                'db_table': 'Compra',
            },
        ),
        migrations.CreateModel(
            name='Venta',
            fields=[
                ('id_compra', models.AutoField(primary_key=True, serialize=False)),
                ('fecha', models.DateField(default=datetime.datetime.now)),
                ('total_venta', models.IntegerField(default=0.0)),
                ('cc_cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.cliente')),
                ('id_empleado', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.empleado')),
                ('id_producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.producto')),
            ],
            options={
                'verbose_name': 'Venta',
                'verbose_name_plural': 'Ventas',
                'db_table': 'Venta',
            },
        ),
    ]
