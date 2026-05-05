from django.shortcuts import render

# Create your views here.

# taskfrequency
from .models import TaskRepeatFrequencyType

def frequency_list(request):
    data = TaskRepeatFrequencyType.objects.all()
    return render(request, 'task/frequency_list.html', {'data': data})