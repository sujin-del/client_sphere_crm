from django.db import models

class AccountStatus(models.Model):
    name = models.CharField(max_length=45)

    class Meta:
        db_table = "account_statuses"

    def __str__(self):
        return self.name