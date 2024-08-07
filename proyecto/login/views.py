
from django.shortcuts import render,redirect
from django.http.response import HttpResponse as HttpResponse
from django.views.generic import RedirectView
from django.contrib.auth.views import LoginView
from django.contrib.auth import login, logout

class LoginFormView(LoginView):
    template_name="login.html"
    
    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return redirect("dashboard")
        return super().dispatch(request, *args, **kwargs)
            
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context ["titulo"] = "Iniciar Sesion"
        return context

class logoutredirect(RedirectView):
    pattern_name="login"
    
    def dispatch(self, request,*args ,**kwargs ):
        logout(request)
        return super().dispatch(request, *args, **kwargs)
    