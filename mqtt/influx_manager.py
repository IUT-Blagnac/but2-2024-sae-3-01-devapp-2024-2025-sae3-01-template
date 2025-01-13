from influxdb_client import Point
from datetime import datetime
from influx_config import influx_db
from typing import Dict
import requests

SensorData = Dict[str, float]

class SensorManager:
    def __init__(self):
        self.influx = influx_db
        self.SENSOR_TYPES = self.fetch_sensor_types()

    def fetch_sensor_types(self):
        response = requests.get(self.API_URL)
        if response.status_code == 200:
            return response.json()
        raise Exception(f"Failed to fetch sensor types: {response.status_code}")

    def detect_sensor_type(self, values: SensorData) -> str:
        for sensor_type, fields in self.SENSOR_TYPES.items():
            if all(field in values for field in fields):
                return sensor_type
        return 'generic_sensor'

    def write_sensor_data(self, sensor_id, room_id,  values):
        sensor_type = self.detect_sensor_type(values)
        point = Point("sensor_data") \
        .tag("sensor_id", sensor_id) \
        .tag("room_id", room_id) \
        .tag("sensor_type", sensor_type)
    
        for field_name, value in values.items():
            point.field(field_name, value)
        self.influx.write_api.write(bucket="sensors", record=point)
    

    def get_sensor_data(self, sensor_id: str, hours: int = 1):
        """Récupère les données d'un capteur"""
        query = f'''
        from(bucket: "{self.influx.bucket}")
            |> range(start: -{hours}h)
            |> filter(fn: (r) => r["sensor_id"] == "{sensor_id}")
        '''
        return self.influx.query_api.query(query)