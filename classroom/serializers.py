
# task 3: API CRUD assignments
from rest_framework import serializers
from django.http import JsonResponse
from .models import Assignments
from django.utils import timezone
from django.shortcuts import get_object_or_404

# task 3: API CRUD assignments
class AssignmentsSerializer(serializers.ModelSerializer):

    class Meta:
        model = Assignments
        fields = ['assignment_id', 'file', 'created_date', 'deadline_date', 'textbox', 'title',  'section_id']

    def create(self, validated_data):
        request = self.context["request"]
        return Assignments.objects.create(assignment_id=validated_data['assignment_id'],
                                          file=validated_data['file'],
                                          deadline_date=validated_data['deadline_date'],
                                          textbox=validated_data['textbox'],
                                          title=validated_data['title'],
                                          section_id=validated_data['section_id']
                                          )

    def update(self, instance, validated_data):
        request = self.context['request']
        instance.file = validated_data['file']
        instance.deadline_date = validated_data['deadline_date']
        instance.textbox = validated_data['textbox']
        instance.title = validated_data['title']
        instance.section_id = validated_data['section_id']
        instance.created_date = timezone.now()
        instance.save()
        return instance

    def delete(self,request, pk):
        assignments = get_object_or_404(Assignments, pk=pk)
        assignments.delete()
        return JsonResponse({'message': 'Delete assignment successful!'})

from rest_framework import serializers

from .models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'email', 'password')

class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'email', 'password')
        extra_kwargs = {'password': {'write_only': True}}

class UserLoginSerializer(serializers.Serializer):
    username = serializers.CharField(required=True)
    password = serializers.CharField(required=True)

