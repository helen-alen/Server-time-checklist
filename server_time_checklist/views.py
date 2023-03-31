from django.db.models import Max
from django.db.models.expressions import Random
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views.decorators.http import require_POST
from datetime import date, timedelta
from .models import ServerTimeChecklist
from .forms import ServerTimeCheckListForm
from datetime import datetime
import random


# Create your views here.

def time_select(request):
    if request.method == 'POST':
        selected_time = request.POST['selected_time']
        return redirect('checklist_page', selected_time=selected_time)
    else:
        return render(request, 'server_time_checklist.html')


def checklist_page(request, selected_time):
    selected_time_obj = datetime.strptime(selected_time, '%Y-%m-%d')
    start_id = 1
    end_id = ServerTimeChecklist.objects.aggregate(Max('id'))['id__max']
    desired_object_count = 15
    queryset = ServerTimeChecklist.objects.filter(id__range=(start_id, end_id), time_synced=0,
                                                  review_time__in=[selected_time_obj - timedelta(days=1)]).order_by(
        'id')[:desired_object_count]
    # print(queryset.count())
    if queryset.count() < desired_object_count:
        ids = queryset.values_list('id', flat=True)
        random_queryset = ServerTimeChecklist.objects.filter(time_synced__isnull=True).order_by('id')[
                          :desired_object_count - len(ids)]
        queryset = list(queryset) + list(random_queryset)
    queryset = sorted(queryset, key=lambda x: x.id)
    queryset = list(queryset)
    # print(len(queryset))
    # print(selected_time_obj.day)
    # for data in queryset:
    #     check_time_obj = datetime.strptime(data.check_time, '%Y-%m-%d')
    #     days_difference = selected_time_obj.day - check_time_obj.day
    #     print(days_difference)
    #     if days_difference >= 2 and data.time_synced == 0:
    #         data.is_red= True
    #     else:
    #         data.is_red = False
    #     data.save()
    return render(request, 'updatechecklist.html',
                  {'selected_time': selected_time, 'queryset': queryset, 'date_today': selected_time_obj})


@require_POST
def update_checklist(request):
    if request.method == 'POST':
        checklist_data = []
        # print(request.method)
        # print(request.POST.getlist('forms'))
        form_data = request.POST.getlist('forms')
        for i in range(len(form_data) // 6):
            # 解析表单数据
            id = form_data[i * 6 + 0]
            time_synced = form_data[i * 6 + 1]
            check_time = form_data[i * 6 + 2]
            review_time = form_data[i * 6 + 3]
            is_adjusted = form_data[i * 6 + 4]
            checked_by = form_data[i * 6 + 5]

            # print(review_time)
            # 根据ID查找对应的ServerTimeChecklist对象
            server_time_checklist = ServerTimeChecklist.objects.get(id=id)

            # 更新对象的字段值
            server_time_checklist.time_synced = bool(int(time_synced))
            server_time_checklist.check_time = check_time
            if review_time == "":
                server_time_checklist.review_time = None
            else:
                server_time_checklist.review_time = review_time
            server_time_checklist.is_adjusted = bool(int(is_adjusted))
            server_time_checklist.checked_by = checked_by

            server_time_checklist.save()
            checklist_data.append({
                'id': server_time_checklist.id,
                'asset_ip': server_time_checklist.asset_ip,
                'server_name': server_time_checklist.server_name,
                'time_synced': server_time_checklist.time_synced,
                'check_time': server_time_checklist.check_time,
                'review_time': server_time_checklist.review_time,
                'is_adjusted': server_time_checklist.is_adjusted,
                'checked_by': server_time_checklist.checked_by,
            })
            # 保存更新后的对象
            # try:
            #     server_time_checklist.save()
            #     checklist_data.append({
            #         'id': server_time_checklist.id,
            #         'asset_ip': server_time_checklist.asset_ip,
            #         'server_name': server_time_checklist.server_name,
            #         'time_synced': server_time_checklist.time_synced,
            #         'check_time': server_time_checklist.check_time,
            #         'review_time': server_time_checklist.review_time,
            #         'is_adjusted': server_time_checklist.is_adjusted,
            #         'checked_by': server_time_checklist.checked_by,
            #     })
            # except:
            #     checklist_data.append({
            #         'id': server_time_checklist.id,
            #         'asset_ip': server_time_checklist.asset_ip,
            #         'server_name': server_time_checklist.server_name,
            #         'time_synced': server_time_checklist.time_synced,
            #         'check_time': server_time_checklist.check_time,
            #         'review_time': server_time_checklist.review_time,
            #         'is_adjusted': server_time_checklist.is_adjusted,
            #         'checked_by': server_time_checklist.checked_by,
            #     })
            if i == len(form_data) // 6:
                break
    # 渲染模板，并传递checklist_data到模板中
    return render(request, 'checklist.html', {'checklist_data': checklist_data})
