<?php
    if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
        $racine = "..";
    }

    include_once("$racine/modele/bd.actualite.inc.php");

    // recuperation des donnees GET, POST, FILES et SESSION
    if(isLoggedOn()){
        if(isset($_POST['add'])){
            $titre = htmlentities($_POST['titre']);
            $contenu = $_POST['contenu'];	
            $datepublication = htmlentities($_POST['datePublication']);	
            $actif = htmlentities($_POST['actif']);	

            $resultat = ajoutActualite($titre, $contenu, $datepublication, $actif);
            
            if($resultat){
                $_SESSION["success"] = 'Actualité ajoutée';
            }
            else{
                $_SESSION["error"] = 'Problème lors de l\'ajout de l\'actualité';
            }
        }

        if(isset($_POST['edit'])){
            $id = htmlentities($_POST['id']);
            $titre = htmlentities($_POST['titre']);
            $contenu = $_POST['contenu'];	
            $datepublication = htmlentities($_POST['datePublication']);	
            $actif = htmlentities($_POST['actif']);	
	

            $resultat = editActualite($id, $titre, $contenu, $datepublication, $actif);

            if($resultat){
                $_SESSION['success'] = 'Actualité modifié';
            }		
            else{
                $_SESSION['error'] = 'Problème lors de la modification de l\'actualité';
            }
        }

        if(isset($_POST['supr'])){
            $id = htmlentities($_POST['id']);
            $resultat = supprActualite($id);

            if($resultat){
                $_SESSION['success'] = 'Actualité suprimée';
            }		
            else{
                $_SESSION['error'] = 'Problème lors de la suppression de l\'actualité';
            }
        }


        // appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
        $actualites = getActualites();
        // traitement si necessaire des donnees recuperees

        // appel du script de vue qui permet de gerer l'affichage des donnees
        $title = "Gestion des actualités";
        include "$racine/vues/entete.html.php";
        include "$racine/vues/v_crudActualites.php";
        include "$racine/vues/pied.html.php";
    }else{
        header("Location: index.php");
    }

?>