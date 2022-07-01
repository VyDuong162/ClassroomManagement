from rest_framework import viewsets
from rest_framework.pagination import LimitOffsetPagination
from .models import Assignments,Teacher, Student
from .serializers import AssignmentsSerializer,StudentListSerializer, TeacherListSerializer
from rest_framework.response import Response
from rest_framework import status
from rest_framework.generics import (ListCreateAPIView,RetrieveUpdateDestroyAPIView)
from django.shortcuts import get_object_or_404

# task 3: API CRUD assignments
class AssignmentsViewSet(viewsets.ModelViewSet):
    queryset = Assignments.objects.order_by('-created_date')
    serializer_class = AssignmentsSerializer
    pagination_class = LimitOffsetPagination
    authentication_classes = []

# task 6: API CRUD User Profile    

class StudentDetailUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Student.objects.filter()
    model=Student
    serializer_class = StudentListSerializer
    lookup_field = 'username'
    def delete(self,request,*args,**kwargs):
        pk=self.kwargs.get('username')
        student=get_object_or_404(Student,username=pk)
        student.delete()
        return Response('Delete student successful!!',status=status.HTTP_200_OK)

class StudentListCreateAPIView(ListCreateAPIView):
    serializer_class=StudentListSerializer
    def get_queryset(self):
        student=Student.objects.all()
        return student
    
class TeacherDetailUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Teacher.objects.filter()
    model=Teacher
    serializer_class = TeacherListSerializer
    lookup_field = 'username'
    def delete(self,request,*args,**kwargs):
        pk=self.kwargs.get('username')
        teacher=get_object_or_404(Teacher,username=pk)
        if teacher:
            teacher.delete()
            return Response('Delete teacher successful!!',status=status.HTTP_200_OK)
        
class TeacherListCreateAPIView(ListCreateAPIView):
    serializer_class=TeacherListSerializer
    def get_queryset(self):
        teacher=Teacher.objects.all()
        return teacher
