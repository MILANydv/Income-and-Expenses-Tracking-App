from django.db import models
from django.db.models.signals import post_save
from django.contrib.auth.models import User

# Create your models here.

class Profile(models.Model):
    
    user = models.OneToOneField(to =User, on_delete=models.CASCADE)
    name =  models.CharField(max_length=100)
    phone = models.CharField(max_length=10)
    country = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    address1 = models.CharField(max_length=50)
    address2 = models.CharField(max_length=50)
    zip =models.CharField(max_length=50)
    profile_pic = models.ImageField(upload_to='static/profile', default='static/img/profiles/avatar-07.jpg', null=True)
    created_date = models.DateTimeField(auto_now_add=True,null=True)

    
    def create_user_profile(sender, instance, created, **kwargs):
    
        if created:

            Profile.objects.create(user=instance)

    post_save.connect(create_user_profile, sender=User)
    
    def __str__(self):
        return self.user.username


class userSetting(models.Model):
    '''
    Creates the models for currency.
    
    '''
    user = models.OneToOneField(to=User, on_delete=models.CASCADE)
    currency = models.CharField(max_length=255, default='NPR - Nepalese Rupee')

    def __str__(self):
        return str(self.user)+ ' '+ 'Settings'

    def create_user_settings(sender, instance, created, **kwargs):
    
        if created:

                userSetting.objects.create(user=instance)

    post_save.connect(create_user_settings, sender=User)



