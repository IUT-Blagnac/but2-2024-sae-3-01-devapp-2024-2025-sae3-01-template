package application.model.data;

import java.util.HashMap;
import java.util.Map;

public class EnergieData {
    
    private Map<String, EnergieRecord> records;

    public EnergieData() {
        this.records = new HashMap<>();
    }

    public Map<String, EnergieRecord> getRecords() {
        return records;
    }

    public void addRecord(String index, EnergieRecord record) {
        this.records.put(index, record);
    }

    public EnergieRecord getRecord(String index) {
        return this.records.get(index);
    }

    public static class EnergieRecord {
        private double energie_totale;
        private double energie_annee_derniere;
        private double energie_mois_dernier;
        private double energie_jour_dernier;
        private double puissance;
        private String lastUpdateTime;

        public double getPuissance() {
            return puissance;
        }
        public void setPuissance(double Puissance) {
            this.puissance = Puissance;
        }

        public double getEnergie_totale() {
            return energie_totale;
        }

        public void setEnergie_totale(double energie_totale) {
            this.energie_totale = energie_totale;
        }

        public double getEnergie_annee_derniere() {
            return energie_annee_derniere;
        }

        public void setEnergie_annee_derniere(double energie_annee_derniere) {
            this.energie_annee_derniere = energie_annee_derniere;
        }

        public double getEnergie_mois_dernier() {
            return energie_mois_dernier;
        }

        public void setEnergie_mois_dernier(double energie_mois_dernier) {
            this.energie_mois_dernier = energie_mois_dernier;
        }

        public double getEnergie_jour_dernier() {
            return energie_jour_dernier;
        }

        public void setEnergie_jour_dernier(double energie_jour_dernier) {
            this.energie_jour_dernier = energie_jour_dernier;
        }

        public String getLastUpdateTime() {
            return lastUpdateTime;
        }

        public void setLastUpdateTime(String lastUpdateTime) {
            this.lastUpdateTime = lastUpdateTime;
        }

        public double getEnergie_moyenne_mensuelle() {
            return energie_annee_derniere / 12;
        }
    }
}
