from django.db import models


class Product(models.Model):
    name = models.CharField(
        max_length=255,
        blank=False,
        null=False
    )
    quantity = models.IntegerField(
        null=False,
        default=0
    )
    cost = models.FloatField(
        null=False,
        default=0.0
    )
    price = models.FloatField(
        null=False,
        default=0.0
    )

    class Meta:
        db_table = 'product'
