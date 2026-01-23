<?php

/**
 * Gestion de l'affichage du formulaire de contact
 *
 * PHP Version 7
 *
 * @category  B35
 * @package   ChocolateIn B3
 * @author    Tiphaine ACCARY-BARBIER <tiphaine.accary-barbier@ac-lyon.fr> 
 * @copyright 2020 José GIL
 * @license   José GIL
 * @version   GIT: <0>
 * @link      Contexte « Chocolate'In »
 */
$action = filter_input(INPUT_GET, 'action', FILTER_UNSAFE_RAW);
$personne = filter_input(INPUT_POST, 'ident', FILTER_UNSAFE_RAW);
$statut = filter_input(INPUT_POST, 'statut', FILTER_UNSAFE_RAW);
$mail = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
$tel = filter_input(INPUT_POST, 'tel', FILTER_UNSAFE_RAW);
$ville = filter_input(INPUT_POST, 'ville', FILTER_UNSAFE_RAW);
$site = filter_input(INPUT_POST, 'site', FILTER_SANITIZE_URL);
$message = filter_input(INPUT_POST, 'msg', FILTER_UNSAFE_RAW);
//$message = $_POST['msg'];
if (!empty($action) && $action === "envoiContact") {
    $envoiReussi = $pdo->setLeContact($personne, $statut, $mail, $tel, $ville, $site, $message);
}
include 'vues/v_contact.php';
