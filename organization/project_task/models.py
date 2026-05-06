from django.db import models

class ProjectTask(models.Model):
    name = models.CharField(max_length=256, null=True, blank=True)
    description = models.CharField(max_length=512, null=True, blank=True)
    project = models.ForeignKey('Project', on_delete=models.CASCADE, null=True, blank=True)
    category = models.CharField(max_length=128, null=True, blank=True)
    assigned_by = models.ForeignKey('Contact', on_delete=models.SET_NULL, null=True, blank=True, related_name='tasks_assigned')
    assigned_to = models.ForeignKey('Contact', on_delete=models.SET_NULL, null=True, blank=True, related_name='tasks_received')
    task_priority = models.ForeignKey('TaskPriority', on_delete=models.SET_NULL, null=True, blank=True)
    start_date = models.DateField(null=True, blank=True)
    end_date = models.DateField(null=True, blank=True)
    estimated_hours = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    worked_hours = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    billed_hours = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    task_status = models.ForeignKey('TaskStatus', on_delete=models.SET_NULL, null=True, blank=True)
    sub_status = models.CharField(max_length=45, null=True, blank=True)
    notes = models.CharField(max_length=512, null=True, blank=True)
    invoice_task_group = models.ForeignKey('InvoiceTaskGroup', on_delete=models.SET_NULL, null=True, blank=True)
    created_by = models.ForeignKey('User', on_delete=models.SET_NULL, null=True, blank=True, related_name='tasks_created')
    created_time = models.DateTimeField(null=True, blank=True)
    modified_by = models.ForeignKey('User', on_delete=models.SET_NULL, null=True, blank=True, related_name='tasks_modified')
    modified_time = models.DateTimeField(null=True, blank=True)
    data_status = models.ForeignKey('DataStatus', on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        db_table = 'project_tasks'
        ordering = ['id']

    def __str__(self):
        return self.name if self.name else f"Task {self.id}"
