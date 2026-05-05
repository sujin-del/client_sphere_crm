from django.urls import path
from . import views

urlpatterns = [
    path('', views.invoice_home, name='invoice_home'),
    path('create/', views.create_invoice, name='create_invoice'),
    path('<int:invoice_id>/', views.invoice_detail, name='invoice_detail'),
    path('update/<int:invoice_id>/', views.update_status, name='update_status'),
]