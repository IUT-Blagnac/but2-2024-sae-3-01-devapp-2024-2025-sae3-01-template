package application.view;

import java.io.IOException;
import java.util.Map;
import application.control.SolarEdgeController;
import application.model.data.EnergieData;
import application.model.data.JsonConverter;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class SolarEdgeViewController {

    private Stage containingStage;
    private SolarEdgeController solar;
    private EnergieData energieData; 

    @FXML
    private Button btnRetour;
    @FXML
    private Button btnRetour1;
    @FXML
    private Button btnRetour2;
    @FXML
    private LineChart<String, Number> GrapheEvolution;
    @FXML
    private BarChart<String, Number> GrapheComparaison;
    @FXML
    private LineChart<String, Number> GrapheTotal;

    @FXML
    private CategoryAxis xAxisEnergyEvolution;
    @FXML
    private NumberAxis yAxisEnergyEvolution;

    @FXML
    private CategoryAxis xAxisEnergyComparison;
    @FXML
    private NumberAxis yAxisEnergyComparison;

    @FXML
    private CategoryAxis xAxisTotalEnergy;
    @FXML
    private NumberAxis yAxisTotalEnergy;

    public void initContext(Stage _containingStage, SolarEdgeController _solar) {
        this.containingStage = _containingStage;
        this.solar = _solar;
    }

    @FXML
    public void initialize() {
        // On charge les données du json
        JsonConverter jsonConverter = new JsonConverter();
        energieData = jsonConverter.loadEnergieDataFromJson();

        // On met à jour les graphes
        updateGrapheEvolution();
        updateGrapheComparaison();
        updateGrapheTotal();
    }

    // Mise à jour du graphique d'évolution 
    private void updateGrapheEvolution() {
        if (energieData == null || energieData.getRecords().isEmpty()) return;

        XYChart.Series<String, Number> series = new XYChart.Series<>();
        series.setName("Puissance en W");

        for (Map.Entry<String, EnergieData.EnergieRecord> entry : energieData.getRecords().entrySet()) {
            EnergieData.EnergieRecord record = entry.getValue();
            series.getData().add(new XYChart.Data<>(record.getLastUpdateTime(), record.getPuissance()));
        }

        GrapheEvolution.getData().clear();
        GrapheEvolution.getData().add(series);
    }

    
    private void updateGrapheComparaison() {
    if (energieData == null || energieData.getRecords().isEmpty()) return;

    Map.Entry<String, EnergieData.EnergieRecord> lastEntry = null;
    for (Map.Entry<String, EnergieData.EnergieRecord> entry : energieData.getRecords().entrySet()) {
        lastEntry = entry; 
    }

    if (lastEntry == null) return;

    EnergieData.EnergieRecord lastRecord = lastEntry.getValue();

    XYChart.Series<String, Number> series = new XYChart.Series<>();
    series.setName("Comparaison Dernier Prélèvement en W/h");

    series.getData().add(new XYChart.Data<>(  " Mois dernier", lastRecord.getEnergie_mois_dernier()));
    series.getData().add(new XYChart.Data<>( " Moyenne mensuelle", lastRecord.getEnergie_moyenne_mensuelle()));

    GrapheComparaison.getData().clear();
    GrapheComparaison.getData().add(series);
}


    // Mise à jour du graphique de l'énergie totale
    private void updateGrapheTotal() {
        if (energieData == null || energieData.getRecords().isEmpty()) return;

        XYChart.Series<String, Number> series = new XYChart.Series<>();
        series.setName("Total énergie en W/h");

        for (Map.Entry<String, EnergieData.EnergieRecord> entry : energieData.getRecords().entrySet()) {
            EnergieData.EnergieRecord record = entry.getValue();
            series.getData().add(new XYChart.Data<>(record.getLastUpdateTime(), record.getEnergie_totale()));
        }

        GrapheTotal.getData().clear();
        GrapheTotal.getData().add(series);
    }

    @FXML
    private void ActionBtnRetour(ActionEvent event) {
        Button sourceButton = (Button) event.getSource();
        Stage stage = (Stage) sourceButton.getScene().getWindow();
        stage.close();
    }

    public void showDialog() {
        this.containingStage.showAndWait();
    }
}
