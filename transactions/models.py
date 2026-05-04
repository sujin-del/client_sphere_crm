import uuid
from django.db import models


class Account(models.Model):
    account_number = models.CharField(max_length=20, unique=True)
    balance = models.DecimalField(max_digits=12, decimal_places=2, default=0)

    def __str__(self):
        return self.account_number


class TransactionMode(models.Model):
    name = models.CharField(max_length=20)  # UPI, NEFT, CASH

    def __str__(self):
        return self.name


class Transaction(models.Model):
    DIRECTION = (
        ('CREDIT', 'Credit'),
        ('DEBIT', 'Debit'),
    )

    reference_id = models.UUIDField(
        default=uuid.uuid4,
        editable=False
    )

    account = models.ForeignKey(Account, on_delete=models.CASCADE)

    amount = models.DecimalField(max_digits=12, decimal_places=2)
    direction = models.CharField(
        max_length=10,
        choices=DIRECTION,
        default='CREDIT'
    )

    mode = models.ForeignKey(TransactionMode, on_delete=models.SET_NULL, null=True)

    description = models.TextField(blank=True)

    created_at = models.DateTimeField(auto_now_add=True)