import csv
import re
import string

from django.contrib.auth.models import User
from django.core.management.base import BaseCommand, CommandError
from classroom.models import Assignments , Classes, Classroom, Joins, Resources, Sections, Stream, Student, Submits, Teacher
from datetime import datetime

class Command(BaseCommand):
    help = 'Load the classroom data from a CSV file.'

    def add_arguments(self, parser):
        parser.add_argument('--csv', type=str)

    @staticmethod
    def row_to_dict(row, header):
        if len(row) < len(header):
            row += [''] * (len(header) - len(row))
        return dict([(header[i], row[i]) for i, head in enumerate(header) if head])

    def handle(self, *args, **options):
        m = re.compile(r'content:(\w+)')
        header = None
        models = dict()
        model_name  = " "
        try:
            with open(options['csv'], mode ='r', encoding='utf-8-sig') as csvfile:
                model_data = csv.reader(csvfile)
                
                for i, row in enumerate(model_data):
                    print(row)
                    if max([len(cell.strip()) for cell in row[1:] + ['']]) == 0 and m.match(row[0]):
                        model_name = m.match(row[0]).groups()[0]
                        print(model_name)
                        models[model_name] = []
                        header = None
                        continue

                    if header is None:
                        header = row
                        continue

                    row_dict = self.row_to_dict(row, header)
                    if set(row_dict.values()) == {''}:
                        continue
                    models[model_name].append(row_dict)

        except FileNotFoundError:
            raise CommandError('File "{}" does not exist'.format(options['csv']))

        for data_dict in models.get('Stream', []):
            stream, created = Stream.objects.get_or_create(stream_id=data_dict['stream_id'], defaults={
                'name': data_dict['stream_name']

            })

            if created:
                print('Created Stream "{}"'.format(stream.name))

        for data_dict in models.get('Classes', []):
            classes, created = Classes.objects.get_or_create(class_id=data_dict['class_id'], defaults={
                'stream_id': Stream.objects.get(stream_id=data_dict['stream_id']),
                'name': data_dict['classes_name'],
                'semester': data_dict['semester']
            })

            if created:
                print('Created Classes "{}"'.format(classes.name))

        for data_dict in models.get('Student', []):
            s, created = Student.objects.get_or_create(
                student_id = data_dict['student_id'],
                class_id = Classes.objects.get(class_id=data_dict['class_id']),
                first_name=data_dict['first_name'],
                last_name=data_dict['last_name'],
                email=data_dict['email'],
                roll_no = data_dict['roll_no'],
                username = data_dict['username']
            )

            if created:
                print('Created Student "{} {}"'.format(data_dict['first_name'],
                                                           data_dict['last_name']))

        for data_dict in models.get('Teacher', []):
            t, created = Teacher.objects.get_or_create(
                teacher_id=data_dict['teacher_id'],
                stream_id=Stream.objects.get(stream_id=data_dict['stream_id']),
                first_name=data_dict['first_name'],
                last_name=data_dict['last_name'],
                email=data_dict['email'],
                username=data_dict['username']
            )

            if created:
                print('Created Teacher "{} {}"'.format(data_dict['first_name'],
                                                       data_dict['last_name']))

        for data_dict in models.get('Classroom', []):
            c, created = Classroom.objects.get_or_create(
                room_id = data_dict['room_id'],
                teacher_id = Teacher.objects.get(teacher_id=data_dict['teacher_id']),
                subject = data_dict['subject'],
                code=data_dict['code'],
                semester=data_dict['semester'],
                created_date  = datetime.strptime(data_dict['created_date'], "%d/%m/%Y")
            )

            if created:
                print('Created Classroom "{}"'.format(c.room_id))

        for data_dict in models.get('Joins', []):
            j, created = Joins.objects.get_or_create(
                room_id = Classroom.objects.get(room_id=data_dict['room_id']),
                student_id = Student.objects.get(student_id=data_dict['student_id'])

            )

            if created:
                print('Created Joins "{}" ->  "{}"'.format(j.room_id, j.student_id))

        for data_dict in models.get('Sections', []):
            sections, created = Sections.objects.get_or_create(
                section_id=data_dict['section_id'],
                title=data_dict['title'],
                created_date=datetime.strptime(data_dict['created_date'], "%d/%m/%Y"),
                room_id = Classroom.objects.get(room_id=data_dict['room_id'])

            )

            if created:
                print('Created Sections "{}"'.format(sections.section_id))

        for data_dict in models.get('Assignments', []):
            a, created = Assignments.objects.get_or_create(
                assignment_id=data_dict['assignment_id'],
                file=data_dict['file'],
                created_date=datetime.strptime(data_dict['created_date'], "%d/%m/%Y"),
                deadline_date=datetime.strptime(data_dict['deadline_date'], "%d/%m/%Y"),
                textbox=data_dict['textbox'],
                section_id = Sections.objects.get(section_id=data_dict['section_id']),
                title=data_dict['title']

            )

            if created:
                print('Created Assigments "{}"'.format(a.assignment_id))

        for data_dict in models.get('Submits', []):
            submits, created = Submits.objects.get_or_create(
                student_id=Student.objects.get(student_id=data_dict['student_id']),
                assignment_id=Assignments.objects.get(assignment_id=data_dict['assignment_id']),
                submitted_on=data_dict['submitted_on'],
                status=data_dict['status'],
                file=data_dict['file'],


            )

            if created:
                print('Created Submits "{}" -> "{}"'.format(submits.student_id, submits.assignment_id))

        for data_dict in models.get('Resources', []):
            r, created = Resources.objects.get_or_create(
                resource_id=data_dict['resource_id'],
                title=data_dict['title'],
                created_date=datetime.strptime(data_dict['created_date'], "%d/%m/%Y"),
                textbox=data_dict['textbox'],
                file=data_dict['file'],
                section_id = Sections.objects.get(section_id=data_dict['section_id'])
            )

            if created:
                print('Created Resources "{}"'.format(r.resource_id))




        print("Import complete")