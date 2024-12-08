-- Suppression des données existantes (précaution pour éviter les doublons)
DELETE FROM Article;
DELETE FROM Stock;
DELETE FROM Catégorie;
DELETE FROM Utilisateur;
DELETE FROM Avis;
DELETE FROM Produit_Apparenté;


-- Ajout des catégories principales
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (1, 'Sets de jeu complet', 'Sets de jeu à thème', NULL);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (2, 'Sets de jeu créatifs', 'Sets pour matérialiser l’imagination des acheteurs.', NULL);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (3, 'Sets mobiliers', 'Boîtes pour créer des meubles décoratifs.', NULL);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (4, 'Pièces individuelles', 'Pièces achetables à l’unité.', NULL);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (5, 'Sachets de figurines', 'Sachets contenant des personnages.', NULL);

-- Sous-catégories pour "Sets de jeu complet"
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (6, 'Town', 'Sous-catégorie de Sets de jeu complet.', 1);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (7, 'Techno', 'Sous-catégorie de Sets de jeu complet.', 1);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (8, 'Aventure', 'Sous-catégorie de Sets de jeu complet.', 1);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (9, 'Hydro', 'Sous-catégorie de Sets de jeu complet.', 1);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (10, 'World', 'Sous-catégorie de Sets de jeu complet.', 1);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (11, 'Retro', 'Sous-catégorie de Sets de jeu complet.', 1);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (12, 'Kidz', 'Sous-catégorie de Sets de jeu complet.', 1);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (13, 'Teenz', 'Sous-catégorie de Sets de jeu complet.', 1);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (14, 'History', 'Sous-catégorie de Sets de jeu complet.', 1);

-- Sous-catégories pour "Sets de jeu créatifs"
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (15, 'Création libre', 'Sous-catégorie de Sets de jeu créatifs.', 2);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (16, 'Thèmes architecture', 'Sous-catégorie de Sets de jeu créatifs.', 2);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (17, 'Thèmes loisirs et divertissement', 'Sous-catégorie de Sets de jeu créatifs.', 2);

-- Sous-catégories pour "Sets mobiliers"
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (18, 'Meubles maison', 'Sous-catégorie de Sets mobiliers.', 3);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (19, 'Meubles décoratifs', 'Sous-catégorie de Sets mobiliers.', 3);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (20, 'Meubles d’extérieur', 'Sous-catégorie de Sets mobiliers.', 3);

-- Sous-catégories pour "Pièces individuelles"
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (21, 'Élément de base', 'Sous-catégorie de Pièces individuelles.', 4);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (22, 'Élément mécanique', 'Sous-catégorie de Pièces individuelles.', 4);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (23, 'Pièces spécifiques', 'Sous-catégorie de Pièces individuelles.', 4);

-- Sous-catégories pour "Sachets de figurines"
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (24, 'Figurines humaines', 'Sous-catégorie de Sachets de figurines.', 5);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (25, 'Figurines animales', 'Sous-catégorie de Sachets de figurines.', 5);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (26, 'Figurines personnages imaginaires', 'Sous-catégorie de Sachets de figurines.', 5);
INSERT INTO Catégorie (idCat, nomCat, description, idCatPere) VALUES (27, 'Figurines collectors', 'Sous-catégorie de Sachets de figurines.', 5);



-- Création des stocks pour town
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (1, 10, 100, 50);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (2, 5, 50, 30);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (3, 15, 120, 70);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (4, 20, 150, 90);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (5, 10, 80, 40);
-- Création des stocks pour Techno
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (6, 20, 150, 100);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (7, 15, 120, 80);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (8, 25, 200, 150);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (9, 30, 250, 180);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (10, 10, 100, 50);
-- Création des stocks pour Aventure
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (11, 15, 100, 70);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (12, 20, 120, 90);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (13, 10, 80, 50);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (14, 25, 150, 110);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (15, 30, 200, 140);

INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (16, 10, 100, 50); -- Hydro
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (17, 20, 150, 90);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (18, 15, 120, 70);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (19, 25, 180, 110);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (20, 30, 200, 150);

INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (21, 12, 100, 60); -- World
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (22, 18, 120, 80);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (23, 10, 80, 50);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (24, 25, 150, 100);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (25, 30, 180, 140);

INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (26, 10, 90, 45); -- Retro
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (27, 15, 110, 70);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (28, 20, 130, 85);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (29, 25, 150, 100);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (30, 12, 100, 60);

INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (31, 8, 70, 40); -- Kidz
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (32, 10, 90, 50);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (33, 15, 110, 60);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (34, 20, 130, 80);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (35, 25, 150, 100);

INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (36, 15, 120, 70); -- Teenz
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (37, 18, 140, 90);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (38, 12, 100, 60);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (39, 20, 160, 110);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (40, 25, 180, 130);

INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (41, 20, 150, 100); -- History
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (42, 25, 180, 120);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (43, 15, 130, 80);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (44, 30, 200, 150);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (45, 18, 160, 90);


-- Création des stocks
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (46, 10, 100, 50); -- Création Libre
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (47, 15, 120, 70);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (48, 20, 150, 100);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (49, 25, 200, 150);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (50, 30, 250, 180);

INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (51, 12, 100, 60); -- Thèmes Architecture
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (52, 15, 120, 80);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (53, 20, 150, 110);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (54, 25, 180, 140);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (55, 30, 200, 170);

INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (56, 20, 120, 80); -- Thèmes Loisirs et Divertissement
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (57, 25, 150, 100);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (58, 30, 180, 120);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (59, 15, 130, 90);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (60, 35, 200, 150);

-- Stocks pour Meubles Maison
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (61, 15, 100, 60);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (62, 20, 120, 80);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (63, 25, 150, 90);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (64, 20, 130, 75);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (65, 30, 160, 100);

-- Stocks pour Meubles Décoratifs
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (66, 10, 80, 50);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (67, 15, 90, 60);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (68, 20, 100, 70);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (69, 15, 85, 55);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (70, 25, 110, 80);

-- Stocks pour Meubles d'Extérieur
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (71, 20, 120, 70);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (72, 25, 140, 85);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (73, 30, 160, 100);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (74, 25, 150, 90);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (75, 35, 180, 120);


-- Stocks pour Éléments de Base
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (76, 100, 1000, 500);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (77, 150, 1200, 600);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (78, 200, 1500, 800);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (79, 120, 1100, 550);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (80, 180, 1300, 700);

-- Stocks pour Éléments Mécaniques
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (81, 50, 500, 250);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (82, 60, 600, 300);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (83, 70, 700, 350);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (84, 55, 550, 275);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (85, 65, 650, 325);

-- Stocks pour Pièces Spécifiques
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (86, 30, 300, 150);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (87, 40, 400, 200);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (88, 45, 450, 225);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (89, 35, 350, 175);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (90, 50, 500, 250);


-- Stocks pour Figurines Humaines
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (91, 40, 400, 200);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (92, 45, 450, 225);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (93, 50, 500, 250);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (94, 35, 350, 175);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (95, 55, 550, 275);

-- Stocks pour Figurines Animaux
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (96, 30, 300, 150);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (97, 35, 350, 175);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (98, 40, 400, 200);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (99, 25, 250, 125);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (100, 45, 450, 225);

-- Stocks pour Figurines Collectors
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (101, 20, 100, 50);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (102, 15, 80, 40);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (103, 25, 120, 60);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (104, 10, 60, 30);
INSERT INTO Stock (idStock, seuil_min, seuil_max, quantite) VALUES (105, 30, 150, 75);


-- Insertion des produits de la sous-catégorie 'Town'
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (1, 'Station de Police Brickolo Town™', 'Station complète avec véhicules et figurines.', 29.99, 1.5, '30x20x10', 300, '8+', 'Bleu', TRUE, 6, 1);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (2, 'Gare Brickolo Town™', 'Créez une gare avec des quais, un train, et des passagers.', 34.99, 1.8, '40x25x15', 350, '8+', 'Gris', TRUE, 6, 2);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (3, 'École Brickolo Town™', 'Construisez une école avec salles de classe et figurines.', 24.99, 1.2, '25x20x10', 250, '8+', 'Jaune', TRUE, 6, 3);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (4, 'Caserne de Pompiers Brickolo Town™', 'Caserne de pompiers avec camions et figurines.', 39.99, 2.0, '50x30x20', 400, '8+', 'Rouge', TRUE, 6, 4);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (5, 'Centre Commercial Brickolo Town™', 'Centre commercial avec magasins et clients.', 49.99, 3.0, '60x40x25', 500, '8+', 'Multicolore', TRUE, 6, 5);

-- Insertion des produits pour Techno
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (6, 'Robots en Action Brickolo Techno™', 'Construisez des robots avec des moteurs et des bras mécaniques.', 34.99, 1.5, '30x25x10', 400, '10+', 'Gris', TRUE, 7, 6);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (7, 'Usine Automatisée Brickolo Techno™', 'Créez une usine avec convoyeurs et bras robotisés.', 49.99, 2.0, '50x30x20', 500, '12+', 'Bleu', TRUE, 7, 7);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (8, 'Véhicules Futuristes Brickolo Techno™', 'Assemblez des véhicules modernes et volants.', 44.99, 2.5, '40x30x15', 450, '10+', 'Rouge', FALSE, 7, 8);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (9, 'Générateur d\'Énergie Brickolo Techno™', 'Construisez un modèle réaliste de centrale énergétique.', 29.99, 1.8, '35x20x15', 300, '10+', 'Vert', TRUE, 7, 9);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (10, 'Construction Mécanique Brickolo Techno™', 'Apprenez les bases de la mécanique avec des engrenages.', 39.99, 2.2, '40x25x20', 400, '12+', 'Jaune', TRUE, 7, 10);

-- Insertion des produits pour Aventure
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (11, 'Jungle d\'Explorer Brickolo Aventure™', 'Explorez la jungle avec des arbres et des animaux exotiques.', 34.99, 2.0, '40x30x15', 400, '8+', 'Vert', TRUE, 8, 11);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (12, 'Base Arctique Brickolo Aventure™', 'Créez une base de recherche polaire avec des scientifiques.', 39.99, 2.5, '45x35x20', 450, '10+', 'Blanc', TRUE, 8, 12);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (13, 'Safari en Afrique Brickolo Aventure™', 'Explorez la savane africaine avec des animaux sauvages.', 29.99, 1.8, '35x25x15', 350, '8+', 'Beige', FALSE, 8, 13);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (14, 'Expédition Désertique Brickolo Aventure™', 'Partez à la découverte d\'un temple ancien dans le désert.', 34.99, 2.0, '40x30x20', 400, '10+', 'Jaune', TRUE, 8, 14);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (15, 'Rivière Sauvage Brickolo Aventure™', 'Descendez la rivière avec un bateau et des accessoires.', 27.99, 1.6, '30x20x15', 300, '8+', 'Bleu', TRUE, 8, 15);

-- Sous-catégorie : Hydro (idCatégorie = 9)
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (16, 'Station Sous-Marine Brickolo Hydro™', 'Station complète pour explorer les fonds marins.', 44.99, 2.5, '40x30x20', 500, '10+', 'Bleu', TRUE, 9, 16);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (17, 'Véhicules Aquatiques Brickolo Hydro™', 'Bateaux et sous-marins pour des aventures marines.', 29.99, 1.8, '35x25x15', 300, '8+', 'Blanc', FALSE, 9, 17);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (18, 'Créatures Marines Brickolo Hydro™', 'Figurines et briques pour construire des animaux marins.', 19.99, 1.2, '30x20x10', 200, '6+', 'Multicolore', TRUE, 9, 18);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (19, 'Épave du Titanic Brickolo Hydro™', 'Recréez l\'épave légendaire du Titanic.', 49.99, 3.0, '50x40x30', 700, '12+', 'Gris', TRUE, 9, 19);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (20, 'Île Sous-Marine Brickolo Hydro™', 'Explorez des ruines sous-marines antiques.', 39.99, 2.2, '40x35x25', 400, '10+', 'Vert', FALSE, 9, 20);

-- Sous-catégorie : World (idCatégorie = 10)
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (21, 'Panorama des Grandes Villes Brickolo™', 'Réplique des grandes villes comme Paris et New York.', 29.99, 2.0, '35x30x15', 350, '8+', 'Multicolore', TRUE, 10, 21);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (22, 'Paysages de l\'Asie Brickolo™', 'Temples et jardins zen pour un paysage asiatique.', 24.99, 1.5, '30x25x15', 300, '8+', 'Rouge', FALSE, 10, 22);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (23, 'Safari en Afrique Brickolo™', 'Expédition avec véhicules et animaux de la savane.', 26.99, 1.8, '35x25x20', 400, '8+', 'Jaune', FALSE, 10, 23);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (24, 'Scène de Film Noir Brickolo™', 'Recréez une ambiance rétro avec voitures et personnages mystérieux.', 21.99, 1.2, '25x20x10', 300, '12+', 'Noir', TRUE, 11, 26);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (25, 'Diner Américain des Années 50 Brickolo™', 'Un diner vintage complet avec mobilier et accessoires.', 19.99, 1.5, '30x20x15', 350, '10+', 'Rouge', FALSE, 11, 27);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (26, 'Voitures Classiques des Années 60 Brickolo™', 'Construisez des voitures emblématiques comme la Mustang.', 23.99, 1.8, '35x25x15', 400, '10+', 'Bleu', TRUE, 11, 28);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (27, 'Télévision Vintage Brickolo™', 'Modèle rétro avec détails authentiques.', 16.99, 0.8, '20x15x10', 200, '12+', 'Gris', FALSE, 11, 29);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (28, 'Quartier Rétro Brickolo™', 'Recréez un quartier des années 60 avec boutiques et personnages.', 28.99, 2.5, '40x30x20', 500, '12+', 'Multicolore', TRUE, 11, 30);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (29, 'Parc d\'Aventure Kidz™', 'Un set coloré avec structures de jeux et toboggans.', 12.99, 1.0, '25x20x15', 200, '4+', 'Multicolore', TRUE, 12, 31);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (30, 'Petite Ferme Kidz™', 'Créez une ferme avec animaux, tracteur et grange.', 14.99, 1.2, '30x20x15', 250, '4+', 'Vert', FALSE, 12, 32);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (31, 'Super-Héros Kidz™', 'Un set simplifié avec figurines de super-héros.', 16.49, 1.5, '30x20x10', 300, '6+', 'Bleu', TRUE, 12, 33);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (32, 'Centre Commercial Kidz™', 'Centre commercial adapté aux plus jeunes.', 19.99, 1.8, '35x25x15', 400, '6+', 'Jaune', FALSE, 12, 34);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (33, 'Cité des Animaux Kidz™', 'Construisez une ville peuplée d\'animaux.', 17.99, 2.0, '40x30x20', 450, '6+', 'Multicolore', TRUE, 12, 35);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (34, 'Studio de Musique Teenz™', 'Créez un studio avec instruments et équipements.', 25.99, 2.0, '35x25x15', 350, '10+', 'Noir', TRUE, 13, 36);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (35, 'Salle de Sport Teenz™', 'Aménagez une salle avec équipements de musculation.', 22.49, 1.8, '30x20x15', 300, '10+', 'Gris', FALSE, 13, 37);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (36, 'Café-Pâtisserie Teenz™', 'Un café branché avec desserts et déco moderne.', 18.99, 1.5, '25x20x15', 250, '10+', 'Rouge', TRUE, 13, 38);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (37, 'Salle de Cinéma Teenz™', 'Construisez une salle de cinéma moderne.', 23.99, 2.2, '40x30x20', 450, '12+', 'Bleu', FALSE, 13, 39);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (38, 'Shopping Mall Teenz™', 'Centre commercial pour adolescents.', 27.99, 2.5, '50x40x25', 600, '12+', 'Multicolore', TRUE, 13, 40);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (39, 'Rome Antique History™', 'Recréez l\'Empire Romain avec bâtiments emblématiques.', 28.99, 3.0, '50x40x30', 700, '12+', 'Beige', TRUE, 14, 41);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (40, 'Château Médiéval History™', 'Un château complet avec remparts et tours.', 32.99, 3.5, '60x50x35', 800, '12+', 'Gris', FALSE, 14, 42);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (41, 'Pirates du Passé History™', 'Navires de guerre et cartes au trésor.', 18.99, 1.5, '30x20x15', 250, '10+', 'Noir', TRUE, 14, 43);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (42, 'Égypte Ancienne History™', 'Pyramides et statues des pharaons.', 24.99, 2.5, '40x30x20', 400, '10+', 'Jaune', FALSE, 14, 44);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (43, 'Japon Féodal History™', 'Temples et châteaux japonais traditionnels.', 22.49, 2.2, '35x30x20', 350, '12+', 'Rouge', TRUE, 14, 45);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (44, 'Briques de Construction Brickolo™', 'Set de briques pour laisser libre cours à votre imagination.', 14.99, 1.8, '25x20x10', 400, '6+', 'Multicolore', TRUE, 15, 46);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (45, 'Briques Géantes Brickolo™', 'Briques sûres et adaptées aux jeunes enfants.', 24.99, 2.5, '30x25x15', 500, '4+', 'Multicolore', FALSE, 15, 47);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (46, 'Kit de Mosaïque Brickolo™', 'Créez des motifs avec des briques colorées.', 19.99, 1.2, '20x20x10', 300, '8+', 'Multicolore', TRUE, 15, 48);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (47, 'Briques Colorées Brickolo™', 'Briques vives pour personnaliser vos créations.', 17.99, 1.0, '25x15x10', 250, '6+', 'Rouge', TRUE, 15, 49);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (48, 'Boîte Créative Brickolo™', 'Un large assortiment de briques variées.', 21.99, 2.8, '30x25x20', 600, '8+', 'Multicolore', TRUE, 15, 50);


INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (49, 'Architecture Moderne Brickolo™', 'Créez des bâtiments modernes avec des éléments contemporains.', 39.99, 2.0, '35x30x20', 400, '10+', 'Blanc', TRUE, 16, 51);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (50, 'Villes Futuristes Brickolo™', 'Construisez une ville futuriste avec des voitures volantes.', 49.99, 3.0, '50x40x30', 700, '12+', 'Gris', FALSE, 16, 52);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (51, 'Château Médiéval Brickolo™', 'Construisez un château avec un pont-levis et des créneaux.', 44.99, 2.5, '40x35x20', 600, '10+', 'Beige', TRUE, 16, 53);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (52, 'Maison de Luxe Brickolo™', 'Recréez une maison de luxe avec jardin et meubles.', 49.99, 3.2, '50x40x30', 750, '12+', 'Bleu', TRUE, 16, 54);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (53, 'Immeubles Urbains Brickolo™', 'Construisez des immeubles modernes avec des terrasses.', 39.99, 2.8, '40x30x20', 500, '10+', 'Gris', FALSE, 16, 55);


INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (54, 'Parc d\'Attractions Brickolo™', 'Manèges, montagnes russes et stands de nourriture.', 59.99, 4.0, '60x50x30', 1000, '12+', 'Multicolore', TRUE, 17, 56);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (55, 'Cinéma Brickolo™', 'Construisez un cinéma avec écran géant et sièges.', 39.99, 2.0, '40x30x20', 500, '10+', 'Noir', FALSE, 17, 57);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (56, 'Studio de Danse Brickolo™', 'Un studio complet avec barres de danse et miroirs.', 34.99, 1.5, '30x25x15', 400, '10+', 'Rose', TRUE, 17, 58);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (57, 'Salle de Jeux Brickolo™', 'Tables de billard et jeux d\'arcade inclus.', 29.99, 1.8, '35x30x15', 300, '12+', 'Bleu', TRUE, 17, 59);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (58, 'Stade de Football Brickolo™', 'Terrain, buts et tribunes pour recréer un match.', 49.99, 3.0, '50x40x30', 800, '12+', 'Vert', FALSE, 17, 60);


-- Articles Meubles Maison
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (59, 'Salon Moderne Brickolo™', 'Ensemble comprenant canapé, fauteuils et table basse', 44.99, 2.5, '45x35x20', 450, '8+', 'Gris', TRUE, 18, 61);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (60, 'Chambre à Coucher Brickolo™', 'Set avec lit double, armoire et tables de chevet', 39.99, 2.0, '40x30x15', 350, '8+', 'Blanc', FALSE, 18, 62);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (61, 'Cuisine Équipée Brickolo™', 'Cuisine complète avec îlot central et électroménagers', 49.99, 3.0, '50x40x25', 550, '10+', 'Beige', TRUE, 18, 63);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (62, 'Bureau Home Office Brickolo™', 'Ensemble bureau avec chaise et bibliothèque', 34.99, 1.8, '35x25x15', 300, '8+', 'Marron', FALSE, 18, 64);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (63, 'Salle à Manger Brickolo™', 'Table avec chaises et buffet assorti', 54.99, 3.5, '55x45x30', 600, '10+', 'Chêne', TRUE, 18, 65);

-- Articles Meubles Décoratifs
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (64, 'Bibliothèque Murale Brickolo™', 'Étagères modulables et décorative', 29.99, 1.5, '30x20x10', 250, '8+', 'Bois', TRUE, 19, 66);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (65, 'Lampe Design Brickolo™', 'Lampe moderne avec variations de couleurs', 24.99, 0.8, '15x15x25', 150, '8+', 'Multicolore', FALSE, 19, 67);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (66, 'Horloge Murale Brickolo™', 'Horloge décorative avec mécanisme fonctionnel', 19.99, 0.5, '20x20x5', 100, '8+', 'Argent', TRUE, 19, 68);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (67, 'Vase Artistique Brickolo™', 'Vase décoratif modulable', 14.99, 0.3, '10x10x20', 80, '8+', 'Bleu', FALSE, 19, 69);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (68, 'Miroir Encadré Brickolo™', 'Miroir avec cadre personnalisable', 34.99, 1.2, '40x30x5', 200, '10+', 'Or', TRUE, 19, 70);

-- Articles Meubles d'Extérieur
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (69, 'Salon de Jardin Brickolo™', 'Ensemble table et chaises d\'extérieur', 59.99, 4.0, '60x50x30', 700, '10+', 'Blanc', TRUE, 20, 71);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (70, 'Bain de Soleil Brickolo™', 'Chaise longue réglable avec parasol', 39.99, 2.5, '45x35x20', 400, '8+', 'Beige', FALSE, 20, 72);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (71, 'Fontaine de Jardin Brickolo™', 'Fontaine décorative avec système d\'eau', 49.99, 3.0, '40x40x50', 500, '12+', 'Gris', TRUE, 20, 73);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (72, 'Bar Extérieur Brickolo™', 'Bar de jardin avec tabourets', 44.99, 2.8, '50x30x40', 450, '10+', 'Marron', FALSE, 20, 74);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (73, 'Cuisine d\'Été Brickolo™', 'Ensemble barbecue et plan de travail', 64.99, 5.0, '70x60x40', 800, '12+', 'Noir', TRUE, 20, 75);


-- Articles Éléments de Base
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (74, 'Briques Standard 2x4 Brickolo™', 'Lot de 100 briques standard', 9.99, 0.5, '2x4', 100, '4+', 'Rouge', FALSE, 21, 76);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (75, 'Plaques de Base 4x8 Brickolo™', 'Lot de 50 plaques de base', 12.99, 0.8, '4x8', 50, '4+', 'Gris', FALSE, 21, 77);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (76, 'Mini-Briques 1x1 Brickolo™', 'Lot de 200 mini-briques', 7.99, 0.3, '1x1', 200, '4+', 'Multicolore', TRUE, 21, 78);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (77, 'Briques Angles Brickolo™', 'Lot de 75 briques d\'angle', 11.99, 0.6, '2x2', 75, '4+', 'Blanc', FALSE, 21, 79);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (78, 'Briques Arrondies Brickolo™', 'Lot de 60 briques arrondies', 13.99, 0.4, '2x4', 60, '4+', 'Bleu', TRUE, 21, 80);

-- Articles Éléments Mécaniques
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (79, 'Engrenages Basics Brickolo™', 'Set d\'engrenages variés', 14.99, 0.3, 'Varié', 40, '6+', 'Gris', TRUE, 22, 81);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (80, 'Axes et Connecteurs Brickolo™', 'Lot de pièces de connexion', 11.99, 0.2, 'Varié', 60, '6+', 'Noir', FALSE, 22, 82);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (81, 'Moteurs Électriques Brickolo™', 'Moteurs compatibles', 24.99, 0.5, '4x3x3', 1, '8+', 'Gris', TRUE, 22, 83);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (82, 'Roues et Essieux Brickolo™', 'Set complet de roues', 16.99, 0.4, 'Varié', 30, '6+', 'Noir', FALSE, 22, 84);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (83, 'Chaînes et Poulies Brickolo™', 'Kit de transmission', 19.99, 0.3, 'Varié', 25, '8+', 'Gris', TRUE, 22, 85);

-- Articles Pièces Spécifiques
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (84, 'Fenêtres et Portes Brickolo™', 'Éléments architecturaux', 17.99, 0.4, 'Varié', 20, '6+', 'Transparent', TRUE, 23, 86);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (85, 'Éléments Décoratifs Brickolo™', 'Pièces ornementales variées', 15.99, 0.3, 'Varié', 30, '6+', 'Multicolore', FALSE, 23, 87);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (86, 'Panneaux Spéciaux Brickolo™', 'Panneaux texturés et gravés', 21.99, 0.5, '4x6', 15, '6+', 'Gris', TRUE, 23, 88);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (87, 'Pièces Lumineuses Brickolo™', 'Éléments avec LED intégrée', 23.99, 0.2, '2x2', 10, '8+', 'Multicolore', TRUE, 23, 89);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (88, 'Connecteurs Spéciaux Brickolo™', 'Connecteurs techniques avancés', 18.99, 0.3, 'Varié', 25, '8+', 'Gris', FALSE, 23, 90);



-- Articles Figurines Humaines
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (89, 'Pack Famille Brickolo™', 'Set de 4 figurines famille (produit composé)', 14.99, 0.2, '5x2x2', 20, '4+', 'Multicolore', TRUE, 24, 91);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (90, 'Personnages Métiers Brickolo™', 'Set de 6 figurines professionnelles (produit composé)', 19.99, 0.3, '5x2x2', 30, '4+', 'Multicolore', FALSE, 24, 92);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (91, 'Figurines Sport Brickolo™', 'Set de 5 athlètes (produit composé)', 16.99, 0.25, '5x2x2', 25, '4+', 'Multicolore', TRUE, 24, 93);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (92, 'Mini-Figurines Aventuriers Brickolo™', 'Set de 3 explorateurs (produit composé)', 12.99, 0.15, '5x2x2', 15, '4+', 'Multicolore', FALSE, 24, 94);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (93, 'Personnages Historiques Brickolo™', 'Set de 4 figurines historiques (produit composé)', 17.99, 0.2, '5x2x2', 20, '6+', 'Multicolore', TRUE, 24, 95);

-- Articles Figurines Animaux
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (94, 'Animaux Domestiques Brickolo™', 'Set de 6 animaux de compagnie (produit composé)', 13.99, 0.2, '4x2x2', 18, '4+', 'Multicolore', TRUE, 25, 96);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (95, 'Animaux Sauvages Brickolo™', 'Set de 5 animaux de la savane (produit composé)', 15.99, 0.25, '5x3x2', 20, '4+', 'Multicolore', FALSE, 25, 97);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (96, 'Créatures Marines Brickolo™', 'Set de 4 animaux marins (produit composé)', 12.99, 0.15, '4x2x2', 16, '4+', 'Multicolore', TRUE, 25, 98);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (97, 'Dinosaures Brickolo™', 'Set de 3 dinosaures (produit composé)', 18.99, 0.3, '6x4x3', 15, '6+', 'Multicolore', FALSE, 25, 99);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (98, 'Animaux Fantastiques Brickolo™', 'Set de 4 créatures mythiques (produit composé)', 16.99, 0.25, '5x3x2', 20, '6+', 'Multicolore', TRUE, 25, 100);

-- Articles Figurines Collectors
INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (99, 'Héros Édition Limitée Brickolo™', 'Figurine collector superhéros', 29.99, 0.2, '5x3x2', 10, '8+', 'Or', TRUE, 26, 101);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (100, 'Personnages Rares Brickolo™', 'Set de 2 figurines exclusives (produit composé)', 34.99, 0.3, '6x4x3', 15, '8+', 'Chrome', FALSE, 26, 102);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (101, 'Figurine 25ème Anniversaire Brickolo™', 'Édition spéciale commemorative', 39.99, 0.25, '5x3x2', 12, '8+', 'Platine', TRUE, 26, 103);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (102, 'Collectors Pack Brickolo™', 'Pack exclusif de 3 figurines rares (produit composé)', 49.99, 0.4, '8x6x4', 25, '8+', 'Multicolore', TRUE, 26, 104);

INSERT INTO Article (idArticle, nomArticle, description, prix, poids, dimension, nbPièce, trancheAge, couleur, nouveaute, idCatégorie, idStock)
VALUES (103, 'Figurine Signature Brickolo™', 'Pièce numérotée et signée', 44.99, 0.3, '6x4x3', 15, '12+', 'Édition Spéciale', FALSE, 26, 105);

  --insertion des clients

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (1, 'Martin', 'Jean', 'H', 'jean.martin@gmail.com', '$2a$10$M9OguM5w5dVZm.uzRmB9s.xjxHqIcFmjEB5HQU0UlM0TgZGTzFd9G', '0612345678', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (2, 'Durand', 'Sophie', 'F', 'sophie.durand@gmail.com', '$2a$10$1Od2E2K4jm1p/5BdWoeIsOm7JYoF2vIkdknLO7WBBy9lFh/CVqaR.', '0623456789', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (3, 'Bernard', 'Luc', 'H', 'luc.bernard@gmail.com', '$2a$10$QbGr7joGmUkHh0.02sV9gB5rpO7D5GpETy3ZgsQYP8smRJZXHkp1S', '0634567890', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (4, 'Petit', 'Camille', 'F', 'camille.petit@gmail.com', '$2a$10$Eqq6tTa6aCw1Wy2dOgjL6sB5pxZKlAoFhANz9hRYKkS9KkzgF6eyK', '0645678901', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (5, 'Roux', 'Julie', 'F', 'julie.roux@gmail.com', '$2a$10$X9QNYgMjhtYQq56Hhr9tPgbCUcJ1e9dHoDRUuwvD2OeeaeRzmXs9m', '0656789012', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (6, 'Moreau', 'Jacques', 'H', 'jacques.moreau@gmail.com', '$2a$10$Y8jRrnKrIrVJ4SKslUkBo2dxgePyO1FwZ2E2xBOzFTAKWmwwa3nKm', '0667890123', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (7, 'Fournier', 'Claire', 'F', 'claire.fournier@gmail.com', '$2a$10$Wvj0LrXShMbUwCvIrS4QmO4dPhjbkZ3Dl2TyzShVJrLtyzXpbkdqG', '0678901234', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (8, 'Girard', 'Paul', 'H', 'paul.girard@gmail.com', '$2a$10$rcFwQ.XRz3Kse49gks6.OxjqBoMRV0q1xQhgNGFjkH1OZQZGQe5m6', '0689012345', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (9, 'Lemoine', 'Bernadette', 'F', 'bernadette.lemoine@gmail.com', '$2a$10$RAt6y/N7Q1BG0HlFlNYOTny5XzS/6HAPw6A.B8Ck9URqu9tw8F8Vm', '0690123456', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (10, 'Leclerc', 'Henri', 'H', 'henri.leclerc@gmail.com', '$2a$10$KNjZXKNSLU6bkTucdV91lBl6ddHhXqYN.f7e2Wf.Bm0aZ9jXgdiD6', '0611122334', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (11, 'Deschamps', 'Marie', 'F', 'marie.deschamps@gmail.com', '$2a$10$YhIkOUFv5IGrKnpdXUMfF12bni0OZs61yZsUp9mv1dwZ5B88FXBGq', '0722334455', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (12, 'Dufresne', 'Pierre', 'H', 'pierre.dufresne@gmail.com', '$2a$10$CbGHkmfO3dV1QEnr2y3QZfHqz3cRg8g9LZVLMnmco0z6XoFjTHY3S', '0733445566', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (13, 'Lemoine', 'Jean', 'H', 'jean.lemoine@gmail.com', '$2a$10$F7dUJt3yVpXjiP1p02O5so3ijYO4eQHiFqTPfzOs3nVtvfK3C7cTS', '0744556677', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (14, 'Benoit', 'Charlotte', 'F', 'charlotte.benoit@gmail.com', '$2a$10$Ut41O4tn/Zf/VqTLrpnt37c8c88BF61qth1.bG9s4yoGNh35N4jkf', '0755667788', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (15, 'Muller', 'Claude', 'H', 'claude.muller@gmail.com', '$2a$10$TyFx8hKEl/Jhz3ftREx9FeDzJlk.f5LOE79o57uOsaRHrxszB9k6m', '0766778899', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (16, 'Lemoine', 'Sébastien', 'H', 'sebastien.lemoine@gmail.com', '$2a$10$O.yC6y7qYd9ReBc19Hg30J6Q8zO0WwWlfjB8woQe0TpPlM42I9KxS', '0777889900', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (17, 'Lemoine', 'Isabelle', 'F', 'isabelle.lemoine@gmail.com', '$2a$10$TkY7MOaHRkLIMwMd5Gr1J5Y0oy2P/jti6m0Xw09cML9y6dIQec0Jk', '0788990011', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (18, 'Roche', 'François', 'H', 'francois.roche@gmail.com', '$2a$10$Y74G1guL5qa3c1/x0fKlUmI7KTzMkmCZPsrMn7.IgDce7kjiXbaDi', '0799001122', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (19, 'Lemoine', 'Lucie', 'F', 'lucie.lemoine@gmail.com', '$2a$10$1WYjXZlrpYzS1x1EhvOIfTTr2Dh9fpJv1nDzy.Nw2AGvPh93Y0c9C', '0800112233', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (20, 'Pires', 'Vincent', 'H', 'vincent.pires@gmail.com', '$2a$10$9XnHgFrLVK68w8hbZy5gnVfTEm9FqU9.HGZ39BIMtLFSHmr0EnyNe', '0811223344', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (21, 'Vasseur', 'Emma', 'F', 'emma.vasseur@gmail.com', '$2a$10$WV9V1dOkVfq0m5c4tzkmLP9ykf84dzy6mvT5tHTeVZjKp3zYo.PU1', '0822334455', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (22, 'Lemoine', 'Pierre', 'H', 'pierre.lemoine@gmail.com', '$2a$10$XZ7Otn1ZTZVknQkgjEdA.dwrM6yKh5EuAD5SeIQHQtj3fNNIuN.nW', '0833445566', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (23, 'Lemoine', 'Thomas', 'H', 'thomas.lemoine@gmail.com', '$2a$10$JTpUw8Nr65HAdPx7XvP2rli6uCqKrdVe4xYekHsq4y8ou0xYgGqL1', '0844556677', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (24, 'Dubois', 'Alice', 'F', 'alice.dubois@gmail.com', '$2a$10$KjL8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J', '0855667788', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (25, 'Laurent', 'Marc', 'H', 'marc.laurent@gmail.com', '$2a$10$Nj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0866778899', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (26, 'Simon', 'Élise', 'F', 'elise.simon@gmail.com', '$2a$10$Pj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0877889900', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (27, 'Michel', 'Philippe', 'H', 'philippe.michel@gmail.com', '$2a$10$Qj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0888990011', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (28, 'Lefevre', 'Catherine', 'F', 'catherine.lefevre@gmail.com', '$2a$10$Rj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0899001122', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (29, 'Garcia', 'Antoine', 'H', 'antoine.garcia@gmail.com', '$2a$10$Sj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0900112233', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (30, 'David', 'Sylvie', 'F', 'sylvie.david@gmail.com', '$2a$10$Tj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0911223344', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (31, 'Bertrand', 'Nicolas', 'H', 'nicolas.bertrand@gmail.com', '$2a$10$Uj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0922334455', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (32, 'Thomas', 'Caroline', 'F', 'caroline.thomas@gmail.com', '$2a$10$Vj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0933445566', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (33, 'Robert', 'Mathieu', 'H', 'mathieu.robert@gmail.com', '$2a$10$Wj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0944556677', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (34, 'Petit', 'Anne', 'F', 'anne.petit@gmail.com', '$2a$10$Xj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0955667788', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (35, 'Richard', 'Guillaume', 'H', 'guillaume.richard@gmail.com', '$2a$10$Yj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0966778899', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (36, 'Dumont', 'Céline', 'F', 'celine.dumont@gmail.com', '$2a$10$Zj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0977889900', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (37, 'Leroy', 'Alexandre', 'H', 'alexandre.leroy@gmail.com', '$2a$10$Aj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0988990011', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (38, 'Moreau', 'Nathalie', 'F', 'nathalie.moreau@gmail.com', '$2a$10$Bj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0999001122', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (39, 'Simon', 'Patrick', 'H', 'patrick.simon@gmail.com', '$2a$10$Cj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0610111213', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (40, 'Laurent', 'Christine', 'F', 'christine.laurent@gmail.com', '$2a$10$Dj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0611121314', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (41, 'Michel', 'Stéphane', 'H', 'stephane.michel@gmail.com', '$2a$10$Ej8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0612131415', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (42, 'Lefevre', 'Valérie', 'F', 'valerie.lefevre@gmail.com', '$2a$10$Fj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0613141516', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (43, 'Garcia', 'Olivier', 'H', 'olivier.garcia@gmail.com', '$2a$10$Gj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0614151617', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (44, 'David', 'Sandrine', 'F', 'sandrine.david@gmail.com', '$2a$10$Hj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0615161718', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (45, 'Bertrand', 'Laurent', 'H', 'laurent.bertrand@gmail.com', '$2a$10$Ij8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0616171819', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (46, 'Thomas', 'Isabelle', 'F', 'isabelle.thomas@gmail.com', '$2a$10$Jj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0617181920', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (47, 'Robert', 'Daniel', 'H', 'daniel.robert@gmail.com', '$2a$10$Kj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0618192021', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (48, 'Petit', 'Marie-Claire', 'F', 'marie-claire.petit@gmail.com', '$2a$10$Lj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0619202122', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (49, 'Richard', 'Bernard', 'H', 'bernard.richard@gmail.com', '$2a$10$Mj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0620212223', 'Client');

INSERT INTO Utilisateur (idUtilisateur, nom, prenom, Civilite, email, mdp, numTel, rôle)
VALUES (50, 'Dumont', 'Florence', 'F', 'florence.dumont@gmail.com', '$2a$10$Nj8mN9pX6rQ2Y5vH3n1Z.8J5q6X9K8tQ5X2Y9K5nM2X5vH3n1Z8J5', '0621222324', 'Client');

-- Avis 1
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (1, '5', 'Produit incroyable, je le recommande vivement !', '2024-12-01', 'Top qualité', 1, 1);

-- Avis 2
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (2, '4', 'Bon produit mais livraison lente.', '2024-12-02', 'Satisfaisant', 2, 2);

-- Avis 3
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (3, '3', 'La couleur ne correspond pas à la description.', '2024-12-03', 'Déçu par la couleur', 3, 3);

-- Avis 4
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (4, '5', 'Livraison rapide, produit conforme.', '2024-12-04', 'Très satisfait', 4, 4);

-- Avis 5
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (5, '2', 'La qualité laisse à désirer.', '2024-12-05', 'Mauvaise qualité', 5, 5);

-- Avis 6
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (6, '5', 'Produit conforme à la description et très pratique.', '2024-12-06', 'Pratique et conforme', 6, 6);

-- Avis 7
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (7, '4', 'Bon rapport qualité/prix.', '2024-12-07', 'Bon achat', 7, 7);

-- Avis 8
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (8, '1', 'Le produit est arrivé endommagé.', '2024-12-08', 'Produit endommagé', 8, 8);

-- Avis 9
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (9, '5', 'Très satisfait du service client.', '2024-12-09', 'Service client au top', 9, 9);

-- Avis 10
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (10, '3', 'Les instructions d\'utilisation ne sont pas claires.', '2024-12-10', 'Manque de clarté', 10, 10);

-- Avis 11
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (11, '4', 'Produit conforme mais emballage peu soigné.', '2024-12-11', 'Bon produit, emballage médiocre', 11, 11);

-- Avis 12
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (12, '5', 'Article parfait pour un cadeau.', '2024-12-12', 'Idéal pour offrir', 12, 12);

-- Avis 13
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (13, '2', 'Produit inutilisable après quelques jours.', '2024-12-13', 'Déçu', 13, 13);

-- Avis 14
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (14, '5', 'Excellente qualité, je rachèterai.', '2024-12-14', 'Qualité exceptionnelle', 14, 14);

-- Avis 15
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (15, '3', 'Le produit ne vaut pas son prix.', '2024-12-15', 'Trop cher', 15, 15);

-- Avis 16
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (16, '4', 'Livraison dans les délais, produit conforme.', '2024-12-16', 'Bonne expérience', 16, 16);

-- Avis 17
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (17, '1', 'Aucun suivi après vente.', '2024-12-17', 'Service client absent', 17, 17);

-- Avis 18
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (18, '5', 'Produit innovant et facile à utiliser.', '2024-12-18', 'Produit génial', 18, 18);

-- Avis 19
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (19, '4', 'Léger problème avec la livraison, mais tout s\'est réglé.', '2024-12-19', 'Bon suivi', 19, 19);

-- Avis 20
INSERT INTO Avis (idAvis, note, commentaire, date, titre, idUtilisateur, idArticle)
VALUES (20, '2', 'Mauvaise expérience, produit non conforme.', '2024-12-20', 'Non conforme', 20, 20);


-- Insertion des relations entre produits

INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (1, 4, 'complémentaire'); -- Station de Police et Caserne de Pompiers
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (2, 3, 'similaire'); -- Gare et École
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (5, 7, 'cross-sell'); -- Centre Commercial et Usine Automatisée
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (6, 8, 'complémentaire'); -- Robots en Action et Véhicules Futuristes
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (9, 10, 'similaire'); -- Générateur d'Énergie et Construction Mécanique
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (11, 13, 'cross-sell'); -- Jungle d'Explorer et Safari en Afrique
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (12, 14, 'complémentaire'); -- Base Arctique et Expédition Désertique
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (15, 17, 'similaire'); -- Rivière Sauvage et Véhicules Aquatiques
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (16, 18, 'cross-sell'); -- Station Sous-Marine et Créatures Marines
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (19, 20, 'complémentaire'); -- Épave du Titanic et Île Sous-Marine
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (21, 22, 'similaire'); -- Panorama des Grandes Villes et Paysages de l'Asie
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (23, 24, 'cross-sell'); -- Safari en Afrique et Scène de Film Noir
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (25, 26, 'complémentaire'); -- Diner Américain des Années 50 et Voitures Classiques des Années 60
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (27, 28, 'similaire'); -- Télévision Vintage et Quartier Rétro
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (29, 30, 'cross-sell'); -- Parc d'Aventure Kidz et Petite Ferme Kidz
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (31, 32, 'complémentaire'); -- Super-Héros Kidz et Centre Commercial Kidz
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (33, 34, 'similaire'); -- Cité des Animaux Kidz et Studio de Musique Teenz
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (35, 36, 'cross-sell'); -- Salle de Sport Teenz et Café-Pâtisserie Teenz
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (37, 38, 'complémentaire'); -- Salle de Cinéma Teenz et Shopping Mall Teenz
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (39, 40, 'similaire'); -- Rome Antique History et Château Médiéval History
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (41, 42, 'cross-sell'); -- Pirates du Passé History et Égypte Ancienne History
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (43, 44, 'complémentaire'); -- Japon Féodal History et Briques de Construction Brickolo
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (45, 46, 'similaire'); -- Briques Géantes Brickolo et Kit de Mosaïque Brickolo
INSERT INTO Produit_Apparenté (idArticle1, idArticle2, TypeRelation) VALUES (47, 48, 'cross-sell'); -- Briques Colorées Brickolo et Boîte Créative Brickolo


-- Insertion des adresses pour les utilisateurs existants
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (1, '12', 'Rue de la Paix', '75002', 'Paris', 'France', NULL, 1);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (2, '34', 'Avenue des Champs-Élysées', '75008', 'Paris', 'France', NULL, 2);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (3, '56', 'Boulevard Saint-Germain', '75005', 'Paris', 'France', NULL, 3);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (4, '78', 'Rue de Rivoli', '75001', 'Paris', 'France', NULL, 4);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (5, '90', 'Rue du Faubourg Saint-Honoré', '75008', 'Paris', 'France', NULL, 5);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (6, '23', 'Rue de la République', '69002', 'Lyon', 'France', NULL, 6);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (7, '45', 'Cours Lafayette', '69003', 'Lyon', 'France', NULL, 7);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (8, '67', 'Rue Victor Hugo', '69002', 'Lyon', 'France', NULL, 8);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (9, '89', 'Avenue Jean Jaurès', '69007', 'Lyon', 'France', NULL, 9);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (10, '12', 'Rue de la Liberté', '21000', 'Dijon', 'France', NULL, 10);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (11, '34', 'Rue des Godrans', '21000', 'Dijon', 'France', NULL, 11);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (12, '56', 'Rue de la Préfecture', '21000', 'Dijon', 'France', NULL, 12);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (13, '78', 'Rue Monge', '21000', 'Dijon', 'France', NULL, 13);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (14, '90', 'Rue Chabot-Charny', '21000', 'Dijon', 'France', NULL, 14);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (15, '23', 'Rue de la Bourse', '33000', 'Bordeaux', 'France', NULL, 15);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (16, '45', 'Cours de l\'Intendance', '33000', 'Bordeaux', 'France', NULL, 16);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (17, '67', 'Rue Sainte-Catherine', '33000', 'Bordeaux', 'France', NULL, 17);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (18, '89', 'Rue du Pas-Saint-Georges', '33000', 'Bordeaux', 'France', NULL, 18);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (19, '12', 'Rue des Remparts', '33000', 'Bordeaux', 'France', NULL, 19);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (20, '34', 'Rue du Palais Gallien', '33000', 'Bordeaux', 'France', NULL, 20);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (21, '56', 'Rue de la Devise', '33000', 'Bordeaux', 'France', NULL, 21);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (22, '78', 'Rue du Loup', '33000', 'Bordeaux', 'France', NULL, 22);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (23, '90', 'Rue du Mirail', '33000', 'Bordeaux', 'France', NULL, 23);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (24, '23', 'Rue de la Porte Dijeaux', '33000', 'Bordeaux', 'France', NULL, 24);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (25, '45', 'Rue du Parlement Sainte-Catherine', '33000', 'Bordeaux', 'France', NULL, 25);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (26, '67', 'Rue du Pas-Saint-Georges', '33000', 'Bordeaux', 'France', NULL, 26);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (27, '89', 'Rue des Bahutiers', '33000', 'Bordeaux', 'France', NULL, 27);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (28, '12', 'Rue du Chai des Farines', '33000', 'Bordeaux', 'France', NULL, 28);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (29, '34', 'Rue du Languedoc', '31000', 'Toulouse', 'France', NULL, 29);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (30, '56', 'Rue de Metz', '31000', 'Toulouse', 'France', NULL, 30);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (31, '78', 'Rue Alsace Lorraine', '31000', 'Toulouse', 'France', NULL, 31);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (32, '90', 'Rue de la Pomme', '31000', 'Toulouse', 'France', NULL, 32);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (33, '23', 'Rue du Taur', '31000', 'Toulouse', 'France', NULL, 33);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (34, '45', 'Rue Saint-Rome', '31000', 'Toulouse', 'France', NULL, 34);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (35, '67', 'Rue des Filatiers', '31000', 'Toulouse', 'France', NULL, 35);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (36, '89', 'Rue de la Bourse', '31000', 'Toulouse', 'France', NULL, 36);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (37, '12', 'Rue des Lois', '31000', 'Toulouse', 'France', NULL, 37);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (38, '34', 'Rue Gambetta', '31000', 'Toulouse', 'France', NULL, 38);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (39, '56', 'Rue de la Colombette', '31000', 'Toulouse', 'France', NULL, 39);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (40, '78', 'Rue de la Concorde', '31000', 'Toulouse', 'France', NULL, 40);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (41, '90', 'Rue des Arts', '31000', 'Toulouse', 'France', NULL, 41);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (42, '23', 'Rue de l\'Industrie', '31000', 'Toulouse', 'France', NULL, 42);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (43, '45', 'Rue de la Fonderie', '31000', 'Toulouse', 'France', NULL, 43);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (44, '67', 'Rue de la Chaussée', '31000', 'Toulouse', 'France', NULL, 44);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (45, '89', 'Rue de la Garonne', '31000', 'Toulouse', 'France', NULL, 45);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (46, '12', 'Rue de la Daurade', '31000', 'Toulouse', 'France', NULL, 46);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (47, '34', 'Rue de la Fonderie', '31000', 'Toulouse', 'France', NULL, 47);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (48, '56', 'Rue de la Chaussée', '31000', 'Toulouse', 'France', NULL, 48);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (49, '78', 'Rue de la Garonne', '31000', 'Toulouse', 'France', NULL, 49);
INSERT INTO Adresse (idAdresse, numAdr, rue, codePostal, ville, pays, complement, idUtilisateur) VALUES (50, '90', 'Rue de la Daurade', '31000', 'Toulouse', 'France', NULL, 50);

-- Insertion des références de carte bancaire pour une dizaine d'utilisateurs
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (1, '1234567812345678', '2025-12-31', 1);
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (2, '2345678923456789', '2024-11-30', 2);
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (3, '3456789034567890', '2023-10-31', 3);
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (4, '4567890145678901', '2026-09-30', 4);
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (5, '5678901256789012', '2025-08-31', 5);
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (6, '6789012367890123', '2024-07-31', 6);
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (7, '7890123478901234', '2023-06-30', 7);
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (8, '8901234589012345', '2026-05-31', 8);
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (9, '9012345690123456', '2025-04-30', 9);
INSERT INTO CB (idCarte, numeroCarte, dateExpiration, idUtilisateur) VALUES (10, '0123456701234567', '2024-03-31', 10);
