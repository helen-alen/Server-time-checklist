from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views.decorators.http import require_POST
from datetime import date
from .models import ServerTimeChecklist
from .forms import ServerTimeCheckListForm
from datetime import datetime


# Create your views here.

def time_select(request):
    if request.method == 'POST':
        selected_time = request.POST['selected_time']
        return redirect('checklist_page', selected_time=selected_time)
    else:
        return render(request, 'server_time_checklist.html')


def checklist_page(request, selected_time):
    day_value = int(selected_time.split('-')[2])
    start_id = (day_value - 1) * 11 + 1
    end_id = day_value * 11
    queryset = ServerTimeChecklist.objects.filter(id__range=(start_id, end_id))
    return render(request, 'updatechecklist.html', {'selected_time': selected_time, 'queryset': queryset})


@require_POST
def update_checklist(request):
    if request.method == 'POST':
        checklist_data = []
        # print(request.method)
        # print(request.POST.getlist('forms'))
        form_data = request.POST.getlist('forms')
        for i in range(len(form_data) // 5):
            # 解析表单数据
            # print(i)
            # print(len(form_data)//5)
            # print(range(len(form_data)//5))
            id = form_data[i * 5 + 0]
            time_synced = form_data[i * 5 + 1]
            check_time = form_data[i * 5 + 2]
            is_adjusted = form_data[i * 5 + 3]
            checked_by = form_data[i * 5 + 4]

            # 根据ID查找对应的ServerTimeChecklist对象
            server_time_checklist = ServerTimeChecklist.objects.get(id=id)

            # 更新对象的字段值
            server_time_checklist.time_synced = bool(int(time_synced))
            server_time_checklist.check_time = check_time
            server_time_checklist.is_adjusted = bool(int(is_adjusted))
            server_time_checklist.checked_by = checked_by

            # 保存更新后的对象
            try:
                server_time_checklist.save()
                checklist_data.append({
                    'id': server_time_checklist.id,
                    'asset_ip': server_time_checklist.asset_ip,
                    'server_name': server_time_checklist.server_name,
                    'time_synced': server_time_checklist.time_synced,
                    'check_time': server_time_checklist.check_time,
                    'is_adjusted': server_time_checklist.is_adjusted,
                    'checked_by': server_time_checklist.checked_by,
                })
            except:
                checklist_data.append({
                    'id': server_time_checklist.id,
                    'asset_ip': server_time_checklist.asset_ip,
                    'server_name': server_time_checklist.server_name,
                    'time_synced': server_time_checklist.time_synced,
                    'check_time': server_time_checklist.check_time,
                    'is_adjusted': server_time_checklist.is_adjusted,
                    'checked_by': server_time_checklist.checked_by,
                })
                if i == len(form_data) // 5:
                    break
            # 添加修改后的数据到checklist_data列表中
        # return redirect('update_checklist')
        # 渲染模板，并传递checklist_data到模板中
        # print(checklist_data)
        return render(request, 'checklist.html', {'checklist_data': checklist_data})
    else:
        return HttpResponse("Hello world!")

