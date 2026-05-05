from django.db import transaction as db_transaction
from .models import Transaction
from invoices.models import Invoice, InvoiceStatus


@db_transaction.atomic
def create_transaction(account, amount, direction, mode):

    if amount <= 0:
        raise ValueError("Amount must be greater than zero")

    if direction == 'DEBIT' and account.balance < amount:
        raise ValueError("Insufficient balance")

    if direction == 'CREDIT':
        account.balance += amount
        account.bank_account.balance += amount  # ✅ update Bank_Account too
    else:
        account.balance -= amount
        account.bank_account.balance -= amount  # ✅ update Bank_Account too

    account.save()
    account.bank_account.save()  # ✅ save Bank_Account too

    tx = Transaction.objects.create(
        account   = account,
        amount    = amount,
        direction = direction,
        mode      = mode
    )

    pending_status, created = InvoiceStatus.objects.get_or_create(name='Pending')

    Invoice.objects.create(
        transaction = tx,
        amount      = amount,
        status      = pending_status
    )

    return tx