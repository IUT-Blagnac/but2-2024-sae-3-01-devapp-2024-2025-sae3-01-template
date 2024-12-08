package application.view;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.io.IOException;

import application.model.data.INIReader;

public class ConfigViewController {
    private Stage containingStage;
    private boolean temperatureCheck;
    private boolean humidityCheck;
    private boolean co2Check;
    private boolean tvocCheck;
    private boolean illuminationCheck;
    private boolean pressureCheck;
    private boolean puissanceActivePositiveCheck;
    private boolean puissanceReactiveNegativeCheck;
    private boolean energieActivePositiveCheck;
    private boolean energieReactiveNegativeCheck;

    public void initContext(Stage _containingStage) {
        this.containingStage = _containingStage;
    }

    @FXML
    private TextField temperature_max;

    @FXML
    private TextField humidity_max;

    @FXML
    private TextField co2_max;

    @FXML
    private TextField tvoc_min;

    @FXML
    private TextField illumination_min;

    @FXML
    private TextField pressure_min;

    @FXML
    private TextField puissance_active_positive_max;

    @FXML
    private TextField puissance_reactive_negative_max;

    @FXML
    private TextField energie_active_positive_max;

    @FXML
    private TextField energie_reactive_negative_max;

    @FXML
    private Button retour;

    @FXML
    private Button appliquer;
    @FXML
    private CheckBox temperature_check;
    @FXML
    private CheckBox humidity_check;
    @FXML
    private CheckBox co2_check;
    @FXML
    private CheckBox tvoc_check;
    @FXML
    private CheckBox illumination_check;
    @FXML
    private CheckBox pressure_check;
    @FXML
    private CheckBox puissance_active_positive_checkbox;
    @FXML
    private CheckBox puissance_reactive_negative_checkbox;
    @FXML
    private CheckBox energie_active_positive_checkbox;
    @FXML
    private CheckBox energie_reactive_negative_checkbox;

    @FXML
    private void handleBackButtonAction() {
        Stage stage = (Stage) retour.getScene().getWindow();
        stage.close();
    }

    public void showDialog() {
        loadIniData();
        this.containingStage.showAndWait();
    }

    public void loadIniData() {
        try {
            INIReader iniReader = new INIReader("IOT/FInal/config.ini");

            temperature_max.setText(iniReader.getValue("seuils", "temperature_max"));
            humidity_max.setText(iniReader.getValue("seuils", "humidity_max"));
            co2_max.setText(iniReader.getValue("seuils", "co2_max"));
            tvoc_min.setText(iniReader.getValue("seuils", "tvoc_min"));
            illumination_min.setText(iniReader.getValue("seuils", "illumination_min"));
            pressure_min.setText(iniReader.getValue("seuils", "pressure_min"));
            puissance_active_positive_max.setText(iniReader.getValue("seuils", "puissance_active_positive_max"));
            puissance_reactive_negative_max.setText(iniReader.getValue("seuils", "puissance_reactive_negative_max"));
            energie_active_positive_max.setText(iniReader.getValue("seuils", "energie_active_positive_max"));
            energie_reactive_negative_max.setText(iniReader.getValue("seuils", "energie_reactive_negative_max"));

            // Charger les états des cases à cocher depuis le fichier INI
            temperatureCheck = iniReader.getBoolean("data_selection", "temperature");
            humidityCheck = iniReader.getBoolean("data_selection", "humidity");
            co2Check = iniReader.getBoolean("data_selection", "co2");
            tvocCheck = iniReader.getBoolean("data_selection", "tvoc");
            illuminationCheck = iniReader.getBoolean("data_selection", "illumination");
            pressureCheck = iniReader.getBoolean("data_selection", "pressure");
            puissanceActivePositiveCheck = iniReader.getBoolean("data_selection", "puissance_active_positive");
            puissanceReactiveNegativeCheck = iniReader.getBoolean("data_selection", "puissance_reactive_negative");
            energieActivePositiveCheck = iniReader.getBoolean("data_selection", "energie_active_positive");
            energieReactiveNegativeCheck = iniReader.getBoolean("data_selection", "energie_reactive_negative");

            // Mettre à jour les cases à cocher en fonction des booléens
            temperature_check.setSelected(temperatureCheck);
            humidity_check.setSelected(humidityCheck);
            co2_check.setSelected(co2Check);
            tvoc_check.setSelected(tvocCheck);
            illumination_check.setSelected(illuminationCheck);
            pressure_check.setSelected(pressureCheck);
            puissance_active_positive_checkbox.setSelected(puissanceActivePositiveCheck);
            puissance_reactive_negative_checkbox.setSelected(puissanceReactiveNegativeCheck);
            energie_active_positive_checkbox.setSelected(energieActivePositiveCheck);
            energie_reactive_negative_checkbox.setSelected(energieReactiveNegativeCheck);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void handleApplyButtonAction() {
        try {
            INIReader iniReader = new INIReader("IOT/FInal/config.ini");
            // Mettre à jour les valeurs des seuils
            iniReader.setValue("seuils", "temperature_max", temperature_max.getText());
            iniReader.setValue("seuils", "humidity_max", humidity_max.getText());
            iniReader.setValue("seuils", "co2_max", co2_max.getText());
            iniReader.setValue("seuils", "tvoc_min", tvoc_min.getText());
            iniReader.setValue("seuils", "illumination_min", illumination_min.getText());
            iniReader.setValue("seuils", "pressure_min", pressure_min.getText());
            iniReader.setValue("seuils", "puissance_active_positive_max", puissance_active_positive_max.getText());
            iniReader.setValue("seuils", "puissance_reactive_negative_max", puissance_reactive_negative_max.getText());
            iniReader.setValue("seuils", "energie_active_positive_max", energie_active_positive_max.getText());
            iniReader.setValue("seuils", "energie_reactive_negative_max", energie_reactive_negative_max.getText());

            // Sauvegarder les états des cases à cocher
            iniReader.setBoolean("data_selection", "temperature", temperatureCheck);
            iniReader.setBoolean("data_selection", "humidity", humidityCheck);
            iniReader.setBoolean("data_selection", "co2", co2Check);
            iniReader.setBoolean("data_selection", "tvoc", tvocCheck);
            iniReader.setBoolean("data_selection", "illumination", illuminationCheck);
            iniReader.setBoolean("data_selection", "pressure", pressureCheck);
            iniReader.setBoolean("data_selection", "puissance_active_positive", puissanceActivePositiveCheck);
            iniReader.setBoolean("data_selection", "puissance_reactive_negative", puissanceReactiveNegativeCheck);
            iniReader.setBoolean("data_selection", "energie_active_positive", energieActivePositiveCheck);
            iniReader.setBoolean("data_selection", "energie_reactive_negative", energieReactiveNegativeCheck);

            // Sauvegarder dans le fichier
            iniReader.save();

            System.out.println("Enregistrement teriné");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void handleTemperatureCheckBoxAction() {
        temperatureCheck = temperature_check.isSelected();
    }

    @FXML
    private void handleHumidityCheckBoxAction() {
        humidityCheck = humidity_check.isSelected();
    }

    @FXML
    private void handleCO2CheckBoxAction() {
        co2Check = co2_check.isSelected();
    }

    @FXML
    private void handleTVOCCheckBoxAction() {
        tvocCheck = tvoc_check.isSelected();
    }

    @FXML
    private void handleIlluminationCheckBoxAction() {
        illuminationCheck = illumination_check.isSelected();
    }

    @FXML
    private void handlePressureCheckBoxAction() {
        pressureCheck = pressure_check.isSelected();
    }

    @FXML
    private void handlePuissanceActivePositiveMaxCheckBoxAction() {
        puissanceActivePositiveCheck = puissance_active_positive_checkbox.isSelected();
    }

    @FXML
    private void handlePuissanceReactiveNegativeMaxCheckBoxAction() {
        puissanceReactiveNegativeCheck = puissance_reactive_negative_checkbox.isSelected();
    }

    @FXML
    private void handleEnergieActivePositiveMaxCheckBoxAction() {
        energieActivePositiveCheck = energie_active_positive_checkbox.isSelected();
    }

    @FXML
    private void handleEnergieReactiveNegativeMaxCheckBoxAction() {
        energieReactiveNegativeCheck = energie_reactive_negative_checkbox.isSelected();
    }

}
