# invoices/apps.py
from django.apps import AppConfig

class InvoicesConfig(AppConfig):
    name = 'invoices'

    def ready(self):
        from .models import InvoiceStatus
        from transactions.models import TransactionMode

        # Seed InvoiceStatus
        for status in ['Pending', 'Paid', 'Cancelled']:
            InvoiceStatus.objects.get_or_create(name=status)

        # Seed TransactionMode
        for mode in ['UPI', 'NEFT', 'CASH', 'IMPS', 'RTGS']:
            TransactionMode.objects.get_or_create(name=mode)