from django.db import models


# Create your models here.

class ServerTimeChecklist(models.Model):
    id = models.IntegerField(primary_key=True)
    asset_ip = models.CharField(max_length=255)
    server_name = models.CharField(max_length=255)
    time_synced = models.BooleanField(default=False, null=True, blank=True)
    check_time = models.DateTimeField(null=True, blank=True)
    review_time = models.DateTimeField(null=True, blank=True)
    is_adjusted = models.BooleanField(default=False, null=True, blank=True)
    checked_by = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = 'server_time_checklist_servertimechecklist'
        app_label = 'server_time_checklist'

    def __str__(self):
        return f"Id: {self.id} ,Asset IP: {self.asset_ip}, Server Name: {self.server_name}, Time Synced: {self.time_synced}, Check Time: {self.check_time}, Review Time: {self.review_time}, Is Adjusted: {self.is_adjusted},Checked By: {self.checked_by}"
