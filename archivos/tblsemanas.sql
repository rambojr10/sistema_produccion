-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-07-2019 a las 18:32:11
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdprueba3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsemanas`
--

CREATE TABLE `tblsemanas` (
  `PKId` int(11) NOT NULL,
  `N_Semana` varchar(50) DEFAULT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  `FKId_TblCintas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblsemanas`
--

INSERT INTO `tblsemanas` (`PKId`, `N_Semana`, `Fecha_Inicio`, `Fecha_Fin`, `FKId_TblCintas`) VALUES
(1, 'SEMANA 01', '2018-12-31', '2019-01-06', 1),
(2, 'SEMANA 02', '2019-01-07', '2019-01-13', 2),
(3, 'SEMANA 03', '2019-01-14', '2019-01-20', 3),
(4, 'SEMANA 04', '2019-01-21', '2019-01-27', 4),
(5, 'SEMANA 05', '2019-01-28', '2019-02-03', 5),
(6, 'SEMANA 06', '2019-02-04', '2019-02-10', 6),
(7, 'SEMANA 07', '2019-02-11', '2019-02-17', 7),
(8, 'SEMANA 08', '2019-02-18', '2019-02-24', 8),
(9, 'SEMANA 09', '2019-02-25', '2019-03-03', 9),
(10, 'SEMANA 10', '2019-03-04', '2019-03-10', 10),
(11, 'SEMANA 11', '2019-03-11', '2019-03-17', 1),
(12, 'SEMANA 12', '2019-03-18', '2019-03-24', 2),
(13, 'SEMANA 13', '2019-03-25', '2019-03-31', 3),
(14, 'SEMANA 14', '2019-04-01', '2019-04-07', 4),
(15, 'SEMANA 15', '2019-04-08', '2019-04-14', 5),
(16, 'SEMANA 16', '2019-04-15', '2019-04-21', 6),
(17, 'SEMANA 17', '2019-04-22', '2019-04-28', 7),
(18, 'SEMANA 18', '2019-04-29', '2019-05-05', 8),
(19, 'SEMANA 19', '2019-05-06', '2019-05-12', 9),
(20, 'SEMANA 20', '2019-05-13', '2019-05-19', 10),
(21, 'SEMANA 21', '2019-05-20', '2019-05-26', 1),
(22, 'SEMANA 22', '2019-05-27', '2019-06-02', 2),
(23, 'SEMANA 23', '2019-06-03', '2019-06-09', 3),
(24, 'SEMANA 24', '2019-06-10', '2019-06-16', 4),
(25, 'SEMANA 25', '2019-06-17', '2019-06-23', 5),
(26, 'SEMANA 26', '2019-06-24', '2019-06-30', 6),
(27, 'SEMANA 27', '2019-07-01', '2019-07-07', 7),
(28, 'SEMANA 28', '2019-07-08', '2019-07-14', 8),
(29, 'SEMANA 29', '2019-07-15', '2019-07-21', 9),
(30, 'SEMANA 30', '2019-07-22', '2019-07-28', 10),
(31, 'SEMANA 31', '2019-07-29', '2019-08-04', 1),
(32, 'SEMANA 32', '2019-08-05', '2019-08-11', 2),
(33, 'SEMANA 33', '2019-08-12', '2019-08-18', 3),
(34, 'SEMANA 34', '2019-08-19', '2019-08-25', 4),
(35, 'SEMANA 35', '2019-08-26', '2019-09-01', 5),
(36, 'SEMANA 36', '2019-09-02', '2019-09-08', 6),
(37, 'SEMANA 37', '2019-09-09', '2019-09-15', 7),
(38, 'SEMANA 38', '2019-09-16', '2019-09-22', 8),
(39, 'SEMANA 39', '2019-09-23', '2019-09-29', 9),
(40, 'SEMANA 40', '2019-09-30', '2019-10-06', 10),
(41, 'SEMANA 41', '2019-10-07', '2019-10-13', 1),
(42, 'SEMANA 42', '2019-10-14', '2019-10-20', 2),
(43, 'SEMANA 43', '2019-10-21', '2019-10-27', 3),
(44, 'SEMANA 44', '2019-10-28', '2019-11-03', 4),
(45, 'SEMANA 45', '2019-11-04', '2019-11-10', 5),
(46, 'SEMANA 46', '2019-11-11', '2019-11-17', 6),
(47, 'SEMANA 47', '2019-11-18', '2019-11-24', 7),
(48, 'SEMANA 48', '2019-11-25', '2019-12-01', 8),
(49, 'SEMANA 49', '2019-12-02', '2019-12-08', 9),
(50, 'SEMANA 50', '2019-12-09', '2019-12-15', 10),
(51, 'SEMANA 51', '2019-12-16', '2019-12-22', 1),
(52, 'SEMANA 52', '2019-12-23', '2019-12-29', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblsemanas`
--
ALTER TABLE `tblsemanas`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblCintas` (`FKId_TblCintas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblsemanas`
--
ALTER TABLE `tblsemanas`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblsemanas`
--
ALTER TABLE `tblsemanas`
  ADD CONSTRAINT `tblsemanas_ibfk_1` FOREIGN KEY (`FKId_TblCintas`) REFERENCES `tblcintas` (`PKId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
