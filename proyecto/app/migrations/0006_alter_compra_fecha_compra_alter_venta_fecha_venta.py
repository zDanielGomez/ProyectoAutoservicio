# Generated by Django 5.0.7 on 2024-07-16 22:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0005_alter_compra_fecha_compra_alter_venta_fecha_venta'),
    ]

    operations = [
        migrations.AlterField(
            model_name='compra',
            name='fecha_compra',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='venta',
            name='fecha_venta',
            field=models.DateTimeField(auto_now=True),
        ),
    ]
