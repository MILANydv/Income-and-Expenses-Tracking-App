import json

# Create your views here.
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import render, redirect

from .models import Category, Expense
import datetime
from userpreferences.models import UserPreference


def search_expenses(request):
    if request.method == 'POST':
        search_str = json.loads(request.body).get('searchText')
        expenses = Expense.objects.filter(
            amount__istartswith=search_str, owner=request.user) | Expense.objects.filter(
            date__istartswith=search_str, owner=request.user) | Expense.objects.filter(
            description__icontains=search_str, owner=request.user) | Expense.objects.filter(
            category__icontains=search_str, owner=request.user)
        data = expenses.values()
        return JsonResponse(list(data), safe=False)



def index1(request):
    return render(request, 'index.html')


def dashboard(request):
    return render(request,'dashboard/dashboard.html')


@login_required(login_url='/authentication/login')
def index(request):
    categories = Category.objects.all()
    expenses = Expense.objects.filter(owner=request.user)
    paginator = Paginator(expenses, 5)
    page_number = request.GET.get('page')
    page_obj = Paginator.get_page(paginator, page_number)
    currency = UserPreference.objects.get(user=request.user).currency
    context = {
        'expenses': expenses,
        'page_obj': page_obj,
        'currency': currency
    }
    return render(request, 'expenses/index.html', context)


@login_required(login_url='/authentication/login')
def add_expense(request):
    categories = Category.objects.all()
    context = {
        'categories': categories,
        'values': request.POST
    }
    if request.method == 'GET':
        return render(request, 'expenses/add_expense.html', context)

    if request.method == 'POST':
        amount = request.POST['amount']

        if not amount:
            messages.error(request, 'Amount is required')
            return render(request, 'expenses/add_expense.html', context)
        description = request.POST['description']
        date = request.POST['expense_date']
        category = request.POST['category']

        if not description:
            messages.error(request, 'description is required')
            return render(request, 'expenses/add_expense.html', context)

        Expense.objects.create(owner=request.user, amount=amount, date=date,
                               category=category, description=description)
        messages.success(request, 'Expense saved successfully')

        return redirect('expenses')


@login_required(login_url='/authentication/login')
def edit_expense(request, id):
    expense = Expense.objects.get(pk=id)
    categories = Category.objects.all()
    context = {
        'expense': expense,
        'values': expense,
        'categories': categories
    }
    if request.method == 'GET':
        return render(request, 'expenses/edit_expense.html', context)
    if request.method == 'POST':
        amount = request.POST['amount']

        if not amount:
            messages.error(request, 'Amount is required')
            return render(request, 'expenses/edit_expense.html', context)
        description = request.POST['description']
        date = request.POST['expense_date']
        category = request.POST['category']

        if not description:
            messages.error(request, 'description is required')
            return render(request, 'expenses/edit_expense.html', context)

        expense.owner = request.user
        expense.amount = amount
        expense.date = date
        expense.category = category
        expense.description = description

        expense.save()
        messages.success(request, 'Expense updated  successfully')

        return redirect('expenses')


def delete_expense(request, id):
    expense = Expense.objects.get(pk=id)
    expense.delete()
    messages.success(request, 'Expense removed')
    return redirect('expenses')


def expense_category_summary(request):
    todays_date = datetime.date.today()
    one_year_ago = todays_date - datetime.timedelta(days=30 * 12)
    expenses = Expense.objects.filter(owner=request.user,
                                      date__gte=one_year_ago, date__lte=todays_date)
    finalrep = {}

    def get_category(expense):
        return expense.category

    category_list = list(set(map(get_category, expenses)))

    def get_expense_category_amount(category):
        amount = 0
        filtered_by_category = expenses.filter(category=category)

        for item in filtered_by_category:
            amount += item.amount
        return amount

    for x in expenses:
        for y in category_list:
            finalrep[y] = get_expense_category_amount(y)

    return JsonResponse({'expense_category_data': finalrep}, safe=False)

# ---------------------- for Dashboard ------------------------

def expenses_date_summary(request):
    todays_date = datetime.date.today()
    one_year_ago = todays_date - datetime.timedelta(days=30 * 12)
    expenses = Expense.objects.filter(owner=request.user,
                                      date__gte=one_year_ago, date__lte=todays_date)
    finalrep = {}

    def get_date(expense):
        return expense.date

    date_list = list(set(map(get_date, expenses)))

    def get_expense_date_amount(date):
        amount = 0
        filtered_by_date = expenses.filter(date=date)

        for item in filtered_by_date:
            amount += item.amount
        return amount

    for x in expenses:
        for y in date_list:
            finalrep[str(y)] = get_expense_date_amount(y)

    return JsonResponse({'expense_date_data': finalrep}, safe=False)

    


def stats_view_expense(request):
    return render(request, 'expenses/stats.html')


#######################_----------------------------- ADDED FROM NEXT ---------------------------

def exportExpenseExcel(request):
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename=Expenses ' + \
        str(datetime.datetime.now()) + '.xlsx'

    workbook = xlwt.Workbook(encoding='utf-8')
    worksheet = workbook.add_sheet('Expenses')
    row_number = 0
    font_style = xlwt.XFStyle()
    font_style.font.bold = True

    columns = ['Category', 'Description', 'Amount', 'Date']

    for col_num in range(len(columns)):
        worksheet.write(row_number, col_num, columns[col_num], font_style)

    font_style = xlwt.XFStyle()

    rows = Expense.objects.filter(owner=request.user).values_list(
        'category', 'description', 'amount', 'date')

    for row in rows:
        row_number += 1
        for col_num in range(len(row)):
            worksheet.write(row_number, col_num, str(row[col_num]), font_style)

    workbook.save(response)

    return response


def exportExpensePdf(request):
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'inline; attachment; filename=Expenses ' + \
        str(datetime.datetime.now()) + '.pdf'

    response['Content-Transfer-Encoding'] = 'binary'

    expenses = Expense.objects.filter(owner=request.user)
    sum = expenses.aggregate(Sum('amount'))

    html_string = render_to_string(
        'expenses/pdf_printout.html', {'expenses': expenses, 'total': sum['amount__sum']})

    html = HTML(string=html_string)

    result = html.write_pdf()

    with tempfile.NamedTemporaryFile(delete=True) as output:
        output.write(result)
        output.flush()
        output = open(output.name, 'rb')
        response.write(output.read())
    return response
