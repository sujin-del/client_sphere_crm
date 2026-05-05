from django.urls import path
from . import views
<<<<<<< HEAD

urlpatterns = [
    path("categories/", views.category_list, name="category_list"),
    path("categories/add/", views.add_category, name="add_category"),
    path("categories/delete/<int:category_id>/", views.delete_category, name="delete_category"),
=======


urlpatterns = [
    path('admin/', admin.site.urls),
    path('frequency-types/', views.frequency_list, name='frequency_list'), #taskfrequency
>>>>>>> 9c64740adb8adbd349bd5cd396bc0b58c2c6222d
]

from django.urls import path
from . import views

urlpatterns = [
    path("categories/", views.category_list, name="category_list"),
    path("categories/add/", views.add_category, name="add_category"),
    path("categories/delete/<int:category_id>/", views.delete_category, name="delete_category"),
]
