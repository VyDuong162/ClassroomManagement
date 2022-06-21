from django.db import models

# Create your models here.

class Stream(models.Model):
    stream_id = models.IntegerField(primary_key=True, max_length=10)
    name = models.CharField(max_length=100, help_text="The name of the Stream")

    def __str__(self):
        return self.name

class Classes(models.Model):
    class_id = models.IntegerField(primary_key=True, max_length=10)
    stream_id = models.ForeignKey(Stream, on_delete=models.CASCADE)
    name = models.CharField(max_length=255, help_text="The name of the Classes")
    semester = models.CharField(max_length=255)



class Student(models.Model):
    student_id = models.IntegerField(primary_key= True, max_length= 10)
    class_id = models.ForeignKey(Classes, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=50, help_text="The Student's first name or names.")
    last_name = models.CharField(max_length=50, help_text="The Student's last name or names.")
    email = models.EmailField(help_text="The contact email for the student.")
    roll_no = models.CharField(max_length=50)
    username = models.CharField(unique=True,max_length=255, help_text="The Student's username.")
    password = models.CharField(max_length=100, help_text="The Student's password.")

    def __str__(self):
        return self.first_name

class Teacher(models.Model):
    teacher_id = models.IntegerField(primary_key=True, max_length=10)
    stream_id = models.ForeignKey(Stream, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=50, help_text="The Teacher's first name or names.")
    last_name = models.CharField(max_length=50, help_text="The Teacher's last name or names.")
    email = models.EmailField(help_text="The contact email for the teacher.")
    username = models.CharField(unique=True,max_length=255, help_text="The Teacher's username.")
    password = models.CharField(max_length=100, help_text="The Teacher's password.")

    def __str__(self):
        return self.first_name


class Classroom(models.Model):
    room_id = models.IntegerField(primary_key=True, max_length=10)
    teacher_id = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    subject = models.CharField(max_length=255)
    code = models.CharField(max_length=255)
    semester = models.CharField(max_length=255)
    created_date = models.DateTimeField(auto_now_add=True, help_text="The date and time the classroom was created.")

class Joins(models.Model):
    room_id = models.ForeignKey(Classroom, on_delete=models.CASCADE)
    student_id = models.ForeignKey(Student, on_delete=models.CASCADE)


class Resources(models.Model):
    resource_id = models.IntegerField(primary_key=True, max_length=10)
    title = models.CharField(max_length=100, help_text="The title of the resources.")
    created_date = models.DateTimeField(auto_now_add=True, help_text="The date and time the resources was created.")
    textbox = models.TextField(help_text="The Resources text.")
    file = models.FileField(null=True, blank=True, upload_to="resources_file/")

class Submits(models.Model):
