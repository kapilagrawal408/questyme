from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Course(models.Model):
    course = models.CharField(max_length=20)
    user = models.ManyToManyField(User)

class Slot(models.Model):
    slot_name = models.CharField(max_length = 200, null = False)
    start_time = models.TimeField()
    end_time = models.TimeField()

class Interviewer_Slot(models.Model):
    slot = models.ForeignKey(Slot, on_delete = models.CASCADE)
    date = models.DateField()
    instructions = models.TextField(max_length = 20000, null = False, blank = False)
    meeting_link = models.CharField(max_length = 200, null = False)
    title = models.CharField(max_length = 200, null = False)

    choices = (('open', 'open'),('close', 'close'))
    status = models.CharField(choices = choices, max_length = 5, default='open')

    interviewee = models.ForeignKey(User, null = True, on_delete=models.CASCADE, related_name = 'interviewee', default = None)
    interviewer = models.ForeignKey(User, on_delete=models.CASCADE, related_name='interviewer')
    interviewee_attended = models.BooleanField(default = False)
    feedback = models.TextField(max_length=20000, null = True, blank = True)
    rating = models.IntegerField(default = 0)