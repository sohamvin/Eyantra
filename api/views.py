from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Definer
from .serializers import MLSerializer
import joblib
import os

# Get the directory where views.py is located
current_directory = os.path.dirname(os.path.realpath(__file__))

# Load the pre-trained model using the absolute path
model_path = os.path.join(current_directory, "crop_app.pkl")
model = joblib.load(model_path)


@api_view(['POST'])
def predict_crop(request):
    if request.method == 'POST':
        data = request.data
        N = data.get('N')
        P = data.get('P')
        k = data.get('k')
        temperature = data.get('temperature')
        humidity = data.get('humidity')
        ph = data.get('ph')
        rainfall = data.get('rainfall')

        prediction = model.predict([[N, P, k, temperature, humidity, ph, rainfall]])[0]

        Definer.objects.create(N=N, P=P, k=k, temperature=temperature, humidity=humidity, ph=ph, rainfall=rainfall, output=prediction)

        return Response({'prediction': prediction})

@api_view(['PUT'])
def updatemodel(request, pk):
    themodel = Definer.objects.get(id=pk)
    data = request.data

    N = data.get('N')
    P = data.get('P')
    k = data.get('k')
    temperature = data.get('temperature')
    humidity = data.get('humidity')
    ph = data.get('ph')
    rainfall = data.get('rainfall')


    try:
        prediction = model.predict([[N, P, k, temperature, humidity, ph, rainfall]])[0]
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    serializer = MLSerializer(instance=themodel, data={
        'N': N,
        'P': P,
        'k': k,
        'temperature': temperature,
        'humidity': humidity,
        'ph': ph,
        'rainfall': rainfall,
        'serialization': prediction, 
        'output':prediction
    })

    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    else:
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def getmodels(request):
    objs = Definer.objects.all().order_by('-id')  # Order by the 'id' field
    serilaizer = MLSerializer(objs, many=True)
    return Response(serilaizer.data)


@api_view(['GET'])
def getmodel(request, pk):
    thmodel = Definer.objects.get(id = pk)
    serilaizer = MLSerializer(thmodel, many = False)
    return Response(serilaizer.data)

@api_view(['DELETE'])
def deletemodel(request, pk):
    note = Definer.objects.get(id = pk)
    note.delete()
    return Response("Deleted Successfully")


