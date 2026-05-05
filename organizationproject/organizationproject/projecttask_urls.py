from django.contrib import admin
from django.urls import path
from organizationapp import projecttask_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('projecttasks/', views.projecttask_list, name='projecttask_list'),
    path('projecttasks/new/', views.projecttask_create, name='projecttask_create'),
    path('projecttasks/<int:pk>/edit/', views.projecttask_edit, name='projecttask_edit'),
    path('projecttasks/<int:pk>/delete/', views.projecttask_delete, name='projecttask_delete'),
]
