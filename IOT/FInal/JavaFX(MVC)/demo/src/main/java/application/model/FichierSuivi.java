package application.model;

import java.io.IOException;
import java.net.URL;
import java.nio.file.*;
import java.util.*;

public class FichierSuivi {
    private final Path cheminFichier;
    private long nombreLignesLues = 0;

    // Constructeur prenant un URL
    public FichierSuivi(URL chemin) {
        this.cheminFichier = Paths.get(chemin.getPath());
    }

    // Constructeur prenant un String
    public FichierSuivi(String chemin) {
        this.cheminFichier = Paths.get(chemin);
    }

    public Optional<String> verifierNouvelleLigne() throws IOException {
        List<String> toutesLesLignes = Files.readAllLines(cheminFichier);
        if (toutesLesLignes.size() > nombreLignesLues) {
            String nouvelleLigne = toutesLesLignes.get(toutesLesLignes.size() - 1);
            nombreLignesLues = toutesLesLignes.size();
            return Optional.of(nouvelleLigne);
        }
        return Optional.empty();
    }
}
