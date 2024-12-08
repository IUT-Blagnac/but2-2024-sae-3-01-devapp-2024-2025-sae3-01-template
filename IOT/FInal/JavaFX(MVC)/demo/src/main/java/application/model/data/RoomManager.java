package application.model.data;

import com.fasterxml.jackson.databind.ObjectMapper;
import application.view.AffDonneesViewController;
import javafx.application.Platform;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class RoomManager {
    private List<Room> roomsList = new ArrayList<>();
    private static final String JSON_FILE = "IOT/Final/datas/AM07_filtre_data.json"; // Remplacez par le chemin réel
    private AffDonneesViewController viewDonnees = new AffDonneesViewController(); 

    private Room findRoomById(String roomId) {
        for (Room room : roomsList) {
            if (room.getRoomId().equals(roomId)) {
                return room;
            }
        }
        return null; 
    }

    public void addRoomData(String roomId, Double temperature, Double humidity, Double co2, Double illumination) {
        // Cherche la pièce par son ID
        Room room = findRoomById(roomId);
    
        // Si la pièce n'existe pas, créez-la
        if (room == null) {
            room = new Room(roomId);
            roomsList.add(room); // Ajout de la pièce à la liste
        }
    
        // Ajout des données à la pièce (existante ou nouvellement créée)
        room.addData(temperature, humidity, co2, illumination);
        System.out.println("Données ajoutées : Temp=" + temperature + ", Hum=" + humidity + ", CO2=" + co2 + ", Lum=" + illumination);
    
        // Mise à jour de l'interface graphique si nécessaire
        Platform.runLater(() -> viewDonnees.loadRooms());
    }
    
    public static String getJsonFilePath() {
        return JSON_FILE;
    }
    
    public void loadDataFromJson() {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> dataList = objectMapper.readValue(new File(JSON_FILE), List.class);

            for (Map<String, Object> data : dataList) {
                String roomId = (String) data.get("room");
                Map<String, Object> sensorData = (Map<String, Object>) data.get("data");

                // Utiliser Number pour gérer à la fois Integer et Double
                Double temperature = toDouble(sensorData.get("temperature"));
                Double humidity = toDouble(sensorData.get("humidity"));
                Double co2 = toDouble(sensorData.get("co2"));
                Double illumination = toDouble(sensorData.get("illumination"));

                addRoomData(roomId, temperature, humidity, co2, illumination);
                System.out.println("Données ajoutées pour la salle " + roomId + " : Temp=" + temperature + ", Hum=" + humidity + ", CO2=" + co2 + ", Lum=" + illumination);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private Double toDouble(Object value) {
        if (value instanceof Number) {
            return ((Number) value).doubleValue();
        }
        return 0.0;
    }

    public List<Room> getRoomsList() {
        return roomsList;
    }
}
