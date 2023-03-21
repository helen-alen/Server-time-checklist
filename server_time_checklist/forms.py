from django import forms
from .models import ServerTimeChecklist


class ServerTimeCheckListForm(forms.ModelForm):
    class Meta:
        model = ServerTimeChecklist
        fields = ["id", 'time_synced', 'check_time', 'is_adjusted', 'checked_by']
