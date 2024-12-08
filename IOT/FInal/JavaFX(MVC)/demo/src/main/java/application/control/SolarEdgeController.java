package application.control;

import java.io.IOException;

import application.view.SolarEdgeViewController;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Modality;
import javafx.stage.Stage;


public class SolarEdgeController {

    private Stage solarStage;

    public SolarEdgeController(Stage parentStage) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/ressources/application/view/SolarEdge.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root);
            this.solarStage = new Stage();
            this.solarStage.initModality(Modality.NONE);
            this.solarStage.initOwner(parentStage);
            this.solarStage.setScene(scene);
            this.solarStage.setTitle("SolarEdge");
            this.solarStage.setResizable(true);

            SolarEdgeViewController viewController = loader.getController();
            viewController.initContext(this.solarStage, this);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

       
    public void doCapteurDialog() {
        if (this.solarStage != null) {
            this.solarStage.showAndWait();
        } else {
            System.err.println("La vue des données n'est pas initialisée !");
        }
    }
}