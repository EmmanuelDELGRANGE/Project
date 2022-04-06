-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 25 mars 2022 à 15:57
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `d:\cours\ece\s6\oop_java\project_car_rent1\db`
--

-- --------------------------------------------------------

--
-- Structure de la table `car`
--

DROP TABLE IF EXISTS `car`;
CREATE TABLE IF NOT EXISTS `car` (
  `numCar` int NOT NULL AUTO_INCREMENT,
  `model` varchar(50) DEFAULT NULL,
  `constructor` varchar(50) NOT NULL,
  `rentPrice` int NOT NULL,
  `discountOffer` float NOT NULL,
  `seatNumber` int NOT NULL,
  `engine` varchar(50) NOT NULL,
  `transmission` varchar(50) NOT NULL,
  PRIMARY KEY (`numCar`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `car`
--

INSERT INTO `car` (`numCar`, `model`, `constructor`, `rentPrice`, `discountOffer`, `seatNumber`, `engine`, `transmission`) VALUES
(1, '206', 'Peugeot', 40, 0.2, 4, 'Petrol', 'Manual'),
(2, 'Fortwo', 'Smart', 40, 0.2, 2, 'Petrol', 'Automatic'),
(4, 'Civic', 'Honda', 50, 0.3, 4, 'Petrol', 'Manual'),
(5, '500E', 'Mercedes-Benz', 150, 0, 5, 'Petrol', 'Manual'),
(6, 'Enzo', 'Ferrari', 300, 0, 2, 'Petrol', 'Manual'),
(7, 'Continental GT', 'Bentley', 500, 0.05, 2, 'Petrol', 'Automatic'),
(8, 'Focus', 'Ford', 50, 0.2, 5, 'Diesel', 'Automatic');

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `numCustomer` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `birthDate` date NOT NULL,
  `memberDicsount` float NOT NULL,
  PRIMARY KEY (`numCustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`numCustomer`, `email`, `password`, `firstName`, `lastName`, `type`, `birthDate`, `memberDicsount`) VALUES
(1, 'jeanlassalle@president.fr', 'jeVeuxEtrePresident', 'Jean', 'Lasalle', '2', '1937-03-01', 0.1),
(2, 'JOJO@rock.com', 'AllumezLeFeu69', 'Johnny', 'Halliday', '2', '1950-11-05', 0.5);

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `numEmployee` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  PRIMARY KEY (`numEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `employee`
--

INSERT INTO `employee` (`numEmployee`, `email`, `password`, `firstName`, `lastName`) VALUES
(1, 'charlesBurns420@gmail.com', 'iWillRuleTheWorld', 'Charles', 'Montgomery Burns'),
(2, 'doeOhPinaise@yahoo.com', 'Xx_Donut4Ever_xX', 'Homer', 'Simpson');

-- --------------------------------------------------------

--
-- Structure de la table `include`
--

DROP TABLE IF EXISTS `include`;
CREATE TABLE IF NOT EXISTS `include` (
  `numRent` int NOT NULL,
  `numCar` int NOT NULL,
  PRIMARY KEY (`numRent`,`numCar`),
  KEY `include_Car0_FK` (`numCar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `modify`
--

DROP TABLE IF EXISTS `modify`;
CREATE TABLE IF NOT EXISTS `modify` (
  `numUser` int NOT NULL,
  `numCar` int NOT NULL,
  PRIMARY KEY (`numUser`,`numCar`),
  KEY `Modify_Car0_FK` (`numCar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rent`
--

DROP TABLE IF EXISTS `rent`;
CREATE TABLE IF NOT EXISTS `rent` (
  `numRent` int NOT NULL AUTO_INCREMENT,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `numCustomer` int NOT NULL,
  PRIMARY KEY (`numRent`),
  KEY `Rent_Customer_FK` (`numCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `include`
--
ALTER TABLE `include`
  ADD CONSTRAINT `include_Car0_FK` FOREIGN KEY (`numCar`) REFERENCES `car` (`numCar`),
  ADD CONSTRAINT `include_Rent_FK` FOREIGN KEY (`numRent`) REFERENCES `rent` (`numRent`);

--
-- Contraintes pour la table `modify`
--
ALTER TABLE `modify`
  ADD CONSTRAINT `Modify_Car0_FK` FOREIGN KEY (`numCar`) REFERENCES `car` (`numCar`),
  ADD CONSTRAINT `Modify_Employee_FK` FOREIGN KEY (`numUser`) REFERENCES `employee` (`numEmployee`);

--
-- Contraintes pour la table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `Rent_Customer_FK` FOREIGN KEY (`numCustomer`) REFERENCES `customer` (`numCustomer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
