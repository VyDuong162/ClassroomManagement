from django.urls import path

from . import views

from .views import ResourceList, ResourceDetail, SectionList, SectionDetail

urlpatterns = [
    path('resource/',ResourceList.as_view()),
    path('resource/<int:pk>', ResourceDetail.as_view()),
    path('section/', SectionList.as_view()),
    path('section/<int:pk>', SectionDetail.as_view()),

]