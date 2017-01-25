#!/bin/bash
#Create user for admin account
#python manage.py createsuperuser

#Bash to create a polls app XD
python manage.py startapp polls

cat > polls/views.py << '__EOF__'
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")
__EOF__

touch polls/urls.py

cat > polls/urls.py << '__EOF__'
from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
]
__EOF__

cat > myproject/urls.py << '__EOF__'
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^polls/', include('polls.urls')),
    url(r'^admin/', admin.site.urls),
]
__EOF__

# #Create tables on database to use them:
# #It sees the INSTALLED_APPS in myproject/settings.py and creates databases needed
# python manage.py migrate

# #Create models:
# cat > polls/models.py << '__EOF__'
# from django.db import models


# class Question(models.Model):
#     question_text = models.CharField(max_length=200)
#     pub_date = models.DateTimeField('date published')


# class Choice(models.Model):
#     question = models.ForeignKey(Question, on_delete=models.CASCADE)
#     choice_text = models.CharField(max_length=200)
#     votes = models.IntegerField(default=0)
# __EOF__

# #Activate models:
# cat > myproject/settings.py << '__EOF__'
# INSTALLED_APPS = [
#     'polls.apps.PollsConfig',
#     'django.contrib.admin',
#     'django.contrib.auth',
#     'django.contrib.contenttypes',
#     'django.contrib.sessions',
#     'django.contrib.messages',
#     'django.contrib.staticfiles',
# ]
# __EOF__

# #Three steps to modify models:::
# #1 Change models in models.py
# #2 Tell Django that we made some changes in the models, to save them as a migration:
# python manage.py makemigrations polls
# #Optional: Check project for any problem without making migrations or modifying databases yet:
# python manage.py check

# #3 Create tables on database:
# #(It takes all non applyed migrations and executes them on the database, sincing changes in the models with the database scheme)
# python manage.py migrate


