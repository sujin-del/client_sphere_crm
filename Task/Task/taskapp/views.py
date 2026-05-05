from django.shortcuts import render, redirect
from .models import TaskCategory

<<<<<<< HEAD
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
=======
# Create your views here.

# taskfrequency
from .models import TaskRepeatFrequencyType

def frequency_list(request):
    data = TaskRepeatFrequencyType.objects.all()
    return render(request, 'task/frequency_list.html', {'data': data})
>>>>>>> 9c64740adb8adbd349bd5cd396bc0b58c2c6222d
