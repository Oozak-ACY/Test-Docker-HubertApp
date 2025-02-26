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