-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 08 fév. 2022 à 12:34
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bddchocsq3`
--
CREATE DATABASE IF NOT EXISTS `bddchocsq3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'userchoc'@'%' IDENTIFIED BY 'p@ssCh0c';

GRANT ALL PRIVILEGES ON bddchocsq3.* TO 'userchoc'@'%' IDENTIFIED BY 'p@ssCh0c';

USE `bddchocsq3`;

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

DROP TABLE IF EXISTS `actualite`;
CREATE TABLE IF NOT EXISTS `actualite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` text NOT NULL,
  `contenu` text NOT NULL,
  `datepublication` date NOT NULL DEFAULT current_timestamp(),
  `actif` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `actualite`
--

INSERT INTO `actualite` (`id`, `titre`, `contenu`, `datepublication`, `actif`) VALUES
(1, 'C\'est les vacances du Chocolat', '<p>Il fait trop chaud pour les chocolats ! Nous serons ferm&eacute;s du 15 juillet au 15 aout inclus pour vacances d&#39;&eacute;t&eacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"https://voyage-onirique.com/wp-content/uploads/2019/05/WallpaperStudio10-119302-landscape.jpg\" style=\"float:left; height:100px; width:178px\" />Profitez-en pour manger des glaces en attendant de retrouver nos gourmandises &agrave; la rentr&eacute;e.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Suivez-nous sur notre <a href=\"https://www.facebook.com/Chocolate.In.Bordeaux\" target=\"_blank\">page Facebook</a></p>\r\n', '2021-07-01', 1),
(2, 'Les Bonbons &agrave; la cerise et au piment d&rsquo;Espelette &reg; pour f&eacute;ter les beaux jours', '<p><img alt=\"\" src=\"http://192.168.1.48/vues/images/produits/confiseries/piment-espelette_750w.jpg\" style=\"float:left; height:200px; width:355px\" />Faites plaisir aux petits et aux grands avec notre nouveau produit : les Bonbons &agrave; la cerise et au piment d&rsquo;Espelette<strong>.</strong></p>\r\n\r\n<p>Surprenant par ses &eacute;pices et son caract&egrave;re, c&#39;est le fleuron du Pays Basque.</p>\r\n', '2021-06-01', 1),
(3, 'Fermeture exceptionnelle du 30 Aout au 3 Septembre', '<p>Fermeture exceptionnelle de la boutique de Bordeaux du 30 Aout au 3 Septembre pour cause de travaux.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.jardinerie-animalerie-fleuriste.fr/wp-content/uploads/2020/02/Kukka-le-secret-des-fleurs-JAF-info-Fleuriste-7.jpg.webp\" style=\"float:left; height:150px; width:201px\" />Pendant cette p&eacute;riode, vous pouvez toujours passer vos commandes par t&eacute;l&eacute;phone ou en nous contactant sur notre <a href=\"https://www.facebook.com/Chocolate.In.Bordeaux\" target=\"_blank\">page Facebook</a>. Vous pourrez ensuite r&eacute;cup&eacute;rer vos colis chez notre voisin &quot;au Bouquet Japonais&quot; situ&eacute; &agrave; cot&eacute; de notre boutique.</p>', '2021-08-23', 1),
(7, 'Salon du Chocolat de Lyon du 5 au 7 Novembre', '<p><img alt=\"\" src=\"https://lyon.salon-du-chocolat.com/wp-content/uploads/2017/07/logo_retina_lyon.jpg\" style=\"float:left; height:150px; width:245px\" />Chocolate&#39;in sera pr&eacute;sent au salon du Chocolat de Lyon du 5 au 7 Novembre 2021</p>\r\n\r\n<p><strong>Rendez-vous au STAND D340</strong></p>\r\n\r\n<p>Suivez-nous sur notre <a href=\"https://www.facebook.com/Chocolate.In.Bordeaux\" target=\"_blank\">page Facebook</a></p>\r\n', '2021-08-04', 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personne` text DEFAULT NULL,
  `statut` text DEFAULT NULL,
  `mail` text DEFAULT NULL,
  `telephone` text DEFAULT NULL,
  `ville` text DEFAULT NULL,
  `site` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `traite` tinyint(1) NOT NULL DEFAULT 0,
  `datetraitement` datetime DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13575 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `personne`, `statut`, `mail`, `telephone`, `ville`, `site`, `message`, `date`, `traite`, `datetraitement`, `commentaire`) VALUES
(13551, 'Alice Des Lys', 'Particulier', 'gourmand@lyon.fr', '', 'Lyon', '', 'Est-il possible de faire livrer les chocolats sur Lyon ?\r\ncordialement,', '2021-10-26 10:31:21', 1, '2021-10-26 00:00:00', '<p>Bonjour Alice,</p>\r\n\r\n<p>Nous livrons nos chocolats &agrave; l&#39;adresse de votre choix, moyennant des frais de ports qui d&eacute;pendent de la taille de votre commande. Contactez-nous pas t&eacute;l&eacute;phone si vous souhaitez passer une commande.</p>\r\n\r\n<p>Bonne journ&eacute;e,</p>\r\n'),
(13552, 'Bob Marron', 'Comité d&#39;entreprise (CE)', 'chaudlesmarrons@bordeaux.fr', '', 'Bordeaux', '', 'Bonjour,\r\nNous cherchons une chocolaterie qui pourrait proposer des balottins à prix préférentiels pour une commande de groupe avant les fêtes via notre CE.\r\nProposez-vous ce type de service ?\r\nBien cordialement,', '2021-10-26 10:37:15', 0, NULL, NULL),
(13554, 'Jean Neymar', 'Autres', 'troll@internet.fr', '', 'Nice', '', 'Vos chocolats sont dégoutants !', '2021-10-26 10:39:13', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `details_produits`
--

DROP TABLE IF EXISTS `details_produits`;
CREATE TABLE IF NOT EXISTS `details_produits` (
  `idproduit` varchar(25) NOT NULL,
  `num` int(11) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`idproduit`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `details_produits`
--

INSERT INTO `details_produits` (`idproduit`, `num`, `details`) VALUES
('cadeau_convive_cube', 1, 'Dragées de couleur rose et blanc en forme de mini-coeur.'),
('cadeau_convive_cube', 2, 'Ces dragées en forme de coeur sont au chocolat'),
('cadeau_convive_enfant', 1, 'Possibilité de choisir les couleurs de dragées'),
('cadeau_convive_enfant', 2, 'Ou de remplir de toutes autres friandises...'),
('cadeau_convive_sachet', 1, 'Boule de 5 cm'),
('cadeau_convive_sachet', 2, 'Hauteur : 10,5 cm'),
('cadeau_convive_sachet', 3, 'Largeur : 7 cm'),
('choc_o_lait', 1, 'Lait'),
('choc_o_lait', 2, 'Noir'),
('choc_o_lait', 3, 'Noisette'),
('choc_o_lait', 4, 'Café'),
('coffret_27_tablettes', 1, 'noir orange'),
('coffret_27_tablettes', 2, 'noir citron gingembre'),
('coffret_27_tablettes', 3, 'noir 88 % cacao'),
('coffret_27_tablettes', 4, 'lait noisette'),
('coffret_27_tablettes', 5, 'lait spéculos'),
('coffret_27_tablettes', 6, 'lait'),
('coffret_27_tablettes', 7, 'noir amandes'),
('coffret_27_tablettes', 8, 'lait caramel'),
('coffret_27_tablettes', 9, 'noir poivre rose'),
('dragees_amandes_corsees', 1, 'Dragées de la marque Medicis, une marque de qualité'),
('dragees_amandes_corsees', 2, 'Chocolat à 70% de cacao'),
('dragees_amandes_fines', 1, 'Dragées de la marque Medicis, une marque de qualité'),
('dragees_amandes_fines', 2, 'Chocolat à 70% de cacao'),
('dragees_petits_coeurs', 1, 'Dragées de la marque Medicis, une marque de qualité'),
('dragees_petits_coeurs', 2, 'Chocolat à 70% de cacao'),
('dragees_petits_coeurs', 3, 'De nombreuses couleurs disponibles :  bleu galaxie, rose, mauve, fuchsia, prune, dune, safran, orange, gris taupe et vert bambou.'),
('escarpin', 1, 'Excellent cadeau à offrir ou à s\'offrir pour toutes les occasions !'),
('escarpin', 2, 'Anniversaire, Noël ou encore pour la Saint Valentin.'),
('escarpin_chocolat_rose', 1, 'Excellent cadeau à offrir ou à s\'offrir pour toutes les occasions !'),
('escarpin_chocolat_rose', 2, 'Anniversaire, Noël ou encore pour la Saint Valentin.'),
('feuilles_d_automne', 1, 'Feuilles'),
('feuilles_d_automne', 2, 'Fleurs'),
('feuilles_d_automne', 3, 'Champignons'),
('feuilles_d_automne', 4, 'Des colorants naturels uniquement'),
('gateau_de_bonbons', 1, 'Des guimauves'),
('gateau_de_bonbons', 2, 'Des fraises tagadas'),
('gateau_de_bonbons', 3, 'Des oeufs au plat'),
('gateau_de_bonbons', 4, 'Des schtroumpfs'),
('gateau_de_bonbons', 5, 'Des framboises'),
('gateau_de_bonbons', 6, '...'),
('mendiants', 1, 'Tapis moelleux, saveurs croquantes et décor de fruits secs'),
('mendiants', 2, 'Disques de chocolat plein'),
('mendiants', 3, 'Chocolat noir'),
('mendiants', 4, 'Chocolat au lait'),
('outils_chocolat_noir', 1, 'Tournevis'),
('outils_chocolat_noir', 2, 'Marteau'),
('outils_chocolat_noir', 3, 'Scie'),
('outils_chocolat_noir', 4, 'Clef anglaise'),
('outils_chocolat_noir', 5, 'Et pince. '),
('rose_chocolat', 1, 'Excellent cadeau à offrir ou à s\'offrir pour toutes les occasions !'),
('rose_chocolat', 2, 'Anniversaire, Noël ou encore pour la Saint Valentin.'),
('tablettes', 1, 'lait 38 %'),
('tablettes', 2, 'noir 70 %'),
('tablettes', 3, 'lait spéculos'),
('tablettes', 4, 'noir poivre rose'),
('tablettes', 5, 'noir macadamia'),
('tablettes', 6, 'noir orange épice');

-- --------------------------------------------------------

--
-- Structure de la table `gamme`
--

DROP TABLE IF EXISTS `gamme`;
CREATE TABLE IF NOT EXISTS `gamme` (
  `id` varchar(25) NOT NULL,
  `libelle` text NOT NULL,
  `picto` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gamme`
--

INSERT INTO `gamme` (`id`, `libelle`, `picto`) VALUES
('chocolats', 'Chocolats', 'box-open'),
('confiseries', 'Confiseries', 'candy-cane'),
('dragees', 'Dragées et cadeaux invités', 'shopping-bag'),
('idees_cadeaux', 'Idées cadeaux', 'gifts'),
('produits_de_saison', 'Produits de saison', 'calendar-alt');

-- --------------------------------------------------------

--
-- Structure de la table `infolettre`
--

DROP TABLE IF EXISTS `infolettre`;
CREATE TABLE IF NOT EXISTS `infolettre` (
  `id` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` text DEFAULT NULL,
  `confirmation` tinyint(1) DEFAULT NULL,
  `dateconfirmation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `infolettre`
--

INSERT INTO `infolettre` (`id`, `email`, `confirmation`, `dateconfirmation`) VALUES
('2022-02-01 22:37:57', 'test@test.fr', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` varchar(25) NOT NULL,
  `nom` text NOT NULL,
  `description` text DEFAULT NULL,
  `packaging` text NOT NULL,
  `urlimg` text NOT NULL,
  `idgamme` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idgamme` (`idgamme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `description`, `packaging`, `urlimg`, `idgamme`) VALUES
('ballotins', 'Ballotins', 'Ballotins &agrave; composer directement devant les pr&eacute;sentoirs.', 'de 125 g &agrave; 1000 g', './vues/images/produits/chocolats/ballotins', 'chocolats'),
('berlingots', 'Berlingots ', 'Assortiment de différents parfums de berlingots', 'en bonbonnière', './vues/images/produits/confiseries/berlingots', 'confiseries'),
('boite_de_luxe', 'Boite de luxe', 'Boite de luxe', 'de 4 à 49 chocolats', './vues/images/produits/chocolats/luxe', 'chocolats'),
('bonbons_espelette', 'Bonbons à la cerise et au piment d’Espelette', 'Surprenant par ses épices et son caractère, c\'est le fleuron du Pays Basque.', 'en bonbonnière', './vues/images/produits/confiseries/piment-espelette', 'confiseries'),
('bonbons_seve_pin', 'Bonbons à la sève de pin', 'Un bonbon traditionnel à la saveur des montagnes qui désencombre les sinus.', 'en bonbonnière', './vues/images/produits/confiseries/seve-pin', 'confiseries'),
('cadeau_convive_cube', 'Cadeau convive cube', 'Dragées présentées dans un élégant cube de plexiglas.', '120 grammes', './vues/images/produits/dragees/cadeau-convive-cube', 'dragees'),
('cadeau_convive_enfant', 'Cadeau convive en bonbonnière', 'Dragées présentées dans une bonbonnière en verre surplombée d\'un petit garçon ou d\'une petite fille.', '180 grammes', './vues/images/produits/dragees/cadeau-convive-pot', 'dragees'),
('cadeau_convive_sachet', 'Élégant sachet de dragées', 'Dragées dans une boule en plastique présentées dans un élégant sachet.', '90 grammes', './vues/images/produits/dragees/cadeau-convive-sachet', 'dragees'),
('choc_o_lait', 'Choc\' o\' lait', 'Carré de chocolat à faire fondre dans du lait chaud.', '33 grammes', './vues/images/produits/saison/choc-o-lait', 'produits_de_saison'),
('citrouille', 'Citrouille', 'En praliné au lait...', '50 grammes', './vues/images/produits/saison/citrouille', 'produits_de_saison'),
('coffret_27_tablettes', 'Coffret de 27 tablettes', 'Coffret de 27 tablettes', '270 grammes', './vues/images/produits/chocolats/tablettes27', 'chocolats'),
('dragees_amandes_corsees', 'Dragées amandes corsées', 'Nappées de fin chocolat noir aux notes chaudes de brioche et de miel. Pour garnir les cadeaux de vos invités.', 'Environ 80 dragées pour 250g', './vues/images/produits/dragees/dragees-amandes-corsees', 'dragees'),
('dragees_amandes_fines', 'Dragées amandes finesse extrême', 'Amande fraîche au goût délicat de la douce amertume. Pour garnir les cadeaux de vos invités.', 'Environ 85 dragées pour 250g', './vues/images/produits/dragees/dragees-amandes-finesse-extreme', 'dragees'),
('dragees_petits_coeurs', 'Dragées Petits Coeurs', 'Du bon chocolat au lait moulé avec une finition au sucre coloré. Pour garnir les cadeaux de vos invités.', '250 grammes', './vues/images/produits/dragees/dragees-chocolat', 'dragees'),
('escarpin', 'Escarpin en chocolat', 'Un palet mendiant est à l\'avant de la chaussure en chocolat.', 'un cadeau original', './vues/images/produits/idees_cadeaux/chaussure-noire', 'idees_cadeaux'),
('escarpin_chocolat_rose', 'Escarpin en chocolat rose', 'Talon haut en chocolat blanc, coloré en rouge betterave. Intérieur en chocolat au lait.', 'un cadeau original', './vues/images/produits/idees_cadeaux/chaussure-rose', 'idees_cadeaux'),
('feuilles_d_automne', 'Feuilles d\'automne', 'Chocolats pralinés sous différentes formes...', '180 grammes', './vues/images/produits/saison/feuilles_automne', 'produits_de_saison'),
('gateau_de_bonbons', 'Gâteau de bonbons', 'Assemblage de bonbons en forme de gâteau fourni dans une boîte de luxe', 'tout en élégance', './vues/images/produits/confiseries/gateau-bonbons', 'confiseries'),
('grelons', 'Grêlons', 'Noisettes caramélisées, enrobées de chocolat au lait, puis légèrement saupoudrées de sucre glace.', '150 grammes ou vrac', './vues/images/produits/dragees/grelons', 'dragees'),
('herisson', 'Hérisson', 'Chocolat praliné blanc ou lait.', 'environ 25 grammes', './vues/images/produits/saison/herisson', 'produits_de_saison'),
('mendiants', 'Mendiants', 'Composition de différents types de mendiants', '200 grammes', './vues/images/produits/chocolats/mendiants', 'chocolats'),
('outils_chocolat_noir', 'Outils en chocolat noir', 'Excellent cadeau à offrir ou à s\'offrir pour toutes les occasions ! Anniversaire, Noël ou encore pour la Saint Valentin.', '5 outils', './vues/images/produits/idees_cadeaux/outils', 'idees_cadeaux'),
('plateau_traiteur', 'Plateau traiteur', 'Plateau traiteur à composer devant les présentoirs.', '25 ou 49 chocolats', './vues/images/produits/chocolats/plateau', 'chocolats'),
('pralines_roses', 'Pralines roses', 'Des amandes enveloppées de sucre cuit, une gourmandise dont il est difficile de se détacher.', '200 grammes', './vues/images/produits/saison/praline-rose', 'produits_de_saison'),
('rose_chocolat', 'Rose en chocolat', 'Réalisée en chocolat au lait, cette rose fondante est décorée à la main.', '80 grammes', './vues/images/produits/idees_cadeaux/rose', 'idees_cadeaux'),
('tablettes', 'Tablettes', 'Tablettes de 70 grammes', '70 grammes', './vues/images/produits/chocolats/tablettes', 'chocolats');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `IDROLES` int(11) NOT NULL AUTO_INCREMENT,
  `nomRoles` varchar(255) NOT NULL,
  PRIMARY KEY (`IDROLES`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`IDROLES`, `nomRoles`) VALUES
(1, 'Administrateur'),
(2, 'Modérateur'),
(3, 'Editeur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `IDUTILISATEURS` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` text NOT NULL,
  `mail` text NOT NULL,
  `motdepasse` text NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`IDUTILISATEURS`),
  UNIQUE KEY `mail` (`mail`) USING HASH,
  KEY `utilisateurs_roles` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`IDUTILISATEURS`, `pseudo`, `mail`, `motdepasse`, `role`) VALUES
(1, 'admin', 'admin@chocolatein.fr', 'f4f263e439cf40925e6a412387a9472a6773c2580212a4fb50d224d3a817de17', 1),
(2, 'jose', 'jose@chocolatein.fr', 'f4f263e439cf40925e6a412387a9472a6773c2580212a4fb50d224d3a817de17', 2),
(3, 'tab', 'tab@chocolatein.fr', 'f4f263e439cf40925e6a412387a9472a6773c2580212a4fb50d224d3a817de17', 1),
(7, 'bob', 'bob@chocolatein.fr', 'f4f263e439cf40925e6a412387a9472a6773c2580212a4fb50d224d3a817de17', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `details_produits`
--
ALTER TABLE `details_produits`
  ADD CONSTRAINT `fk_idproduit` FOREIGN KEY (`idproduit`) REFERENCES `produit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`idgamme`) REFERENCES `gamme` (`id`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_roles` FOREIGN KEY (`role`) REFERENCES `roles` (`IDROLES`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
