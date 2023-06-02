from django.contrib import admin
from .models import *

# Register your models here.
@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
	list_display = ('course', )

@admin.register(Slot)
class SlotAdmin(admin.ModelAdmin):
	list_display = ('slot_name', 'start_time', 'end_time')