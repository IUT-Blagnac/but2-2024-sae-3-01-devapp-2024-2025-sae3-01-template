DELIMITER //

DROP PROCEDURE IF EXISTS AssignerPaniersAuxCommandes //

CREATE PROCEDURE AssignerPaniersAuxCommandes()
BEGIN
    DECLARE idPanierCourant INT DEFAULT 1;
    DECLARE dateCom DATETIME;
    DECLARE joursEcoules INT;
    
    -- Calculer le nombre de jours entre le 1er janvier 2024 et le 8 décembre 2024
    SET joursEcoules = DATEDIFF('2024-12-08', '2024-01-01');
    
    -- Boucle pour traiter chaque panier
    WHILE idPanierCourant <= 100 DO
        -- Générer une date aléatoire entre le 1er janvier 2024 et le 8 décembre 2024
        SET dateCom = DATE_ADD('2024-01-01 00:00:00',
            INTERVAL FLOOR(RAND() * joursEcoules * 24 * 60 * 60) SECOND);
            
        -- Insérer la commande avec le panier
        INSERT INTO Commande (idCommande, dateCommande, idPanier)
        VALUES (idPanierCourant, dateCom, idPanierCourant);
        
        SET idPanierCourant = idPanierCourant + 1;
    END WHILE;
END;
//

DELIMITER ;

