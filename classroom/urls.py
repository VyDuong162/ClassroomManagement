from django.urls import path, include


from . import views, api_views
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt import views as jwt_views

router = DefaultRouter()
# task 3: API CRUD assignments
router.register(r'assignments', api_views.AssignmentsViewSet)

urlpatterns = [
    # path('', views.home),
    # path('home/', views.home, name='home'),
    # path('register/', views.UserRegister, name='register'),
    # path('login/', views.UserLogin, name='login'),
    # path('logout/', views.UserLogout, name='logout'),
    path('', views.apiOverview, name='apiOverview'),
    path('show/', views.ShowAll, name='show'),
    path('viewuser/<int:pk>', views.ViewById, name='viewbyid'),
    # path('register/', views.register, name='register'),
    path('register/', views.UserRegisterView.as_view(), name='register'),
    path('login/', views.UserLoginView.as_view(), name='login'),
    path('userinfo/', views.UserAPIView.as_view(), name='info'),
    path('logout/', views.UserLogoutView.as_view(), name='refresh'),
    path('refresh/', views.RefreshAPIView.as_view(), name='refresh'),
    path('api/', include((router.urls, 'api'))),

]



