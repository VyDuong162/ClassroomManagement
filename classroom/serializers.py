from urllib import request
from pkg_resources import require
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
# Task submission
from rest_framework import serializers
from django.http import JsonResponse
from django.utils import timezone
from django.shortcuts import get_object_or_404
from .models import Assignments, Student, Submits
from rest_framework.exceptions import NotAuthenticated, PermissionDenied
class SubmitSerializer(serializers.ModelSerializer):

    class Meta:
        model = Submits
        fields = ['pk', 'student_id','assignment_id','submitted_on', 'status', 'file']

    def create(self, validated_data):
        request = self.context["request"]
        creator = request.user
        if not creator.is_authenticated:
            raise NotAuthenticated('Authentication required.')
        student = Student.objects.get(pk=request.data['student_id'])
        assignment = Assignments.objects.get(pk=request.data['assignment_id'])
        return Submits.objects.create(  student_id=student,
                                        assignment_id=assignment,
                                        submitted_on=validated_data['submitted_on'],
                                        status=validated_data['status'],
                                        file=validated_data['file'],
                                        )

    def update(self, instance, validated_data):
        request = self.context['request']
        instance.student_id = validated_data['student_id']
        instance.assignment_id = validated_data['assignment_id']
        instance.submitted_on = validated_data['submitted_on']
        instance.status = validated_data['status']
        instance.file = validated_data['file']
        instance.save()
        return instance

    def delete(self,request, pk):
        submit = get_object_or_404(Submits, pk=pk)
        submit.delete()
        return JsonResponse({'message': 'Delete submit successful!'})
# end task submission

