# Generated by Django 5.1 on 2024-08-16 02:53

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0007_alter_cliente_cc_cliente_alter_cliente_telefono_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='venta',
            name='fecha_venta',
            field=models.DateTimeField(default=datetime.datetime.now),
        ),
    ]
