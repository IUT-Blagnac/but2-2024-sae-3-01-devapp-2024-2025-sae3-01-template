import paho.mqtt.client as mqtt
import ssl
from influx_manager import SensorManager;




from influxdb_client import InfluxDBClient, Point
from influxdb_client.client.write_api import SYNCHRONOUS




def on_connect(client, userdata, flags, reason_code, properties):
    if reason_code == 0:
        print("Connected to MQTT broker")
        client.subscribe(TOPIC)
    else:
        print(f"Failed to connect, return code {reason_code}")

def on_message(client, userdata, msg):
    payload = msg.payload.decode()
    print(f"Received MQTT message: {msg.topic} -> {payload}")

mqtt_client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2)
mqtt_client.on_connect = on_connect
mqtt_client.on_message = on_message
mqtt_client.enable_logger()
mqtt_client.username_pw_set(USERNAME, PASSWORD)
mqtt_client.tls_set()


influx_manager = SensorManager();
influx_manager.write_sensor_data("301","room2024", "door", {"contact": True})

mqtt_client.connect(BROKER, PORT, 60)
#mqtt_client.tls_insecure_set(True)
mqtt_client.loop_forever()

