-- Suppression des tables si elles existent déjà
DROP TABLE IF EXISTS Produit_Apparenté;
DROP TABLE IF EXISTS Livraison;
DROP TABLE IF EXISTS Paiement;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS DétailPanier;
DROP TABLE IF EXISTS Panier;
DROP TABLE IF EXISTS Avis;
DROP TABLE IF EXISTS CB;
DROP TABLE IF EXISTS Adresse;
DROP TABLE IF EXISTS Article;
DROP TABLE IF EXISTS Catégorie;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Utilisateur;

CREATE TABLE Utilisateur (
    idUtilisateur INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    Civilite ENUM('H', 'F', 'A'),
    email VARCHAR(50) UNIQUE NOT NULL,
    mdp VARCHAR(255) NOT NULL,
    numTel VARCHAR(15) NOT NULL,
    rôle ENUM('Admin', 'Client')
);

CREATE TABLE Adresse (
    idAdresse INTEGER PRIMARY KEY,
    numAdr VARCHAR(10) NOT NULL,
    rue VARCHAR(100) NOT NULL,
    codePostal VARCHAR(10) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    pays VARCHAR(50) NOT NULL,
    complement VARCHAR(100),
    idUtilisateur INTEGER,
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
);

CREATE TABLE CB (
    idCarte INTEGER PRIMARY KEY,
    numeroCarte VARCHAR(19) UNIQUE NOT NULL CHECK (CHAR_LENGTH(numeroCarte) BETWEEN 13 AND 19),
    dateExpiration DATE,
    idUtilisateur INTEGER,
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
);

CREATE TABLE Catégorie (
    idCat INTEGER PRIMARY KEY,
    nomCat VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    idCatPere INTEGER
);

CREATE TABLE Stock (
    idStock INTEGER PRIMARY KEY,
    seuil_min INTEGER NOT NULL,
    seuil_max INTEGER NOT NULL,
    quantite INTEGER NOT NULL CHECK (quantite > 0)
);

CREATE TABLE Article (
    idArticle INTEGER PRIMARY KEY,
    nomArticle VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    prix DECIMAL(10, 2) NOT NULL CHECK (prix >= 0),
    poids DECIMAL(10, 3) NOT NULL CHECK (poids >= 0),
    dimension VARCHAR(30) NOT NULL,
    nbPièce INTEGER NOT NULL CHECK (nbPièce >= 0),
    trancheAge VARCHAR(30),
    couleur VARCHAR(30),
    nouveaute BOOLEAN DEFAULT FALSE,
    idCatégorie INTEGER,
    idStock INTEGER,
    FOREIGN KEY (idCatégorie) REFERENCES Catégorie(idCat),
    FOREIGN KEY (idStock) REFERENCES Stock(idStock)
);

CREATE TABLE Avis (
    idAvis INTEGER PRIMARY KEY,
    note ENUM('1', '2', '3', '4', '5'),
    commentaire VARCHAR(255),
    date DATE NOT NULL,
    titre VARCHAR(50) NOT NULL,
    idUtilisateur INTEGER,
    idArticle INTEGER,
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur),
    FOREIGN KEY (idArticle) REFERENCES Article(idArticle)
);

CREATE TABLE Panier (
    idPanier INTEGER PRIMARY KEY,
    montant DECIMAL(10, 2) NOT NULL CHECK (montant >= 0),
    nbArticle INTEGER NOT NULL CHECK (nbArticle >= 0),
    idUtilisateur INTEGER,
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
);

CREATE TABLE DétailPanier (
    idPanier INTEGER,
    idArticle INTEGER,
    quantité INTEGER NOT NULL CHECK (quantité > 0),
    PRIMARY KEY (idPanier, idArticle),
    FOREIGN KEY (idPanier) REFERENCES Panier(idPanier),
    FOREIGN KEY (idArticle) REFERENCES Article(idArticle)
);

CREATE TABLE Commande (
    idCommande INTEGER PRIMARY KEY,
    dateCommande DATE NOT NULL,
    idPanier INTEGER,
    FOREIGN KEY (idPanier) REFERENCES Panier(idPanier)
);

CREATE TABLE Paiement (
    idPaiement INTEGER PRIMARY KEY,
    typeP ENUM('CB', 'Chèques', 'Espèces', 'Virement'),
    date DATE NOT NULL,
    montantTotal DECIMAL(10, 2) NOT NULL CHECK (montantTotal >= 0),
    idCommande INTEGER,
    idCarte INTEGER,
    FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
    FOREIGN KEY (idCarte) REFERENCES CB(idCarte)
);

CREATE TABLE Livraison (
    idLivraison INTEGER PRIMARY KEY,
    typeL ENUM('Standard', 'Express', 'Retrait en magasin'),
    statut ENUM('En attente', 'expédiée', 'annulée', 'livrée'),
    MontantLiv DECIMAL(10, 2) NOT NULL CHECK (MontantLiv >= 0),
    idCommande INTEGER,
    idAdresse INTEGER,
    FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
    FOREIGN KEY (idAdresse) REFERENCES Adresse(idAdresse)
);

-- Table des relations entre produits
CREATE TABLE Produit_Apparenté (
    idArticle1 INT NOT NULL,
    idArticle2 INT NOT NULL,
    TypeRelation ENUM('complémentaire', 'similaire', 'cross-sell', 'parent-enfant') NOT NULL,
    PRIMARY KEY (idArticle1, idArticle2),
    FOREIGN KEY (idArticle1) REFERENCES Article(idArticle),
    FOREIGN KEY (idArticle2) REFERENCES Article(idArticle)
);

