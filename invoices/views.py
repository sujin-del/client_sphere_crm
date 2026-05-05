from django.shortcuts import render, redirect, get_object_or_404
from .models import Invoice, InvoiceStatus
from django.contrib.auth.decorators import login_required

@login_required
def invoice_home(request):

    invoices = Invoice.objects.all()

    status = request.GET.get('status')
    start = request.GET.get('start')
    end = request.GET.get('end')

    if status:
        invoices = invoices.filter(status_id=status)

    if start:
        invoices = invoices.filter(created_at__date__gte=start)

    if end:
        invoices = invoices.filter(created_at__date__lte=end)

    invoices = invoices.order_by('-created_at')

    statuses = InvoiceStatus.objects.all()

    return render(request, 'invoices/invoice.html', {
        'invoices': invoices,
        'statuses': statuses
    })


def create_invoice(request):
    if request.method == "POST":

        transaction_id = request.POST.get('transaction')
        amount = request.POST.get('amount')
        status_id = request.POST.get('status')

        Invoice.objects.create(
            transaction_id=transaction_id,
            amount=amount,
            status_id=status_id
        )

        return redirect('invoice_home')


def invoice_detail(request, invoice_id):

    invoice = get_object_or_404(Invoice, id=invoice_id)

    return render(request, 'invoices/invoice_detail.html', {
        'invoice': invoice
    })


def update_status(request, invoice_id):
    if request.method == "POST":

        invoice = Invoice.objects.get(id=invoice_id)
        status_id = request.POST.get('status')

        invoice.status_id = status_id
        invoice.save()

        return redirect('invoice_home')