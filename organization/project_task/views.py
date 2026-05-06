from django.shortcuts import render, redirect
from .project_forms import ProjectForm
from .project_models import Project

def project_create(request):
    if request.method == 'POST':
        form = ProjectForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('project_list')
    else:
        form = ProjectForm()
    return render(request, 'project.html', {'form': form})

def project_list(request):
    projects = Project.objects.all()
    return render(request, 'base.html', {'projects': projects})