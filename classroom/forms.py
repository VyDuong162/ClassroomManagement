from django import forms

from .models import Student, Assignments, Submits


class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = "__all__"


class SubmitsForm(forms.ModelForm):
    class Meta:
        model = Submits
        exclude = ["submitted_on", "status", "file"]

class SubmitsMediaForm(forms.ModelForm):
    class Meta:
        model = Submits
        fields = ["file"]