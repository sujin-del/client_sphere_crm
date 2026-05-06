import uuid
from django.db import models
from bank_accounts.models import Bank_Account

class Account(models.Model):
    bank_account   = models.OneToOneField(
                        Bank_Account,
                        on_delete=models.CASCADE,
                        related_name='account_no',
                        null=True,
                        blank=True,
    )
    account_number = models.CharField(max_length=20, unique=True)
    balance        = models.DecimalField(max_digits=12, decimal_places=2, default=0)


    def __str__(self):
        return f"{self.bank_account.first_name} - {self.account_number} - {self.balance}"


class TransactionMode(models.Model):
    MODE_CHOICES = (
        ('UPI',  'UPI'),
        ('NEFT', 'NEFT'),
        ('CASH', 'Cash'),
        ('IMPS', 'IMPS'),
        ('RTGS', 'RTGS'),
    )
    name = models.CharField(max_length=50, choices=MODE_CHOICES, unique=True)

    def __str__(self):
        return self.name


class Transaction(models.Model):
    DIRECTION = (
        ('CREDIT', 'Credit'),
        ('DEBIT',  'Debit'),
    )

    reference_id = models.UUIDField(
        default=uuid.uuid4,
        editable=False,
        unique=True
    )

    account     = models.ForeignKey(Account, on_delete=models.CASCADE)
    amount      = models.DecimalField(max_digits=12, decimal_places=2)
    direction   = models.CharField(max_length=10, choices=DIRECTION, default='CREDIT')
    mode        = models.ForeignKey(
                        TransactionMode,
                        on_delete=models.SET_NULL,
                        null=True,
                        to_field='name',
                  )
    description = models.TextField(blank=True)
    created_at  = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.direction} - {self.amount} - {self.reference_id}"