# Generated by Django 5.0.6 on 2024-06-14 14:18

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0004_rename_id_compra_venta_id_venta'),
    ]

    operations = [
        migrations.AlterField(
            model_name='venta',
            name='cc_cliente',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.cliente', verbose_name='Cliente'),
        ),
        migrations.AlterField(
            model_name='venta',
            name='id_empleado',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.empleado', verbose_name='Empleado'),
        ),
    ]
