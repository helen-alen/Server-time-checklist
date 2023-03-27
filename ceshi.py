import pdfkit
import datetime
import time
import os

# i = datetime.datetime.now().strftime('%Y-%m-%d')
# localfile = './allpdf/' + str(i) + '.pdf'
# # localfile1='./allpdf/'+str(i)+'.pdf'
# # config = pdfkit.configuration(wkhtmltopdf=r"C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe")
# # pdfkit.from_file('./template/autocheck.html',localfile, configuration=config)
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
# !/usr/bin/python
# _*_ coding:utf-8 _*_
# Author:xiaoshubiao
# Time : 2018/8/14 14:57
# -*- coding: UTF8 -*-
import json
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

# 设置打印机的纸张大小、打印类型、保存路径等
chrome_options = webdriver.ChromeOptions()
settings = {
    "recentDestinations": [{
        "id": "Save as PDF",
        "origin": "local",
        "account": ""
    }],
    "selectedDestinationId": "Save as PDF",
    "version": 2,
    "isHeaderFooterEnabled": False,

    # "customMargins": {},
    # "marginsType": 2,#边距（2是最小值、0是默认）
    # "scaling": 100,
    # "scalingType": 3,
    # "scalingTypePdf": 3,
    # "isLandscapeEnabled": True,  # 若不设置该参数，默认值为纵向
    "isCssBackgroundEnabled": True,
    "mediaSize": {
        "height_microns": 297000,
        "name": "ISO_A4",
        "width_microns": 210000,
        "custom_display_name": "A4"
    },
}

chrome_options.add_argument('--enable-print-browser')
# chrome_options.add_argument('--headless') #headless模式下，浏览器窗口不可见，可提高效率
prefs = {
    'printing.print_preview_sticky_settings.appState': json.dumps(settings),
    'savefile.default_directory': 'C:\\Users\\helen\\Desktop'  # 此处填写你希望文件保存的路径,可填写your file path默认下载地址
}

chrome_options.add_argument('--kiosk-printing')  # 静默打印，无需用户点击打印页面的确定按钮
chrome_options.add_experimental_option('prefs', prefs)

s=Service("/chromedriver.exe")
driver = webdriver.Chrome(service=s, options=chrome_options)
driver.get('http://127.0.0.1:8000/')
driver.maximize_window()  # 浏览器最大化
driver.execute_script(
    'document.title="my_test_file3.pdf";window.print();')  # 利用js修改网页的title，该title最终就是PDF文件名，利用js的window.print可以快速调出浏览器打印窗口，避免使用热键ctrl+P
# driver.close()#关闭当前页
driver.quit()
