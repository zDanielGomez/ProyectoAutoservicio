# Generated by Django 5.0.6 on 2024-06-14 14:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_producto_compra_venta'),
    ]

    operations = [
        migrations.RenameField(
            model_name='venta',
            old_name='id_compra',
            new_name='id_venta',
        ),
    ]
