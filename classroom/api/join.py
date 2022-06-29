from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view

from classroom.serializers import join
from classroom.models import Joins
from django.http import Http404

class JoinList(APIView):

    def get_object(self):
        try:
            return Joins.objects.all()
        except Joins.DoesNotExist:
            raise Http404

    def get(self, request, format=None):
        join_all = self.get_object()
        serializer = join.JoinCreateSerializer(join_all, many=True)
        # join.delete()
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request, format=None):
        serializer = join.JoinCreateSerializer(data=request.data)
        
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    
class JoinDeatail(APIView):
       
    def get_object(self, pk):
        try:
            return Joins.objects.get(pk=pk)
        except Joins.DoesNotExist:
            raise Http404

    def get_object_all_room(self, pk):
        try:
            return Joins.objects.filter(room_id=pk)
        except Joins.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        respon = self.get_object_all_room(pk)
        serializer = join.JoinCreateSerializer(respon, many=True)
        print(serializer.data)
        print("-")
        return Response(serializer.data, status=status.HTTP_200_OK)

    def put(self, request, pk, format=None):
        join_pk = self.get_object(pk)
        serializer = join.JoinCreateSerializer(join_pk, data=request.data)
        print(request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        join_pk = self.get_object(pk)
        join_pk.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)




# @api_view(['GET'])
# def delete_student_from_the_class_room(request):
#     id_student = request.get('id_student', '')
#     room_id = request.get('room_id', '')
#     print(id_student)
#     return Response({"message": "Hello for today! See you tomorrow!"})
