from django.contrib import admin
from django.urls import path
from .views import *
from rest_framework.urlpatterns import format_suffix_patterns

urlpatterns = [
    path('users', RegisterInterviewer.as_view()),
    path('users/<int:pk>', RegisterInterviewerDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)