from django.urls import path, include

from . import views, api_views
from rest_framework.routers import DefaultRouter


router = DefaultRouter()
# task 3: API CRUD assignments
router.register(r'assignments', api_views.AssignmentsViewSet)

urlpatterns = [
    path('', views.home),
    path('home/', views.home, name='home'),
    path('register/', views.UserRegister, name='register'),
    path('login/', views.UserLogin, name='login'),
    path('logout/', views.UserLogout, name='logout'),
    path('api/', include((router.urls, 'api'))),

]