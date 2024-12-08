package application.view;

import javafx.fxml.FXML;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import application.control.AcceuilController;
import application.tools.AlertUtilities;

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
        configure(); // Ensure the close event is configured when the context is initialized
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

    /**
	 * Action menu quitter. Demander une confirmation puis fermer la fenêtre (donc
	 * l'application car fenêtre principale).
	 */
	@FXML
    public void doQuit() {

		if (AlertUtilities.confirmYesCancel(this.containingStage, "Quitter l'application",
				"Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {
			this.containingStage.close();
		}
	}

    /**
	 * Méthode de fermeture de la fenêtre par la croix.
	 *
	 * @param e Evénement associé (inutilisé pour le moment)
	 *
	 * @return null toujours (inutilisé)
	 */
	private Object closeWindow(WindowEvent e) {
		this.doQuit();
		e.consume();
		return null;
	}

    /**
     * Configures the stage to handle close requests with a confirmation dialog.
     */
    private void configure() {
        this.containingStage.setOnCloseRequest(e -> this.closeWindow(e));
    }
}
