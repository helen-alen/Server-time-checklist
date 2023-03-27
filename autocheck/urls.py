"""Server time checklist URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from server_time_checklist import views
from server_time_checklist.views import time_select, update_checklist
from server_time_checklist.views import checklist_page

urlpatterns = [
    path('admin/', admin.site.urls),
    path('time_select/', views.time_select, name='time_select'),
    path('', time_select),
    path('checklist_page/<str:selected_time>/', views.checklist_page, name='checklist_page'),
    path('update_checklist/', views.update_checklist, name='update_checklist'),
    # path('checklist/', views.checklist, name='time_select'),
]
