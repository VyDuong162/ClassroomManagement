from rest_framework import serializers
from classroom.models import Joins, Student


class StudentDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = Student
        fields = ['student_id', 'class_id', 'first_name', 'last_name']


class JoinCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Joins
        fields = '__all__'


class JoinDetailSerializer(serializers.ModelSerializer):
    student_id = StudentDetailSerializer(many=True)

    class Meta:
        model = Joins
        fields = ['student_id', 'room_id']


class JoinListStudentAndTeacher(serializers.ModelSerializer):
    list_students = serializers.SerializerMethodField('list_student')


    def list_student(self, join):
        students = join.student_id_set.all()
        if students:
            return StudentDetailSerializer(students, many=True)
        else:
            None

    class Meta:
        model = Joins
        fields = ['list_student', 'room_id']