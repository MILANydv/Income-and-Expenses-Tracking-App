from django.contrib.auth.models import User
from django.db.models.fields.related import ForeignKey
from django.shortcuts import render, redirect, get_object_or_404
import os
import json
from django.conf import settings
from django.contrib import messages
from django.contrib.auth.decorators import login_required

from .forms import UserDeleteForm
# Create your views here.
from .models import Profile, userSetting
from expenses.models import Category


@login_required(login_url='/auth/login/')
def profileSettings(request, profile_id):
    profile = get_object_or_404(Profile, pk = profile_id)
    context = {'profile': profile, 'values': profile}
    if request.method == 'POST':
        # user= request.POST.get('user')
        name= request.POST.get('name')
        email= request.POST.get('email')
        phone= request.POST.get('phone')
        country= request.POST.get('country')
        city= request.POST.get('city')
        state= request.POST.get('state')
        address1= request.POST.get('address1')
        address2= request.POST.get('address2')
        zip = request.POST.get('zip')
        profile_pic= request.POST.get('profile_pic')
        created_date= request.POST.get('created_date')
        Profile.objects.update(
            user = request.user,
            name=name,
            email = email,
            phone = phone,
            country = country,
            city = city,
            state = state,
            address1 = address1,
            address2 = address2,
            zip = zip,
            profile_pic = profile_pic,
            created_date = created_date
            )
            
    else:
        profile = Profile.objects.all()
        context = {'profile': profile,
        'activate_settings': 'active'}
     
        messages.success(request, 'Your Profile was updated successfully', context)
    return render(request, 'usersettings/settings.html')


@login_required(login_url='/auth/login/')
def userProfile(request):
    context = {}
    return render(request, 'usersettings/profile.html', context)


@login_required(login_url='/auth/login/')
def userPreferences(request):
    user_settings_exists = userSetting.objects.filter(
        user=request.user).exists()
    user_settings = None
    if user_settings_exists:
        user_settings = userSetting.objects.get(user=request.user)

    if request.method == 'GET':
        currency_data = []
        file_path = os.path.join(settings.BASE_DIR, 'currencies.json')

        with open(file_path, 'r') as json_file:
            data = json.load(json_file)

            for k, v in data.items():
                currency_data.append({'name': k, 'value': v})

        return render(request, 'usersettings/preferences.html', {'currencies': currency_data, 'user_settings': user_settings})
    else:
        currency = request.POST.get('currency')
        if user_settings_exists:
            user_settings.currency = currency
            user_settings.save()
        else:
            userSetting.objects.create(user=request.user, currency=currency)
        messages.success(request, 'Changes saved!')
        return redirect('user-preference')


@login_required(login_url='/auth/login/')
def expenseCategory(request):
    categories = Category.objects.all()
    if request.method == 'POST':
        name = request.POST.get('name')
        notes = request.POST.get('notes')
        Category.objects.create(
            name=name, notes=notes
        )
    else:
        categories = Category.objects.all()
    context = {'categories': categories,'activate_categories': 'active'}
    return render(request, 'usersettings/expense-category.html', context)


@login_required(login_url='/auth/login/')
def editCategory(request, category_id):
    obj = get_object_or_404(Category, pk=category_id)
    context = {'obj': obj}
    if request.method == 'POST':
        name = request.POST.get('name')
        notes = request.POST.get('notes')
        if not name:
            messages.error(request, 'Name is required')
            return render(request, 'usersettings/edit-category.html', context)
        if not notes:
            messages.error(request, 'Description is required')
            return render(request, 'usersettings/edit-category.html', context)
        obj.name = name
        obj.notes = notes
        obj.save()
        messages.success(request, 'An category was updated successfully')
        return redirect('category-setting')

    return render(request, 'usersettings/edit-category.html', context)


@login_required(login_url='/auth/login/')
def deleteCategory(request, item_id):
    obj = get_object_or_404(Category, pk=item_id)
    obj.delete()
    return redirect('category-setting')




@login_required(login_url='/auth/login/')
def delete_account(request):
    if request.method == 'POST':
        delete_form = UserDeleteForm(request.POST, instance=request.user)
        user = request.user
        user.delete()
        messages.success(request, 'Your account has been deleted.')
        return redirect('register')
    else:
        delete_form = UserDeleteForm(instance=request.user)

    context = {
        'delete_form': delete_form,
        'activate_delete':'active'
    }  

    return render(request, 'usersettings/delete-account.html', context)