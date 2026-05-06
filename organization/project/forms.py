from django import forms
from .models import Projects

class ProjectForm(forms.ModelForm):
    class Meta:
        model = Projects
        fields = [
            'name',
            'organization',
            'contact',
            'cost_per_hour',
            'tds_percentage',
            'created_by',
            'created_time',
            'modified_by',
            'modified_time',
            'data_status',
        ]
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'organization': forms.Select(attrs={'class': 'form-select'}),
            'contact': forms.Select(attrs={'class': 'form-select'}),
            'cost_per_hour': forms.NumberInput(attrs={'class': 'form-control', 'step': '0.01'}),
            'tds_percentage': forms.NumberInput(attrs={'class': 'form-control', 'step': '0.01'}),
            'created_by': forms.Select(attrs={'class': 'form-select'}),
            'created_time': forms.DateTimeInput(attrs={'class': 'form-control', 'type': 'datetime-local'}),
            'modified_by': forms.Select(attrs={'class': 'form-select'}),
            'modified_time': forms.DateTimeInput(attrs={'class': 'form-control', 'type': 'datetime-local'}),
            'data_status': forms.Select(attrs={'class': 'form-select'}),
        }
