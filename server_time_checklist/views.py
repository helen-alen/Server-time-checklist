from django.http import HttpResponse
from django.shortcuts import render, redirect
from .models import ServerTimeChecklist
from .forms import ServerTimeCheckListForm
from datetime import datetime


# Create your views here.
def server_time_checklist(request):
    # 返回request,返回登录界面
    return render(request, 'server time checklist.html')


def updatechecklist_page(request):
    date = request.GET.get('selectedDate')
    print(date)
    day_value = int(date.split('-')[2])
    start_id = (day_value - 1) * 11 + 1
    end_id = day_value * 11
    form = ServerTimeCheckListForm.objects.filter(id__range=(start_id, end_id))
    return HttpResponse("Hello world!")
    # return render(request, 'updatechecklist.html')
    # return render(request, 'updatechecklist.html', {'form': form})
    # serverdate = ServerTimeChecklist.objects.get(selectedDate=selectedDate)
    # form = ServerTimeCheckListForm(instance=serverdate)
    # print(request.method)
    # if request.method == 'POST':
    #     print(request.POST)
    #     form = ServerTimeCheckListForm(request.POST, instance=serverdate)
    #     if form.is_valid():
    #         form.save()
    #         return redirect('server_time_checklist', selectedDate=selectedDate)
    # else:
    #     return render(request, 'updatechecklist.html', {'form': form})
