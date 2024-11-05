Mode opératoire pour installer les deux applications web dans votre serveur de développement local :

Installer les 2 applications web :
-	Copier le code des 2 sites html et site2 sur votre serveur 
-	Importez le script bddchocsq3.sql dans votre serveur mariabd ou mysql

PVérifier le parametrage des 2 applications web (si ce n'est pas déjà fait): 
- Vérifier les fichiers de configuration des drivers d’accès à votre base locale (host= 'localhost', dbname = 'bddchocsq3', user = 'userchoc' et mdp = 'p@ssCh0c') :
    - Dans front/modele/class.pdochoc.inc.php
    - Dans back/modele bd.inc.php
- Vérifier la valeur du paramètre $urlBack dans html/index.php vers $urlBack = "../back"
