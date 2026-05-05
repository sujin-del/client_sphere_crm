from django.db import models

class Bank_Account(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    account_number = models.CharField(max_length= 12,unique=True , null=True)
    account_type = models.CharField(max_length=100)
    ifsc_code = models.CharField(max_length=12)
    branch =models.CharField(max_length=100)
    balance = models.DecimalField(max_digits=12, decimal_places=2 , default=0)

    def __str__(self):
        return f"{self.first_name} {self.last_name} - {self.acc_no}"


