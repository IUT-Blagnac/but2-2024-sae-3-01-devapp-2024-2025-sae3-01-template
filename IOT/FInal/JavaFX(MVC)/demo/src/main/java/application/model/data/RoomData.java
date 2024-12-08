package application.model.data;

public class RoomData {
    private double temperature;
    private double humidity;
    private double co2;
    private double illumination;

    public RoomData(double temperature, double humidity, double co2, double illumination) {
        this.temperature = temperature;
        this.humidity = humidity;
        this.co2 = co2;
        this.illumination = illumination;
    }

    // Getters et Setters
    public double getTemperature() {
        return temperature;
    }

    public void setTemperature(double temperature) {
        this.temperature = temperature;
    }

    public double getHumidity() {
        return humidity;
    }

    public void setHumidity(double humidity) {
        this.humidity = humidity;
    }

    public double getCo2() {
        return co2;
    }

    public void setCo2(double co2) {
        this.co2 = co2;
    }

    public double getIllumination() {
        return illumination;
    }

    public void setIllumination(double illumination) {
        this.illumination = illumination;
    }

    @Override
    public String toString() {
        return "RoomData{" +
               "temperature=" + temperature +
               ", humidity=" + humidity +
               ", co2=" + co2 +
               ", illumination=" + illumination +
               '}';
    }
}
