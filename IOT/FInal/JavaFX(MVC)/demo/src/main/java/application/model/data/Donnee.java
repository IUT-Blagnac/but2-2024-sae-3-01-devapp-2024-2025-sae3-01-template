package application.model.data;

public class Donnee {
    private String date; 
    private String salle; 
    private String valeur;

    private Donnee(String date, String salle, String valeur){
        this.date = date; 
        this.salle = salle; 
        this.valeur = valeur; 
    }
    public String getDate(){
        return this.date; 
    }
    public String getSalle(){
        return this.salle; 
    }
    public String getValeur(){
        return this.valeur; 
    }
}

