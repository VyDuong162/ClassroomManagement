from rest_framework import serializers
from classroom.models import Classroom


class ClassroomCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Classroom
        fields = '__all__'