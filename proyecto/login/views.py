from django.shortcuts import render, redirect
from django.views.generic import RedirectView
from django.contrib.auth.views import LoginView
from django.contrib.auth import logout
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import messages
from django.views.generic import TemplateView
from django.contrib.auth import login
from django.contrib.auth.views import LoginView as DjangoLoginView

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
