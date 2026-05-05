from django.contrib import admin
from .models import Invoice, InvoiceStatus

admin.site.register(Invoice)
admin.site.register(InvoiceStatus)