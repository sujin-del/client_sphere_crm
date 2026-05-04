from django.urls import path
from . import views
from .views import api_transactions, api_transaction_detail

urlpatterns = [
    path('', views.transaction_home, name='transaction_home'),
    path('export/', views.export_csv, name='export_csv'),
    path('api/transactions/', api_transactions),
    path('api/transactions/<int:pk>/', api_transaction_detail),
]