from django.db import models
from transactions.models import Transaction


class InvoiceStatus(models.Model):
    name = models.CharField(max_length=20)  # Paid, Pending, etc.

    def __str__(self):
        return self.name


class Invoice(models.Model):
    transaction = models.ForeignKey(Transaction, on_delete=models.CASCADE)

    amount = models.DecimalField(max_digits=12, decimal_places=2)

    status = models.ForeignKey(InvoiceStatus, on_delete=models.SET_NULL, null=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Invoice {self.id}"
    

class InvoiceStatusHistory(models.Model):
    invoice = models.ForeignKey(Invoice, on_delete=models.CASCADE)
    status = models.ForeignKey(InvoiceStatus, on_delete=models.CASCADE)
    changed_at = models.DateTimeField(auto_now_add=True)