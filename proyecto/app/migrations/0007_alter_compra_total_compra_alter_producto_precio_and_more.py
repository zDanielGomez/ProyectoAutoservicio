# Generated by Django 5.0.6 on 2024-06-17 15:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0006_rename_fecha_venta_fecha_venta_compra_fecha_compra'),
    ]

    operations = [
        migrations.AlterField(
            model_name='compra',
            name='total_compra',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=9),
        ),
        migrations.AlterField(
            model_name='producto',
            name='precio',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=9),
        ),
        migrations.AlterField(
            model_name='venta',
            name='total_venta',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=9),
        ),
    ]
