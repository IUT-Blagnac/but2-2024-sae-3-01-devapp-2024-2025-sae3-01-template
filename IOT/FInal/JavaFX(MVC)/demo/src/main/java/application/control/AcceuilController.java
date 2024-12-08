package application.control;

import java.io.IOException;
import application.model.FichierSuivi;
import application.view.AccueilViewController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;

public class AcceuilController extends Application {
    private Stage mainStage;
    private static Scene scene;
    private ThreadSurveillanceFichier threadSurveillance;

    @Override
    public void start(Stage primaryStage) {
        try {
            this.mainStage = primaryStage;

            FXMLLoader loader = new FXMLLoader(getClass().getResource("/ressources/application/view/Accueil.fxml"));
            Scene scene = new Scene(loader.load(), 600, 600);
            primaryStage.setScene(scene);
            primaryStage.setTitle("Accueil");

            AccueilViewController controller = loader.getController();
            controller.initContext(primaryStage, this);

            // Initialiser la surveillance du fichier
            java.net.URL fileUrl = getClass().getResource("/ressources/alerts_log.txt");
            if (fileUrl != null) {
                java.nio.file.Path filePath = java.nio.file.Paths.get(fileUrl.toURI());
                FichierSuivi fichierSuivi = new FichierSuivi(filePath.toString());
                threadSurveillance = new ThreadSurveillanceFichier(fichierSuivi, this);
                threadSurveillance.setDaemon(true);
                threadSurveillance.start();

            } else {
                throw new IOException("Fichier alerts_log.txt introuvable dans les ressources.");
            }

            primaryStage.setOnCloseRequest(event -> fermerApplication());

            primaryStage.show();
        } catch (IOException | java.net.URISyntaxException e) {
            e.printStackTrace();
        }
    }

    private static javafx.scene.Parent loadFXML(String fxml) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(AcceuilController.class.getResource(fxml + ".fxml"));
        return fxmlLoader.load();
    }

    public static void setRoot(String fxml) throws IOException {
        scene.setRoot(loadFXML(fxml));
    }

    public static void run() {
        launch(); // Lancer l'application JavaFX
    }

    public void affDonnees() {
        AffDonneesController donnees = new AffDonneesController(mainStage);
        donnees.doCapteurDialog();
    }

    public void solar() {
        SolarEdgeController solar = new SolarEdgeController(mainStage);
        solar.doCapteurDialog();
    }

    public void config() {
        ConfigController config = new ConfigController(mainStage);
        config.doConfigDialog();
    }

    // Méthode pour notifier qu'une nouvelle entrée a été trouvée
    public void notifierNouvelleEntree(String ligne) {
        Alert alert = new Alert(AlertType.INFORMATION);
        alert.setTitle("Nouvelle Entrée Détectée");
        alert.setHeaderText("Une nouvelle entrée a été trouvée dans le fichier !");
        alert.setContentText("Contenu : " + ligne);
        alert.showAndWait();
    }

    // Arrêter proprement la surveillance à la fermeture
    private void fermerApplication() {
        if (threadSurveillance != null) {
            threadSurveillance.arreter();
        }
    }
}
