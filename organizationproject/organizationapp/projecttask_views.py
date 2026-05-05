from django.shortcuts import render, redirect, get_object_or_404
from .projecttask_models import ProjectTask
from .projecttask_forms import ProjectTaskForm

# List all tasks
def projecttask_list(request):
    tasks = ProjectTask.objects.all()
    return render(request, 'projecttask_list.html', {'tasks': tasks})

# Create new task
def projecttask_create(request):
    if request.method == "POST":
        form = ProjectTaskForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('projecttask_list')
    else:
        form = ProjectTaskForm()
    return render(request, 'projecttask_form.html', {'form': form})

# Edit existing task
def projecttask_edit(request, pk):
    task = get_object_or_404(ProjectTask, pk=pk)
    if request.method == "POST":
        form = ProjectTaskForm(request.POST, instance=task)
        if form.is_valid():
            form.save()
            return redirect('projecttask_list')
    else:
        form = ProjectTaskForm(instance=task)
    return render(request, 'projecttask_form.html', {'form': form})

# Delete task
def projecttask_delete(request, pk):
    task = get_object_or_404(ProjectTask, pk=pk)
    if request.method == "POST":
        task.delete()
        return redirect('projecttask_list')
    return render(request, 'projecttask_confirm_delete.html', {'task': task})
