from dataclasses import field
from rest_framework import serializers
from rest_framework.response import Response

from .models import Resources, Sections

class ResourecSerializer(serializers.ModelSerializer):
    class Meta:
        model = Resources
        fields = '__all__'

class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sections
        fields = '__all__'