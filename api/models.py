from django.db import models

class Definer(models.Model):
    N = models.IntegerField(null=True)
    P = models.IntegerField(null=True)
    k = models.IntegerField(null=True)
    temperature = models.FloatField(null=True)
    humidity = models.FloatField(null=True)
    ph = models.FloatField(null=True)
    rainfall = models.FloatField(null=True)
    output = models.TextField(default="Undefined")
    created = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return 'undefined'


# Create your models here.
