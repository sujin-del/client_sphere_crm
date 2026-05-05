from django.db import models
#TaskCategory
class TaskCategory(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(
        max_length=45,
        unique=True,
        db_collation="utf8mb3_bin"   # ensures collation matches your SQL
    )
    parent_id = models.IntegerField()
    sort_order_index = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = "task_categories"
        ordering = ["sort_order_index"]

#TaskPriority
class TaskPriority(models.Model):
    name = models.CharField(max_length=45, null=True, blank=True)
    color_code = models.CharField(max_length=45, null=True, blank=True)
    weight = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'task_priorities'
        ordering = ['weight']

    def __str__(self):
        return self.name if self.name else f"Priority {self.id}"
    

#TaskRepeatFrequencyType

    class TaskRepeatFrequencyType(models.Model):
        name = models.CharField(max_length=45)

        class Meta:
            db_table = 'task_repeat_frequency_types'

        def __str__(self):
            return self.name

    class TaskStatus(models.Model):
        name = models.CharField(max_length=45, unique=True)
        color_code = models.CharField(max_length=45, null=True, blank=True)
        is_active = models.BooleanField(default=True)

        class Meta:
            db_table = 'task_statuses'

        def __str__(self):
            return self.name