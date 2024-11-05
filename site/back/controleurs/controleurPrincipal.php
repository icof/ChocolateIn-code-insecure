<?php
function controleurPrincipal($action){
    $lesActions = array();
    $lesActions["catalogue"] = "c_catalogue.php";
    
    $lesActions["CRUDGammes"] = "c_crudGammes.php";
    $lesActions["CRUDProduits"] = "c_crudProduits.php";
    $lesActions["CRUDMessages"] = "c_crudMessages.php";
    $lesActions["CRUDActualites"] = "c_crudActualites.php";

    $lesActions["compte"] = "c_compte.php";
    $lesActions["CRUDUtilisateurs"] = "c_crudUtilisateurs.php";
    
    $lesActions["modale"] = "c_modale.php";

    $lesActions["connexion"] = "c_connexion.php";
    $lesActions["deconnexion"] = "c_deconnexion.php";

    $lesActions["defaut"] = "c_connexion.php";
    if (isLoggedOn()){
        $lesActions["defaut"] = "c_catalogue.php";
    }
    
    
    if (array_key_exists ( $action , $lesActions )){
        return $lesActions[$action];
    }
    else{
        return $lesActions["defaut"];
    }

}
?>