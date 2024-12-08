package application.control;

import java.io.IOException;

import application.view.AffDonneesViewController;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class AffDonneesController {
    private Stage donneeStage;

    public AffDonneesController(Stage parentStage) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/ressources/application/view/tabBord.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root);
            this.donneeStage = new Stage();
            this.donneeStage.initModality(Modality.NONE);
            this.donneeStage.initOwner(parentStage);
            this.donneeStage.setScene(scene);
            this.donneeStage.setTitle("Données");
            this.donneeStage.setResizable(true);

            AffDonneesViewController viewController = loader.getController();
            viewController.initContext(this.donneeStage, this);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void doCapteurDialog() {
        if (this.donneeStage != null) {
            this.donneeStage.showAndWait();
        } else {
            System.err.println("La vue des données n'est pas initialisée !");
        }
    }
}