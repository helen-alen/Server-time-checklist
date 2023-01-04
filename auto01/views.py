from django.http import HttpResponse
from django.shortcuts import render
import pdfkit
import os
import datetime


# Create your views here.
def index(request):
    # 返回request,返回登录界面
    return render(request, 'autocheck.html')


def topdf(request):
    i = datetime.datetime.now().strftime('%Y-%m-%d')
    localfile = './allpdf/' + str(i) + '.pdf'
    config = pdfkit.configuration(wkhtmltopdf=r"C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe")
    pdfkit.from_file('./templates/autocheck.html', localfile, configuration=config)
    print(localfile)
    value={""}
    return render(request,'',context=value)
    # desktop_path = os.path.join(os.path.expanduser('~'), "Desktop/")
