DELIMITER $$

CREATE PROCEDURE remplir_paiement()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE c_idCommande INT;
  DECLARE c_dateCommande DATE;
  DECLARE c_MontantLiv DECIMAL(10,2);
  DECLARE c_montant DECIMAL(10,2);
  DECLARE c_idCarte INT;
  DECLARE next_idPaiement INT;

  DECLARE curs CURSOR FOR
    SELECT 
      c.idCommande,
      c.dateCommande,
      l.MontantLiv,
      p.montant,
      cb.idCarte
    FROM Commande c
    JOIN Livraison l ON l.idCommande = c.idCommande
    JOIN Panier p ON p.idPanier = c.idPanier
    JOIN CB cb ON cb.idUtilisateur = p.idUtilisateur;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  -- Obtenir le prochain idPaiement disponible
  SELECT IFNULL(MAX(idPaiement), 0) INTO next_idPaiement FROM Paiement;

  OPEN curs;

  read_loop: LOOP
    FETCH curs INTO c_idCommande, c_dateCommande, c_MontantLiv, c_montant, c_idCarte;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SET next_idPaiement = next_idPaiement + 1;

    INSERT INTO Paiement (
      idPaiement,
      typeP,
      date,
      montantTotal,
      idCommande,
      idCarte
    ) VALUES (
      next_idPaiement,
      'CB', -- Vous pouvez modifier le type de paiement si nécessaire
      c_dateCommande,
      c_MontantLiv + c_montant,
      c_idCommande,
      c_idCarte
    );
  END LOOP;

  CLOSE curs;
END$$

DELIMITER ;
