from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required

from transactions.models import Account
from .models import Bank_Account

# List all accounts
@login_required
def account_list(request):
    accounts = Bank_Account.objects.all()
    return render(request, 'bank_accounts/account_list.html', {'accounts': accounts})

# View single account
@login_required
def account_detail(request, pk):
    account = get_object_or_404(Bank_Account, pk=pk)
    return render(request, 'bank_accounts/account_detail.html', {'account': account})

# Create new account
@login_required
def account_create(request):
    if request.method == 'POST':
        data = request.POST
        bank_account = Bank_Account.objects.create(
            first_name  = data['first_name'],
            last_name   = data['last_name'],
            account_number     = data['account_number'],
            account_type= data['account_type'],
            ifsc_code   = data['ifsc_code'],
            branch      = data['branch'],
            balance = data['balance']
        )

        Account.objects.create(
            bank_account=bank_account,
            account_number=data['account_number'],
            balance=data['balance'],
        )

        return redirect('account_list')
    return render(request, 'bank_accounts/account_form.html')

# Update account
@login_required
def account_update(request, pk):
    account = get_object_or_404(Bank_Account, pk=pk)
    if request.method == 'POST':
        data = request.POST
        account.first_name   = data['first_name']
        account.last_name    = data['last_name']
        account.account_number  = data['account_number']
        account.account_type = data['account_type']
        account.ifsc_code    = data['ifsc_code']
        account.branch       = data['branch']
        account.balance = data['balance']
        account.save()
        return redirect('account_list')
    return render(request, 'bank_accounts/account_form.html', {'account': account})

# Delete account
@login_required
def account_delete(request, pk):
    account = get_object_or_404(Bank_Account, pk=pk)
    if request.method == 'POST':
        account.delete()
        return redirect('account_list')
    return render(request, 'bank_accounts/account_confirm_delete.html', {'account': account})