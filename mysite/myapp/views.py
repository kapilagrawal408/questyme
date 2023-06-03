from rest_framework.views import APIView
from .serializers import UserSerializer, UserSerializerGetOnly
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User, Group
from .models import Course
from django.http import JsonResponse
from rest_framework.parsers import JSONParser

# Create your views here.
class RegisterInterviewer(APIView):
    #this method is for the GET request when all users data need to be listed
    def get(self, request):
        querySet = User.objects.filter(is_superuser__exact = False).values('username', 'first_name', 'last_name', 'email')
        serializer = UserSerializerGetOnly(querySet, many = True)
        return JsonResponse(serializer.data, safe = False)

    #interviewer account creadentials
    #username: kapil
    #password: FaltuKaPassword@123

    #interviewee account creadentials
    #username: abc
    #password: FaltuKaPassword@321
    # this method is to register interviewees new user
    def post(self, request, format=None):
        #parse the data from request object to the JSON object
        data = JSONParser().parse(request)
        # get the details of the group base on the group name i.e. 'interviewer' & 'interviewee'
        group = Group.objects.filter(name=data['group'])[0]
        #Create an object of XXXSerializer class from collected data
        user = UserSerializer(data = data)
        #make sure to call the is_valid() before save() method otherwise error
        #This method will call validate_fieldname() method for every field. The validate_fieldname() is defined in the serializers.py
        if user.is_valid():
            #save the user [See create() method in serializers.py]
            savedUser = user.save()

            #add the user to the group
            group.user_set.add(savedUser)

            #add the course of the user
            if(data['group'] == 'interviewer'):
                #this user has only one course because it is interviewer
                course = Course.objects.filter(id__iexact = data['course'])[0]
                course.user.add(savedUser)
                pass
            else:
                courses = data['course'].split(",")
                for courseId in courses:
                    course = Course.objects.filter(id__iexact = courseId)[0]
                    course.user.add(savedUser)
            #return the response with success message
            return Response({'success': 'You are successfully registered'}, status=status.HTTP_201_CREATED)

        #you are here means the validation is failed, so send the response that contains the error message
        return Response(user.errors, status=status.HTTP_201_CREATED)

# this APIView is for the single User object
class RegisterInterviewerDetail(APIView):
    #get data of interviewees particular student by Id
    def get(self, request, pk, format=None):
        user = User.objects.get(pk=pk)
        serializer = UserSerializerGetOnly(user)
        return Response(serializer.data)