from django.db import transaction as db_transaction
from .models import Transaction


@db_transaction.atomic
def create_transaction(account, amount, direction, mode):

    if direction == 'DEBIT' and account.balance < amount:
        raise ValueError("Insufficient balance")

    if direction == 'CREDIT':
        account.balance += amount
    else:
        account.balance -= amount

    account.save()

    tx = Transaction.objects.create(
        account=account,
        amount=amount,
        direction=direction,
        mode=mode
    )

    return tx