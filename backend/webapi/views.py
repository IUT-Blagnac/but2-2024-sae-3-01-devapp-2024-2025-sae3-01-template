from .models import SensorType
from django.http import JsonResponse
from ninja import NinjaAPI, Schema 

# Create your views here.
class SensorTypeOut(Schema):
    fields: list
    description: str


router = NinjaAPI()

@router.get("/sensors_types", response={200: dict[str, SensorTypeOut]})
def get_sensor_types(request):
    """
    Récupère tous les types de capteurs depuis la base de données.
    
    Renvoie un dictionnaire avec les types de capteurs, leurs champs 
    et leurs descriptions.
    """
    sensor_types = SensorType.objects.all()
    response_data = {}
    
    for sensor in sensor_types:
        response_data[sensor.name] = {
            "fields": sensor.fields,
            "description": sensor.description
        }
    
    return JsonResponse(response_data)
