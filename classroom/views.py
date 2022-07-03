from contextlib import redirect_stderr
import imp
from django.shortcuts import render, redirect

# Create your views here.
from django.shortcuts import render
from .models import User, Authentication
from django.contrib import messages

from django.contrib.auth.decorators import login_required

import mysql.connector

from operator import itemgetter

from classroom import serializers

# Create your views here.

from django.http import HttpResponse
from django.views.generic.edit import FormView
from django.views import View
from .forms import ResourcesForm

from rest_framework import generics
from .models import Resources, Sections
from . serializers import ResourecSerializer, SectionSerializer

class ResourceList(generics.ListCreateAPIView):
    serializer_class = ResourecSerializer

    def get_queryset(self):
        queryset = Resources.objects.all()
        section = self.request.query_params.get('section')
        if section is not None:
            queryset = queryset.filter(section_id=section)
        return queryset

class ResourceDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ResourecSerializer
    queryset = Resources.objects.all()

class SectionList(generics.ListCreateAPIView):
    serializer_class = SectionSerializer
    queryset = Sections.objects.all()

class SectionDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SectionSerializer
    queryset = Sections.objects.all()

