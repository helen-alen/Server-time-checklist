from django.db import models

# Create your models here.

class ServerTimeChecklist(models.Model):
    asset_ip = models.CharField(max_length=255)
    server_name = models.CharField(max_length=255)
    time_synced = models.BooleanField(default=False, null=True, blank=True)
    check_time = models.DateTimeField(null=True, blank=True)
    checked_by = models.CharField(max_length=255, null=True, blank=True)
    is_adjusted = models.BooleanField(default=False, null=True, blank=True)

    def __str__(self):
        return self.server_name