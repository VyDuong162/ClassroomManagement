from django.contrib.auth import authenticate
from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.pagination import LimitOffsetPagination
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.status import HTTP_404_NOT_FOUND, HTTP_200_OK
from rest_framework.views import APIView

from rest_framework import generics
from .models import Assignments, Student, Submits
from .serializers import SubmitSerializer

class Login(APIView):

    def post(self, request):
        user = authenticate(username=request.data.get("username"), password=request.data.get("password"))
        if not user:
            return Response({'error': 'Credentials are incorrect or user does not exist'}, status=HTTP_404_NOT_FOUND)
        token, _ = Token.objects.get_or_create(user=user)
        return Response({'token': token.key}, status=HTTP_200_OK)

class SubmitsViewSet(viewsets.ModelViewSet):
    queryset = Submits.objects.all()
    serializer_class = SubmitSerializer
    authentication_classes = []
    permission_classes = []
  
class AllSubmits(generics.ListAPIView):
    queryset = Submits.objects.all()
    serializer_class = SubmitSerializer
    authentication_classes = []
    permission_classes = []
# def submit_list(request):

#     if request.method == 'GET':
#         ả
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
