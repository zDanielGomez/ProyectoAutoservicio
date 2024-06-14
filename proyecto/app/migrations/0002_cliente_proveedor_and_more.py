# Generated by Django 5.0.6 on 2024-06-14 12:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('cc_cliente', models.IntegerField(primary_key=True, serialize=False)),
                ('nombres', models.CharField(max_length=200, verbose_name='Nombres')),
                ('apellidos', models.CharField(max_length=200, verbose_name='Apellidos')),
                ('telefono', models.CharField(max_length=10, unique=True, verbose_name='Telefono')),
            ],
            options={
                'verbose_name': 'Cliente',
                'verbose_name_plural': 'Clientes',
                'db_table': 'Cliente',
            },
        ),
        migrations.CreateModel(
            name='Proveedor',
            fields=[
                ('id_proveedor', models.AutoField(primary_key=True, serialize=False)),
                ('nombres', models.CharField(max_length=200, verbose_name='Nombres')),
                ('telefono', models.CharField(max_length=10, unique=True, verbose_name='Telefono')),
                ('correo', models.CharField(max_length=200, verbose_name='Correo')),
            ],
            options={
                'verbose_name': 'Proveedor',
                'verbose_name_plural': 'Proveedores',
                'db_table': 'Proveedor',
            },
        ),
        migrations.RenameField(
            model_name='categoria',
            old_name='Id_categoria',
            new_name='id_categoria',
        ),
        migrations.RenameField(
            model_name='categoria',
            old_name='Nombre',
            new_name='nombre',
        ),
        migrations.RenameField(
            model_name='empleado',
            old_name='Apellidos',
            new_name='apellidos',
        ),
        migrations.RenameField(
            model_name='empleado',
            old_name='Id_empleado',
            new_name='id_empleado',
        ),
        migrations.RenameField(
            model_name='empleado',
            old_name='Nombres',
            new_name='nombres',
        ),
        migrations.RenameField(
            model_name='empleado',
            old_name='Telefono',
            new_name='telefono',
        ),
        migrations.RenameField(
            model_name='marca',
            old_name='Id_marca',
            new_name='id_marca',
        ),
        migrations.RenameField(
            model_name='marca',
            old_name='Nombre',
            new_name='nombre',
        ),
        migrations.RenameField(
            model_name='presentacion',
            old_name='Descripcion',
            new_name='descripcion',
        ),
        migrations.RenameField(
            model_name='presentacion',
            old_name='Id_presentacion',
            new_name='id_presentacion',
        ),
    ]
