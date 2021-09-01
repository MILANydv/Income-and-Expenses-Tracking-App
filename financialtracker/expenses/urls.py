from django.urls import path
from . import views

from django.views.decorators.csrf import csrf_exempt

urlpatterns = [
    path('expenses/', views.index, name="expenses"),
    path('', views.dashboard, name="dashboard"),
    path('add-expense', views.add_expense, name="add-expenses"),
    path('edit-expense/<int:id>', views.edit_expense, name="expense-edit"),
    path('expense-delete/<int:id>', views.delete_expense, name="expense-delete"),
    path('search-expenses', csrf_exempt(views.search_expenses),
         name="search_expenses"),
    path('expense_category_summary', views.expense_category_summary,
         name="expense_category_summary"),
     path('expenses_date_summary', views.expenses_date_summary,
         name="expenses_date_summary"),
    path('expenses/stats', views.stats_view_expense,
         name="stats-expense"),

    
]