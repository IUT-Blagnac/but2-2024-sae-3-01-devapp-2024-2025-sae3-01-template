package application.control;

import java.io.IOException;
import application.model.FichierSuivi;
import javafx.application.Platform;

public class ThreadSurveillanceFichier extends Thread {
    private final FichierSuivi fichierSuivi;
    private final AcceuilController controller;
    private volatile boolean enCours = true;

    public ThreadSurveillanceFichier(FichierSuivi fichierSuivi, AcceuilController controller) {
        this.fichierSuivi = fichierSuivi;
        this.controller = controller;
    }

    @Override
    public void run() {
        while (enCours) {
            try {

                fichierSuivi.verifierNouvelleLigne()
                        .ifPresent(ligne -> Platform.runLater(() -> controller.notifierNouvelleEntree(ligne)));
                Thread.sleep(5000); // Vérifie toutes les 5 secondes
            } catch (IOException | InterruptedException e) {
                enCours = false; // Stop en cas d'erreur ou interruption
                e.printStackTrace();
            }
        }
    }

    public void arreter() {
        enCours = false;
        this.interrupt();
    }
}
