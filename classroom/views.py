from django.contrib.auth.hashers import make_password
from django.http import JsonResponse
from classroom.authentication import create_access_token, create_refresh_token

# Create your views here.
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.views import APIView

from .serializers import RegisterSerializer, UserSerializer, UserLoginSerializer
from .models import User
from .authentication import create_access_token, create_refresh_token, decode_access_token, decode_refresh_token

import mysql.connector

from operator import itemgetter

# Create your views here.

@api_view(['GET'])
def apiOverview(request):
    api_urls = {
        'Show': '/show',
        'Register': '/register',
        'Login': '/login',
        'Logout': '/logout',
        'Refresh Access Token': '/refresh',
        'User Info': '/userinfo',
        'submit' :'api/submits'
    }

    return Response(api_urls)

@api_view(['GET'])
def ShowAll(request):
    users = User.objects.all()
    serializer = UserSerializer(users, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def ViewById(request, pk):
    users = User.objects.get(id=pk)
    serializer = UserSerializer(users, many=False)
    return Response(serializer.data)

@api_view(['POST'])
def register(request):
    serializer = UserSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

class UserRegisterView(generics.GenericAPIView):
    serializer_class = RegisterSerializer
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.validated_data['password'] = make_password(serializer.validated_data['password'])
            user = serializer.save()
            
            return JsonResponse({
                'message': 'Register successful!'
            }, status=status.HTTP_201_CREATED)

        else:
            return JsonResponse({
                'error_message': 'This username has already exist!',
                'errors_code': 400,
            }, status=status.HTTP_400_BAD_REQUEST)

class UserLoginView(generics.GenericAPIView):
    serializer_class = UserLoginSerializer
    
    def post(self, request):
        serializer = UserLoginSerializer(data=request.data)
        if serializer.is_valid():
            username=serializer.validated_data['username']
            password=serializer.validated_data['password']
            connect = mysql.connector.connect(host='localhost', user='root', passwd='', database='classroommgr')
            cursor = connect.cursor()
            sqlcommand = "Select id from temporary_user where username = '" + username + "' and password = '" + password + "'"
            cursor.execute(sqlcommand)
            id = []
            for i in cursor:
                id.append(i)
            res = list(map(itemgetter(0), id))
            
            user = User.objects.filter(username=username).first()
            
            if id:
                access_token = create_access_token(id)
                refresh_token = create_refresh_token(id)

                response = Response()

                response.set_cookie(key='refreshToken', value=refresh_token, httponly=True)
                response.set_cookie(key='accessToken', value=access_token, httponly=True)
                response.data = {
                    'refresh': refresh_token,
                    'token': access_token
                }

                return response

            return Response({
                'error_message': 'Username or password is incorrect!',
                'error_code': 400,
            }, status=status.HTTP_400_BAD_REQUEST)

        return Response({
            'error_messages': serializer.errors,
            'error_code': 400,
        }, status=status.HTTP_400_BAD_REQUEST)

class UserAPIView(APIView):
    def post(self, request):
        access_token = request.COOKIES.get('accessToken')
        id = decode_access_token(access_token)
        return Response({
            'access': access_token,
            'id': id,
        })

class UserLogoutView(APIView):
    def post(self, _):
        response = Response()
        response.delete_cookie(key="refreshToken")
        response.delete_cookie(key="accessToken")
        response.data={
            'message': 'success'
        }

        return response

class RefreshAPIView(APIView):
    def post(self, request):
        refresh_token = request.COOKIES.get('refreshToken')
        id = decode_refresh_token(refresh_token)
        access_token = create_access_token(id)
        response = Response()
        response.set_cookie(key='accessToken', value=access_token, httponly=True)
        response.data = {
            'id': id,
            'refresh': refresh_token,
            'access': access_token
        }
        return response

# @login_required(login_url='login')
# def home(request):
#     return render(request, 'main/homePage.html')

# # Register
# def UserRegister(request):
#     if request.method == 'POST':
#         if request.POST.get('username') and request.POST.get('email') and request.POST.get('first_name') and request.POST.get('last_name') and request.POST.get('password') and request.POST.get('password2'):
#             createrecord = User()
#             createrecord.username = request.POST.get('username')
#             createrecord.email = request.POST.get('email')
#             createrecord.first_name = request.POST.get('first_name')
#             createrecord.last_name = request.POST.get('last_name')
#             createrecord.password = request.POST.get('password')
#             if request.POST.get('password') == request.POST.get('password2'):
#                 createrecord.save()
#                 messages.success(request, 'Create User Successfully!')
#                 return render(request, "main/loginPage.html", {})
#             else:
#                 messages.error(request, 'Password and Re Password are not match!')
#                 return render(request, "main/registerPage.html", {})
#         else:
#             messages.error(request, 'Please fill out all fields')
#             return render(request, "main/registerPage.html", {})
#     else:
#         return render(request, 'main/registerPage.html')

# # Login
# def UserLogin(request):
    
#     connect = mysql.connector.connect(host='localhost', user='root', passwd='', database='classroommgr')
#     cursor = connect.cursor()
#     connect2 = mysql.connector.connect(host='localhost', user='root', passwd='', database='classroommgr')
#     cursor2 = connect2.cursor()

#     sqlcommand = 'Select username from temporary_user'
#     sqlcommand2 = 'Select password from temporary_user'

#     cursor.execute(sqlcommand)
#     cursor2.execute(sqlcommand2)

#     name=[]
#     pwd=[]

#     for i in cursor:
#         name.append(i)

#     for j in cursor2:
#         pwd.append(j)

#     res = list(map(itemgetter(0), name))
#     res2 = list(map(itemgetter(0), pwd))

#     if request.method == "POST":
#         username = request.POST.get('username')
#         password = request.POST.get('password')

#         k=1
#         i=len(res)

#         while k < i:
#             if res[k]==username and res2[k]==password:
#                 request.session['User_Login'] = username
#                 return render(request, 'main/homePage.html', {'username':request.session.get('User_Login')})
#                 break
#             k+=1
#         else:
#             messages.error(request, 'Check UserName OR PassWord')
#             return redirect('loginPage.html')
#     else:
#         return render(request, 'main/loginPage.html')

# def UserLogout(request):
#     if request.session.get('User_Login'):
#         del request.session['User_Login']
#     return redirect('/login')
# task submission
from io import BytesIO

from PIL import Image
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from django.core.exceptions import PermissionDenied
from django.core.files.images import ImageFile
from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone

from .forms import SubmitsForm, SubmitsMediaForm
from .models import Student, Assignments, Submits
def index(request):
    viewed_submits = [Submits.objects.get(id = pk) for pk in request.session.get('viewed_submits', [])]

    context = {
        "viewed_submits": viewed_submits,
    }
    return render(request, "submission/index.html", context)
def submit_list(request):
    submits = Submits.objects.all()
    submits_list = []
    for submit in submits:
        submits_list.append({"submit": submit})

    context = {
        "submits_list": submits_list
    }
    return render(request, "submission/submit_list.html", context)
# end submission
