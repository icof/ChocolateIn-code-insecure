<?php

function connexionPDO() {
    $login = "userchoc";
	$mdp = "p@ssCh0c";
	$bd = "bddchocsq3";
	$serveur = "db"; // 10.0.0.4

    try {
        $conn = new PDO("mysql:host=$serveur;dbname=$bd", $login, $mdp, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\'')); 
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch (PDOException $e) {
        print "Erreur de connexion PDO ";
        die();
    }
}

?>
