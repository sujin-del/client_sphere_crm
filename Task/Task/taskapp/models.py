from django.db import models


# TaskCategory
class TaskCategory(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(
        max_length=45,
        unique=True,
        db_collation="utf8mb3_bin"
    )
    parent_id = models.IntegerField(default=0)
    sort_order_index = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = "task_categories"
        ordering = ["sort_order_index"]

    def __str__(self):
        return self.name


# TaskPriority
class TaskPriority(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45, null=True, blank=True)
    color_code = models.CharField(max_length=45, null=True, blank=True)
    weight = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'task_priorities'
        ordering = ['weight']

    def __str__(self):
        return self.name if self.name else f"Priority {self.id}"


# TaskRepeatFrequencyType
class TaskRepeatFrequencyType(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)

    class Meta:
        db_table = 'task_repeat_frequency_types'

    def __str__(self):
        return self.name


# TaskRepeatOption
class TaskRepeatOption(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)

    class Meta:
        db_table = "task_repeat_options"

    def __str__(self):
        return self.name


# TaskStatus
class TaskStatus(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45, null=True, blank=True)
    group_id = models.SmallIntegerField(null=True, blank=True)
    color_code = models.CharField(max_length=10, null=True, blank=True)

    class Meta:
        db_table = 'task_statuses'

    def __str__(self):
        return self.name if self.name else f"Status {self.id}"


# Task
class Task(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=128, null=True, blank=True,
                            db_collation="utf8mb3_bin")
    status = models.ForeignKey(
        TaskStatus,
        on_delete=models.RESTRICT,
        db_column='status_id'
    )
    priority = models.ForeignKey(
        TaskPriority,
        on_delete=models.RESTRICT,
        db_column='priority_id'
    )
    category = models.ForeignKey(
        TaskCategory,
        on_delete=models.RESTRICT,
        db_column='category_id'
    )
    due_date = models.DateField(null=True, blank=True)
    reminder_at = models.DateTimeField()
    assigned_to = models.IntegerField()
    created_by = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    last_modified_at = models.DateTimeField(auto_now=True)
    description = models.CharField(max_length=512, null=True, blank=True,
                                   db_collation="utf8mb3_bin")
    repeat_option = models.ForeignKey(
        TaskRepeatOption,
        on_delete=models.RESTRICT,
        db_column='repeat_option_id',
        default=1
    )
    repeat_frequency_type = models.ForeignKey(
        TaskRepeatFrequencyType,
        on_delete=models.RESTRICT,
        db_column='repeat_frequency_type_id',
        null=True,
        blank=True,
        default=1
    )
    repeat_frequency = models.IntegerField(default=1)
    group_id = models.BigIntegerField(null=True, blank=True)
    list_id = models.IntegerField(default=1)

    class Meta:
        db_table = 'tasks'

    def __str__(self):
        return self.name if self.name else f"Task {self.id}"