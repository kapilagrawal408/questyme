from rest_framework import serializers
from ..models import Interviewer_Slot


class InterviewSerializerViewInterview(serializers.ModelSerializer):
    class Meta:
        model = Interviewer_Slot
        fields = ['id', 'slot', 'date', 'instructions', 'title', 'status', 'interviewer']
