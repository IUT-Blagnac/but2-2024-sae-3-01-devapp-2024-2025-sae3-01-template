<?php
require_once __DIR__ . '/../vendor/autoload.php';
include 'Connect.inc.php';
use Faker\Factory;
$faker = Faker\Factory::create('fr_FR');

//tableau de tout les insert
$tabInsert=[];
$tabProduit=[
    'Jeux de société' => ['Monopoly', 'Uno', 'Cluedo' , 'Jungle Speed' ,'SkyJo'],
    'Jeux de rôle' => ['Donjons et Dragons', 'Pathfinder', 'Star Wars' ],
    'Jeux de logique' => ['Rush Hour', 'Mastermind', 'Sudoku' ],
    'Jeux de mémoire' => ['Memory', 'Dobble', 'Time’s Up' ],
    'Kits de robotique' => ['Lego Mindstorms', 'Makeblock', 'Thymio' ],
    'Kits de chimie' => ['Clementoni', 'Buki', 'Educa' ],
    'Marvel' => ['Spiderman', 'IronMan', 'Captain America' ],
    'DC Comics' => ['Batman', 'SuperMan ','WonderWoman' ],
    'Power Rangers' => ['Mighty Morphin', 'Zeo', 'Turbo' ],
    'Animaux' => ['peppa pig', 'paw patrol', 'Les Animaux de la Ferme ' ],
    'Jeux de jardin' => ['Toboggan', 'Balançoire', 'Bac à sable' ],
    'Vélos et trottinettes' => ['Vélo', 'Trottinette', 'Draisienne' ,'skateboard'],
    'Instruments' => ['Guitare', 'Piano', 'Batterie' ],
    'Kits de chant' => ['Micro', 'Karaoké', 'Enceinte' ,'Casque'],
    'Arts plastiques' => ['Peinture', 'Pâte à modeler', 'Crayons de couleur' ],
    'DIY' => ['Perles', 'Origami', 'Couture' ],
    'Tablettes pour enfants' => ['Vtech', 'Leapfrog', 'Kurio' ],
    'Appareils photo et caméras' => ['Vtech', 'Fisher Price', 'Nikon' ],
    'Jouets d’éveil' => ['Sophie la Girafe', 'Tapis d’éveil', 'Mobile' ],
    'Jeux pour bébé' => ['Cubes', 'Puzzles', 'Livres' ],
    'Ballons' => ['de Foot', ' de Basket', ' de Rugby' ],
    'Raquettes' => [' de Tennis', ' de Badminton', ' de Ping Pong ' ],


];
$tabCategorie = [
    'Familial' => [
        'Jeux de société' ,
        'Jeux de rôle' 
    ],
    'Éducatif' => [
        'Jeux de logique' ,
        'Jeux de mémoire' 
    ],
    'Scientifique' => [
        'Kits de robotique' ,
        'Kits de chimie' 
    ],
    'Figurine' => [
        'Super-héros' => ['Marvel', 'DC Comics', 'Power Rangers'],
        'Animaux' ,
    ],
    'Exterieur' => [
        'Jeux de jardin' ,
        'Vélos et trottinettes' ,
    ],
    'Musical' => [
        'Instruments' ,
        'Kits de chant' ,
    ],
    'Créatif' => [
        'Arts plastiques' ,
        'DIY' ,
    ],
    'Technologique' => [
        'Tablettes pour enfants' ,
        'Appareils photo et caméras' ,
    ],
    'Bébé' => [
        'Jouets d’éveil' ,
        'Jeux pour bébé' ,
    ],
    'Sport' => [
        'Ballons'  ,
        'Raquettes' ,
    ],
];






function client($nbClient){
    $tabInsert=[];
    $tabClient=[];
    $faker = Factory::create('fr_FR');
$numbers = range(1, $nbClient);
shuffle($numbers);
for($i=0;$i<$nbClient;$i++){
    $Client = [
        'mailClient' => $faker->email,
        'nomClient' => $faker->firstName,
        'prenomClient' => $faker->lastName,
        'telClient' => $faker->bothify('0########'),

        'mdpClient' => $faker->bothify('??##?##??#'),
        'genre' => $faker->randomElement($array = array ('H','F')),
        'dateNaissance' => $faker->date($format = 'Y-m-d', $max = 'now'),
        'idAdresse' => $numbers[$i]
    ];
    $tabClient[] = $Client;
}
foreach($tabClient as $client){
    $insert = 'INSERT INTO Client (email, nom, prenom, numTel, password, genreC, dateNaissance, idAdresse) 
           VALUES ("' . $client['mailClient'] . '", "' . $client['nomClient'] . '", 
           "' . $client['prenomClient'] . '", "' . $client['telClient'] . '", "' . $client['mdpClient'] . '"
           , "' . $client['genre'] . '", "' . $client['dateNaissance'] . '", ' . $client['idAdresse'] . ')';

    $tabInsert[] = $insert;
}
    return $tabInsert;
}


function random_decimal($min, $max, $precision = 2) {
    $factor = pow(10, $precision);
    return mt_rand($min * $factor, $max * $factor) / $factor;
}
function regroupement($nbRP){
    $tabInsert=[];
    $faker = Factory::create('fr_FR');
    $tabRP=['nouveauté','promotion','solde','made in france'];
    for($i=0;$i<4;$i++){
        $RP = [
            'nomRP' => $faker->randomElement($tabRP),
        ];
        $tabInsert[] ='INSERT INTO Regroupement 
        (nomRegroupement) VALUES ("'.$RP['nomRP'].'")';
    }
    for($i=0;$i<$nbRP;$i++){
        $RP = [
            'nomRP' => $faker->word,
        ];
        $tabInsert[] ='INSERT INTO Produit_Regroupement 
        (idProduit,idRegroupement) VALUES 
        ('.random_int(1, 70).','.random_int(1, 4).')';
    }
    return $tabInsert;

}


function detailproduit($nomProduit,$typeProduit,$idcategorie){
    // Initialiser Faker
    $faker = Factory::create('fr_FR');

    // Générer un nom de marque aléatoire
    $nomMarque = $faker->company;
    $age = random_int(3, 10);
    $t=random_int(10, 50);
    $taille = $t . 'x' . random_int(10, $t) . 'x' . random_int(10, $t);
    $prix = random_decimal(10, 50, 2);
    $note =random_decimal(2, 5, 1); 
    $nbJoueur = random_int(1, 5);

    // Créer une description personnalisée avec Faker
    $descriptions = [
        "un {$typeProduit} {$nomProduit} de la marque {$nomMarque}, conçu pour les enfants à partir de {$age} ans. Ce produit offre une expérience unique grâce à ses dimensions compactes de {$taille} et son design adapté. Avec une note de {$note}/5, il est apprécié pour sa qualité et ses fonctionnalités. Parfait pour {$nbJoueur} joueur(s), il garantit des heures d'amusement.",
        "Le {$typeProduit} {$nomProduit} de la marque {$nomMarque} est idéal pour les enfants dès {$age} ans. Avec ses dimensions de {$taille}, il offre une expérience de jeu exceptionnelle. Note de {$note}/5, c'est un produit de qualité apprécié pour sa robustesse et son design pratique. Convient à {$nbJoueur} joueur(s), pour des heures de divertissement garanties.",
        "Découvrez le {$typeProduit} {$nomProduit} de la marque {$nomMarque}, spécialement conçu pour les enfants à partir de {$age} ans. Son design compact de {$taille} et sa qualité en font un choix parfait. Note {$note}/5, il est apprécié pour sa simplicité et ses caractéristiques. Idéal pour {$nbJoueur} joueur(s), il garantit des moments inoubliables.",
        "Le {$typeProduit} {$nomProduit} de {$nomMarque} est conçu pour les enfants dès {$age} ans. Ce produit est compact avec des dimensions de {$taille} et offre une expérience ludique. Sa note de {$note}/5 témoigne de sa popularité pour sa qualité. Idéal pour {$nbJoueur} joueur(s), il promet des heures de jeu fun et divertissantes."
    ];
    //enlever '
    foreach($descriptions as $key => $value){
        $descriptions[$key] = str_replace("'", "", $value);
    }

    // Retourner les détails du produit sous forme de tableau associatif
    return [
        'nom' => $nomProduit,
        'age' => $age,
        'taille' => $taille,
        'prix' => $prix,
        'idCategorie' => $idcategorie,
        'note' => $note,
        'description' => $faker->randomElement($descriptions),         'nbJoueur' => $nbJoueur
    ];
    
}

// Exemple d'appel à la fonction




function adresse($nbAdresse){
    $faker = Factory::create('fr_FR');
    $Adresse=[];
    $tabAdresse=[];
        $tabInsert=[];

for($i=0;$i<$nbAdresse;$i++){
    $Adresse = [
        'rue' => $faker->streetName,
        'ville' => $faker->city,
        'codePostal' => $faker->postcode,
        'pays' => 'France'
    ];
    $tabAdresse[] = $Adresse;
}

foreach($tabAdresse as $adresse){
    $insert = 'INSERT INTO Adresse 
    (rue, ville, codePostal, pays) VALUES ('.
    "'".$adresse['rue']."'," .
    "'".$adresse['ville']."'," .
    $adresse['codePostal']."," .
    "'".$adresse['pays']."'" .
')';

    $tabInsert[] = $insert;
}
return $tabInsert;
}
//Insertion des catégories
//tout en minuscule
function getInitials($phrase) {
    $mots = explode(' ', $phrase); // Séparer les mots par espace
    $initiales = '';

    foreach ($mots as $mot) {
        $initiales .= mb_substr(mb_strtolower($mot, 'UTF-8'), 0, 1, 'UTF-8'); // Récupérer la première lettre de chaque mot
    }

    return $initiales;
}

function categorie($tabCategorie, $tabProduits) {
    $tabInsert = []; // Initialiser un tableau pour stocker toutes les requêtes
    $cpt = 1;
    $cpt2 = 0;
    $cpt3 = 0;
    $cptproduit = 1;

    foreach ($tabCategorie as $categorie => $sousCategorie) {
        $valCategorie = mb_substr(mb_strtolower($categorie, 'UTF-8'), 0, 3, 'UTF-8');
        $insert = "INSERT INTO Categorie (nomCategorie, valCategorie) VALUES ('$categorie', '$valCategorie');";
        $tabInsert[] = $insert; // Ajouter au tableau
        
        foreach ($sousCategorie as $sousCat => $sousCat2) {
            if (is_array($sousCat2)) {
                $cpt2 = $cpt;
                $cpt3 = $cpt;

                foreach ($sousCat2 as $sousCat3) {
                    $cpt2++;
                    $cpt3++;
                    $valSousCategorie = mb_substr(mb_strtolower($sousCat3, 'UTF-8'), 0, 3, 'UTF-8');
                    $valSousCategorie = str_replace(' ', '', $valSousCategorie);

                    $insert = "INSERT INTO Categorie 
                    (nomCategorie, valCategorie) 
                    VALUES ('$sousCat3', '$valSousCategorie');";
                    $tabInsert[] = $insert;

                    $tab = produit($tabProduits, $cpt3, $sousCat3, $cptproduit);
                    $cptproduit = $tab[1];
                    $tabInsert = array_merge($tabInsert, $tab[0]);

                    $insert = "INSERT INTO SousCategorie
                    (idCategorie, idSousCategorie) VALUES 
                    ('$cpt', '$cpt2');";
                    $tabInsert[] = $insert;
                }

                $cpt = $cpt2 - 1;
            } else {
                $valSousCategorie = getInitials($sousCat2);
                $valSousCategorie = str_replace(' ', '', $valSousCategorie);

                if (strlen($valSousCategorie) < 3) {
                    $valSousCategorie = mb_substr($sousCat2, 0, 3, 'UTF-8');
                }

                $cpt++;
                $insert = "INSERT INTO Categorie (nomCategorie, valCategorie) VALUES ('$sousCat2', '$valSousCategorie');";
                $tabInsert[] = $insert;

                $tab = produit($tabProduits, $cpt, $sousCat2, $cptproduit);
                $cptproduit = $tab[1];

                $tabInsert = array_merge($tabInsert, $tab[0]);
            }
        }

        $cpt++;
    }

    // Afficher toutes les requêtes pour vérification

    return $tabInsert;
}



//Insertion des produits

function produit ($tabProduit,$idcategorie,$nomCategorie,$compter){
    $cpt = $compter;
    $insert = '';
    $insert2 = '';
    $tab2[] = [];
    foreach($tabProduit as $categorie => $produits){
        if($categorie == $nomCategorie){
            foreach($produits as $produit){
                $donneeDroduit =detailproduit($produit,$categorie,$idcategorie);
                $insert = "INSERT INTO Produit 
                (nomProduit,age,taille,prix,idCategorie,
                noteGlobale,description,nbJoueurMax) 
                VALUES ('".$donneeDroduit['nom']."','".$donneeDroduit['age']."'
                ,'".$donneeDroduit['taille']."','".$donneeDroduit['prix']."',
                '".$donneeDroduit['idCategorie']."','".$donneeDroduit['note']."',
                '".$donneeDroduit['description']."','".$donneeDroduit['nbJoueur']."')";

                $tab []= $insert;
                $cpt++;
            }
        }
    }
    $tab2 [1]= $cpt;

    
    $tab2 [0]=array_merge($tab2[0],$tab);
    return $tab2;
}



//categorie($tabCategorie,$tabProduit);

//insertion des avis

//insertion des commandes
function commande($nbClient,$nbCommande){
    $faker = Factory::create('fr_FR');
    $tabInsert=[];
    
    $n =range(1, $nbClient);
    while(count($n) < $nbCommande){
        if(count($n) < $nbCommande){
            $n = array_merge($n,range(1, $nbClient));
        }
    }
    $tabUseProduit = [];
    shuffle($n);
    for ($i = 1; $i < $nbCommande; $i++){
        $idClient =$n[$i];
        $dateCommande = $faker->date('Y-m-d', 'now'); // Génère une date au format 'Y-m-d'
        $idAdresse = $n[$i];
        $typeLivraison = $faker->randomElement($array = array ('Livraison à domicile','Point relais','Retrait en magasin'));
        $insert = " INSERT INTO Commande 
        (idClient,dateCommande,idAdresse,typeLivraison) 
        VALUES ('$idClient','$dateCommande','$idAdresse','$typeLivraison')";
        $tabInsert[] = $insert;
for ($j = 0; $j < random_int(6, 7); $j++) {
    $idProduit = random_int(1, 70);
    $quantite = random_int(1, 5);
    
    // Créer une clé unique basée sur idCommande et idProduit
    $pk = $i . '-' . $idProduit;

    // Vérifier si cette combinaison (idCommande, idProduit) est déjà utilisée
    if (!in_array($pk, $tabUseProduit)) {
        // Si la combinaison n'est pas utilisée, ajouter et préparer l'insertion
        $tabUseProduit[] = $pk;
        $insert = "INSERT INTO Composer (idCommande, idProduit, quantite) 
        VALUES ('$i', '$idProduit', '$quantite')";
        $tabInsert[] = $insert;
    }
}


    }
    return $tabInsert;
}


//insertion des carte bancaire

function insertCB($nbC){
    $faker = Factory::create('fr_FR');
    $tabInsert=[];
    $cpt = 1;
    $n =range(1, $nbC);
    $uniqueNumbers = [];
    while (count($uniqueNumbers) <= $nbC) {
        $generatedNumber = $faker->creditCardNumber;
        if (!in_array($generatedNumber, $uniqueNumbers)) {
            $uniqueNumbers[] = $generatedNumber;
        }
    }
    
    shuffle($n);
    for ($i = 0; $i < $nbC; $i++){
        $idClient =$n[$i];
        $numeroCarte = $uniqueNumbers[$i];
        $numeroCarte = $faker->creditCardNumber;
        $dateExpiration = $faker->creditCardExpirationDate->format('Y-m-d'); // Format YYYY-MM-DD

        $cryptogramme = str_pad(mt_rand(0, 999), 3, '0', STR_PAD_LEFT);;
        $insert = "INSERT INTO CarteBancaire (idClient,numCarte,dateExpiration,codeCarte) VALUES 
        ('$idClient','$numeroCarte','$dateExpiration','$cryptogramme')";
        $tabInsert[] = $insert;
        

    }
    return $tabInsert;
}


//insertion des produit favoris

//insertion des quantité

function quantité(){
    $tabInsert=[];
    for($i=1;$i<71;$i++){
        $quantite = random_int(40, 50);
        $insert = "INSERT INTO Stock (idProduit,quantiteStock) 
        VALUES ('$i','$quantite')";
        $tabInsert[] = $insert;
    }
    return $tabInsert;
}

//insertion des avis
function avisetProduitF($nbProduit,$nbClient){
    $faker = Factory::create('fr_FR');
    $cpt = 1;
    $tabInsert=[];
    $n =range(1, $nbClient);
    while(count($n) < $nbProduit){
        if(count($n) < $nbProduit){
            $n = array_merge($n,range(1, $nbClient));
        }
    }
    shuffle($n);
    for ($i = 1; $i < $nbProduit; $i++){
        $idClient =$n[$i];
        $idProduit = $i;
        $note = random_decimal(2, 5, 1); 
        $dateAvis = $faker->date('Y-m-d', 'now');// Génère une date au format 'Y-m-d'
        $commentaire = $faker->randomElement($array = array 
        ('Super produit','Je recommande','Très bon rapport qualité/prix','Je suis satisfait','les enfants adorent',
        'Je recommande pas','envoi rapide','produit conforme à la description'));

        $insert = "INSERT INTO Avis (idClient,idProduit,dateAvis,note,contenu)
         VALUES ('$idClient','$idProduit','$dateAvis','$note','$commentaire')";
        $tabInsert[] = $insert;
        for($j=0;$j<random_int(0, 1);$j++){
            $insert = "INSERT INTO Produit_Favoris (idClient,idProduit)
             VALUES ('$idClient','$idProduit')";
            $tabInsert[] = $insert;
        }
    }
    return $tabInsert;
}




/*
//demarrer tout les programme
$nbClient = 50;
/$tabInsert = array_merge($tabInsert,adresse($nbClient));
$tabInsert = array_merge($tabInsert,client($nbClient));
$tabInsert = array_merge($tabInsert,categorie($tabCategorie,$tabProduit));
$tabInsert = array_merge($tabInsert,commande($nbClient,110,$conn));
$tabInsert = array_merge($tabInsert,avisetProduitF(70,$nbClient));
$tabInsert = array_merge($tabInsert,insertCB($nbClient));
$tabInsert = array_merge($tabInsert,quantité());
$tabInsert = array_merge($tabInsert,regroupement(30));
//compter le nombre de requete
$d=0;
print_r(count($tabInsert));
//insere les requete dans la base de donnée avec les messages d'erreur
$creetable ="-- Suppression des tables existantes
DROP TABLE IF EXISTS Produit_Favoris;
DROP TABLE IF EXISTS Avis;
DROP TABLE IF EXISTS Panier_Client;
DROP TABLE IF EXISTS Composer;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS CarteBancaire;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS SousCategorie;
DROP TABLE IF EXISTS Categorie;
DROP TABLE IF EXISTS Adresse;


-- Création des tables
CREATE TABLE Adresse (
    idAdresse INT AUTO_INCREMENT,
    codePostal CHAR(5),
    ville VARCHAR(100),
    rue VARCHAR(255),
    pays VARCHAR(50),
    CONSTRAINT pk_Adresse PRIMARY KEY (idAdresse)
);

CREATE TABLE Categorie (
    idCategorie INT AUTO_INCREMENT,
    nomCategorie VARCHAR(100),
    valCategorie VARCHAR(100),
    CONSTRAINT pk_Categorie PRIMARY KEY (idCategorie)
);

CREATE TABLE SousCategorie (
    idCategorie INT,
    idSousCategorie INT,
    CONSTRAINT fk_Categorie FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie),
    CONSTRAINT fk_SousCategorie FOREIGN KEY (idSousCategorie) REFERENCES Categorie(idCategorie),
    CONSTRAINT pk_SousCategorie PRIMARY KEY (idCategorie, idSousCategorie)
);

CREATE TABLE Client (
    idClient INT AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(50),
    nom VARCHAR(100),
    prenom VARCHAR(100),
    numTel CHAR(10),
    genreC CHAR(1) CHECK (genreC IN ('H', 'F')),
    dateNaissance DATE,
    idAdresse INT,
    CONSTRAINT pk_Client PRIMARY KEY (idClient),
    CONSTRAINT fk_Client_Adresse FOREIGN KEY (idAdresse) REFERENCES Adresse(idAdresse)
);

CREATE TABLE Produit (
    idProduit INT AUTO_INCREMENT,
    age INT,
    taille VARCHAR(10),
    nbJoueurMax INT,
    description TEXT,
    prix DECIMAL(10,2),
    nomProduit VARCHAR(255),
    noteGlobale DECIMAL(3,2),
    idCategorie INT,
    CONSTRAINT pk_Produit PRIMARY KEY (idProduit),
    CONSTRAINT fk_Produit_Categorie FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie)
);

CREATE TABLE Commande (
    idCommande INT AUTO_INCREMENT,
    typeLivraison VARCHAR(50),
    dateCommande DATE,
    idClient INT,
    idAdresse INT,
    CONSTRAINT pk_Commande PRIMARY KEY (idCommande),
    CONSTRAINT fk_Commande_Client FOREIGN KEY (idClient) REFERENCES Client(idClient),
    CONSTRAINT fk_Commande_Adresse FOREIGN KEY (idAdresse) REFERENCES Adresse(idAdresse)
);

CREATE TABLE CarteBancaire (
    numCarte CHAR(16),
    dateExpiration DATE,
    codeCarte CHAR(3) NOT NULL,
    idClient INT,
    CONSTRAINT pk_CarteBancaire PRIMARY KEY (numCarte),
    CONSTRAINT fk_CarteBancaire_Client FOREIGN KEY (idClient) REFERENCES Client(idClient)
);

CREATE TABLE Stock (
    idProduit INT,
    quantiteStock INT,
    CONSTRAINT pk_Stock PRIMARY KEY (idProduit),
    CONSTRAINT fk_Stock_Produit FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
);

CREATE TABLE Composer (
    idCommande INT,
    idProduit INT,
    quantite INT,
    CONSTRAINT pk_Composer PRIMARY KEY (idCommande, idProduit),
    CONSTRAINT fk_Composer_Commande FOREIGN KEY (idCommande) REFERENCES Commande(idCommande),
    CONSTRAINT fk_Composer_Produit FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
);

CREATE TABLE Panier_Client (
    idProduit INT,
    idClient INT,
    CONSTRAINT pk_Panier_Client PRIMARY KEY (idProduit, idClient),
    CONSTRAINT fk_Panier_Client_Produit FOREIGN KEY (idProduit) REFERENCES Produit(idProduit),
    CONSTRAINT fk_Panier_Client_Client FOREIGN KEY (idClient) REFERENCES Client(idClient)
);

CREATE TABLE Avis (
    idProduit INT,
    idClient INT,
    contenu TEXT,
    note INT,
    dateAvis DATE,
    CONSTRAINT pk_Avis PRIMARY KEY (idProduit, idClient),
    CONSTRAINT fk_Avis_Produit FOREIGN KEY (idProduit) REFERENCES Produit(idProduit),
    CONSTRAINT fk_Avis_Client FOREIGN KEY (idClient) REFERENCES Client(idClient),
    CONSTRAINT chk_Note CHECK (note BETWEEN 1 AND 5)
);

CREATE TABLE Produit_Favoris (
    idProduit INT,
    idClient INT,
    CONSTRAINT pk_Produit_Favoris PRIMARY KEY (idProduit, idClient),
    CONSTRAINT fk_Produit_Favoris_Produit FOREIGN KEY (idProduit) REFERENCES Produit(idProduit),
    CONSTRAINT fk_Produit_Favoris_Client FOREIGN KEY (idClient) REFERENCES Client(idClient)
);
";
/*
$conn->exec($creetable);
foreach($tabInsert as $insert){
    $d++;
    
    try{
        
    $conn->exec($insert);
    print_r($d);
    echo') ';
    echo "Insertion réussie: $d <br>";
    echo'<br>';
}catch(PDOException $e){
    print_r($insert);
    echo'<br>';
    
    echo "Erreur: ".$e->getMessage()."<br>";
}
}

*/

$tabinsert []= 
['categorie'=> 'SELECT COUNT(*) FROM Categorie',
 'adresse'=> 'SELECT COUNT(*) FROM Adresse',
 'client'=> 'SELECT COUNT(*) FROM Client',
 'produit'=> 'SELECT COUNT(*) FROM Produit', 
 'commande'=> 'SELECT COUNT(*) FROM Commande',
  'carte bancaire'=> 'SELECT COUNT(*) FROM CarteBancaire', 
  'stock'=> 'SELECT COUNT(*) FROM Stock',
   'composer'=> 'SELECT COUNT(*) FROM Composer', 
   'avis'=> 'SELECT COUNT(*) FROM Avis',
    'produit favoris'=> 'SELECT COUNT(*) FROM Produit_Favoris',
    'regroupement'=> 'SELECT COUNT(*) FROM Regroupement'
    ,'sous categorie'=> 'SELECT COUNT(*) FROM SousCategorie',
    'produit regroupement'=> 'SELECT COUNT(*) FROM Produit_Regroupement'
    ];
$total = 0;
foreach($tabinsert as $insert){
    foreach($insert as $key => $value){
        
        $stmt = $conn->prepare($value);
        $stmt->execute();
        $result = $stmt->fetch();
        $total += $result[0];
        echo $key.' : '.$result[0].'<br>';
    }
} 
echo 'Total : '.$total;