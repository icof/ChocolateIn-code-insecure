<?php
$racine = dirname(__FILE__);
include "$racine/controleurs/controleurPrincipal.php";
include_once "$racine/modele/bd.authentification.inc.php";



if (isset($_GET["action"])){
    $action = $_GET["action"];
}
else{
    
    $action = "defaut";
}


$fichier = controleurPrincipal($action);

include "$racine/controleurs/$fichier";


?>