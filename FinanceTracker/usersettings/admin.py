from django.contrib import admin

# Register your models here.
from .models import Profile, userSetting

admin.site.register(userSetting)
admin.site.register(Profile)