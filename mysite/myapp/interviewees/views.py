from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import InterviewSerializerViewInterview
from django.http import JsonResponse
from rest_framework.parsers import JSONParser

from ..models import Interviewer_Slot


# Create your views here.

# class RegisterInterviewerDetail(APIView):
#     # get data of a particular student by Id
#     def get(self, request, pk, format=None):
#         user = User.objects.get(pk=pk)
#         serializer = UserSerializerGetOnly(user)
#         return Response(serializer.data)

class ViewInterviewSlot(APIView):
    # get all the available interview_slots
    def get(self, request):
        interview_slots = Interviewer_Slot.objects.all()
        serializer = InterviewSerializerViewInterview(interview_slots, many=True)

        return Response(serializer.data)

    def post(self, request, id,i):
        interviewSlot = Interviewer_Slot.objects.get(id=id)
        interviewSlot.interviewee_id = i
        interviewSlot.save()
        serializer = InterviewSerializerViewInterview(interviewSlot)
        print(serializer.data)
        return Response(serializer.data)

