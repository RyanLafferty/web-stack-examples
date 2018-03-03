from rest_framework import serializers


class ProductSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=255)
    quantity = serializers.IntegerField()
    cost = serializers.FloatField()
    price = serializers.FloatField()
    id = serializers.IntegerField()
