from rest_framework import serializers
from classroom.models import Stream


class StreamCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Stream
        fields = '__all__'