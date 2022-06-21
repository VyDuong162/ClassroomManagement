from django.db import models

class Student(models.Model) :
    student_id= models.IntegerField(primary_key=True,max_length=10)
   first_name = models.CharField(
                max_length=50, help_text="The student's first name")
   last_name = models.CharField(
                max_length=50, help_text="The student's last name")
   email = models.EmailField(help_text="The contact email for the student")
    roll_no = models.IntegerField(help_text="The roll number of the student")
    username = models.CharField(unique=True,max_length=100, help_text="Username's student")
    password = models.CharField(max_length=100, help_text="Password's username")

    def __str__(self):
        return self.first_name


class Sections(models.Model):
    section_id = models.IntegerField(primary_key=True, max_length=10)
    title = models.CharField(max_length=100, help_text="The title's resource")
    create_date = models.DateTimeField(auto_now_add=True, help_text="The date and time the resource was created")
    room_id = models.ForeignKey(Classroom, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.title


class Assignment(models.Model):
    Assignment_id = models.IntegerField(primary_key=True, max_length=10)
    file = models.FileField(help_text="The file of assignment", blank=True, upload_to="assignments_files/)
    create_date = models.DateTimeField(auto_now_add=True, help_text="The date and time the resource was created")
    deadline_date = models.DateTimeField(null=True, help_text=\
                     "The date and time the assignment is deadline.")
    textbox = models.TextField(help_text="The comment of The assignment")
    section_id = models.ForeignKey(Sections, on_delete=models.CASCADE)
    title = models.CharField(max_length=100, help_text="The title's assignment")

    def __str__(self):
        return self.title


class Submits(models.Model) :
    student_id = models.ForeignKey (Student, on_delete=models.CASCADE)
    assignment_id = models.ForeignKey(Assignment, on_delete=models.CASCADE)
    submitted_on = models.SmallIntegerField(help_text="The comment of The resource")
    status = models.SmallIntegerField(help_text="The status of submit has 2 value: 0: yet , 1: done")
    file = models.FileField(help_text="The file of submit",blank=True, upload_to="Submits_files/")


class Resources(models.Model) :
    resource_id= models.IntegerField(primary_key=True, max_length=10)
    title = models.CharField(max_length=100, help_text="The title's resource")
    create_date = models.DateTimeField(auto_now_add=True, help_text="The date and time the resource was created")
    textbox = models.TextField(help_text="The comment of The resource")
    file = models.FileField(help_text="The file of resource")
    section_id = models.ForeignKey(Sections, on_delete=models.CASCADE)

    def __str__(self):
        return self.title