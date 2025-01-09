# SAÉ 3.01 2023-2024

[comment]: <> (/!\ A MODIFIER !!!)
[comment]: <> (:baseURL: https://github.com/IUT-Blagnac/sae3-01-template)

[comment]: <> (TIP: Pensez à mettre à jour les infos dans ce fichier pour que les badges pointent sur les résultats effectifs de vos intégrations continue ou sur la bonne licence logicielle.)

**Ce dépôt présente le projet à développer dans le cadre de la SAÉ 3.01 du BUT2 Informatique de l'IUT de Blagnac.**

[![Quality Gate Status](https://sonarqube.endide.com/api/project_badges/measure?project=saerecherche&metric=alert_status&token=sqb_42450a8aee8dd783bac82122f9c36dd4b062a832)](https://sonarqube.endide.com/dashboard?id=saerecherche)

## Table de matière
- [Équipe](#équipe)
- [Gestion de projet & qualité](#gestion-de-projet-et-qualité)
- [Contexte général](#contexte-général)
  - [Liens Utiles](#liens-utiles)
- [Réalisations](#réalisations)
  - [Installation de notre application](#installation-de-notre-application)
  - [Aborescence](#aborescence)

## Équipe

L'équipe de ce projet est constitué de 7 personnes. Voici leurs noms, rôles, et répartition du travail :

| Nom du membre de l'équipe | Rôle dans l'équipe | Répartition de travail |
|---------------------------|--------------------|------------------------|
|[Ophélie WINTERHOFF](https://github.com/ophewinx) | Cheffe d'équipe, Développeuse | .% |
|[Zachary IVARS](https://github.com/Traimix05) | Product Owner, Développeur | .% |
|[Yahya MAGAZ](https://github.com/Magaz-Yahya) | SCRUM Master, Développeur | .% |
|[Naila BON](https://github.com/naila-bon) | Développeuse | .% |
|[Adrien FAURÉ](https://github.com/AirbnbEcoPlus) | Développeur | .% | 
|[Esteban GARNIL](https://github.com/estbanGarnil) | Développeur | .% |
|[Mete YALÇIN](https://github.com/MetelsCoding) | Développeur| .% |


Tutrice & tuteur enseignant.e.s de l'équipe : [Cassandre Vey](cassandre.vey@irit.fr) & [Remi Boulle](remi.boulle@univ-tlse2.fr)

## Gestion de projet et Qualité

Chaque sprint (semaine et demi) nous livrons une nouvelle version de notre application (release).
Nous utilisons pour cela les fonctionnalités de GitHub pour les [Releases](https://docs.github.com/en/repositories/releasing-projects-on-github).

- Version courante : [v0.0.1]()
- Lien vers la doc technique : [Documentation Technique](https://github.com/IUT-Blagnac/SAE-ALT-S3-Dev-24-25-DB-Recherche-Equipe-3A02/blob/master/Documentation/Doc%20Technique/Technical_Document.md)
- Lien vers la doc utilisateur : [Documentation Utilisateur](https://github.com/IUT-Blagnac/SAE-ALT-S3-Dev-24-25-DB-Recherche-Equipe-3A02/blob/master/Documentation/Documentation%20Utilisateur/User_Document.md)
- Liste des User Stories avec leurs (ToDo/Ongoing/Done) et % restant :

  | User Story | Lien vers User Story | Étape de réalisation | % restant |
  |------------|----------------------|----------------------|-----------|
  | Visualisation en temps réel de l'état des salles | [US1](https://github.com/orgs/IUT-Blagnac/projects/296/views/1?pane=issue&itemId=93015121&issue=IUT-Blagnac%7CSAE-ALT-S3-Dev-24-25-DB-Recherche-Equipe-3A02%7C2) | ToDo | 100% |
  | Consultation de l'historique de l'état des salles | [US2](https://github.com/orgs/IUT-Blagnac/projects/296/views/1?pane=issue&itemId=93017220&issue=IUT-Blagnac%7CSAE-ALT-S3-Dev-24-25-DB-Recherche-Equipe-3A02%7C3) | ToDo | 100% |
  
- Tests unitaires et plans de [Cahier de tests](https://github.com/IUT-Blagnac/SAE-ALT-S3-Dev-24-25-DB-Recherche-Equipe-3A02/blob/master/Documentation/Cahier%20de%20tests/Test_Book.md)
- Indicateurs de qualité du code (dette technique) :
- ...

## Contexte général

Nous avons été demandé de faire un site web ainsi qu'un API pour le bâtiment de recherche. Ce site web regroupe les informations de différents capteurs (temperature, humidité, si une porte est fermé ou pas, ...) des différents salles de trouvant dans le bâtiment de recherche. Nous devons présenter ces informations de manière explicite et compréhensible, avec un historique, l'utilisation de la carte du bâtiment de recherche, utilisation de graphiques pour démontrer l'évolution sur une lapse de temps, ainsi que d'autres demandes et fonctionnalités.

L'éxistant est constitué de seulement un base de données InfluxDB.

Les contraintes sont :
  - Utilisation d'une base de données InfluxDB
  - Création d'une API supplémentaire permettant de faire des requêtes et du filtrage sur les données
  - Utilisation du langage de programmation `Python` afin de faciliter sa modification ultérieurement


### Liens utiles

- Le [cours Moodle](https://webetud.iut-blagnac.fr/course/view.php?id=841) sur la SAE
- Le dépôt [template](https://github.com/IUT-Blagnac/sae3-01-template) qui sert de base à tous les dépôts étudiants.
- Le lien [classroom](https://classroom.github.com/a/OUF7gxEa) si besoin.
- Le lien [documentation](https://github.com/IUT-Blagnac/SAE-ALT-S3-Dev-24-25-DB-Recherche-Equipe-3A02/tree/master/Documentation)

## Réalisations 

TIP: Mettez ici toutes les informations nécessaire à l'utilisation de votre dépôt (comment on installe votre application, où sont les docs, etc.)

### Installation de notre application

### Aborescence
Les documents se trouverons dans un premier temps un répertoir appelé `Documentation`. Dans ce répertoir `Documentation` vous trouverez : 
- un répertoir `Documentation Techinque` contenant toutes les ressources pour la documentation ainsi que le fichier Markdown pour la documentation technique.
- un répertoir `Documentation Utilisateur` contenant toutes les ressources pour la documentation ainsi que le fichier Markdown pour la documentation utilisateur.
- un répertoir `Cahier de tests` contenant toutes les ressources pour la documentation ainsi que le fichier Markdown pour le cahier de tests.
