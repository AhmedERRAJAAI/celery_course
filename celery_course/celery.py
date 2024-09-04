import os
from celery import Celery

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'celery_course.settings')
app = Celery("celery_course")
app.config.from_object("django.conf:settings", namespace="CELERY")

@app.task
def add_numbers():
    return


app.autodiscover_tasks()
