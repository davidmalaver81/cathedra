from django.db import models

class Rol(models.Model):
    id_rol = models.AutoField(primary_key=True)
    nombre_rol = models.CharField(max_length=50, unique=True)

    class Meta:
        managed = True
        db_table = 'roles'

    def __str__(self):
        return self.nombre_rol


class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    correo = models.CharField(max_length=150, unique=True)
    contrasena = models.CharField(max_length=255)
    telefono = models.CharField(max_length=20, null=True, blank=True)
    fecha_registro = models.DateTimeField(auto_now_add=True)
    id_rol = models.ForeignKey(Rol, on_delete=models.SET_NULL, null=True, db_column='id_rol')

    class Meta:
        managed = True
        db_table = 'usuarios'

    def __str__(self):
        return f'{self.nombre} {self.apellido}'