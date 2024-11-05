<?php

    if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
        $racine = "..";
    }

    include_once("$racine/modele/bd.authentification.inc.php");
    include_once("$racine/modele/bd.utilisateur.inc.php");

    if(isLoggedOn()){

        if(isset($_POST['add'])){
            $pseudo = htmlentities($_POST['pseudo']);
            $email = htmlentities($_POST['email']);
            $role = htmlentities($_POST['role']);
            $mdp = htmlentities($_POST['mdp']);

            $resultat = setUtilisateur($pseudo, $email, $role, $mdp);

            if($resultat){
                $_SESSION["success"] = 'Utilisateur ajouté';
            }
            else{
                $_SESSION["error"] = 'Problème lors de l\'ajout de l\'Utilisateur';
            }
        }

                
        if(isset($_POST['edit'])){
            $pseudo = htmlentities($_POST['pseudo']);
            $email = htmlentities($_POST['email']);
            $role = htmlentities($_POST['role']);
            $id = htmlentities($_POST['id']);

            $resultat = updateUtilisateur($pseudo, $email, $role, $id);

            if($resultat){
                $_SESSION['success'] = 'Utilisateur modifié';
            }		
            else{
                $_SESSION['error'] = 'Problème lors de la modification de l\'Utilisateur';
            }
        }
        
        if(isset($_POST['supr'])){
            $id = htmlentities($_POST['id']);
            
            $resultat = supprUtilisateur($id);

            if($resultat){
                $_SESSION['success'] = 'Utilisateur supprimé';
            }		
            else{
                $_SESSION['error'] = 'Problème lors de la suppression de l\'Utilisateur';
            }
        }

        // recuperation des donnees GET, POST, et SESSION

        // appel des fonctions permettant de recuperer les donnees utiles a l'affichage 


        // traitement si necessaire des donnees recuperees
        $utilisateur = getUtilisateurs();
        $roles = getRoles();
        // appel du script de vue qui permet de gerer l'affichage des donnees
        $title = "Modifier les Utilisateurs";
        include "$racine/vues/entete.html.php";
        include "$racine/vues/v_crudUtilisateurs.php";
        include "$racine/vues/pied.html.php";

    }else{ header("Location: index.php"); }
?>