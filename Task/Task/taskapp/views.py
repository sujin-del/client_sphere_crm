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

from django.shortcuts import render, redirect
from .models import TaskCategory

def category_list(request):
    categories = TaskCategory.objects.all()
    return render(request, "task_categories/list.html", {"categories": categories})

def add_category(request):
    if request.method == "POST":
        name = request.POST.get("name")
        parent_id = request.POST.get("parent_id", 0)
        sort_order_index = request.POST.get("sort_order_index", None)

        TaskCategory.objects.create(
            name=name,
            parent_id=parent_id,
            sort_order_index=sort_order_index
        )
        return redirect("category_list")

    return render(request, "task_categories/add.html")

def delete_category(request, category_id):
    category = TaskCategory.objects.get(id=category_id)
    category.delete()
    return redirect("category_list")
