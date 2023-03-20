from django.http import HttpResponse
from django.shortcuts import render,redirect
from .models import ServerTimeChecklist
from .forms import ServerTimeCheckListForm

# Create your views here.
def server_time_checklist(request):
    # 返回request,返回登录界面
    serverdate=ServerTimeChecklist.objects.all()
    return render(request, 'server time checklist.html',{'serverdate':serverdate})

def updatechecklist_page(request):
    return render(request, 'updatechecklist.html')


def update_server_time_checklist(request):
    if request.method == 'POST':
        form = ServerTimeCheckListForm(request.POST)
        if form.is_valid():
            for data in form.cleaned_data:
                server_time_checklist = ServerTimeChecklist.objects.get(id=data['id'])
                server_time_checklist.time_synced = data['time_synced']
                server_time_checklist.check_time = data['check_time']
                server_time_checklist.is_adjusted = data['is_adjusted']
                server_time_checklist.checked_by = data['checked_by']
                server_time_checklist.save()
            return redirect('server_time_checklist')
    else:
        form = ServerTimeCheckListForm()
    return render(request, 'update_server_time_checklist.html', {'form': form})