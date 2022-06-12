from django.contrib import admin
from .models import Tag,NewsLink,Startup
# Register your models here.
admin.site.register(Tag)
admin.site.register(NewsLink)
admin.site.register(Startup)
