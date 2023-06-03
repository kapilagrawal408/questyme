from django.urls import path
from .views import *
from rest_framework.urlpatterns import format_suffix_patterns

urlpatterns = [
    path('slots/', ViewInterviewSlot.as_view()),
    path('slots/<int:id>/<int:i>', ViewInterviewSlot.as_view())
]

urlpatterns = format_suffix_patterns(urlpatterns)
