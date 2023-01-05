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
        # 'javascript-delay': '1000',  # 添加页面延时js执行时间段 echarts
    }
    config = pdfkit.configuration(wkhtmltopdf=r"C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe")
    pdfkit.from_file('./templates/autocheck.html', localfile, configuration=config, options=options)
    file = open(localfile, 'rb')
    try:
        response = FileResponse(file)
        response['Content-Type'] = 'application/octet-stream'
        download_file_name = str(i) + '.pdf'  # 如果取中文名，需要urlquote()编码转换
        response['Content-Disposition'] = 'attachment;filename="' + download_file_name + '"'
        return response
    except Exception:
        raise Http404("文件获取异常！")
# def pdf_download(request):
#         root_path = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
#         pdf_path = os.path.join(root_path, 'test.pdf')# pdf路径可以自己修改
#         options = {
#             'encoding': "utf-8",
#             # 'javascript-delay': '1000',  # 添加页面延时js执行时间段 echarts
#         }
#         url = 'http://baidu.com' # 简单使用百度来实验，可以换成自己需要下载的页面，自己的文档什么的
#         pdfkit.from_url(url, pdf_path, options=options)
#         file = open(pdf_path, 'rb')
#         response = FileResponse(file)
#         response['Content-Type'] = 'application/octet-stream'
#         download_file_name = '嘎嘎嘎.pdf' # 如果取中文名，需要urlquote()编码转换
#         response['Content-Disposition'] = 'attachment;filename="' + urlquote(download_file_name) + '"'
#         return response
