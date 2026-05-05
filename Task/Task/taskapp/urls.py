from django.urls import path
from . import views

urlpatterns = [
    path('', views.task_priority_list, name='task_priority_list'),
    path('update/<int:pk>/', views.task_priority_update, name='task_priority_update'),
    path('delete/<int:pk>/', views.task_priority_delete, name='task_priority_delete'),
]