# Generated by Django 5.1.1 on 2024-10-09 01:03

import app.models
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0024_alter_compra_proveedor_alter_venta_cliente_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='cliente',
            name='tipo_documento',
            field=models.CharField(choices=[('CC', 'Cédula de Ciudadanía'), ('CE', 'Cédula de Extranjería'), ('PSP', 'Pasaporte')], default='CC', max_length=3, verbose_name='Tipo de documento'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='cc_cliente',
            field=models.PositiveIntegerField(unique=True, validators=[app.models.Cliente.validar_numero_documento]),
        ),
        migrations.AlterField(
            model_name='det_compra',
            name='id_producto',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.producto'),
        ),
        migrations.AlterField(
            model_name='det_venta',
            name='id_producto',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.producto'),
        ),
    ]