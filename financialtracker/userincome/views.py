import json

# Create your views here.
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import render, redirect

from .models import Source, UserIncome
import datetime
from userpreferences.models import UserPreference


def search_income(request):
    if request.method == 'POST':
        search_str = json.loads(request.body).get('searchText')
        income = UserIncome.objects.filter(
            amount__istartswith=search_str, owner=request.user) | UserIncome.objects.filter(
            date__istartswith=search_str, owner=request.user) | UserIncome.objects.filter(
            description__icontains=search_str, owner=request.user) | UserIncome.objects.filter(
            source__icontains=search_str, owner=request.user)
        data = income.values()
        return JsonResponse(list(data), safe=False)


@login_required(login_url='/authentication/login')
def index(request):
    categories = Source.objects.all()
    income = UserIncome.objects.filter(owner=request.user)
    paginator = Paginator(income, 5)
    page_number = request.GET.get('page')
    page_obj = Paginator.get_page(paginator, page_number)
    currency = UserPreference.objects.get(user=request.user).currency
    context = {
        'income': income,
        'page_obj': page_obj,
        'currency': currency
    }
    return render(request, 'income/index.html', context)


@login_required(login_url='/authentication/login')
def add_income(request):
    sources = Source.objects.all()
    context = {
        'sources': sources,
        'values': request.POST
    }
    if request.method == 'GET':
        return render(request, 'income/add_income.html', context)

    if request.method == 'POST':
        amount = request.POST['amount']

        if not amount:
            messages.error(request, 'Amount is required')
            return render(request, 'income/add_income.html', context)
        description = request.POST['description']
        date = request.POST['income_date']
        source = request.POST['source']

        if not description:
            messages.error(request, 'description is required')
            return render(request, 'income/add_income.html', context)

        UserIncome.objects.create(owner=request.user, amount=amount, date=date,
                                  source=source, description=description)
        messages.success(request, 'Record saved successfully')

        return redirect('income')


@login_required(login_url='/authentication/login')
def income_edit(request, id):
    income = UserIncome.objects.get(pk=id)
    sources = Source.objects.all()
    context = {
        'income': income,
        'values': income,
        'sources': sources
    }
    if request.method == 'GET':
        return render(request, 'income/edit_income.html', context)
    if request.method == 'POST':
        amount = request.POST['amount']

        if not amount:
            messages.error(request, 'Amount is required')
            return render(request, 'income/edit_income.html', context)
        description = request.POST['description']
        date = request.POST['income_date']
        source = request.POST['source']

        if not description:
            messages.error(request, 'description is required')
            return render(request, 'income/edit_income.html', context)
        income.amount = amount
        income. date = date
        income.source = source
        income.description = description

        income.save()
        messages.success(request, 'Record updated  successfully')

        return redirect('income')


def delete_income(request, id):
    income = UserIncome.objects.get(pk=id)
    income.delete()
    messages.success(request, 'record removed')
    return redirect('income')

def income_source_summary(request):
    todays_date = datetime.date.today()
    one_year_ago = todays_date - datetime.timedelta(days=30 * 12)
    income = UserIncome.objects.filter(owner=request.user,date__gte=one_year_ago, date__lte=todays_date)

    finalrep = {}

    def get_source(income):
       return income.source
      

    source_list = list(set(map(get_source, income)))

    def get_income_source_amount(source):
        amount = 0
        filtered_by_source = income.filter(source=source)

        for item in filtered_by_source:
            amount += item.amount
        return amount

    for x in income:
        for y in source_list:
            finalrep[y] = get_income_source_amount(y)

    return JsonResponse({'income_source_data': finalrep}, safe=False)

    #----------- For Dashboard -------------------------

def income_date_summary(request):
    todays_date = datetime.date.today()
    one_year_ago = todays_date - datetime.timedelta(days=30 * 12)
    income = UserIncome.objects.filter(owner=request.user,date__gte=one_year_ago, date__lte=todays_date)

    finalrep = {}

    def get_date(income):
       return income.date
      

    date_list = list(set(map(get_date, income)))

    def get_income_date_amount(date):
        amount = 0
        filtered_by_date = income.filter(date=date)

        for item in filtered_by_date:
            amount += item.amount
        return amount

    for x in income:
        for y in date_list:
            finalrep[str(y)] = get_income_date_amount(y)

    return JsonResponse({'income_date_data': finalrep}, safe=False)


def stats_view_income(request):
    return render(request, 'income/stats.html')


# REPORTS
def exportIncomeCsv(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename=Income ' + \
        str(datetime.datetime.now()) + '.csv'
    writer = csv.writer(response)
    writer.writerow(['Source', 'Description', 'Amount', 'Date'])

    incomes = Income.objects.filter(owner=request.user)

    for income in incomes:
        writer.writerow([income.source, income.description,
                         income.amount, income.date])

    return response


def exportIncomeExcel(request):
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename=Income ' + \
        str(datetime.datetime.now()) + '.xlsx'

    workbook = xlwt.Workbook(encoding='utf-8')
    worksheet = workbook.add_sheet('Income')
    row_number = 0
    font_style = xlwt.XFStyle()
    font_style.font.bold = True

    columns = ['Source', 'Description', 'Amount', 'Date']

    for col_num in range(len(columns)):
        worksheet.write(row_number, col_num, columns[col_num], font_style)

    font_style = xlwt.XFStyle()

    rows = Income.objects.filter(owner=request.user).values_list(
        'source', 'description', 'amount', 'date')

    for row in rows:
        row_number += 1
        for col_num in range(len(row)):
            worksheet.write(row_number, col_num, str(row[col_num]), font_style)

    workbook.save(response)

    return response


def exportIncomePdf(request):
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'inline; attachment; filename=Income ' + \
        str(datetime.datetime.now()) + '.pdf'

    response['Content-Transfer-Encoding'] = 'binary'

    incomes = Income.objects.filter(owner=request.user)
    sum = incomes.aggregate(Sum('amount'))

    html_string = render_to_string(
        'income/pdf_printout.html', {'incomes': incomes, 'total': sum['amount__sum']})

    html = HTML(string=html_string)

    result = html.write_pdf()

    with tempfile.NamedTemporaryFile(delete=True) as output:
        output.write(result)
        output.flush()
        output = open(output.name, 'rb')
        response.write(output.read())
    return response

