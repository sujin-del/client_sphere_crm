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
