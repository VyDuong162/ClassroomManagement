from django.contrib.auth import authenticate
from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.pagination import LimitOffsetPagination
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.status import HTTP_404_NOT_FOUND, HTTP_200_OK
from rest_framework.views import APIView

from rest_framework import generics
from .models import Assignments, Student, Submits
from .serializers import SubmitSerializer

class Login(APIView):

    def post(self, request):
        user = authenticate(username=request.data.get("username"), password=request.data.get("password"))
        if not user:
            return Response({'error': 'Credentials are incorrect or user does not exist'}, status=HTTP_404_NOT_FOUND)
        token, _ = Token.objects.get_or_create(user=user)
        return Response({'token': token.key}, status=HTTP_200_OK)

class SubmitsViewSet(viewsets.ModelViewSet):
    queryset = Submits.objects.all()
    serializer_class = SubmitSerializer
    authentication_classes = []
    permission_classes = []
  
class AllSubmits(generics.ListAPIView):
    queryset = Submits.objects.all()
    serializer_class = SubmitSerializer
    authentication_classes = []
    permission_classes = []
# def submit_list(request):

#     if request.method == 'GET':
#         ả
