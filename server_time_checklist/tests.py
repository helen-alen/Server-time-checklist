from django.test import TestCase

# Create your tests here.
from datetime import datetime

date_str = "2023-03-21"
date_obj = datetime.strptime(date_str, "%Y-%m-%d")
day_value = int(date_str.split('-')[2])

print(day_value)
print(type(day_value))
