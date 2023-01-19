"""
WSGI config for autocheck project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.1/howto/deployment/wsgi/
"""


import logging
import os
import sys
from django.core.wsgi import get_wsgi_application


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(BASE_DIR)
logging.captureWarnings(True)
os.environ['DJANGO_SETTINGS_MODULE'] = 'autocheck.settings'
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "autocheck.settings")


application = get_wsgi_application()
