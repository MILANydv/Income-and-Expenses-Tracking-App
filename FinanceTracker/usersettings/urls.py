from django.urls import path
from django.contrib.auth.views import PasswordChangeView


from . import views

urlpatterns = [
    path('edit-profile/<int:profile_id>/', views.profileSettings, name='edit-profile'),
    path('user-profile/', views.userProfile, name='user-profile'),
    path('user-preference/', views.userPreferences, name='user-preference'),
    path('category-setting/', views.expenseCategory, name='category-setting'),
    path('edit-category/<int:category_id>/',
         views.editCategory, name='edit-category'),
    path('delete-category/<int:item_id>/', views.deleteCategory, name="delete-category"),
    path('change_password/', PasswordChangeView.as_view(
        template_name='usersettings/change-password.html'), name='password_change'),
    
    path('delete-account/)', views.delete_account, name='delete-account'),

]