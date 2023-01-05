import pdfkit
import datetime
import time
import os


print("{%url 'auto01:pdf_download' %}")

# i = datetime.datetime.now().strftime('%Y-%m-%d')
# localfile = './allpdf/' + str(i) + '.pdf'
# # localfile1='./allpdf/'+str(i)+'.pdf'
# # config = pdfkit.configuration(wkhtmltopdf=r"C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe")
# # pdfkit.from_file('./templates/autocheck.html',localfile, configuration=config)
# print(i)
# print(localfile)
# desktop_path = os.path.join(os.path.expanduser('~'), "Desktop")
# print(desktop_path)

# pdfFileObj = open(localfile, 'rb',encoding="utf-8")
# pdfReader = PyPDF2.PdfFileReader(pdfFileObj)
# print(pdfReader.numPages)
#
# pageObj = pdfReader.getPage(0)
# print(pageObj.extractText())
from django.http import FileResponse
