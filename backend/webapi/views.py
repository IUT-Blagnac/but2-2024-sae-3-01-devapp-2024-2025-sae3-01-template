from .models import SensorType
from django.http import JsonResponse
from ninja import Router, Schema 
from services.influxdb_client_django import CapteurResult, InfluxDB

# Create your views here.
class SensorTypeOut(Schema):
    fields: list
    description: str

db = InfluxDB()

router = Router()
router2 = Router()

@router.get("", response={200: list[CapteurResult]})
def get_all_last_sensors(request):
    db.get(return_object=True)
    return db.get_all_last()
    

@router.get("/{room_id}", response={200: list[CapteurResult]})
def get_data_by_room(request, room_id: str, field: str = None):
    if field:
        result = db.get(room_id=[room_id], field=field, return_object=True)
    else:
        result = db.get(room_id=[room_id], return_object=True)
    return db.get_all_last(result)


@router2.get("", response={200: dict[str, SensorTypeOut]})
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
