module com.example {
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.base;
    requires javafx.graphics;
    requires com.fasterxml.jackson.databind;
    requires org.apache.commons.configuration2;

    opens application.model.data to com.fasterxml.jackson.databind;

    opens application.view to javafx.fxml, javafx.base;
    opens application.control to javafx.xml, javafx.base, javafx.graphics;

    exports application;
}