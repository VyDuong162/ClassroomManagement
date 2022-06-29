"""ClassroomManagement URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static

from django.contrib import admin
from django.urls import path, include
from classroom.api import join, stream, student, classes, classroom, teacher



urlpatterns = [
    path('admin/', admin.site.urls),
    # API of Join
    path('api/join/list-create', join.JoinList.as_view(), name='join-create'),
    path('api/join/deatail/<int:pk>/', join.JoinDeatail.as_view(), name='join-delete'),

    # API of Stream
    path('api/stream/create', stream.StreamAPIView.as_view(), name='stream'),

    # API of Student
    path('api/student/create', student.StudentAPIView.as_view(), name='student'),

    # API of Teacher
    path('api/teacher/create', teacher.TeacherAPIView.as_view(), name='teacher'),

    # API of Classes
    path('api/classes/create', classes.ClassesAPIView.as_view(), name='classes'),

    # API of Class Room
    path('api/class-room/create', classroom.ClassRoomAPIView.as_view(), name='class-room'),

]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)