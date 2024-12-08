package application.view;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.Stage;

import application.control.AcceuilController;

public class AccueilViewController {
    private Stage containingStage;
    private AcceuilController accueil; 

    @FXML
    private Button configurationButton;

    @FXML
    private Button donneesSallesButton;

    @FXML
    private Button solarButton;

    @FXML
    private Label accueilLabel;

    public void initContext(Stage containingStage, AcceuilController accueilController) {
        this.containingStage = containingStage;
        this.accueil = accueilController;
    }

    public void showDialog() {
        this.containingStage.show();
    }

    @FXML
    private void handleConfigurationButtonAction() {
        this.accueil.config();
    }

    @FXML
    private void handleDonneesSallesButtonAction() {
        this.accueil.affDonnees();
    }

    @FXML
    private void handleSolarButtonAction() {
        this.accueil.solar();
    }
}
