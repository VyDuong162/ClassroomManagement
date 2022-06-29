from rest_framework import serializers
from classroom.models import Classes


class ClassesCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Classes
        fields = '__all__'