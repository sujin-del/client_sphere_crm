from django.db import models


class Project(models.Model):
    name = models.CharField(
        max_length=45,
        null=True,
        blank=True
    )

    organization = models.ForeignKey(
        'Organization',
        on_delete=models.CASCADE,
        null=True,
        blank=True
    )

    contact = models.ForeignKey(
        'Contact',
        on_delete=models.CASCADE,
        null=True,
        blank=True
    )

    cost_per_hour = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        null=True,
        blank=True
    )

    tds_percentage = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        default=0.00
    )

    created_by = models.ForeignKey(
        'User',
        related_name='created_projects',
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )

    created_time = models.DateTimeField(
        null=True,
        blank=True
    )

    modified_by = models.ForeignKey(
        'User',
        related_name='modified_projects',
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )

    modified_time = models.DateTimeField(
        null=True,
        blank=True
    )

    data_status = models.ForeignKey(
        'DataStatus',
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )

    def __str__(self):
        return self.name or f"Project {self.id}"

    class Meta:
        db_table = 'projects'