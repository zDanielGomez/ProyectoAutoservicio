# Generated by Django 5.1 on 2024-09-05 04:47

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0011_remove_venta_producto'),
    ]

    operations = [
        migrations.CreateModel(
            name='Det_Venta',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.PositiveIntegerField()),
                ('id_producto', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.producto')),
                ('id_venta', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.venta')),
            ],
            options={
                'verbose_name': 'Detalle venta',
                'verbose_name_plural': 'Detalles de ventas',
                'db_table': 'Detalle_Venta',
            },
        ),
    ]