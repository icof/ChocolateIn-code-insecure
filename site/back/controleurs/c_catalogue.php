<?php

if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
    $racine = "..";
}

include_once("$racine/modele/bd.gamme.inc.php");
include_once("$racine/modele/bd.produit.inc.php");

// recuperation des donnees GET, POST, et SESSION
if (isset($_POST['id']) && ($_POST['id'] != "")){
    $idGammeSelected = $_POST['id'];
}
// appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
$lesGammes = getGammes();

// traitement si necessaire des donnees recuperees
if (isset($idGammeSelected)){
    $lesProduits = getProduitsByGame($idGammeSelected);
    $title = "Produits de la gamme ".$idGammeSelected ;
}
else {
    $lesProduits = getProduits();
    $title = "Produits de toutes les gammes";
}


// appel du script de vue qui permet de gerer l'affichage des donnees

include "$racine/vues/entete.html.php";
//include "$racine/vues/v_afficheGammes.php";
include "$racine/vues/v_selecteurGammes.php";
include "$racine/vues/v_listeProduits.php";
include "$racine/vues/pied.html.php";
?>