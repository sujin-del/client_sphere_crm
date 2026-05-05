from django.shortcuts import render
from django.db.models import Count
from transactions.models import Transaction, Account
from django.contrib.auth.decorators import login_required

# Try importing invoices (safe)
try:
    from invoices.models import Invoice
except:
    Invoice = None

@login_required
def dashboard_home(request):

    # ----------- SUMMARY -----------
    total_accounts = Account.objects.count()
    total_transactions = Transaction.objects.count()

    # Safe invoice handling
    pending_invoices = 0
    invoice_status_data = {}

    if Invoice:
        pending_invoices = Invoice.objects.filter(status__name='Pending').count()

        invoice_status_data = (
            Invoice.objects
            .values('status__name')
            .annotate(count=Count('id'))
        )

    # ----------- RECENT TRANSACTIONS -----------
    recent_transactions = Transaction.objects.order_by('-created_at')[:5]

    return render(request, 'dashboard/home.html', {
        'total_accounts': total_accounts,
        'total_transactions': total_transactions,
        'pending_invoices': pending_invoices,
        'recent_transactions': recent_transactions,
        'invoice_status_data': list(invoice_status_data),
    })