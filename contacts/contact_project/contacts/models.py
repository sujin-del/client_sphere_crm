from django.db import models

class Customer(models.Model):
    organization_name = models.CharField(max_length=128, null=True, blank=True)
    website_url = models.URLField(max_length=256, null=True, blank=True)

    def __str__(self):
        return self.organization_name or "No Name"