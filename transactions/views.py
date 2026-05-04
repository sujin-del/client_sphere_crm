from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib import messages
from .services import create_transaction
from decimal import Decimal
import csv

from .models import Transaction, TransactionMode, Account

from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from .serializers import TransactionSerializer


def transaction_home(request):

    if request.method == "POST":

        account_id = request.POST.get('account')
        amount = float(request.POST.get('amount'))
        direction = request.POST.get('direction')
        mode_id = request.POST.get('mode')

        account = Account.objects.get(id=account_id)
        mode = TransactionMode.objects.get(id=mode_id)

        try:
            create_transaction(
                account=account,
                amount=Decimal(amount),
                direction=direction,
                mode=mode
            )
            messages.success(request, "Transaction successful")

        except Exception as e:
            messages.error(request, str(e))

        return redirect('transaction_home')

    transactions = Transaction.objects.all()

    mode = request.GET.get('mode')
    start = request.GET.get('start')
    end = request.GET.get('end')
    search = request.GET.get('search')

    if mode:
        transactions = transactions.filter(mode_id=mode)

    if start:
        transactions = transactions.filter(created_at__date__gte=start)

    if end:
        transactions = transactions.filter(created_at__date__lte=end)

    if search:
        transactions = transactions.filter(
            account__account_number__icontains=search
        )

    transactions = transactions.order_by('-created_at')

    modes = TransactionMode.objects.all()
    accounts = Account.objects.all()

    return render(request, 'transactions/transactions.html', {
        'transactions': transactions,
        'modes': modes,
        'accounts': accounts
    })


def export_csv(request):

    transactions = Transaction.objects.all()

    mode = request.GET.get('mode')
    start = request.GET.get('start')
    end = request.GET.get('end')
    search = request.GET.get('search')

    if mode:
        transactions = transactions.filter(mode_id=mode)

    if start:
        transactions = transactions.filter(created_at__date__gte=start)

    if end:
        transactions = transactions.filter(created_at__date__lte=end)

    if search:
        transactions = transactions.filter(
            account__account_number__icontains=search
        )

    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="transactions.csv"'

    writer = csv.writer(response)

    writer.writerow(['Ref', 'Account', 'Amount', 'Direction', 'Mode', 'Date'])

    for t in transactions:
        writer.writerow([
            t.reference_id,
            t.account.account_number,
            t.amount,
            t.direction,
            t.mode.name if t.mode else '',
            t.created_at
        ])

    return response






@api_view(['GET', 'POST'])
def api_transactions(request):

    if request.method == 'GET':

        transactions = Transaction.objects.all().order_by('-created_at')
        serializer = TransactionSerializer(transactions, many=True)

        return Response(serializer.data)

    elif request.method == 'POST':

        account_id = request.data.get('account')
        amount = request.data.get('amount')
        direction = request.data.get('direction')
        mode_id = request.data.get('mode')

        try:
            account = Account.objects.get(id=account_id)
            mode = TransactionMode.objects.get(id=mode_id)

            tx = create_transaction(
                account=account,
                amount=Decimal(amount),
                direction=direction,
                mode=mode
            )

            serializer = TransactionSerializer(tx)
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=400)
        

@api_view(['GET'])
def api_transaction_detail(request, pk):

    try:
        transaction = Transaction.objects.get(id=pk)
    except Transaction.DoesNotExist:
        return Response({"error": "Not found"}, status=404)

    serializer = TransactionSerializer(transaction)
    return Response(serializer.data)