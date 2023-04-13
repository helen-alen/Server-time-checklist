from django.db.models import Max, Min
from django.db.models.expressions import Random
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.utils.dateparse import parse_date
from django.utils.datetime_safe import time
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

    # 获取ServerTimeChecklist模型的所有日期数据
    date_list = ServerTimeChecklist.objects.exclude(check_time__isnull=True).values_list('check_time', flat=True)
    # print(date_list)

    # 确定与selected_time_obj最接近的日期并存储在mindate中
    mindelta = timedelta(days=365 * 100)  # 初始差值假设为100年
    mindate = None
    loop_count = 0
    # print(len(date_list))
    for date_str in date_list:
        date_obj = datetime.combine(date_str, time.min)
        delta = abs(selected_time_obj - date_obj)
        loop_count += 1
        # print(loop_count)
        if loop_count == len(date_list):
            break
        if delta < mindelta:
            mindelta = delta
            mindate = date_obj

    yesterday_start = mindate
    yesterday_end = yesterday_start + timedelta(days=1, seconds=-1)
    # print(yesterday_end)
    # 每日服务器检查量
    desired_object_count = 15

    queryset = ServerTimeChecklist.objects.filter(id__range=(start_id, end_id), time_synced=0, is_adjusted=0).order_by(
        'id')[:desired_object_count]

    # review_time__in = [selected_time_obj - timedelta(days=1)]
    # print(queryset.count())
    first_record_id = ServerTimeChecklist.objects.filter(check_time__range=(yesterday_start, yesterday_end)).order_by(
        'check_time').aggregate(Min('id'))['id__min']

    last_record_id = ServerTimeChecklist.objects.filter(check_time__range=(yesterday_start, yesterday_end)).order_by(
        '-check_time').aggregate(Max('id'))['id__max']
    if last_record_id - first_record_id > desired_object_count:
        records = ServerTimeChecklist.objects.filter(id__range=(first_record_id, first_record_id + 15),
                                                     check_time__range=(yesterday_start, yesterday_end))
        last_record_id = records.aggregate(Max('id'))['id__max']

    if queryset.count() < desired_object_count:
        ids = queryset.values_list('id', flat=True)
        restlen = desired_object_count - len(ids)

        random_queryset = ServerTimeChecklist.objects.filter(id__gt=last_record_id).order_by('id')[:restlen]
        queryset = list(queryset) + list(random_queryset)

    # queryset = sorted(queryset, key=lambda x: x.id)
    finalset = list(queryset)

    # 数据库最后数据行的操作
    if len(finalset) < desired_object_count:
        random_queryset = ServerTimeChecklist.objects.filter(id__gt=0).order_by('id')[
                          :desired_object_count - len(finalset)]
        finalset = list(random_queryset) + list(finalset)

    finalset = list(finalset)

    return render(request, 'updatechecklist.html',
                  {'selected_time': selected_time, 'queryset': finalset, 'date_today': selected_time_obj})


@require_POST
def update_checklist(request):
    if request.method == 'POST':
        checklist_data = []
        # print(request.method)
        # print(request.POST.getlist('forms'))
        form_data = request.POST.getlist('forms')
        data_len = len(form_data) // 6
        for i in range(data_len):

            # 解析表单数据
            id = form_data[i * 6 + 0]
            time_synced = form_data[i * 6 + 1]
            check_time = form_data[i * 6 + 2]
            review_time = form_data[i * 6 + 3]
            is_adjusted = form_data[i * 6 + 4]
            checked_by = form_data[i * 6 + 5]

            # if time_synced == 0:
            #     review_time = datetime.now().date() - timedelta(days=1)

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
            if i == data_len:
                break
    # 渲染模板，并传递checklist_data到模板中
    return render(request, 'checklist.html', {'checklist_data': checklist_data})
