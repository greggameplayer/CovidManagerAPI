-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 15 avr. 2021 à 09:40
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `covidmanager`
--

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
-- Structure de la table `vacccine`
--

DROP TABLE IF EXISTS `vacccine`;
CREATE TABLE IF NOT EXISTS `vacccine` (
  `idVaccine` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idVaccine`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vacccine`
--

INSERT INTO `vacccine` (`idVaccine`, `name`) VALUES
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
-- Contraintes pour la table `vial`
--
ALTER TABLE `vial`
  ADD CONSTRAINT `FK_Vial_Slot` FOREIGN KEY (`idSlot`) REFERENCES `slot` (`idSlot`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_Vial_Vaccine` FOREIGN KEY (`idVaccine`) REFERENCES `vacccine` (`idVaccine`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
