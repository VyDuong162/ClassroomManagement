from django.urls import path, include

from . import views
from rest_framework_simplejwt import views as jwt_views
# submission by vy
from . import  api_views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'submits', api_views.SubmitsViewSet)
# end submission
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
    # Submission
    path('api/all_submits/',api_views.AllSubmits.as_view(),name='all_submits'),
    path('api/', include((router.urls, 'api'))),
    path('submits/', views.submit_list, name='submit_list'),
    # path('submits/<int:pk>/', views.book_detail, name='book_detail'),
    # path('submits/<int:pk>/new/', views.review_edit, name='review_create'),
]