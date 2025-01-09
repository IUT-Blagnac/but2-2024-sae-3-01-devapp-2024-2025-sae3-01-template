from influxdb_client import InfluxDBClient
from influxdb_client.client.write_api import SYNCHRONOUS
from django.conf import settings
import os 


class InfluxDB:
    def __init__(self):
        self.client = None

        self.config = {
            "url":settings.INFLUXDB_CONFIG["url"],
            "token":settings.INFLUXDB_CONFIG["token"],
            "org":settings.INFLUXDB_CONFIG["org"],
            "bucket":settings.INFLUXDB_CONFIG["bucket"]
        }
        self.connexion(
            self.config["url"],
            self.config["token"],
            self.config["org"],
            self.config["bucket"]
        )

    def __call__(self, flux_query):
        """
        flux_query : String, code Flux
        Exécute une requête Flux et retourne les résultats.
        Retourne None si une erreur survient.
        """
        try:
            self.reconnect()  # S'assure que la connexion est active
            result = self.query_api.query(org=self.config["org"], query=flux_query)
            data = [{"time": record.get_time(), "value": record.get_value(), "fields": record.values} for table in result for record in table.records]
            return data
        except Exception as error:
            print("Requête échouée : ", error)
            return None

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()

    def connexion(self, url, token, org, bucket):
        """
        Connecte l'instance au serveur InfluxDB.
        """
        self.config = {
            "url": url,
            "token": token,
            "org": org,
            "bucket": bucket
        }
        try:
            self.client = InfluxDBClient(
                url=url,
                token=token,
                org=org
                
            )
            self.write_api = self.client.write_api(write_options=SYNCHRONOUS)
            self.query_api = self.client.query_api()
            print("Connexion réussie")
        except Exception as error:
            print("Erreur lors de la connexion :", error)

    def reconnect(self):
        """
        Réouvre la connexion si elle est fermée.
        """
        if self.client is None:
            try:
                self.connexion(
                    self.config["url"],
                    self.config["token"],
                    self.config["org"],
                    self.config["bucket"]
                )
                print("Connexion rétablie")
            except Exception as error:
                print("Erreur lors de la reconnexion :", error)

    def write_data(self, measurement, data):
        """
        Écrit des données dans le bucket InfluxDB.
        :param measurement: Nom de la mesure
        :param data: Données au format dictionnaire
        """
        try:
            point = {
                "measurement": measurement,
                "tags": data.get("tags", {}),
                "fields": data["fields"],
                "time": data.get("time")  # Optionnel
            }
            self.write_api.write(bucket=self.config["bucket"], org=self.config["org"], record=point)
            print("Données écrites avec succès")
        except Exception as error:
            print("Erreur lors de l'écriture des données :", error)

    def is_true(self, flux_query):
        """
        Retourne True si la requête Flux ne renvoie pas de résultats, False sinon.
        """
        data = self(flux_query)
        return not data  # True si la liste est vide

    def close(self):
        """
        Ferme la connexion au client InfluxDB.
        """
        if self.client is not None:
            self.client.close()
            print("Connexion fermée")