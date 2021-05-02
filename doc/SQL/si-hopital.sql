-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  Dim 02 mai 2021 à 09:14
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `si-hopital`
--

-- --------------------------------------------------------

--
-- Structure de la table `add_stay`
--

DROP TABLE IF EXISTS `add_stay`;
CREATE TABLE IF NOT EXISTS `add_stay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_stay_id` int(11) DEFAULT NULL,
  `id_staff_id` int(11) DEFAULT NULL,
  `modification` datetime NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_50F15E6C25A75EA6` (`id_stay_id`),
  KEY `IDX_50F15E6C5D96BB58` (`id_staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bed`
--

DROP TABLE IF EXISTS `bed`;
CREATE TABLE IF NOT EXISTS `bed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_hospital_room_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E647FCFF452044B9` (`id_hospital_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `doctor`
--

INSERT INTO `doctor` (`id`, `first_name`, `last_name`) VALUES
(1, 'Jad', 'Daouk');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210209210417', '2021-02-09 21:04:23', 16680);

-- --------------------------------------------------------

--
-- Structure de la table `hospital_room`
--

DROP TABLE IF EXISTS `hospital_room`;
CREATE TABLE IF NOT EXISTS `hospital_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_service_id` int(11) DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F37EFBDA48D62931` (`id_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `log_user`
--

DROP TABLE IF EXISTS `log_user`;
CREATE TABLE IF NOT EXISTS `log_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `log_user`
--

INSERT INTO `log_user` (`id`, `action`, `date`, `staff_id`) VALUES
(1, 'connexion', '2021-02-09 21:14:20', 1),
(2, 'connexion', '2021-02-09 21:16:15', 1),
(3, 'connexion', '2021-02-09 21:19:22', 1),
(4, 'connexion', '2021-02-09 21:21:00', 1),
(5, 'connexion', '2021-02-09 21:21:08', 1),
(6, 'connexion', '2021-02-09 21:24:58', 1),
(7, 'connexion', '2021-02-09 21:26:03', 1),
(8, 'connexion', '2021-02-09 21:26:24', 1),
(9, 'connexion', '2021-02-09 21:28:56', 1),
(10, 'connexion', '2021-02-09 21:30:01', 1),
(11, 'connexion', '2021-02-17 22:03:07', 1),
(12, 'connexion', '2021-02-28 18:47:57', 1),
(13, 'connexion', '2021-02-28 22:35:07', 1),
(14, 'connexion', '2021-03-02 03:13:32', 1),
(15, 'connexion', '2021-03-05 22:20:23', 1),
(16, 'connexion', '2021-03-06 15:38:42', 1),
(17, 'connexion', '2021-03-08 12:57:36', 7),
(18, 'connexion', '2021-03-08 13:30:29', 19),
(19, 'connexion', '2021-03-08 13:31:16', 19),
(20, 'connexion', '2021-03-08 13:32:15', 19),
(21, 'connexion', '2021-03-08 14:54:43', 3),
(22, 'connexion', '2021-03-08 14:56:22', 1),
(23, 'connexion', '2021-03-08 17:22:20', 3),
(24, 'connexion', '2021-03-08 17:25:37', 4),
(25, 'connexion', '2021-03-08 17:38:30', 1),
(26, 'connexion', '2021-03-16 12:41:28', 2),
(27, 'connexion', '2021-03-16 12:42:29', 4),
(28, 'connexion', '2021-03-16 12:42:50', 1),
(29, 'connexion', '2021-03-16 12:43:13', 1),
(30, 'connexion', '2021-03-16 12:44:06', 5),
(31, 'connexion', '2021-03-16 12:44:29', 5),
(32, 'connexion', '2021-03-16 12:45:56', 5),
(33, 'connexion', '2021-03-16 13:17:24', 4),
(34, 'connexion', '2021-03-16 13:17:48', 5),
(35, 'connexion', '2021-03-16 13:20:57', 22),
(36, 'connexion', '2021-03-16 13:21:44', 4),
(37, 'connexion', '2021-03-16 13:44:41', 22);

-- --------------------------------------------------------

--
-- Structure de la table `manage`
--

DROP TABLE IF EXISTS `manage`;
CREATE TABLE IF NOT EXISTS `manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_patient_id` int(11) DEFAULT NULL,
  `id_staff_id` int(11) DEFAULT NULL,
  `modification` datetime NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2472AA4ACE0312AE` (`id_patient_id`),
  KEY `IDX_2472AA4A5D96BB58` (`id_staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
CREATE TABLE IF NOT EXISTS `meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F515E13987F4FB17` (`doctor_id`),
  KEY `IDX_F515E1396BF700BD` (`status_id`),
  KEY `IDX_F515E1396B899279` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `meeting`
--

INSERT INTO `meeting` (`id`, `doctor_id`, `status_id`, `patient_id`, `date`) VALUES
(1, 1, 3, 3, '2021-03-01 09:00:00'),
(2, 1, 3, 3, '2021-03-01 11:00:00'),
(3, 1, 3, 3, '2021-03-02 11:00:00'),
(4, 1, 6, 3, '2021-03-03 09:00:00'),
(5, 1, 1, 3, '2021-03-17 09:00:00'),
(6, 1, 1, 13, '2021-03-18 09:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_security_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `blood_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activate` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1ADAD7EBA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id`, `user_id`, `last_name`, `first_name`, `social_security_number`, `birth_date`, `blood_type`, `activate`) VALUES
(1, 1, 'Hage', 'Grégoire', '123456', '2001-04-15', 'A', 1),
(2, 2, 'Marit', 'Victor', '12345678', '2000-05-28', 'AB', 1),
(3, 4, 'Marit', 'Victor', 'azerty123456', '2021-03-01', NULL, 1),
(4, 6, 'Marit', 'Victor', 'wkjnfksjdnlskdnflqkzùdfsdfsdddd', '2021-03-01', NULL, 1),
(5, 7, 'Marit', 'Victor', 'wkjnfksjdnlskdnflqkzùdfsdfsddfdfsdfsefzezf', '2021-03-01', NULL, 1),
(6, 8, 'Marit', 'Victor', 'wkjnfksjdnlskdnflqkzùdfsdfsddqsd557', '2021-03-01', NULL, 1),
(7, 9, 'Marit', 'Victor', 'wkjnfksjdnlskdnflqkzùdfsdfsdfsdf555', '2021-03-01', NULL, 1),
(8, 11, 'Vcitr', 'fsd', 'sdfsqdfqsf', '1996-04-02', NULL, 1),
(9, 18, 'Marit', 'Victor', '123456sdfsdfs', '2021-03-01', NULL, 1),
(10, 19, 'Marit', 'fqsdf', 'wkjnfksjdnlskdnflqkzùdfsdfsd', '2021-03-01', NULL, 1),
(11, 20, 'Marit', 'Victor', 'wkjnfksjdnlskdnflqkzùdfsdfsdqsdqsd', '2021-03-01', NULL, 1),
(12, 21, 'Marit', 'Victor', 'vsqdvqsd5v416s5dv65sd1v', '2021-03-01', NULL, 1),
(13, 22, 'marit', 'victor', '123456fff156', '1995-02-27', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `slot`
--

DROP TABLE IF EXISTS `slot`;
CREATE TABLE IF NOT EXISTS `slot` (
  `idSlot` int(11) NOT NULL AUTO_INCREMENT,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `nbInitialPlaces` int(11) DEFAULT NULL,
  `nbReservedPlaces` int(11) DEFAULT '0',
  PRIMARY KEY (`idSlot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_426EF392A76ED395` (`user_id`),
  KEY `IDX_426EF39248D62931` (`id_service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `first_name`, `last_name`, `id_service_id`) VALUES
(1, 1, 'Grégoire', 'Hage', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Demandé'),
(2, 'Confirmé'),
(3, 'Annulé'),
(4, 'Refusé'),
(5, 'Réalisé'),
(6, 'Inactif');

-- --------------------------------------------------------

--
-- Structure de la table `stay`
--

DROP TABLE IF EXISTS `stay`;
CREATE TABLE IF NOT EXISTS `stay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bed_id` int(11) DEFAULT NULL,
  `id_patient_id` int(11) DEFAULT NULL,
  `entry_date` datetime NOT NULL,
  `leave_date` datetime NOT NULL,
  `creation_date` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IDX_5E09839CAE5F3E54` (`id_bed_id`),
  KEY `IDX_5E09839CCE0312AE` (`id_patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `update_status`
--

DROP TABLE IF EXISTS `update_status`;
CREATE TABLE IF NOT EXISTS `update_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `date_update` datetime NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_78D6E3F2D4D57CD` (`staff_id`),
  KEY `IDX_78D6E3F267433D9C` (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `roles`) VALUES
(1, 'gregoire.hage@gmail.com', '$2y$10$JVpbVXltFt6cRtjTYR7TCe8Zny4gDbdEXcA0L68KvjznWBW7l.Xfi', '[\"ROLE_SECRETARY\"]'),
(2, 'victor.marit', '$2y$10$Ur1uDzrKNNyRQRvXt8cJhOhuSsVCxydDdkEkaSCEnMV2T.yZ4ZkUe ', '[]'),
(4, 'victormarit.95@gmail.com', '$2y$13$cfCjwQFmImP22OgImbskke5KYPGfvYBkjBzEcMDu63Rgz4mYxZMW.', '[\"ROLE_PATIENT\"]'),
(6, 'victormarit.951@gmail.com', '$2y$13$OmBELYi1WkRezyt8aUyU1ex/gAM2nxIcBkwmwbHpACXs09SvoO.La', '[\"ROLE_PATIENT\"]'),
(7, 'victormarit.95fqssofdsqsqls@gmail.com', '$2y$13$ScuFZQvFoY3rGPUKEkPnDeKVB5LwefUvnSAp89BDmV64kqSVKyU.u', '[\"ROLE_PATIENT\"]'),
(8, 'victormarit.95fqsfvdsoqsqls@gmail.com', '$2y$13$yIRJcrQYFi1nHGOrrVJQlu2HOiqGxzlw4ZzDokE2LNjAmi.rVsobi', '[\"ROLE_PATIENT\"]'),
(9, 'victormarit.95151@gmail.com', '$2y$13$DLNwJ0Kf8FagIO9NHoz9uuw7ByRSGhdZYNENomVOTZwmy4HyMHegO', '[\"ROLE_PATIENT\"]'),
(10, 'victormarit.95wvwx1@gmail.com', '$2y$13$YqT9PWAQNi9D6lXMmG2rl.PgwOQrDGJyct8jbFuXSuCPOhVtupu/K', '[\"ROLE_PATIENT\"]'),
(11, 'victormarit.95wvwx1@gmail.com', '$2y$13$IuWcQYdkxQublZwsHboMruHdq3KxD96MOb6v0HAdSW4hIP2JOeju6', '[\"ROLE_PATIENT\"]'),
(12, 'victormarit.9df5@gmail.com', '$2y$13$incHyhjQVn.b2YUOYk12OeI01.PFmckchhUp.OjfnARUgyMysX5ri', '[\"ROLE_PATIENT\"]'),
(13, 'victormarit.9df5@gmail.com', '$2y$13$H.4Yhhtcjhl3Gl9rOc1Po.SNpJp86lfB8ZSDFRCi6i4NVqD.pXY3G', '[\"ROLE_PATIENT\"]'),
(14, 'victormarit.9df5@gmail.com', '$2y$13$9NcB2EOkywg6VKoZ/yFypuprhCR44/9hGzE98cWoiSSN5gmeEE2ay', '[\"ROLE_PATIENT\"]'),
(15, 'victormarit.9df5@gmail.com', '$2y$13$qOqsevnKGSd/A7sAjd2j0.A3jnV7dq1ELG8WvJYn2zBBYb1ZO5dOS', '[\"ROLE_PATIENT\"]'),
(16, 'victormarit.9df5@gmail.com', '$2y$13$LRYhOB9cdKuFcTC3xr/4F.VAYaYKfJDaBCJw0JayE76pkcd28WO2S', '[\"ROLE_PATIENT\"]'),
(17, 'victormarit.9df5@gmail.com', '$2y$13$U5QlPOvxdNayM7K3pxnvg.UFVDlbzMMqY3wbfAMDjIqK1yu7OUldS', '[\"ROLE_PATIENT\"]'),
(18, 'victormarit.9df5@gmail.com', '$2y$13$bEs7gi4yZJ4h8SYArikK8e8l4tO.aZ6u1xBEPY46XnfYFj5QvwEye', '[\"ROLE_PATIENT\"]'),
(19, 'victormarit.95dddd@gmail.com', '$2y$10$zmEGVEf/C8VHrX5kwBnZK.EC0oUF2ukqGuIVLWTVlRln8uYwA9acq', '[\"ROLE_PATIENT\"]'),
(20, 'victormarit.9521@gmail.com', '$2y$13$lR46fPA4boJ87Mg1pjk8WepmjSqxr64uetJbmVmx2PzNdXSfBNwNu', '[\"ROLE_PATIENT\"]'),
(21, 'victormarit.91235@gmail.com', '$2y$13$oXvv4fxo/eRyOshZBqz6suRA9Y.ydPmRZameSAWdldoRlVYvbNSqa', '[\"ROLE_PATIENT\"]'),
(22, 'victormarit.952@gmail.com', '$2y$13$zFWW3N9ZoEZmRBaVPaXSOOnEFU6qJXlrcC2XnThxLnDc1jRzVXZga', '[\"ROLE_PATIENT\"]');

-- --------------------------------------------------------

--
-- Structure de la table `vaccine`
--

DROP TABLE IF EXISTS `vaccine`;
CREATE TABLE IF NOT EXISTS `vaccine` (
  `idVaccine` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idVaccine`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vaccine`
--

INSERT INTO `vaccine` (`idVaccine`, `name`) VALUES
(1, 'Astrazenaca'),
(2, 'Moderna'),
(3, 'Pfizer'),
(4, 'J & J');

-- --------------------------------------------------------

--
-- Structure de la table `vial`
--

DROP TABLE IF EXISTS `vial`;
CREATE TABLE IF NOT EXISTS `vial` (
  `idVial` int(11) NOT NULL AUTO_INCREMENT,
  `shotNumber` int(11) DEFAULT NULL,
  `idSlot` int(11) DEFAULT NULL,
  `idVaccine` int(11) NOT NULL,
  PRIMARY KEY (`idVial`),
  KEY `FK_Vial_Slot` (`idSlot`),
  KEY `FK_Vial_Vaccine` (`idVaccine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `add_stay`
--
ALTER TABLE `add_stay`
  ADD CONSTRAINT `FK_50F15E6C25A75EA6` FOREIGN KEY (`id_stay_id`) REFERENCES `stay` (`id`),
  ADD CONSTRAINT `FK_50F15E6C5D96BB58` FOREIGN KEY (`id_staff_id`) REFERENCES `staff` (`id`);

--
-- Contraintes pour la table `bed`
--
ALTER TABLE `bed`
  ADD CONSTRAINT `FK_E647FCFF452044B9` FOREIGN KEY (`id_hospital_room_id`) REFERENCES `hospital_room` (`id`);

--
-- Contraintes pour la table `hospital_room`
--
ALTER TABLE `hospital_room`
  ADD CONSTRAINT `FK_F37EFBDA48D62931` FOREIGN KEY (`id_service_id`) REFERENCES `service` (`id`);

--
-- Contraintes pour la table `manage`
--
ALTER TABLE `manage`
  ADD CONSTRAINT `FK_2472AA4A5D96BB58` FOREIGN KEY (`id_staff_id`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `FK_2472AA4ACE0312AE` FOREIGN KEY (`id_patient_id`) REFERENCES `patient` (`id`);

--
-- Contraintes pour la table `meeting`
--
ALTER TABLE `meeting`
  ADD CONSTRAINT `FK_F515E1396B899279` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `FK_F515E1396BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `FK_F515E13987F4FB17` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);

--
-- Contraintes pour la table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `FK_1ADAD7EBA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `FK_426EF39248D62931` FOREIGN KEY (`id_service_id`) REFERENCES `service` (`id`),
  ADD CONSTRAINT `FK_426EF392A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `stay`
--
ALTER TABLE `stay`
  ADD CONSTRAINT `FK_5E09839CAE5F3E54` FOREIGN KEY (`id_bed_id`) REFERENCES `bed` (`id`),
  ADD CONSTRAINT `FK_5E09839CCE0312AE` FOREIGN KEY (`id_patient_id`) REFERENCES `patient` (`id`);

--
-- Contraintes pour la table `update_status`
--
ALTER TABLE `update_status`
  ADD CONSTRAINT `FK_78D6E3F267433D9C` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`),
  ADD CONSTRAINT `FK_78D6E3F2D4D57CD` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Contraintes pour la table `vial`
--
ALTER TABLE `vial`
  ADD CONSTRAINT `FK_Vial_Slot` FOREIGN KEY (`idSlot`) REFERENCES `slot` (`idSlot`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_Vial_Vaccine` FOREIGN KEY (`idVaccine`) REFERENCES `vaccine` (`idVaccine`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
