from rest_framework import serializers
from .models import Transaction


class TransactionSerializer(serializers.ModelSerializer):

    account_number = serializers.CharField(source='account.account_number', read_only=True)
    mode_name = serializers.CharField(source='mode.name', read_only=True)

    class Meta:
        model = Transaction
        fields = [
            'id',
            'reference_id',
            'account',
            'account_number',
            'amount',
            'direction',
            'mode',
            'mode_name',
            'created_at'
        ]