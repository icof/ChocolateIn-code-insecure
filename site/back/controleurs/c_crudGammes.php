<?php
    if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
        $racine = "..";
    }
    
    include_once("$racine/modele/bd.gamme.inc.php");

    // recuperation des donnees GET, POST, et SESSION
    if(isLoggedOn()){
        if(isset($_POST['add'])){
            $id = htmlentities($_POST['id']);
            $libelle = htmlentities($_POST['libelle']);
            $picto = htmlentities($_POST['picto']);	

            $resultat = ajoutGamme($id, $libelle, $picto);
            
            if($resultat){
                $_SESSION["success"] = 'Gamme ajouté';
            }
            else{
                $_SESSION["error"] = 'Problème lors de l\'ajout de la gamme';
            }
        }

        if(isset($_POST['edit'])){
            $id = htmlentities($_POST['id']);
            $libelle = htmlentities($_POST['libelle']);
            $picto = htmlentities($_POST['picto']);	

            $resultat = editGamme($id, $libelle, $picto);

            if($resultat){
                $_SESSION['success'] = 'Gamme modifié';
            }		
            else{
                $_SESSION['error'] = 'Problème lors de la modification de la gamme';
            }
        }

        if(isset($_POST['supr'])){
            $id = htmlentities($_POST['id']);
            $resultat = supprGamme($id);

            if($resultat){
                $_SESSION['success'] = 'Gamme supprimé';
            }		
            else{
                $_SESSION['error'] = 'Problème lors de la suppression de la gamme';
            }
        }

        // appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
        $gammes = getGammes();
        // traitement si necessaire des donnees recuperees

        // appel du script de vue qui permet de gerer l'affichage des donnees
        $title = "Gestion des gammes de produit";
        include "$racine/vues/entete.html.php";
        include "$racine/vues/v_crudGammes.php";
        include "$racine/vues/pied.html.php";
    }else{
        header("Location: index.php");
    }

?>