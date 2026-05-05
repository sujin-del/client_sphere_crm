from django.contrib import admin
from django.urls import path
from organizationapp import project_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('projects/new/', views.project_create, name='project_create'),
    path('projects/', views.project_list, name='project_list'),
]