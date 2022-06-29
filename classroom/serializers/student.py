from rest_framework import serializers
from classroom.models import Student


class StudentCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Student
        fields = '__all__'