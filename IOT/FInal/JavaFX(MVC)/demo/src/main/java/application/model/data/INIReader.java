package application.model.data;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class INIReader {
    private final Map<String, Map<String, String>> iniData = new HashMap<>();
    private final String filePath;

    public INIReader(String filePath) throws IOException {
        this.filePath = filePath;
        load(filePath);
    }

    private void load(String filePath) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String section = null;
            String line;

            while ((line = reader.readLine()) != null) {
                line = line.trim();

                if (line.isEmpty() || line.startsWith(";") || line.startsWith("#")) {
                    continue;
                }

                if (line.startsWith("[") && line.endsWith("]")) {
                    section = line.substring(1, line.length() - 1);
                    iniData.putIfAbsent(section, new HashMap<>());
                } else if (section != null && line.contains("=")) {
                    String[] keyValue = line.split("=", 2);
                    String key = keyValue[0].trim();
                    String value = keyValue[1].trim();
                    iniData.get(section).put(key, value);
                }
            }
        }
    }

    public String getValue(String section, String key) {
        return iniData.getOrDefault(section, new HashMap<>()).get(key);
    }

    public double getDouble(String section, String key) {
        return Double.parseDouble(getValue(section, key));
    }

    public boolean getBoolean(String section, String key) {
        return Boolean.parseBoolean(getValue(section, key));
    }

    // Méthode pour définir une valeur générique
    public void setValue(String section, String key, String value) {
        iniData.putIfAbsent(section, new HashMap<>());
        iniData.get(section).put(key, value);
    }

    // Méthode pour définir une valeur booléenne
    public void setBoolean(String section, String key, boolean value) {
        setValue(section, key, Boolean.toString(value)); // Utilise setValue pour stocker "true" ou "false"
    }

    // Méthode pour sauvegarder les modifications dans le fichier INI
    public void save() throws IOException {
        try (FileWriter writer = new FileWriter(filePath)) {
            for (Map.Entry<String, Map<String, String>> sectionEntry : iniData.entrySet()) {
                writer.write("[" + sectionEntry.getKey() + "]\n");
                for (Map.Entry<String, String> keyValue : sectionEntry.getValue().entrySet()) {
                    writer.write(keyValue.getKey() + "=" + keyValue.getValue() + "\n");
                }
                writer.write("\n");
            }
        }
    }
}
