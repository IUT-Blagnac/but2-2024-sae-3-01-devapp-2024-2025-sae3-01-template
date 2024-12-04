package sae.view;

import java.io.File;
import java.io.FileReader;
import java.net.URL;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;
import sae.App;

public class AfficherDonneesController {

  @SuppressWarnings("unused")
  private Stage fenetrePrincipale;

  private App application;

  @FXML
  private Label titreSalle;

  private String numSalle;

  @FXML
  private GridPane gridDynamique;

  private ArrayList<String> donnees = new ArrayList<>();

  private JSONObject sallesData; // Champ pour stocker les données JSON

  Map<String, Object> dicoTypeValeur ; //recupere toutes les valeurs du config.ini
  Map<String, Object> dicoGraphe ; //recupere seulement les données selectionnées

  Map<String, Map<String, Object> > dicoHist ; //recupere l'gistorique des données
  Map<String, Map<String, Object> > dicoGrapheHist ; //recupere l'gistorique des données pour le graphe


  public void setDatas(Stage fenetre, App app) {
    this.application = app;
    this.fenetrePrincipale = fenetre;
  }

  public void setSalle(String salle) {
    this.titreSalle.setText(salle);
    this.numSalle = salle;
  }

  public void setTab(ArrayList<String> list) {
    this.donnees = list;
  }

  @FXML
  private void actionAfficher() {
    System.out.println(dicoHist);
      application.loadGraphe(numSalle, dicoGraphe);
      application.loadGraphe2(numSalle, dicoGraphe);
  }

  @FXML
  private void actionRetour() {
    application.loadParametrageSalles();
  }

  public void afficherDonnees() {
    dicoTypeValeur = chargerFichierSalle();
    //System.out.println(dicoTypeValeur);
    
    dicoGraphe = new HashMap<String,Object>();
    dicoGrapheHist = new HashMap<String, Map<String, Object> >();

    System.out.println("------------------------------------------------");
    System.out.println(dicoHist);


    for (int i = 0; i < donnees.size(); i++) { 
      gridDynamique.add(new Label( donnees.get(i).toUpperCase() + " :"), 0, i);
      gridDynamique.add(new Label( dicoTypeValeur.get(donnees.get(i)) + "" ), 1, i);

      dicoGraphe.put(donnees.get(i), dicoTypeValeur.get(donnees.get(i)));

      for (Map.Entry<String, Map<String, Object>> entry1 : dicoHist.entrySet()) {
        Map<String, Object> dico2 = entry1.getValue();

        for (Map.Entry<String, Map<String, Object>> entry2 : dicoHist.entrySet()) {
          dico2.put(donnees.get(i), dicoTypeValeur.get(donnees.get(i)));
        }

      }
      
    }

    System.out.println("------------------------------------------------");
    System.out.println(dicoHist);

  }

  public Map<String, Object> chargerFichierSalle() {

     JSONParser parser = new JSONParser();
     Map<String, Object> dicoTypeValeur = new HashMap<String,Object>();

        try {
            // Définir le chemin du fichier salles.json à la racine du projet
            File file = new File("Iot/salles.json");

            if (!file.exists()) {
                System.out.println("Le fichier salles.json est introuvable à la racine du projet.");
                // return;
            }

            // Lire et analyser le fichier JSON
            FileReader reader = new FileReader(file);
            JSONObject json = (JSONObject) parser.parse(reader);

            // Stocker les données dans le champ solarData
            this.sallesData = json;

            System.out.println("Données extraites du fichier salles.json " + numSalle + " : ");
            //System.out.println(json.toJSONString());
            

            if (json.containsKey(numSalle)) {
              JSONObject salleChoisie = (JSONObject) json.get(numSalle);
              System.out.println(salleChoisie.toJSONString());
              this.dicoHist = salleChoisie;

              // Récupérer toutes les valeurs pour cette clé spécifique
              Set<String> allKeys = salleChoisie.keySet();

              JSONObject dernierClé = (JSONObject) salleChoisie.get( (allKeys.size() - 1) + "" );
              System.out.println( "Dernière clée de la salle : " + (allKeys.size() - 1));
              System.out.println(dernierClé);

              dicoTypeValeur = dernierClé;

              System.out.println(dernierClé);
    

            } else {
              System.out.println("La salle " + numSalle + " n'existe pas dans le fichier JSON.");
            }

            reader.close();
            
            

        } catch (Exception e) {
            System.out.println("Erreur lors du chargement du fichier solar.json : " + e.getMessage());
            e.printStackTrace();
        }

        return dicoTypeValeur;

  }

}
