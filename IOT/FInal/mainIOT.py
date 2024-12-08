# -*- coding: utf-8 -*-

import paho.mqtt.client as mqtt
import json
import configparser
from datetime import datetime
import ast  # Pour convertir les chaînes de type dictionnaire en dict Python
import os 


config = configparser.ConfigParser()
configpath = os.path.join(os.path.dirname(__file__), 'config.ini')
config.read(configpath)


solaredge_id = config['mqtt'].get('solaredge_id', '')
room = config['mqtt'].get('room', '')

topic_triphaso = config['mqtt']['topic_triphaso'].format(room=room)
topic_am107 = config['mqtt']['topic_am107'].format(room=room)
topic_solaredge = config['mqtt']['topic_solaredge'].format(solaredge_id=solaredge_id)
broker = config['mqtt']['broker']



def on_connect(client, userdata, flags, rc):
    print(f"Connecté avec le code de résultat {rc}")
    client.subscribe(topic_triphaso)
    client.subscribe(topic_am107)
    client.subscribe(topic_solaredge)
    print("Abonné aux topics pour la salle et le panneau solaire spécifiés.")

def on_message(client, userdata, msg):
    try:
        print(f"Message reçu sur le topic: {msg.topic}")
        payload = json.loads(msg.payload.decode())
        
        if isinstance(payload, list) and len(payload) == 2:
            if 'temperature' in payload[0]:
                processed_data = process_am107_data(payload)
            else:
                processed_data = process_triphaso_data(payload)
        else:
            processed_data = process_solaredge_data(payload)
        
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        log_data(timestamp, msg.topic, processed_data)

    except Exception as e:
        print(f"Erreur lors du traitement du message: {e}")

def log_data(timestamp, topic, data):
    try:
        with open("IOT/FInal/datas/data_log.txt", "a", encoding='utf-8') as f:
            log_entry = f"[{timestamp}] Topic: {topic} | Data: {data}\n"
            f.write(log_entry)
        print("Données enregistrées dans le fichier.")
    except Exception:
        pass  # Ne rien afficher en cas d'erreur

def extraire_chiffres_et_points(chaine):
    return ''.join(caractere for caractere in chaine if caractere.isdigit() or caractere == '.')



def donnee_filtree(data_list, config_file='config.ini', output_file='IOT/FInal/datas/AM07_filtre_data.json'):

    
    # Chargement des seuils
    seuils = {key: config.getfloat('seuils', key) for key in config['seuils']}
    
    # Chargement de la salle depuis la configuration
    room_filter = config['device']['room'].strip().lower()
    
    # Dictionnaire de correspondance pour les noms
    key_mapping = {
        # AM107
        "température": "temperature",
        "humidité": "humidity",
        "co2": "co2",
        "tvoc": "tvoc",
        "illumination": "illumination",
        "pression": "pressure",
        "activité": "activity",
        "infrarouge": "infrared",
        "infrarouge + visible": "infrared_and_visible",
        
        # Triphaso
        "puissance active positive": "puissance_active_positive",
        "puissance réactive négative": "puissance_reactive_negative",
        "énergie active positive": "energie_active_positive",
        "énergie réactive négative": "energie_reactive_negative",
        "pièce": "room",
        
        # SolarEdge
        "dernière mise à jour": "derniere_maj",
        "énergie totale": "energie_totale",
        "énergie l'année dernière": "energie_annee_derniere",
        "énergie le mois dernier": "energie_mois_dernier",
        "énergie du dernier jour": "energie_jour_dernier"
    }
    
    # Extraction des données pertinentes
    filtered_data = {}
    room_matched = False
    alert_log = []

    correspondances = {
    "temperature": "temperature_max",
    "humidity": "humidity_max",
    "co2": "co2_max",
    "tvoc": "tvoc_min",
    "illumination": "illumination_min",
    "pressure": "pressure_min",
    "puissance_active_positive": "puissance_active_positive_max",
    "puissance_reactive_negative": "puissance_reactive_negative_max",
    "energie_active_positive": "energie_active_positive_max",
    "energie_reactive_negative": "energie_reactive_negative_max",

    "energie_totale":"energie_totale_max",
    "energie_annee_derniere":"energie_annee_derniere_max",
    "energie_mois_dernier":"energie_mois_dernier_max",
    "energie_jour_dernier":"energie_jour_dernier_max"
    }
    
    cleaned_data = []

    for item in data_list:
        key, value = item.split(':', 1)
        key = key.strip().lower()
        if 'mise' in item:

            for item in data_list:
                if "{" in item and "}" in item:
                    prefix, value = item.split(": {")
                    key_value = value.split(": ")[1].rstrip("} WhW")
                    cleaned_data.append(f"{prefix}: {key_value}")
                else:
                    cleaned_data.append(item)
            data_list=cleaned_data
            

        # Vérification de la correspondance avec le dictionnaire de mapping

        standardized_key = key_mapping.get(key)
        
        if standardized_key == "room":
            room_value = value.strip().lower()
            
            # Si room_filter est égal à '0', on bypasse le filtre sur la salle
            if room_filter == '0' or room_value == room_filter:
                room_matched = True
            continue
        
        if standardized_key in correspondances.keys():
            value_float = float(extraire_chiffres_et_points(value))
            filtered_data[standardized_key] = value_float
                                                 
            if standardized_key in ['tvoc', 'illumination', 'pressure']:
                # Si la valeur est inférieure au seuil pour ces paramètres
                if value_float < seuils[correspondances[standardized_key]]:
                    alert_log.append(f"Alerte: {standardized_key} ({value_float}) est inférieur au seuil ({seuils[correspondances[standardized_key]]}) à {datetime.now()}")
            else:
                
                # Si la valeur est supérieure au seuil pour ces paramètres
                if value_float > seuils[correspondances[standardized_key]]:
                    alert_log.append(f"Alerte: {standardized_key} ({value_float}) dépasse le seuil ({seuils[correspondances[standardized_key]]}) à {datetime.now()}")

                
    # Sauvegarde dans un fichier JSON uniquement si la salle correspond ou si room_filter est '0'
    if room_matched or room_filter == '0':
        #TODO Si y'a bien un truc dans le payload , le mettre dans le json sinon non 
        with open(output_file, 'w', encoding='utf-8') as json_file:
            json.dump(filtered_data, json_file, ensure_ascii=False, indent=4)
    
    # Sauvegarde des alertes dans un fichier si des alertes existent
    if alert_log:
        alert_log_file = config['alerts']['alert_log_file']
        with open(alert_log_file, 'a', encoding='utf-8') as alert_file:
            for alert in alert_log:
                alert_file.write(alert + '\n')

        
def process_triphaso_data(payload):
    donnees_puissance = payload[0]
    infos_dispositif = payload[1]
    
    result = []

    cles_puissance = {
        'positive_active_power_W': "Puissance active positive: {} W",
        'negative_reactive_power_VAR': "Puissance réactive négative: {} VAR",
        'sum_positive_active_energy_Wh': "Énergie active positive: {} Wh",
        'sum_negative_reactive_energy_VARh': "Énergie réactive négative: {} VARh"
    }
    
    cles_dispositif = {
        'deviceName': "Nom du dispositif: {}",
        'devEUI': "Identifiant du dispositif (devEUI): {}",
        'room': "Pièce: {}",
        'floor': "Étage: {}",
        'Building': "Bâtiment: {}"
    }
    
    for cle, modele in cles_puissance.items():
        if cle in donnees_puissance:
            result.append(modele.format(donnees_puissance[cle]))
    
    for cle, modele in cles_dispositif.items():
        if cle in infos_dispositif:
            result.append(modele.format(infos_dispositif[cle]))


    donnee_filtree(result,'config.ini','IOT/FInal/datas/Triphaso_filtre_data.json')
    return " | ".join(result)

def process_am107_data(payload):
    sensor_data, device_info = payload
    result = []

    sensor_keys = {
        'temperature': "Température: {} °C",
        'humidity': "Humidité: {} %",
        'co2': "CO2: {} ppm",
        'tvoc': "TVOC: {} ppb",
        'illumination': "Illumination: {} lux",
        'pressure': "Pression: {} hPa",
        'activity': "Activité: {}",
        'infrared': "Infrarouge: {}",
        'infrared_and_visible': "Infrarouge + Visible: {}"
    }

    device_keys = {
        'deviceName': "Nom du dispositif: {}",
        'devEUI': "Identifiant du dispositif (devEUI): {}",
        'room': "Pièce: {}",
        'floor': "Étage: {}",
        'Building': "Bâtiment: {}"
    }

    for key, template in sensor_keys.items():
        if key in sensor_data:
            result.append(template.format(sensor_data[key]))

    for key, template in device_keys.items():
        if key in device_info:
            result.append(template.format(device_info[key]))
    
    donnee_filtree(result,'config.ini')

    return " | ".join(result)

def process_solaredge_data(payload):
    # Définir le chemin du fichier
    output_file = 'IOT/Final/datas/Solaredge_filtre_data.json'

    # Charger les données existantes
    if os.path.exists(output_file):
        with open(output_file, 'r', encoding='utf-8') as json_file:
            try:
                solar_data = json.load(json_file)
            except json.JSONDecodeError:
                solar_data = {"solar": {}}
    else:
        solar_data = {"solar": {}}

    # Trouver le prochain index disponible
    next_index = str(len(solar_data["solar"]))

    # Ajouter les nouvelles données avec le bon format
    solar_data["solar"][next_index] = {
        "currentPower": {
            "power": float(payload.get('currentPower', {}).get('power', 0))  
        },
        "lastDayData": {
            "energy": float(payload.get('lastDayData', {}).get('energy', 0))  
        },
        "lastMonthData": {
            "energy": float(payload.get('lastMonthData', {}).get('energy', 0))  
        },
        "lastYearData": {
            "energy": float(payload.get('lastYearData', {}).get('energy', 0))  
        },
        "lifeTimeData": {
            "energy": float(payload.get('lifeTimeData', {}).get('energy', 0))  
        },
        "lastUpdateTime": payload.get('lastUpdateTime', "")
    }


    # Sauvegarder les données mises à jour dans le fichier JSON
    with open(output_file, 'w', encoding='utf-8') as json_file:
        json.dump(solar_data, json_file, ensure_ascii=False, indent=4)

    
    return solar_data

client = mqtt.Client()

client.on_connect = on_connect
client.on_message = on_message

client.connect(broker, port=1883, keepalive=60)

client.loop_forever()