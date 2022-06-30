from rest_framework import viewsets
from rest_framework.pagination import LimitOffsetPagination
from .models import Assignments
from .serializers import AssignmentsSerializer

# task 3: API CRUD assignments
class AssignmentsViewSet(viewsets.ModelViewSet):
    queryset = Assignments.objects.order_by('-created_date')
    serializer_class = AssignmentsSerializer
    pagination_class = LimitOffsetPagination
    authentication_classes = []

