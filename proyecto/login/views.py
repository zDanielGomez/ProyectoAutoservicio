from django.shortcuts import render, redirect
from django.views.generic import RedirectView
from django.contrib.auth.views import LoginView
from django.contrib.auth import logout
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import messages
from django.views.generic import TemplateView
from django.contrib.auth import login
from django.contrib.auth.views import LoginView as DjangoLoginView
from django.urls import reverse_lazy
from django.views.generic.edit import FormView
from .forms import CustomPasswordResetForm  # Asegúrate de que la ruta sea correcta
from django.conf import settings
from django.contrib.auth.forms import PasswordResetForm
from django.views.generic.edit import FormView
from django.urls import reverse_lazy

class CustomPasswordResetView(FormView):
    template_name = 'register/password_reset_form.html'
    form_class = CustomPasswordResetForm
    success_url = reverse_lazy('password_reset_done')

    def form_valid(self, form):
        # Sobrescribe el método para asegurarte de usar la plantilla HTML correcta
        opts = {
            'use_https': self.request.is_secure(),
            'from_email': settings.DEFAULT_FROM_EMAIL,
            'request': self.request,
            'html_email_template_name': 'register/password_reset_email.html',  # Usamos la plantilla personalizada
        }
        form.save(**opts)  # Envía el correo de restablecimiento de contraseña
        return super().form_valid(form)

class LoginFormView(DjangoLoginView):
    template_name = "login.html"
    
    def form_invalid(self, form):
        # Verifica si el formulario contiene errores
        if form.non_field_errors():
            # Mensaje general de error
            messages.error(self.request, "Nombre de usuario o contraseña incorrectos.")
        return super().form_invalid(form)
    
    def form_valid(self, form):
        user = form.get_user()
        if user is not None:
            login(self.request, user)
            return redirect('dashboard')  # Cambia 'dashboard' por la vista a la que quieres redirigir
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["titulo"] = "Iniciar Sesión"
        return context

class LogoutRedirect(RedirectView):
    pattern_name = "login"
    
    def dispatch(self, request, *args, **kwargs):
        logout(request)
        return super().dispatch(request, *args, **kwargs)
