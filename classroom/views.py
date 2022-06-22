from contextlib import redirect_stderr
from django.shortcuts import render, redirect

# Create your views here.
from django.shortcuts import render
from .models import User, Authentication
from django.contrib import messages

from django.contrib.auth.decorators import login_required

import mysql.connector

from operator import itemgetter

# Create your views here.

@login_required(login_url='login')
def home(request):
    return render(request, 'main/homePage.html')

# Register
def UserRegister(request):
    if request.method == 'POST':
        if request.POST.get('username') and request.POST.get('email') and request.POST.get('first_name') and request.POST.get('last_name') and request.POST.get('password') and request.POST.get('password2'):
            createrecord = User()
            createrecord.username = request.POST.get('username')
            createrecord.email = request.POST.get('email')
            createrecord.first_name = request.POST.get('first_name')
            createrecord.last_name = request.POST.get('last_name')
            createrecord.password = request.POST.get('password')
            if request.POST.get('password') == request.POST.get('password2'):
                createrecord.save()
                messages.success(request, 'Create User Successfully!')
                return render(request, "main/loginPage.html", {})
            else:
                messages.error(request, 'Password and Re Password are not match!')
                return render(request, "main/registerPage.html", {})
        else:
            messages.error(request, 'Please fill out all fields')
            return render(request, "main/registerPage.html", {})
    else:
        return render(request, 'main/registerPage.html')

# Login
def UserLogin(request):
    
    connect = mysql.connector.connect(host='localhost', user='root', passwd='', database='classroommgr')
    cursor = connect.cursor()
    connect2 = mysql.connector.connect(host='localhost', user='root', passwd='', database='classroommgr')
    cursor2 = connect2.cursor()

    sqlcommand = 'Select username from temporary_user'
    sqlcommand2 = 'Select password from temporary_user'

    cursor.execute(sqlcommand)
    cursor2.execute(sqlcommand2)

    name=[]
    pwd=[]

    for i in cursor:
        name.append(i)

    for j in cursor2:
        pwd.append(j)

    res = list(map(itemgetter(0), name))
    res2 = list(map(itemgetter(0), pwd))

    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        k=1
        i=len(res)

        while k < i:
            if res[k]==username and res2[k]==password:
                request.session['User_Login'] = username
                return render(request, 'main/homePage.html', {'username':request.session.get('User_Login')})
                break
            k+=1
        else:
            messages.error(request, 'Check UserName OR PassWord')
            return redirect('loginPage.html')
    else:
        return render(request, 'main/loginPage.html')

def UserLogout(request):
    if request.session.get('User_Login'):
        del request.session['User_Login']
    return redirect('/login')
