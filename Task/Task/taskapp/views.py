from django.shortcuts import render, get_object_or_404, redirect
from .models import TaskPriority

def task_priority_list(request):
    if request.method == "POST":
        name = request.POST.get('name')
        color_code = request.POST.get('color_code')
        weight = request.POST.get('weight')

        TaskPriority.objects.create(
            name=name,
            color_code=color_code,
            weight=weight
        )
        return redirect('task_priority_list')

    priorities = TaskPriority.objects.all()
    return render(request, 'task_priority.html', {'priorities': priorities})


def task_priority_update(request, pk):
    priority = get_object_or_404(TaskPriority, pk=pk)

    if request.method == "POST":
        priority.name = request.POST.get('name')
        priority.color_code = request.POST.get('color_code')
        priority.weight = request.POST.get('weight')
        priority.save()
        return redirect('task_priority_list')

    return render(request, 'task_priority_update.html', {'priority': priority})


def task_priority_delete(request, pk):
    priority = get_object_or_404(TaskPriority, pk=pk)
    priority.delete()
    return redirect('task_priority_list')