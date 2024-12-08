package application.model.data;

import com.fasterxml.jackson.databind.ObjectMapper;

import application.view.AffDonneesViewController;
import javafx.application.Platform;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.List;
import java.util.Map;

public class JsonFileWatcher implements Runnable {
    private final String jsonFilePath;
    private final RoomManager roomManager;
    private boolean running = true;

    public JsonFileWatcher(String jsonFilePath, RoomManager roomManager) {
        this.jsonFilePath = jsonFilePath;
        this.roomManager = roomManager;
    }

    public void stopWatching() {
        running = false;
    }

    @Override
    public void run() {
        try {
            Path path = Paths.get(new File(jsonFilePath).getParent());
            WatchService watchService = FileSystems.getDefault().newWatchService();
            path.register(watchService, StandardWatchEventKinds.ENTRY_MODIFY);

            while (running) {
                WatchKey key = watchService.take();
                for (WatchEvent<?> event : key.pollEvents()) {
                    if (event.kind() == StandardWatchEventKinds.ENTRY_MODIFY &&
                        event.context().toString().equals(new File(jsonFilePath).getName())) {

                        // Vérifier si le fichier de verrouillage existe
                        File lockFile = new File(jsonFilePath + ".lock");

                        // Si le fichier de verrouillage existe, attendre sa suppression
                        while (lockFile.exists()) {
                            System.out.println("Fichier de verrouillage détecté, en attente...");
                            Thread.sleep(500);  // Attendre 500ms avant de vérifier à nouveau
                        }

                        // Si le fichier de verrouillage n'existe pas, lire et actualiser les données
                        System.out.println("Modification détectée, lecture du fichier JSON...");
                        roomManager.loadDataFromJson();

                        // Mettre à jour l'interface graphique
                        Platform.runLater(() -> {
                            AffDonneesViewController viewDonnees = new AffDonneesViewController();
                            viewDonnees.loadRooms();  // Actualiser les graphes et la vue
                        });
                    }
                }
                key.reset();
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

}
