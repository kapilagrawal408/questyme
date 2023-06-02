from rest_framework import serializers
from django.contrib.auth.models import User
from django.core.validators import EmailValidator

class UserSerializerGetOnly(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'email']

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'email', 'password']

    #this method is to validate the email
    def validate_email(self, value):
        validator = EmailValidator("Please provide a valid email")
        validator(value)

        if self.initial_data['group'] == 'interviewer':
            #You are here means the email is in the valid format & you are setting up the interviewer account
            if not value.endswith("masaischool.com"):
                raise serializers.ValidationError("Interviewer mail id must be of masai school domain")

        #this check is common for both types of accounts
        if User.objects.filter(email = value).exists():
            raise serializers.ValidationError("Email already exists")

        #you are here means the email is ending with masaischool.com
        return value

    # this method is to validate the first name
    def validate_first_name(self, value):
        if len(value.strip()) == 0:
            raise serializers.ValidationError("First name is required")
        return value

    # this method is to validate the last name
    def validate_last_name(self, value):
        if len(value.strip()) == 0:
            raise serializers.ValidationError("Last name is required")
        return value

    # this method is to validate the username
    def validate_username(self, value):
        if len(value.strip()) == 0:
            raise serializers.ValidationError("Username  is required")
        if User.objects.filter(username = value).exists():
            raise serializers.ValidationError("Username already exists")
        # make sure to return the name, it's mandatory if email is okay
        return value

    # this method is to validate the password
    def validate_password(self, value):
        if len(value) < 8:
            raise serializers.ValidationError("Password should not be less than 8 characters")
        return value

    # this method is to validate the group name
    def validate_group(self, value):
        if len(value.strip()) == 0:
            raise serializers.ValidationError("unable to find account type")
        elif value not in ['interviewer', 'interviewee']:
            raise serializers.ValidationError("Invalid account type, it must be interviewer or interviewee")
        return value

    def validate_course(self, value):
        if len(value.split(",")) == 0:
            raise serializers.ValidationError("At least one course is required")
        return value

    def create(self, validated_data):
        return User.objects.create_user(**validated_data)