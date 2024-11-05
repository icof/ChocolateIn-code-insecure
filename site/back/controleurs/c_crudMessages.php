<?php
    if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
        $racine = "..";
    }

    include_once("$racine/modele/bd.message.inc.php");

    // recuperation des donnees GET, POST, FILES et SESSION
    if(isLoggedOn()){
     

        /*if(isset($_POST['reply'])){
            $id = htmlentities($_POST['id']);
            $objet = htmlentities($_POST['objet']);
            $contenu = $_POST['contenu'];	
            $mail = htmlentities($_POST['mail']);	
	

            $resultat = repondreMessage($id, $mail, $objet, $contenu);

            if($resultat){
                $_SESSION['success'] = 'Réponse à la demande de contact envoyée';
            }		
            else{
                $_SESSION['error'] = 'Problème lors de l\'envoi de la réponse à la demande de contact';
            }
        }*/

        
        if(isset($_POST['done'])){
            $id = htmlentities($_POST['id']);
            $commentaire = $_POST['commentaire'];
            $resultat = traiterMessage($id, $commentaire);

            if($resultat){
                $_SESSION['success'] = 'Demande de contact marquée comme traitée';
            }		
            else{
                $_SESSION['error'] = 'Problème lors du traitement de la demande de contact';
            }
        }

        if(isset($_POST['supr'])){
            $id = htmlentities($_POST['id']);
            $resultat = supprMessage($id);

            if($resultat){
                $_SESSION['success'] = 'Demande de contact suprimée';
            }		
            else{
                $_SESSION['error'] = 'Problème lors de la suppression de la demande de contact';
            }
        }


        // appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
        $messages = getMessages();
        // traitement si necessaire des donnees recuperees

        // appel du script de vue qui permet de gerer l'affichage des donnees
        $title = "Gestion des demandes de contacts";
        include "$racine/vues/entete.html.php";
        include "$racine/vues/v_crudMessages.php";
        include "$racine/vues/pied.html.php";
    }else{
        header("Location: index.php");
    }

?>