-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour keovilay_db
CREATE DATABASE IF NOT EXISTS keovilay_db;
USE keovilay_db;
-- Listage de la structure de table keovilay_db. mns_user
CREATE TABLE IF NOT EXISTS `mns_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isadmin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table keovilay_db.mns_user : ~8 rows (environ)
INSERT IGNORE INTO `mns_user` (`id`, `firstname`, `lastname`, `email`, `password`, `isadmin`) VALUES
	(1, 'User', 'USER', 'user@user.fr', 'azerty', 0),
	(2, 'Jean', 'Dupont', 'jean.dupont@example.com', 'motdepasse123', 0),
	(3, 'Marie', 'Martin', 'marie.martin@example.com', 'passsécurisé456', 0),
	(4, 'Michel', 'Durand', 'michel.durand@example.com', 'passe789', 1),
	(5, 'Émilie', 'Leroy', 'emilie.leroy@example.com', 'monmotdepasse', 0),
	(6, 'Robert', 'Moreau', 'robert.moreau@example.com', 'passemorerobert', 0),
	(7, 'John', 'DOE', 'john.doe@email.fr', 'azertyuiop', 0),
	(12, 'Admin', 'ADMIN', 'admin@admin.fr', 'adminTracker123', 1),
	(13, 'zfzafza', 'fnzoafzafzf', 'zfzaf@afzage.Fr', 'feezgez', 0);

-- Listage de la structure de table keovilay_db. ticket
CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `createdat` datetime DEFAULT NULL,
  `openedat` datetime DEFAULT NULL,
  `closedat` datetime DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `mns_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table keovilay_db.ticket : ~7 rows (environ)
INSERT IGNORE INTO `ticket` (`id`, `title`, `content`, `createdat`, `openedat`, `closedat`, `type_id`, `user_id`) VALUES
	(1, 'Erreur sur la page de connexion', 'La page de connexion affiche une erreur lors de la soumission du formulaire.', '2024-09-01 10:15:00', '2024-09-01 11:00:00', NULL, 1, 2),
	(2, 'Ajouter un mode sombre', 'Ce serait bien d\'avoir un mode sombre pour l\'application.', '2024-08-25 09:45:00', NULL, NULL, 2, 3),
	(3, 'Paiement non traité', 'J\'ai essayé de faire un paiement mais il a échoué.', '2024-09-03 14:30:00', NULL, NULL, 4, 4),
	(4, 'L\'application plante', 'L\'application mobile plante quand j\'ouvre le tableau de bord.', '2024-09-04 08:50:00', NULL, NULL, 1, 5),
	(5, 'Problème de mise à niveau d\'abonnement', 'Je n\'arrive pas à mettre à niveau mon abonnement.', '2024-09-05 16:10:00', NULL, NULL, 4, 6),
	(8, 'e&tezf', 'rzafezg', '2024-09-09 13:52:51', NULL, NULL, 2, 13),
	(9, 'dzagza', 'fzagrght', '2024-09-09 13:53:55', NULL, NULL, 3, 13);

-- Listage de la structure de table keovilay_db. type
CREATE TABLE IF NOT EXISTS `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table keovilay_db.type : ~5 rows (environ)
INSERT IGNORE INTO `type` (`id`, `label`, `color`) VALUES
	(1, 'Rapport de bug', '#FF0000'),
	(2, 'Demande de fonctionnalité', '#00FF00'),
	(3, 'Support technique', '#0000FF'),
	(4, 'Problème de facturation', '#FFA500'),
	(5, 'Demande générale', '#808080');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
