DELIMITER //

DROP PROCEDURE IF EXISTS RemplirPanierEtDetailPanier //

CREATE PROCEDURE RemplirPanierEtDetailPanier()
BEGIN
    DECLARE idPanier INT DEFAULT 1;
    DECLARE idArticle INT;
    DECLARE nbArticles INT;
    DECLARE montantPanier DECIMAL(10, 2);
    DECLARE quantite INT;
    DECLARE prixArticle DECIMAL(10, 2);
    DECLARE i INT;
    DECLARE articleExists INT;

    -- Boucle pour insérer 100 paniers
    WHILE idPanier <= 100 DO
        -- Réinitialiser le montant du panier pour chaque nouveau panier
        SET montantPanier = 0;

        -- Générer un nombre d'articles aléatoire pour ce panier (entre 3 et 7)
        SET nbArticles = FLOOR(3 + RAND() * 5);

        -- Insérer dans la table Panier
        INSERT INTO Panier (idPanier, montant, nbArticle, idUtilisateur)
        VALUES (idPanier, 0, nbArticles, FLOOR(1 + RAND() * 50));

        -- Ajouter des articles dans le détail du panier
        SET i = 1;
        WHILE i <= nbArticles DO
            -- Générer un nouvel idArticle jusqu'à en trouver un non utilisé pour ce panier
            article_loop: LOOP
                SET idArticle = FLOOR(1 + RAND() * 103);
                
                -- Vérifier si cet article existe déjà dans ce panier
                SELECT COUNT(*) INTO articleExists
                FROM DétailPanier
                WHERE DétailPanier.idPanier = idPanier 
                AND DétailPanier.idArticle = idArticle;
                
                IF articleExists = 0 THEN
                    LEAVE article_loop;
                END IF;
            END LOOP;

            -- Générer une quantité aléatoire (entre 2 et 5)
            SET quantite = FLOOR(2 + RAND() * 4);

            -- Récupérer le prix de l'article correspondant
            SELECT prix INTO prixArticle
            FROM Article
            WHERE Article.idArticle = idArticle;

            -- Ajouter au montant total du panier
            SET montantPanier = montantPanier + (quantite * prixArticle);

            -- Insérer dans la table DétailPanier
            INSERT INTO DétailPanier (idPanier, idArticle, quantité)
            VALUES (idPanier, idArticle, quantite);

            SET i = i + 1;
        END WHILE;

        -- Mettre à jour le montant final du panier
        UPDATE Panier
        SET montant = montantPanier
        WHERE Panier.idPanier = idPanier;

        SET idPanier = idPanier + 1;
    END WHILE;
END;
//

DELIMITER ;
