from django.shortcuts import render

# Create your views here.
def login(request):

    #返回request,返回登录界面
    return render(request, 'autocheck.html')