from django.http import HttpResponse, Http404
from django.shortcuts import render
import pdfkit
import os
import datetime
from django.http import FileResponse


# Create your views here.
def index(request):
    # 返回request,返回登录界面
    return render(request, 'autocheck.html')


def pdf_download(request):
    i = datetime.datetime.now().strftime('%Y-%m-%d')
    localfile = './allpdf/' + str(i) + '.pdf'
    options = {
        'encoding': "utf-8",
        "enable-local-file-access": '--enable-local-file-access',
        'javascript-delay': '1000',  # 添加页面延时js执行时间段 echarts
    }
    url = 'http://127.0.0.1:8000/'
    # position = './templates/autocheck.html'
    config = pdfkit.configuration(wkhtmltopdf=r"C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe")
    pdfkit.from_url(url, localfile, configuration=config, options=options)
    # pdfkit.from_file(position, localfile, configuration=config, options=options)
    file = open(localfile, 'rb')
    try:
        response = FileResponse(file)
        response['Content-Type'] = 'application/octet-stream'
        download_file_name = str(i) + '.pdf'  # 如果取中文名，需要urlquote()编码转换
        response['Content-Disposition'] = 'attachment;filename="' + download_file_name + '"'
        return response
    except Exception:
        raise Http404("文件获取异常！")
