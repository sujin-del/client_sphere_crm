from django import forms
from .projecttask_models import ProjectTask

class ProjectTaskForm(forms.ModelForm):
    class Meta:
        model = ProjectTask
        fields = [
            'name',
            'description',
            'project',
            'category',
            'assigned_by',
            'assigned_to',
            'task_priority',
            'start_date',
            'end_date',
            'estimated_hours',
            'worked_hours',
            'billed_hours',
            'task_status',
            'sub_status',
            'notes',
            'invoice_task_group',
            'created_by',
            'created_time',
            'modified_by',
            'modified_time',
            'data_status',
        ]
        widgets = {
            'start_date': forms.DateInput(attrs={'type': 'date'}),
            'end_date': forms.DateInput(attrs={'type': 'date'}),
            'created_time': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
            'modified_time': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
        }
