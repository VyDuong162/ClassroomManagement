from urllib import request
from pkg_resources import require

# task 3: API CRUD assignments
from rest_framework import serializers
from django.http import JsonResponse
from .models import Assignments,Student,Teacher
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


# task 6: API CRUD User Profile

class StudentListSerializer(serializers.ModelSerializer):
    username=serializers.CharField(default=self.context['request'].user)
    roll_no=serializers.CharField(default=self.context['request'].user)
    class Meta:
        model=Student
        fields='__all__'
        
class TeacherListSerializer(serializers.ModelSerializer):
    username = serializers.CharField(default=self.context['request'].user)
    class Meta:
        model=Teacher
        fields='__all__'
