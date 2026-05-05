from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
Base = declarative_base()

class TaskCategories(Base):
    __tablename__ = 'task_categories'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(45, collation="utf8mb3_bin"), unique=True, nullable=False)
    parent_id = Column(Integer, nullable=False)
    sort_order_index = Column(Integer)
engine = create_engine("mysql+pymysql://username:password@localhost:3306/your_database?charset=utf8mb3")

Base.metadata.create_all(engine)
Session = sessionmaker(bind=engine)
session = Session()
new_category = TaskCategories(name="Work", parent_id=0, sort_order_index=1)
session.add(new_category)
session.commit()
print("Table created and sample record inserted successfully!")

from django.db import models

class TaskPriority(models.Model):
    name = models.CharField(max_length=45, null=True, blank=True)
    color_code = models.CharField(max_length=45, null=True, blank=True)
    weight = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'task_priorities'
        ordering = ['weight']

    def __str__(self):
        return self.name if self.name else f"Priority {self.id}"
    

<<<<<<< HEAD
    # task/models.py

    from django.db import models
=======
#TaskRepeatFrequencyType
>>>>>>> 9c64740adb8adbd349bd5cd396bc0b58c2c6222d

    class TaskRepeatFrequencyType(models.Model):
        name = models.CharField(max_length=45)

        class Meta:
            db_table = 'task_repeat_frequency_types'

        def __str__(self):
            return self.name

#TaskRepeatOptions

    class TaskRepeatOptions(models.Model):
        name = models.CharField(max_length=45)

        class Meta:
            db_table = "task_repeat_options"


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
