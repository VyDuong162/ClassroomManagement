from django.urls import path

from . import views

urlpatterns = [
    path('', views.home),
    path('home/', views.home, name='home'),
    path('register/', views.UserRegister, name='register'),
    path('login/', views.UserLogin, name='login'),
    path('logout/', views.UserLogout, name='logout')
]