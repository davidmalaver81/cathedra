from django.contrib.auth.hashers import check_password, make_password
from django.shortcuts import render, redirect
from usuarios.models import Usuario

def login_view(request):
    error = None
    if request.method == 'POST':
        correo = request.POST['username']
        password = request.POST['password']
        try:
            usuario = Usuario.objects.get(correo=correo)
            if check_password(password, usuario.contrasena):
                request.session['usuario_id'] = usuario.id_usuario
                request.session['usuario_nombre'] = usuario.nombre
                return redirect('inicio')
            else:
                error = 'Usuario o contraseña incorrectos'
        except Usuario.DoesNotExist:
            error = 'Usuario o contraseña incorrectos'
    return render(request, 'login.html', {'error': error})

def logout_view(request):
    request.session.flush()
    return redirect('landing')

def registro_view(request):
    error = None
    if request.method == 'POST':
        nombre = request.POST['first_name']
        correo = request.POST['email']
        password1 = request.POST['password1']
        password2 = request.POST['password2']

        if password1 != password2:
            error = 'Las contraseñas no coinciden'
        elif Usuario.objects.filter(correo=correo).exists():
            error = 'El correo ya está registrado'
        else:
            Usuario.objects.create(
                nombre=nombre,
                apellido='',
                correo=correo,
                contrasena=make_password(password1),
            )
            # Buscar el usuario recién creado y guardarlo en sesión
            usuario = Usuario.objects.get(correo=correo)
            request.session['usuario_id'] = usuario.id_usuario
            request.session['usuario_nombre'] = usuario.nombre
            return redirect('inicio')
    return render(request, 'login.html', {'error': error})

def inicio_view(request):
    if not request.session.get('usuario_id'):
        return redirect('login')
    return render(request, 'inicio.html')