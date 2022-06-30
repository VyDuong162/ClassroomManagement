from django.db import models
from django.contrib.auth.models import AbstractBaseUser, UserManager

class User(models.Model):
    objects =  UserManager()

    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255, unique=True)
    email = models.CharField(max_length=255)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    password = models.CharField(max_length=255)

    class Meta:
        db_table = 'temporary_user'

class Authentication(models.Model):
    username = models.CharField(max_length=255)
    password = models.CharField(max_length=255)

    def __str__(self):
        return self.username

    Auth_objects = models.Manager()

class Stream(models.Model):
    stream_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100, help_text="The name of the Stream")

    def __str__(self):
        return self.name

class Classes(models.Model):
    class_id = models.IntegerField(primary_key=True)
    stream_id = models.ForeignKey(Stream, on_delete=models.CASCADE)
    name = models.CharField(max_length=255, help_text="The name of the Classes")
    semester = models.CharField(max_length=255)



class Student(models.Model):
    student_id = models.IntegerField(primary_key= True)
    class_id = models.ForeignKey(Classes, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=50, help_text="The Student's first name or names.")
    last_name = models.CharField(max_length=50, help_text="The Student's last name or names.")
    email = models.EmailField(help_text="The contact email for the student.")
    roll_no = models.CharField(max_length=50)
    username = models.CharField(unique=True,max_length=255, help_text="The Student's username.")

    def __str__(self):
        return self.first_name

class Teacher(models.Model):
    teacher_id = models.IntegerField(primary_key=True)
    stream_id = models.ForeignKey(Stream, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=50, help_text="The Teacher's first name or names.")
    last_name = models.CharField(max_length=50, help_text="The Teacher's last name or names.")
    email = models.EmailField(help_text="The contact email for the teacher.")
    username = models.CharField(unique=True,max_length=255, help_text="The Teacher's username.")

    def __str__(self):
        return self.first_name


class Classroom(models.Model):
    room_id = models.IntegerField(primary_key=True)
    teacher_id = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    subject = models.CharField(max_length=255)
    code = models.CharField(max_length=255)
    semester = models.CharField(max_length=255)
    created_date = models.DateTimeField(auto_now_add=True, help_text="The date and time the classroom was created.")

class Joins(models.Model):
    room_id = models.ForeignKey(Classroom, on_delete=models.CASCADE)
    student_id = models.ForeignKey(Student, on_delete=models.CASCADE)

class Sections(models.Model):
    section_id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=100, help_text="The title's resource")
    created_date = models.DateTimeField(auto_now_add=True, help_text="The date and time the resource was created")
    room_id = models.ForeignKey(Classroom, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.title

class Assignments(models.Model):
    assignment_id = models.IntegerField(primary_key=True)
    file = models.FileField(help_text="The file of assignment", blank=True, upload_to="assignments_files/")
    created_date = models.DateTimeField(auto_now_add=True, help_text="The date and time the resource was created")
    deadline_date = models.DateTimeField(null=True, help_text="The date and time the assignment is deadline.")
    textbox = models.TextField(help_text="The comment of The assignment")
    section_id = models.ForeignKey(Sections, on_delete=models.CASCADE)
    title = models.CharField(max_length=100, help_text="The title's assignment")

    def __str__(self):
        return self.title


class Submits(models.Model) :
    student_id = models.ForeignKey (Student, on_delete=models.CASCADE)
    assignment_id = models.ForeignKey(Assignments, on_delete=models.CASCADE)
    submitted_on = models.SmallIntegerField(help_text="The comment of The resource")
    status = models.SmallIntegerField(help_text="The status of submit has 2 value: 0: yet , 1: done")
    file = models.FileField(help_text="The file of submit",blank=True, upload_to="Submits_files/")


class Resources(models.Model) :
    resource_id= models.IntegerField(primary_key=True)
    title = models.CharField(max_length=100, help_text="The title's resource")
    created_date = models.DateTimeField(auto_now_add=True, help_text="The date and time the resource was created")
    textbox = models.TextField(help_text="The comment of The resource")
    file = models.FileField(help_text="The file of resource")
    section_id = models.ForeignKey(Sections, on_delete=models.CASCADE)

    def __str__(self):
        return self.title




