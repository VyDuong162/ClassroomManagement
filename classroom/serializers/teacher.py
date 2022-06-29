from rest_framework import serializers
from classroom.models import Teacher


class TeacherCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Teacher
        fields = '__all__'