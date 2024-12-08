package application.control;

import java.io.IOException;

import application.view.AffDonneesViewController;
import application.view.ConfigViewController;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class ConfigController {
    private Stage configStage;
    private ConfigViewController configView;

    public ConfigController(Stage _parentStage) {
        // Logique pour le bouton "Configuration"
        System.out.println("Configuration button clicked");
        /*
         * try {
         * FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource(
         * "/ressources/application/view/Config_UneDonnéeTousLesSalles.fxml"));
         * Parent root = fxmlLoader.load();
         * Stage stage = new Stage();
         * stage.setTitle("Configuration");
         * stage.setScene(new Scene(root));
         * stage.show();
         * } catch (IOException e) {
         * e.printStackTrace();
         * }
         */
        try {
            FXMLLoader loader = new FXMLLoader(
                    ConfigViewController.class
                            .getResource("/ressources/application/view/Config_UneDonnéeTousLesSalles.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 50, root.getPrefHeight() + 10);

            this.configStage = new Stage();
            this.configStage.initModality(Modality.NONE);
            this.configStage.initOwner(_parentStage);
            this.configStage.setScene(scene);
            this.configStage.setTitle("Gestion des capteurs");
            this.configStage.setResizable(true);

            this.configView = loader.getController();
            this.configView.initContext(this.configStage);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doConfigDialog() {
        this.configView.showDialog();
    }

}