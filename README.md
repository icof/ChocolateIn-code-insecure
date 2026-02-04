# ChocolateIn correction de code post-pentest
Dépot de code de l'application présentant des vulnérabilités identifiées lors du pentest.
> **Note :** Dernière MAJ 02/2026

## Configuration du site sur un serveur
Ce projet nécessite les éléments suivants :
- Un serveur web Apache
- Un serveur SGBD MySQL

### CAS 1 : Utilisation avec des conteneurs (Apache/MySQL/PhpMyAdmin) à l'intérieur d'un CodeSpace
1. Ouvrez un CodeSpace depuis votre dépot sur Github. Vous arrivez sur un vscode en ligne, il est possible de l'ouvrir également depuis un vscode bureau qui est alors connecté à vore codespace (espace dans le cloud)
2. Ouvrez le terminal dans votre vscode du CodeSpace et saisissez la commande `docker compose up -d` pour démarrer les trois conteneurs. Le script de construction (docker-compose.yml) crée automatiquement la base de données et les utilisateurs nécessaires.
3. Adaptez la valeur du serveur MySQL auquel on effectue la connexion dans la variable `$_ENV["host"]` des fichiers `site/back/modele/bd.inc.php` et `site/front/modele/class.pdochoc.inc.php` en utilisant la valeur 'db' (nom du conteneur MySQL démarré dans le codespace).
4. Installez l'extension Docker (https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)dans le vscode de votre CodeSpace pour visualiser les états des 3 conteneurs et facilement les démarrer/éteindre/ouvrir dans le navigateur. Depuis l'extension Docker, faites un clic droit sur les conteneurs php:8.1 et phpmyadmin pour les ouvrir dans des onglets du navigateur.
> **Attention :** Lorsque vous travaillez dans le codespace, vos modifications sont enregistrées dans celui-ci. Lorsqu'il sera détruit (par votre action ou parce qu'il n'a pas servi depuis longtemps) toutes ces modifications seront perdues. Il faut donc régulièrement faire des commits (enregistrement des versions) et surtout des push pour pousser vos commits sur le dépôt GitHub (ainsi n ne perd plus rien).

> **Info relative aux modifications dans la BDD :** La BDD est générée lors de la création des conteneurs. Ses fichiers sont mappés avec le dossier `database/db_data` qui n'est intégré dans le dépot (il est défini dans le .gitignore). Cela implique là-aussi que les modif apportées à la BDD dans le codespace disparaitront à sa destruction. Pour les conserver (si elles sont utiles), il est conseillé de scripter chaque évolution dans un fichier .sql ou de mettre à jour le fichier d'initialisation de la base de données à partir d'u dump de votre BDD.

### CAS 2 : Utilisation avec un serveur LAMP local (Wamp, Uwamp, Laragon, ...)

#### Installation de Git en local
1. **Télécharger Git :**
   Rendez-vous sur le site officiel de Git : https://git-scm.com/ et téléchargez la version correspondant à votre système d'exploitation (Windows, macOS, Linux) 
2. **Installez Git :**
    Installez-le en suivant les instructions de l'assistant d'installation (vous pouvez laisser les options par défaut).
3. **Vérifier l'installation :**
   Ouvrez un terminal (ou l'invite de commandes sur Windows) et tapez :
   ```sh
   git --version
4. **Configurer votre nom d'utilisateur et votre adresse e-mail :**
   Dans le terminal de VSCode, tapez les commandes suivantes (avec les valeurs correspondant à votre compte github)
   ```sh
   git config --global user.name "Votre Nom"
   git config --global user.email "votre.email@example.com"

#### Clonage du dépot
   Depuis VSCode, clonez votre dépot Github dans le dossier web de votre LAMP (classiquement `html` ou `www`). 

#### Adaptation de la configuration d'accès à la BDD pour le site retrogame'in
1. Importez le script `database/bddchocsq3.sql` dans votre SGBD MySQL local. Ce script crée la base de données, l'utilisateur qui sera utilisé par le driver du site web, les tables et importe les données nécessaires.
2. Dans VSCode : 
  1. Adaptez la valeur du nom du serveur hôte pour la connexion au serveur MySQL local dans les fichiers `site/back/modele/bd.inc.php` et `site/front/modele/class.pdochoc.inc.php`. Sur un serveur local, elle est classiquement à "localhost".


## Préparation de l'environnement de dev : Installation des extensions recommandées pour ce dépôt

Pour faciliter le développement et la maintenance de ce projet, nous recommandons l'installation de certaines extensions dans Visual Studio Code. Ces extensions incluent :

- **PHP Intelephense** (`bmewburn.vscode-intelephense-client`) : Fournit des fonctionnalités avancées pour le développement PHP, telles que l'autocomplétion, la vérification de syntaxe, et la navigation dans le code.
- **MySQL** (`cweijan.vscode-mysql-client2`) : Permet de gérer et d'interagir avec vos bases de données MySQL directement depuis VSCode.
- **Docker** (`ms-azuretools.vscode-docker`) : Facilite la gestion des conteneurs Docker, vous permettant de construire, gérer et déboguer vos conteneurs directement depuis l'éditeur.
- **PHP Debug** (`felixfbecker.php-debug`) : Offre des capacités de débogage pour les scripts PHP, vous permettant de définir des points d'arrêt, de surveiller les variables, et de suivre l'exécution du code.
- **CodeMetrics** (`kisstkondoros.vscode-codemetrics`) : Fournit des métriques de complexité du code pour vous aider à identifier les zones du code qui pourraient nécessiter une refactorisation.
- **Prettier** (`esbenp.prettier-vscode`) : Un formateur de code qui assure une mise en forme cohérente de votre code.
- **PHP DocBlocker** (`neilbrayfield.php-docblocker`) : Aide à générer des blocs de documentation PHPDoc pour vos fonctions et classes.
- **SonarLint** (`SonarSource.sonarlint-vscode`) : Analyse statique du code pour détecter les erreurs et les mauvaises pratiques.
- **Git History** (`donjayamanne.githistory`) : Permet de visualiser et de naviguer dans l'historique des commits Git.

Pour installer les extensions recommandées, allez dans le menu "Extensions" de VSCode, tapez `@recommended` dans la barre de recherche, et cliquez sur le symbole de téléchargement (nuage avec flèche) à côté des extensions listées. Ces outils vous aideront à écrire du code plus efficacement, à déboguer plus facilement, et à gérer vos conteneurs Docker directement depuis l'éditeur.

## Notes importantes
Pour toute assistance supplémentaire, consultez la documentation appropriée pour votre environnement LAMP local ou pour l'utilisation de CodeSpaces https://docs.github.com/fr/codespaces.
