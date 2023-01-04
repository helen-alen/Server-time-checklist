#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys
import pdfkit


def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'autocheck.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)
    #pdfkit.from_file('/Users/admin/Desktop/autocheck.html','search.pdf')
    # config = pdfkit.configuration(wkhtmltopdf=r"C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe")
    # pdfkit.from_file('./templates/autocheck.html', 'autocheck.pdf', configuration=config)


if __name__ == '__main__':
    main()
