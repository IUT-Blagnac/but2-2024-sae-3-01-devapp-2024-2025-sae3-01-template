#!/usr/bin/env python3

#
# ATTENTION le script doit être exécuté dans le même dossier que le fichier config.ini
# True pour une des valeurs du JSON signifie que le seuil a été dépassé
# mettre le timestamp
# dans fichier config frequence a laquelle on ecrit
# choisir les types de donnes, salles ou panneaux dont on recupere les données
# valeurs minimale de production pour les panneaux solaires
#

import paho.mqtt.client as mqtt
import json
import logging
import configparser
import os
from datetime import datetime, timedelta

#on verifie que config.ini existe
fichier_config = 'config.ini'
if not os.path.isfile(fichier_config):
    raise FileNotFoundError(f"Le fichier de configuration '{fichier_config}' est introuvable dans le répertoire courant.")

#on lit le fichier de config
config = configparser.ConfigParser()
config.read(fichier_config)

serveur_mqtt = config.get('MQTT', 'server')
topics = config.get('MQTT', 'topics').split(',')
fichier_sortie = config.get('OUTPUT', 'file')
frequence_ecriture = config.getint('OUTPUT', 'frequence', fallback=60)  # Fréquence d'écriture en secondes

#on lit les valeurs de seuil dans le fichier de config et on prends des valeurs par défaut (fallback) si ces données ne sont pas trouvées
max_temp = float(config.getint('valeurs_max', 'temperature', fallback=35))
max_humidite = float(config.getint('valeurs_max', 'humidity', fallback=60))
max_activite = float(config.getint('valeurs_max', 'activity', fallback=0))
max_co2 = float(config.getint('valeurs_max', 'co2', fallback=1000))
max_tvoc = float(config.getint('valeurs_max', 'tvoc', fallback=500))
max_illumination = float(config.getint('valeurs_max', 'illumination', fallback=100))
max_infrarouge = float(config.getint('valeurs_max', 'infrared', fallback=10))
max_infrarouge_visible = float(config.getint('valeurs_max', 'infrared_and_visible', fallback=20))
max_pression = float(config.getint('valeurs_max', 'pressure', fallback=1013))

logging.basicConfig(level=logging.INFO)

# Variable pour stocker les données en attente d'écriture
donnees_en_attente = []
dernier_ecriture = datetime.now()

def verifier_donnees(donnees):
    #on utilise des dictionnaires comme quoi on écoute en cours
    seuils = {
        'temperature': max_temp,
        'humidity': max_humidite,
        'activity': max_activite,
        'co2': max_co2,
        'tvoc': max_tvoc,
        'illumination': max_illumination,
        'infrared': max_infrarouge,
        'infrared_and_visible': max_infrarouge_visible,
        'pressure': max_pression
    }

    resultat = {}
    for cle, valeur in donnees.items():
        if cle in seuils:
            resultat[cle] = (valeur, valeur > seuils[cle])
        else:
            resultat[cle] = (valeur, False)
    return resultat

def ecrire_donnees():
    global dernier_ecriture
    # Lire les données existantes
    if os.path.exists(fichier_sortie):
        with open(fichier_sortie, 'r') as f:
            try:
                liste_donnees = json.load(f)
            except json.JSONDecodeError:
                liste_donnees = []
    else:
        liste_donnees = []

    # Ajouter les nouvelles données
    liste_donnees.extend(donnees_en_attente)

    # Écrire les données mises à jour dans le fichier JSON
    with open(fichier_sortie, 'w') as f:
        json.dump(liste_donnees, f, indent=4)

    # Réinitialiser la liste des données en attente et mettre à jour le dernier temps d'écriture
    donnees_en_attente.clear()
    dernier_ecriture = datetime.now()

def on_message(client, userdata, msg):
    global dernier_ecriture
    print(f"Message reçu sur le sujet {msg.topic}: OK")
    try:
        #on désérialise le message
        payload_str = msg.payload.decode()
        jsonMsg = json.loads(payload_str)

        donnees_combinees = {}

        if "AM107" in msg.topic:
            if isinstance(jsonMsg, list) and len(jsonMsg) >= 2: #on vérifie que le message est une liste d'au moins 2 éléments
                donnees_capteur = jsonMsg[0]
                infos_appareil = jsonMsg[1]

                #on vérifie si les seuils n'ont pas été dépassés
                donnees_capteur_verifiees = verifier_donnees(donnees_capteur)
                infos_appareil_verifiees = {k: (v, False) for k, v in infos_appareil.items()}  #on mets les valeurs de l'appareil à False

                # Combiner les données vérifiées
                donnees_combinees = {**donnees_capteur_verifiees, **infos_appareil_verifiees}

                # Ajouter l'heure de réception du message
                donnees_combinees["heure_reception"] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        elif "solaredge" in msg.topic:
            #pas de seuils pour les données des panneaux solaires
            donnees_combinees = jsonMsg

        # Ajouter les données combinées à la liste en attente d'écriture
        donnees_en_attente.append(donnees_combinees)

        # Vérifier si le temps écoulé depuis la dernière écriture dépasse la fréquence d'écriture
        if frequence_ecriture == 0 or (datetime.now() - dernier_ecriture).total_seconds() >= frequence_ecriture:
            ecrire_donnees()

    except json.JSONDecodeError as e:
        logging.error("Erreur de décodage JSON : %s", e)

#connexion au serveur MQTT
client = mqtt.Client()
client.on_message = on_message
client.connect(serveur_mqtt, port=1883, keepalive=60)

#on s'abonne aux topics
for topic in topics:
    client.subscribe(topic.strip(), qos=0)

client.loop_forever()