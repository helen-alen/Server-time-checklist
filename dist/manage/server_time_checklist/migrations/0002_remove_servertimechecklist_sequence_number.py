# Generated by Django 2.2 on 2023-03-17 16:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('server_time_checklist', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='servertimechecklist',
            name='sequence_number',
        ),
    ]
