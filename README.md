# ChocolateIn correction de code post-pentest
Dépot de code de l'application présentant des vulnérabilités identifiées lors du pentest.
> **Note :** Dernière MAJ 11/2024 

## Configuration du site sur un serveur
Ce projet nécessite les éléments suivants :
- Un serveur web Apache
- Un serveur SGBD MySQL

### CAS 1 : Utilisation avec un serveur LAMP local (Wamp, Uwamp, Laragon, ...)
1. Copiez le contenu du dossier `site` sous votre repertoire web dans /retrogaming
2. Importez le script `database/bddchocsq3.sql` dans votre SGBD MySQL local. Ce script crée la base de données, l'utilisateur du driver, les tables et importe les données nécessaires.
2. Adaptez la valeur du serveur MySQL auquel on effectue la connexion dans la variable `$_ENV["host"]` du fichier `site/infosConnexionBDD.inc.php`. Sur un serveur local, elle est classiquement à "localhost".
2. Adaptez la valeur du port d'écoute de votre serveur MySQL dans la variable `$_ENV["port"]` du fichier `site/infosConnexionBDD.inc.php`.
3. Adaptez la valeur de la base de données utilisée sur votre serveur MySQL dans la variable `$_ENV["dbname"]` du fichier `site/infosConnexionBDD.inc.php`.

### CAS 2 : Utilisation avec des conteneurs (Apache/MySQL/PhpMyAdmin) à l'intérieur d'un CodeSpace
1. Ouvrez un CodeSpace depuis votre dépot sur Github. Vous arrivez sur un vscode en ligne, il est possible de l'ouvrir également depuis un vscode bureau qui est alors connecté à vore codespace (espace dans le cloud)
2. Ouvrez le terminal dans votre vscode du CodeSpace et saisissez la commande `docker compose up -d` pour démarrer les trois conteneurs. Le script de construction (docker-compose.yml) crée automatiquement la base de données et les utilisateurs nécessaires.
3. Adaptez la valeur du serveur MySQL auquel on effectue la connexion dans la variable `$_ENV["host"]` du fichier `site/infosConnexionBDD.inc.php` en utilisant la valeur 'db' (nom du conteneur MySQL démarré dans le codespace).
4. Installez l'extension Docker (https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)dans le vscode de votre CodeSpace pour visualiser les états des 3 conteneurs et facilement les démarrer/éteindre/ouvrir dans le navigateur. Depuis l'extension Docker, faites un clic droit sur les conteneurs php:8.1 et phpmyadmin pour les ouvrir dans des onglets du navigateur.
> **Attention :** Lorsque vous travaillez dans le codespace, vos modifications sont enregistrées dans celui-ci. Lorsqu'il sera détruit (par votre action ou parce qu'il n'a pas servi depuis longtemps) toutes ces modifications seront perdues. Il faut donc régulièrement faire des commits (enregistrement des versions) et surtout des push pour pousser vos commits sur le dépôt GitHub (ainsi on ne perd plus rien).

> **Info relative aux modifications dans la BDD :** La BDD est générée lors de la création des conteneurs. Ses fichiers sont mappés avec le dossier `database/db_data` qui n'est intégré dans le dépot (il est défini dans le .gitignore). Cela implique là-aussi que les modif apportées à la BDD dans le codespace disparaitront à sa destruction. Pour les conserver (si elles sont utiles), il est conseillé de scripter chaque évolution dans un fichier .sql ou de mettre à jour le fichier d'initialisation de la base de données.

## Notes importantes
Pour toute assistance supplémentaire, consultez la documentation appropriée pour votre environnement LAMP local ou pour l'utilisation de CodeSpaces https://docs.github.com/fr/codespaces.
