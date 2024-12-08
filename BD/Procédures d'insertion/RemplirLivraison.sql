DELIMITER //

DROP PROCEDURE IF EXISTS RemplirLivraison //

CREATE PROCEDURE RemplirLivraison()
BEGIN
    DECLARE idLivraison INT DEFAULT 1;
    DECLARE idCommande INT;
    DECLARE idAdresse INT;
    DECLARE typeL VARCHAR(10);
    DECLARE MontantLiv DECIMAL(10, 2);
    DECLARE done INT DEFAULT 0;

    -- Curseur qui récupère idCommande et idAdresse via les relations entre tables
    DECLARE cur CURSOR FOR 
        SELECT c.idCommande, a.idAdresse
        FROM Commande c
        JOIN Panier p ON c.idPanier = p.idPanier
        JOIN Adresse a ON p.idUtilisateur = a.idUtilisateur
        ORDER BY c.idCommande ASC;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO idCommande, idAdresse;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SET typeL = CASE
            WHEN RAND() < 0.5 THEN 'Standard'
            ELSE 'Express'
        END;

        SET MontantLiv = CASE
            WHEN typeL = 'Standard' THEN 5.00
            ELSE 10.00
        END;

        INSERT INTO Livraison (idLivraison, typeL, statut, MontantLiv, idCommande, idAdresse)
        VALUES (idLivraison, typeL, 'Livrée', MontantLiv, idCommande, idAdresse);

        SET idLivraison = idLivraison + 1;
    END LOOP;

    CLOSE cur;
END;
//

DELIMITER ;
