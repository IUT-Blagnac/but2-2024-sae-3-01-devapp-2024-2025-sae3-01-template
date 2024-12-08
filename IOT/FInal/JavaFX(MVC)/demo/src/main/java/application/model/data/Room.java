package application.model.data;

import java.util.ArrayList;
import java.util.List;

public class Room {
    private String roomId;
    private List<Double> temperatureList;
    private List<Double> humidityList;
    private List<Double> co2List;
    private List<Double> illuminationList;

    public Room(String roomId) {
        this.roomId = roomId;
        this.temperatureList = new ArrayList<>();
        this.humidityList = new ArrayList<>();
        this.co2List = new ArrayList<>();
        this.illuminationList = new ArrayList<>();
    }

    public String getRoomId() {
        return roomId;
    }

    public List<Double> getTemperatureList() {
        return temperatureList;
    }

    public List<Double> getHumidityList() {
        return humidityList;
    }

    public List<Double> getCo2List() {
        return co2List;
    }

    public List<Double> getIlluminationList() {
        return illuminationList;
    }

    public void addData(Double temperature, Double humidity, Double co2, Double illumination) {
        this.temperatureList.add(temperature);
        this.humidityList.add(humidity);
        this.co2List.add(co2);
        this.illuminationList.add(illumination);
    }
}
