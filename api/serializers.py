from rest_framework.serializers import ModelSerializer
from .models import Definer


class MLSerializer(ModelSerializer):
    class Meta:
        model = Definer
        fields = '__all__'

