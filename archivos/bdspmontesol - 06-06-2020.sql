-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2020 a las 22:26:45
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdprueba2`
--
CREATE DATABASE IF NOT EXISTS `bdprueba2` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `bdprueba2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcajasmercadonacional`
--

DROP TABLE IF EXISTS `tblcajasmercadonacional`;
CREATE TABLE `tblcajasmercadonacional` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(250) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblcajasmercadonacional`
--

INSERT INTO `tblcajasmercadonacional` (`PKId`, `Descripcion`) VALUES
(1, 'DEDO SUELTO CARTÓN'),
(2, 'CLUSTER CARTÓN'),
(3, 'MANO ENTERA'),
(4, 'DEDO SUELTO EN BOLSA DE 20KLS'),
(5, 'FRUTA DE PISO BOLSA DE 25KLS'),
(6, 'CANASTAS SUCIAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcajasproduccion`
--

DROP TABLE IF EXISTS `tblcajasproduccion`;
CREATE TABLE `tblcajasproduccion` (
  `PKCodigo` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `Descripcion` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `FactorConversion` float NOT NULL,
  `FKId_TblTipoFruta` int(11) NOT NULL,
  `FKId_TblClasificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblcajasproduccion`
--

INSERT INTO `tblcajasproduccion` (`PKCodigo`, `Descripcion`, `FactorConversion`, `FKId_TblTipoFruta`, `FKId_TblClasificacion`) VALUES
('1003', 'PR ORSERO BANANAS --', 1, 1, NULL),
('1010', 'PR TURBANA 3 LBS BAN', 1, 1, NULL),
('1011', 'FT TESCO*', 0.94, 6, NULL),
('1014', 'FLO FAIR TRADE EU***', 1, 6, NULL),
('1015', 'FT JS FAIR TRADE 17K', 0.94, 6, NULL),
('1016', 'FT 14 KLS- 75 DEDOS*', 0.77, 6, NULL),
('1017', 'FT FLO FAIR TRADE EU', 1, 6, NULL),
('1019', 'FT TESCO 17 KG EU**', 0.94, 6, NULL),
('1020', 'FT SMALL 13 KG*', 0.7, 6, NULL),
('1021', 'FT TESCO 17 KG CLUSTER BAG', 0.94, 6, NULL),
('1025', 'FT FAIR T 3LB EEUU', 1, 6, NULL),
('1028', 'FAIR TRADE TROPY DED', 1, 6, NULL),
('1036', 'PRIMERA BANANAS', 1, 1, NULL),
('1041', 'PIMERA MIX SIMBA BANANAS', 1, 1, NULL),
('1043', 'PR BAHIA HD SIN SELLO  54', 1, 1, NULL),
('1044', 'MIX SIMBA BANANAS 5', 1, 1, NULL),
('1046', 'PREMIUM TROPY HD 54', 1, 1, NULL),
('1047', 'PREMIUM ADRIA BANANA ', 1, 1, NULL),
('1048', 'SEGUNDA DARIEN BVC 54 (SEGUNDA)', 1, 2, NULL),
('1051', 'MENOR ESPECIFICACION  - BANANAS X 54', 1, 2, NULL),
('1054', 'PR DM EUROMINI 17KG', 0.94, 1, NULL),
('1056', 'PR 14 KL EU 75 DEDOS', 0.77, 1, NULL),
('1059', 'PR LD17 TRIAL 2', 0.94, 1, NULL),
('1062', 'FT JSFTX5 17 K EU', 0.94, 6, NULL),
('1073', 'PR SUPREME BANANAS', 1, 1, NULL),
('1075', 'PR LD17 AL 55', 0.94, 1, NULL),
('1078', 'ME FREDY F BAG 13 KG ', 0.74, 1, NULL),
('1079', 'ME FYFFES 12.7 KGS (SEGUNDA).', 0.7, 1, NULL),
('1080', 'ME ALDI BAG 1B 13 KGS.', 0.74, 1, NULL),
('1081', 'SEGUNDA FT SMALL 12.7 KG EU*', 0.7, 6, NULL),
('1085', 'PR FRUTIA BANANAS', 1, 1, NULL),
('1089', 'PR TROPY MEDITERRAN', 1, 1, NULL),
('1103', 'PR DERBY BANANAS', 1, 1, NULL),
('1106', 'SEGUNDA DARIEN BVC 54', 1, 2, NULL),
('1107', 'MENOR ESPECIFICACION - BANANAS AL 54', 1, 2, NULL),
('1108', 'PR TURBANA RAINFOREST', 1, 1, NULL),
('1114', 'PR  LD17RA  KGS.', 0.94, 1, NULL),
('1120', 'PR FYFFES STDW 54', 1, 1, NULL),
('1124', 'DARIEN 54 RAINFORES', 1, 2, NULL),
('1125', 'PR TURBANA 3 LBS BA', 1, 1, NULL),
('1126', 'PR FYFFES USA.', 1, 1, NULL),
('1129', 'PR FYFFES MED 54', 1, 1, NULL),
('1133', 'PR MOR5STD - 54', 0.92, 1, NULL),
('1137', 'PR CHIQUITA BANAVAC', 1, 1, NULL),
('1138', 'DARIEN BVC RAINFORE', 1, 2, NULL),
('1140', 'SEGUNDA CUMBIA BANANAS 54', 1, 2, NULL),
('1141', 'SEGUNDA CUMBIA HD BANANAS 4', 1, 2, NULL),
('1142', 'SEGUNDA CUMBIA HD BANANAS 5', 1, 2, NULL),
('1143', 'SEGUNDA ME HAPPY BANANAS BV', 1, 2, NULL),
('1148', 'SEGUNDA ME SLOBANA', 1, 2, NULL),
('1149', 'STDRA', 1, 1, NULL),
('1153', 'PR DERBY - 48', 0.77, 1, NULL),
('1154', 'MIX DARIEN BANANA', 1, 1, NULL),
('1155', 'PR SUPREME SARL', 1, 1, NULL),
('1163', 'PR SUPREME MEDITERR', 1, 1, NULL),
('1165', 'PR DERBY BANANAS 48', 1, 1, NULL),
('1166', 'ME ALDI BAG 13 KGS.', 0.74, 1, NULL),
('1167', 'FT JSFTX5 17 K EU -', 0.94, 6, NULL),
('1168', 'PRIMERA MIX TROPY RA', 1, 1, NULL),
('1170', 'PR TURBANA RAINFOREST -', 1, 1, NULL),
('1171', 'PR FYFFES STDHD RAI', 1, 1, NULL),
('1186', 'MIX ORSERO 41.5 LB', 1, 1, NULL),
('1189', 'FT JS FAIR TRADE 17', 0.94, 6, NULL),
('1191', 'PR FYFFES SRDHD 18.14 K', 1, 1, NULL),
('1192', 'PR FYFFES FYFMED 18.14 K', 1, 1, NULL),
('1193', 'PR FYFFES STDHDRA 18.14 K. RAIN', 1, 1, NULL),
('1194', 'PR CHIQUITA RAC BAN', 1, 1, NULL),
('1195', 'MIX ORSERO 41.5 LB -', 1, 1, NULL),
('1198', 'PR CLUSTER BAG FYFF', 1, 1, NULL),
('1200', 'ME ALDI BAG RA 13 K', 0.74, 1, NULL),
('1202', 'SEGUNDA ME ALDI BAG RA 13 K', 0.74, 2, NULL),
('1209', 'FT MHFT17 - EU-55', 0.94, 6, NULL),
('1214', 'PR MOR5STDRA - 54', 0.92, 1, NULL),
('1215', 'ME FYFFES 12.7 KGS.', 0.7, 1, NULL),
('1216', 'PR MSTDRA - 54', 1, 1, NULL),
('1219', 'PR FYFFES 3 LBS BAN', 1, 1, NULL),
('1223', 'PR YELLOW RAINFORES', 1, 1, NULL),
('1224', 'PR YELLOW RAINFORES ', 1, 1, NULL),
('1225', 'PR PAMELA BANANAS', 1, 1, NULL),
('1231', 'FT TROPY EU - 48', 1, 1, NULL),
('1233', 'PR FYFFES STDWR 54', 1, 1, NULL),
('1239', 'DARIEN BVC*', 1, 2, NULL),
('1242', 'DARIEN 54*', 1, 2, NULL),
('1243', 'DARIEN BVC 54*', 1, 2, NULL),
('1253', 'PR ALDI RAINFOREST', 0.94, 1, NULL),
('1255', 'MIX TROPY RAINFORES 17 KLOS', 0.94, 1, NULL),
('1259', 'PR CHIQUITA RAC BANAVAC 54 REF', 1, 1, NULL),
('1268', 'PR CHIQUITA RAC BAN -', 1, 1, NULL),
('1271', 'FT FT22X5 EU*', 1, 6, NULL),
('1278', 'MENOR ESPECIFICACION FYFFES 13 KL CLUSTER BAG', 0.7, 1, NULL),
('1283', 'PR DERBY BANANAS -', 1, 1, NULL),
('1285', 'PR DERBY BANANAS RA', 1, 1, NULL),
('1287', 'PR ORSERO EUROMINI 17 KGS', 0.95, 1, NULL),
('1290', 'FT PLUSFT5', 1, 1, NULL),
('1292', 'PR YELLOW RAINFOREST MOTTED', 1, 1, NULL),
('1298', 'FT JSFTIF17-55EU', 0.94, 1, NULL),
('1303', 'MENOR ESPECIFICACION DEDO SUELTO 10 LBS.', 0.25, 2, NULL),
('1304', 'PR ORSERO BANANAS', 1, 1, NULL),
('1313', 'FT - MHFTF517 - 55 EU', 0.94, 1, NULL),
('1316', 'FT - DELMONTE - 54 EU', 1, 1, NULL),
('1320', 'SEGUNDA BANAKING BVC - 54', 1, 1, NULL),
('1324', 'PR GOODFARMER 4 HANDS 13.5 K', 0.74, 1, NULL),
('1327', 'PR GOODFARMER 6 HANDS 13.5 K', 0.74, 1, NULL),
('1328', 'PR GOODFARMER 5 HANDS 13.5 K', 0.74, 1, NULL),
('1329', 'FT TROPY 17 KGS - 55 EU', 0.94, 1, NULL),
('1333', 'PR GOODFARMER 5 HANDS 13.5 K -', 0.74, 1, NULL),
('1336', 'PR BANANAS KRAFT SIN SELLO - 5', 1, 1, NULL),
('1339', 'MENOR ESPECIFICACION ME BANANEN EVERY DAY', 1, 2, NULL),
('1341', 'MENOR ESPECIFICACION - BANANAS 5 DEDOS', 1, 2, NULL),
('1342', 'MENOR ESPECIFICACION ME SIMBARICA 6 DEDO', 1, 2, NULL),
('1345', 'PR BAHIA HD RAINFOREST', 1, 1, NULL),
('1350', 'FT DELMONTE 17 KGS-EU-55', 0.94, 1, NULL),
('1351', 'MENOR ESPECIFICACION YUMMYBAN UCRANIA BANANAS 54', 1, 2, NULL),
('1353', 'FT JS - FAIR TRADE 17K EU - 55', 0.94, 1, NULL),
('1354', 'FT JSFTX5 17 K EU -55', 0.94, 1, NULL),
('1355', 'FT JS FAIR TRADE 17K JSFTB13K', 0.94, 1, NULL),
('1356', 'MHFT17-EU-55', 0.94, 1, NULL),
('1357', 'FT DELMONTE 17 KGS-EU-55 -', 0.94, 1, NULL),
('1359', 'MENOR ESPECIFICACION - YUMMYBAN UCRANIA BA', 1, 2, NULL),
('1361', 'MENOR ESPICIFICACION - YUMMYBAN UCRANIA BANANAS 54', 1, 2, NULL),
('200', 'CLUSTER BAG DEDO SUELTO LARGO KILOS 20', 1, 1, NULL),
('354', 'PRIMERA NORMAL TROPICAL  EDEN EUROBOX KILOS 20', 1, 1, NULL),
('376', 'PREMIUM BANANAS EN BAG PALLET EUROPA URA', 1, 1, NULL),
('392', 'MENOR ESPECIFICACION CLUSTER BAG QUAD PACK KILOS 20', 1, 1, NULL),
('426', 'TROPICAL EDEN EUROBOX 80*120', 1, 1, NULL),
('462', 'SEGUNDA DARIEN BVC 20 KLOS', 1, 2, NULL),
('474', 'SELECT SUN SWEET', 1, 1, NULL),
('489', 'PREMIUM TURBANA ECUADOR', 1, 1, NULL),
('494', 'PRIMERA NORMAL IRANI ESTRELLA KILOS 20', 0.71, 1, NULL),
('511', '13 KLS MANOS TURBANA KILOS', 0.71, 1, NULL),
('512', 'PRIMERA NORMAL FYFFES EUROBOX KILOS 20', 1, 1, NULL),
('519', 'SEVEN BBANANAS PACK', 1, 1, NULL),
('528', 'PR FYFF EUBOX 20 K45', 1, 1, NULL),
('534', 'PRIMERA NORMAL TURBANA PALLET KILOS 20', 1, 1, NULL),
('538', 'PRIMERA NORMAL FYFFES 20 KILOS KILOS 20', 1, 1, NULL),
('540', 'PRIMERA NORMAL BLANCOS BAG KILOS 20', 1, 1, NULL),
('542', 'FREDY FYFFES 20 KL BAG KILOS', 1, 6, NULL),
('545', 'PRIMERA NORMAL FYFFES CL B 48 KILOS 20', 1, 1, NULL),
('550', 'PR TURBANA EUROPA 18.14 KG - 48', 1, 1, NULL),
('552', '1B FREDY FYFFES BAG 22 18.14 KG - 48 SM', 1, 1, NULL),
('553', 'PR FYFFES STD 18.14 KG -48 SM', 1, 1, NULL),
('554', 'SEVEN BANANAS PACK', 1, 1, NULL),
('559', 'CLUSTERT BAG 12X1 KG EXPOCARIBE', 0.71, 1, NULL),
('562', 'PRIMERA NORMAL IRANI FRUTTIA KILOS 20', 0.71, 1, NULL),
('568', 'DOLE USA', 1, 1, NULL),
('574', 'FLO FT EUROPA 18.14 KG - FT', 1, 6, NULL),
('575', 'DARIEN KILOS', 1, 2, NULL),
('584', 'PRIMERA NORMAL STOP AND SHOP KILOS 20', 1, 1, NULL),
('587', 'PRIMERA NORMAL BONI BAG KILOS 20', 1, 1, NULL),
('589', 'PRIMERA NORMAL DON CARLOS KILOS 20', 1, 1, NULL),
('595', '13 KLS MANO ENTER EXPOCA-56', 0.71, 1, NULL),
('601', 'SEVEN BANANAS BLANCO BAG -48', 1, 1, NULL),
('603', '1B 7-BANANAS BLANCO BAG 22 18.14 KG SM -48', 1, 1, NULL),
('604', 'CLUSTER BAG DOLPHIN BAG KILOS 20', 1, 1, NULL),
('608', 'PRIMERA NORMAL TURBANA PREMIUM KILOS 20', 1, 1, NULL),
('609', 'PRIMERA CLUSTER BAG KILOS 20', 1, 1, NULL),
('610', 'PRIMERA NORMAL FIVE A DAY PREMIUM KILOS 20', 1, 1, NULL),
('611', 'PRIMERA NORMAL PRICE CHOPPER KILOS 20', 1, 1, NULL),
('612', 'KORA KILOS', 1, 1, NULL),
('613', 'PRIMERA NORMAL PREMIUM TROPY KILOS 20', 1, 1, NULL),
('614', 'SEGUNDA DARIEN ESTÁNDAR KILOS 20', 1, 2, NULL),
('615', 'DARIEN BAG (SEGUNDA)', 1, 2, NULL),
('616', 'SEGUNDA DARIEN 3 LIBRAS KILOS 17', 1, 2, NULL),
('617', 'PRIMERA NORMAL WEISS PREMIUM KILOS 20', 1, 1, NULL),
('618', 'PRIMERA NORMAL UNIFRUIT KILOS 20', 1, 1, NULL),
('619', 'PRIMERA NORMAL TURBANA SPOT KILOS 20', 1, 1, NULL),
('620', 'PRIMERA NORMAL GIOIA KILOS 20', 1, 1, NULL),
('621', 'PRIMERA NORMAL COMACO KILOS 20', 1, 1, NULL),
('624', 'PRIMERA DOLE USA  KILOS 20', 1, 1, NULL),
('625', 'PRIMERA NORMAL SHURFINE PREMIUM KILOS 20', 1, 1, NULL),
('626', 'PREMIUM FAIR TRADE USA', 1, 1, NULL),
('627', 'CLUSTER BAG FREDY FYFFES 13 KL BAG KILOS 13', 0.74, 1, NULL),
('629', 'PRIMERA NORMAL FAIR TRADE BAG KILOS 20', 1, 1, NULL),
('630', 'PRIMERA NORMAL ANITA PREMIUM KILOS 20', 1, 1, NULL),
('631', '1B FREDY FYFFES BAG 16 13 KG SM - 60', 0.71, 1, NULL),
('637', 'PRIMERA NORMAL FYFFES EUROBOX CHEP KILOS 20', 1, 1, NULL),
('638', 'PRIMERA NORMAL DOLE PREMIO POLYPAC KILOS 20', 1, 1, NULL),
('642', 'CLUSTER BAG FYFFES 13 KLS CLUSTER KILOS 13', 0.71, 1, NULL),
('645', 'PRIMERA NORMAL FYFFES BAG BLANK KILOS 20', 1, 1, NULL),
('649', 'DECO BAG KILOS', 1, 1, NULL),
('650', 'FREDDY FYFFES USA', 1, 6, NULL),
('654', 'CLUSTER BAG DEDO SUELTO CORTO KILOS', 1, 1, NULL),
('655', 'NATURAL TASTY INV. KILOS', 1, 1, NULL),
('656', 'PRIMERA NORMAL PREMIUM HOYA EUROBOX KILOS 20', 1, 1, NULL),
('657', 'PR FYFFES 12.7K -60 SM', 0.71, 1, NULL),
('658', 'PR FYFFE BAG BLANCO 18.14K SM - 48', 1, 1, NULL),
('660', 'PR BONI BAG 18.14K SM-48', 1, 1, NULL),
('661', 'PR FYFFES PRINTED BAG SM-48', 1, 1, NULL),
('663', 'FYFFES SMOLL BAG KILOS', 0.71, 1, NULL),
('665', 'TURBANA 5 LIBRAS KILOS 20', 0.14, 1, NULL),
('667', 'PRIMERA NORMAL DELMONTE ITALIANO KILOS 21', 1, 1, NULL),
('668', 'PR BANASUN', 1, 1, NULL),
('669', 'PRIMERA NORMAL DISNEY PREMIUM KILOS 20', 1, 1, NULL),
('670', 'PR HOYA 12.7 KG SM -60', 0.71, 1, NULL),
('673', 'PRIMERA NORMAL PREMIUM HOYA ESTÁNDAR KILOS 20', 1, 1, NULL),
('674', 'FYFFES HD  KILOS', 1, 1, NULL),
('675', 'JS FAIR TRADE 17 KG EU-50', 0.94, 1, NULL),
('676', 'SAINSBURY EUROPA KILOS', 0.94, 1, NULL),
('678', 'FYFFES 13KL C BAG UK KILOS', 0.72, 1, NULL),
('679', 'PRIMERA NORMAL TURBANA PRMIUN KILOS 20', 1, 1, NULL),
('681', 'PR ASDA CHEP 17 K', 0.94, 1, NULL),
('682', 'PRIMERA NORMAL PR TURBANA HD KILOS 20', 1, 1, NULL),
('683', 'PRIMERA NORMAL FYFFES HD  KILOS 20', 1, 1, NULL),
('685', 'CLUSTER BAG JUNIOR DISNEY KILOS 20', 1, 1, NULL),
('686', 'PRIMERA NORMAL  DIAMANTE HD KILOS 20', 1, 1, NULL),
('687', 'CHIQUITA BANAVACK EUROPALLET', 1, 1, NULL),
('688', 'CLUSTER BAG DISNEY PREMIUN BAG KILOS 20', 1, 1, NULL),
('689', 'PRIMERA NORMAL FRUIT DU MONDE KILOS 20', 1, 1, NULL),
('690', 'PRIMERA NORMAL ASDA  KILOS 17', 0.95, 1, NULL),
('691', 'JS FAIRTRADE 17K SM - 55', 0.94, 1, NULL),
('692', 'CLUSTER BAG BLANCO 7 18.14 KGS KILOS 20', 1, 1, NULL),
('693', 'PRIMERA NORMAL TURBANA BANA FRESH KILOS 20', 1, 1, NULL),
('694', 'PRIMERA MED STDHD NORMAL FYFFES KILOS 20 SIN SELLO', 1, 1, NULL),
('695', 'PR TURBANA HANDS 13K SM - 56', 0.71, 1, NULL),
('696', 'CLUSTER BAG COOP 7 KILOS 13', 0.74, 1, NULL),
('698', 'PRFYFFES STD 18.14 K ALTA VENTILACIÓN', 1, 1, NULL),
('699', 'PRIMERA NORMAL RIO GRANDE  KILOS 20', 1, 1, NULL),
('700', 'RACIMO BANANO ENMEPADO', 1, 1, NULL),
('701', 'FAIR TRADE 12 KG-SM', 0.66, 6, NULL),
('702', 'FLO FT EUROPA 18.14 KG - FT -', 1, 6, NULL),
('703', 'ORGANICO BAG NAKED', 1, 1, NULL),
('704', 'FAIR TRADE 13 KG-UR', 0.72, 6, NULL),
('705', 'PR BANANEC MEDIT EURO KILOS 20', 1, 1, NULL),
('706', 'PR BANANEC MEDIT PAL KILOS 20', 1, 1, NULL),
('707', 'FAITRADE 3LB BAG USA', 1, 6, NULL),
('708', 'FAIR TRADE BAG 13 KLS', 0.72, 6, NULL),
('709', 'BLANC BAG TURBANA SM', 1, 1, NULL),
('710', 'FLO FT 12 BAG 15 KLS', 0.83, 6, NULL),
('711', 'FLO FT 12 BAG 15 KLS SM', 0.83, 6, NULL),
('712', 'PRIMERA NORMAL DOLPHIN HD KILOS 20', 1, 1, NULL),
('713', 'SEGUNDA DARIEN ESTÁNDAR KILOS 20 -', 1, 2, NULL),
('714', 'PRIMERA NORMAL TURBANA PREMIUM KILOS 20 -', 1, 1, NULL),
('716', 'PR FYFFE PEV-EURO-45', 1, 1, NULL),
('717', 'PRIMERA NORMAL TROPY DARIÉN KILOS 20', 1, 1, NULL),
('719', 'FLO FT 20BAG MORRISONS', 1, 6, NULL),
('720', 'CLUSTER BAG TURBANA BAG 3LBS KILOS 20', 1, 1, NULL),
('7200', 'DEL MONTE PB-EU DM-COVER PP', 1, 1, NULL),
('721', 'DEL MONTE PB EU DM-COVER BVC', 1, 1, NULL),
('7210', 'DEL MONTE PB-EU DM-COVER B.BULK PP', 1, 1, NULL),
('7215', 'DEL MONTE PB-EU DM-COVER B.BULK BVC', 1, 1, NULL),
('722', 'COSTCO TB-BAG 3 LBS', 1, 1, NULL),
('7220', 'DEL MONTE EUROBOX-EU EEPB6 B.BULK', 1, 1, NULL),
('7225', 'DEL MONTE EUROBOX-EU EEPB6', 1, 1, NULL),
('723', 'FAIRTRADE PINTED BAG 13KG', 0.72, 6, NULL),
('7230', 'DEL MONTE PB-UK DM-COVER BVC', 1, 1, NULL),
('7235', 'DEL MONTE PREMIUM EUROMINI', 1, 1, NULL),
('724', 'FLO FT 24BAG MORRISONS', 1, 6, NULL),
('7240', 'DEL MONTE PB-DM-COVER BVC B.BULK', 1, 1, NULL),
('7245', 'DEL MONTE PB-EU DM-COVER BVC', 1, 1, NULL),
('725', 'CLUSTER BAG FYFFES 3 LBS BAG KILOS 20', 1, 1, NULL),
('726', 'PRIMERA NORMAL DOLE PREMIO BANAVAC KILOS 20', 1, 1, NULL),
('727', 'TROPY PREMIO', 1, 1, NULL),
('7270', 'UTC PB-EU DM-COVER BVC', 1, 1, NULL),
('7275', 'UTC PB-EU DM-COVER PP', 1, 1, NULL),
('728', 'ELABORADO MERCADO NACIONAL LARGO UNIBAN', 1, 1, NULL),
('7280', 'UTC PB-EU DM-COVER B.BULK PP', 1, 1, NULL),
('7285', 'UTC EUROPEO GRANEL BVC', 1, 1, NULL),
('729', 'ELABORADO DEDO SUELTO 25 KLS', 1, 1, NULL),
('730', 'RECH 20 KLS MDO NAL', 1, 1, NULL),
('7300', 'DEL MONTE PREMIUM ITALIANO', 1, 1, NULL),
('731', 'RECH 13 KLS MDO NAL', 0.71, 1, NULL),
('732', 'PR DOLE MEDITERRANEO PALLET', 1, 1, NULL),
('733', 'PR DOLE MED. GRANEL', 1, 1, NULL),
('7330', 'UTC ITALIANO DM-COVER', 1, 1, NULL),
('734', 'TURBANA 4 LBS', 1, 1, NULL),
('735', 'CLUSTER BAG 1B CLUSTER BAG KILOS 15', 0.84, 1, NULL),
('736', 'ANITA SPOT COMACO', 1, 1, NULL),
('737', 'PRIMERA NORMAL FYFFES EUROBOX KILOS 20 -', 1, 1, NULL),
('738', 'PR PLOP BAG SM-48', 1, 1, NULL),
('739', 'BUMPER PACK', 0.74, 1, NULL),
('740', 'CLUSTER BAG DOLE EXTRA SF-95 BANAVAC KILOS', 1, 1, NULL),
('741', 'DOLE CABANITA BANAVAC KILOS', 1, 1, NULL),
('742', 'PR DON MARIO KILOS', 1, 1, NULL),
('743', 'CLUSTER BAG MORRISONS BUMPER PACK KILOS 13', 0.71, 1, NULL),
('744', 'PRIMERA NORMAL PREMIUM LOBLAW KILOS 20', 1, 1, NULL),
('745', 'FT WHOLE FOODS', 1, 6, NULL),
('746', 'PRIMERA NORMAL PREMIUM TROPY HD KILOS 20', 1, 1, NULL),
('747', 'MORRISON 16 MOR8', 1, 1, NULL),
('748', 'FLO FT 13 BAG 16.5 K', 0.91, 6, NULL),
('749', 'PRIMERA NORMAL DOLE BAJELLA BANAVAC  KILOS 20', 1, 1, NULL),
('750', 'PR TROPICAL EDEN -48', 1, 1, NULL),
('767', 'FT 14 KLS- 75 DEDOS', 0.77, 6, NULL),
('771', 'CLUSTER BAG 1B-ASDA GARDEN 15CB8 KILOS 15', 0.79, 1, NULL),
('780', 'MI CASA', 1, 1, NULL),
('781', 'BAHIA SPOT COMACO EUROPALLET 20K BANAV', 1, 1, NULL),
('783', 'PR TURBANA COLOMBIA', 1, 1, NULL),
('794', 'FT 13 KLS 16CB7 BAG', 0.71, 6, NULL),
('799', 'JS FAIR TRADE EU-50', 0.94, 1, NULL),
('8100', '5 A DAY USA', 1, 1, NULL),
('811', 'PREMIUM TURBANA NEW LOGO 48 KILOS 20', 1, 1, NULL),
('8118', 'PRIMERA NORMAL DOLE EXTRA SF-95 POLYPACK KILOS 20', 1, 1, NULL),
('8123', 'CLUSTER BAG DOLE BARE CLUSTER BAG KILOS 20', 1, 1, NULL),
('8124', 'SEGUNDA NORMAL DOLE BAJELLA POLYPACK KILOS 20', 1, 2, NULL),
('8125', 'PRIMERA NORMAL DOLE FIRST PRICE KILOS 20', 1, 1, NULL),
('8127', 'PRIMERA NORMAL DOLE FIRST PRICE KILOS 21', 1, 1, NULL),
('8136', 'PRIMERA NORMAL DOLE CABANITA POLYPACK KILOS 20', 1, 1, NULL),
('817', 'DEDO SUELTO CORTO', 1, 1, NULL),
('818', 'FT WHOLE FOODS -', 1, 6, NULL),
('820', 'PREMIUM UNIFRUIT KRAFT 20 KLOS', 1, 1, NULL),
('823', 'PRIMERA TROPY KRAFT', 1, 1, NULL),
('833', 'FLO FT 13 BAG 16.5 K -', 0.91, 6, NULL),
('834', 'FT-WAITROSE 17', 0.94, 6, NULL),
('839', 'FAIRTRADE 3 LB BAG USA', 1, 6, NULL),
('840', 'PRIMERA B FYFFES 12.7 KL 60 13 KLS CLUSTERG', 0.72, 1, NULL),
('844', 'FAIR TRADE 18 KL', 1, 6, NULL),
('845', 'FLO FT EUROPEA 18.14 KG - FTMH18', 1, 6, NULL),
('847', 'PR SUPREME MEDIT EUR', 1, 1, NULL),
('851', 'PRIMERA TROPY MEDITERRANEO PACIFIC', 1, 1, NULL),
('853', 'FLO TROPY HD', 1, 6, NULL),
('862', 'DEL MONTE  FRANCIA PB EU DM-COVER BVC', 1, 1, NULL),
('863', 'FLO FT EUROPA 18.14 KG - FT18', 1, 6, NULL),
('865', 'FT SMALL 13 KG', 0.71, 6, NULL),
('868', 'SEGUNDA HAPPY BANANAS', 1, 2, NULL),
('877', 'FTJS FAIR T17K EU-50', 0.94, 6, NULL),
('878', 'FT 13 BAG 16.5 K', 0.91, 6, NULL),
('880', 'DOLE PREMIUM', 1, 1, NULL),
('882', 'PRIMERA DOLE BAJELLA POLYPACK 20 KLOS', 1, 1, NULL),
('883', 'PREMIO BAJELLA POLYPACK', 1, 1, NULL),
('887', 'DEL MONTE  PORTUGAL PB EU DM-COVER BVC', 1, 1, NULL),
('888', 'SELEC ORSERO BANANAS', 1, 1, NULL),
('889', 'SELEC ORSERO BANANAS -', 1, 1, NULL),
('891', 'FT PRIMERA WAITROSD 17 KILOS', 0.94, 6, NULL),
('897', 'FT EUROPA 18.14 KLOS FTNS', 1, 6, NULL),
('906', 'PRIMERA ASDA 17 KLOS', 0.94, 1, NULL),
('9100', 'DM USA', 1, 1, NULL),
('9110', 'ROSY', 1, 1, NULL),
('9120', '3 LBS BAG', 1, 1, NULL),
('913', 'PR AS17 NEW', 0.95, 1, NULL),
('9135', 'U.T.C', 1, 1, NULL),
('918', 'FT PRIMERA ST FIRE 3 LIBRAS BAG', 1, 6, NULL),
('919', 'FT PRIMERA WHOLE FOODS', 1, 6, NULL),
('9200', 'DM 27 BD PALLET POLYPACK', 1, 1, NULL),
('9210', 'DM GRANEL', 1, 1, NULL),
('9220', 'EUROBOX', 1, 1, NULL),
('9225', 'DM EUBOX-EU-EEPB-6', 1, 1, NULL),
('9230', 'DM PALLET', 1, 1, NULL),
('9245', 'DM PALLET BVC', 1, 1, NULL),
('9260', 'ROSY PALLET BVC', 1, 1, NULL),
('9270', 'U.T.C PALLET BVC', 1, 1, NULL),
('9275', 'U.T.C PALLET POLY P.', 1, 1, NULL),
('9280', 'U.T.C GRANEL', 1, 1, NULL),
('930', 'PRIMERA TROPY HD KRAFT', 1, 1, NULL),
('9300', 'DM ITALIANO', 1, 1, NULL),
('9330', 'UTC MEDITERRANEO BVC PALLET', 1, 1, NULL),
('934', 'PR BAHIA HDSIN SELLO', 1, 1, NULL),
('935', 'PR SIMBA BANANAS', 1, 1, NULL),
('942', 'PRIMERA SLOBANA PREMIUM HD', 1, 1, NULL),
('945', 'PR FYFFES STD - HD', 1, 1, NULL),
('946', 'PR FYFFES MED 18.14', 1, 1, NULL),
('947', 'SELECT PEV FYFFES 18K', 1, 1, NULL),
('950', 'FT WALTROSE  17', 0.94, 6, NULL),
('956', 'PR CONAD', 1, 1, NULL),
('96', 'FRUTA PREMIUN BANANAS 1 X 1', 1, 3, NULL),
('960', 'FT 14 CB 6 EU-60 BAG', 0.78, 6, NULL),
('967', 'FT FAIRTRADE FTFY18 20 KLOS', 1, 6, NULL),
('97', 'FRUTA MERCADO NACIONAL ESPECIAL', 1, 3, NULL),
('970', 'PR SUPREME MEDIT EUR (BANAFRUT) ', 1, 1, NULL),
('972', 'FTJS FAIR T17K EU-50 -', 0.94, 6, NULL),
('975', 'PR SUPREME MEDIT EUR -', 1, 1, NULL),
('98', 'FRUTA PREMIUN FRUTICA', 1, 4, NULL),
('983', 'FT PRIMERA WAITROSD 17 KILOS -', 0.94, 6, NULL),
('985', 'FT DOCE KILOS', 0.66, 6, NULL),
('99', 'FRUTA CATEGORIA II FRUTICA ', 1, 5, NULL),
('991', 'FT TEFTB 15 EU-50 17 KL BAG', 0.94, 6, NULL),
('999', 'JS FAIR TRADE 17K E', 0.94, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcargue`
--

DROP TABLE IF EXISTS `tblcargue`;
CREATE TABLE `tblcargue` (
  `PKId_Cargue` int(11) NOT NULL,
  `FKIbm_TblFincas` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `FKDocumento_TblClientes` varchar(11) CHARACTER SET utf8mb4 NOT NULL,
  `Fecha_Cargue` date NOT NULL,
  `N_Poma` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `Placa_Vehiculo` varchar(8) CHARACTER SET utf8mb4 NOT NULL,
  `Conductor` varchar(200) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcintas`
--

DROP TABLE IF EXISTS `tblcintas`;
CREATE TABLE `tblcintas` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblcintas`
--

INSERT INTO `tblcintas` (`PKId`, `Descripcion`) VALUES
(1, 'CAFÉ'),
(2, 'NEGRA'),
(3, 'NARANJA'),
(4, 'VERDE'),
(5, 'AMARILLA'),
(6, 'BLANCA'),
(7, 'AZUL'),
(8, 'GRIS'),
(9, 'MORADA'),
(10, 'ROJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblclasificacion`
--

DROP TABLE IF EXISTS `tblclasificacion`;
CREATE TABLE `tblclasificacion` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblclientes`
--

DROP TABLE IF EXISTS `tblclientes`;
CREATE TABLE `tblclientes` (
  `PKDocumento` varchar(11) CHARACTER SET utf8mb4 NOT NULL,
  `Nombres` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Telefono` varchar(10) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tblcargue`
--

DROP TABLE IF EXISTS `tbldet_tblcargue`;
CREATE TABLE `tbldet_tblcargue` (
  `PKId` int(11) NOT NULL,
  `FKId_Cargue_TblCargue` int(11) NOT NULL,
  `FKId_TblMercadoNacional` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tbldet_tblproduccion`
--

DROP TABLE IF EXISTS `tbldet_tbldet_tblproduccion`;
CREATE TABLE `tbldet_tbldet_tblproduccion` (
  `PKId` int(11) NOT NULL,
  `FKId_TblDet_TblProduccion` int(11) NOT NULL,
  `FKCodigo_TblCajasProduccion` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `N_CajasProducidas_Dia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbldet_tbldet_tblproduccion`
--

INSERT INTO `tbldet_tbldet_tblproduccion` (`PKId`, `FKId_TblDet_TblProduccion`, `FKCodigo_TblCajasProduccion`, `N_CajasProducidas_Dia`) VALUES
(1, 1, '1339', 36),
(2, 1, '1242', 15),
(3, 1, '1313', 220),
(4, 1, '1081', 35),
(5, 1, '1355', 110),
(6, 1, '1014', 162),
(7, 1, '1017', 216),
(8, 1, '1329', 110),
(9, 1, '1290', 270),
(10, 2, '1243', 30),
(11, 2, '1339', 3),
(12, 2, '1081', 34),
(13, 2, '1355', 55),
(14, 2, '1271', 216),
(15, 2, '1357', 495),
(16, 3, '1141', 20),
(17, 3, '1313', 440),
(18, 3, '1355', 165),
(19, 3, '1329', 110),
(20, 3, '1361', 91);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tbldet_tblracimos_tbldias`
--

DROP TABLE IF EXISTS `tbldet_tbldet_tblracimos_tbldias`;
CREATE TABLE `tbldet_tbldet_tblracimos_tbldias` (
  `PKId` int(11) NOT NULL,
  `FKId_TblDet_TblRacimos_TblDias` int(11) NOT NULL,
  `FKId_TblCintas` int(11) NOT NULL,
  `FKId_TblLotes` int(11) NOT NULL,
  `N_RacimosC_Cintas_Lotes` int(11) NOT NULL,
  `N_RacimosR_Cintas_Lotes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbldet_tbldet_tblracimos_tbldias`
--

INSERT INTO `tbldet_tbldet_tblracimos_tbldias` (`PKId`, `FKId_TblDet_TblRacimos_TblDias`, `FKId_TblCintas`, `FKId_TblLotes`, `N_RacimosC_Cintas_Lotes`, `N_RacimosR_Cintas_Lotes`) VALUES
(1, 1, 6, 5, 72, 2),
(2, 1, 6, 11, 50, 2),
(3, 1, 6, 16, 50, 1),
(4, 1, 7, 6, 115, 1),
(5, 1, 7, 11, 115, 1),
(6, 1, 7, 16, 115, 1),
(7, 1, 7, 17, 115, 1),
(8, 1, 7, 24, 115, 0),
(9, 1, 7, 23, 115, 0),
(10, 1, 8, 5, 46, 0),
(11, 1, 8, 11, 46, 1),
(12, 1, 8, 16, 46, 0),
(13, 1, 8, 17, 46, 0),
(14, 1, 8, 23, 46, 2),
(15, 1, 8, 24, 45, 0),
(16, 1, 9, 5, 3, 0),
(17, 1, 9, 11, 3, 0),
(18, 1, 9, 16, 3, 0),
(19, 1, 9, 17, 3, 0),
(20, 1, 9, 23, 3, 0),
(21, 1, 9, 24, 3, 0),
(22, 2, 6, 6, 19, 0),
(23, 2, 6, 7, 19, 0),
(24, 2, 6, 8, 19, 1),
(25, 2, 6, 9, 18, 0),
(26, 2, 6, 18, 18, 1),
(27, 2, 6, 19, 18, 0),
(28, 2, 6, 20, 18, 0),
(29, 2, 6, 21, 18, 0),
(30, 2, 6, 6, 58, 0),
(31, 2, 6, 7, 58, 0),
(32, 2, 6, 8, 58, 0),
(33, 2, 6, 9, 58, 0),
(34, 2, 6, 18, 58, 0),
(35, 2, 6, 19, 57, 0),
(36, 2, 6, 20, 57, 0),
(37, 2, 6, 21, 57, 0),
(38, 2, 8, 6, 30, 0),
(39, 2, 8, 7, 30, 0),
(40, 2, 8, 8, 30, 0),
(41, 2, 8, 9, 30, 0),
(42, 2, 8, 18, 30, 0),
(43, 2, 8, 19, 30, 0),
(44, 2, 8, 20, 30, 0),
(45, 2, 8, 21, 29, 0),
(46, 2, 9, 7, 15, 0),
(47, 2, 9, 21, 20, 2),
(48, 3, 6, 2, 14, 0),
(49, 3, 6, 10, 14, 0),
(50, 3, 6, 12, 14, 0),
(51, 3, 6, 13, 14, 0),
(52, 3, 6, 14, 14, 0),
(53, 3, 6, 15, 14, 0),
(54, 3, 6, 20, 14, 1),
(55, 3, 6, 21, 12, 0),
(56, 3, 6, 2, 60, 1),
(57, 3, 6, 10, 60, 1),
(58, 3, 6, 12, 60, 0),
(59, 3, 6, 13, 60, 6),
(60, 3, 6, 14, 60, 0),
(61, 3, 6, 15, 55, 0),
(62, 3, 6, 20, 60, 2),
(63, 3, 6, 21, 60, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tblembarque`
--

DROP TABLE IF EXISTS `tbldet_tblembarque`;
CREATE TABLE `tbldet_tblembarque` (
  `PKId` int(11) NOT NULL,
  `FKCod_TblEmbarque` varchar(8) CHARACTER SET utf8mb4 NOT NULL,
  `FKIbm_TblFincas` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `FKCodigo_TblCajasProduccion` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tblproduccion`
--

DROP TABLE IF EXISTS `tbldet_tblproduccion`;
CREATE TABLE `tbldet_tblproduccion` (
  `PKId` int(11) NOT NULL,
  `FKId_TblProduccion` int(11) NOT NULL,
  `FKId_TblDias` int(11) NOT NULL,
  `Total_CE_Dia` int(11) DEFAULT NULL,
  `Total_CR_Dia` int(11) DEFAULT NULL,
  `Total_CEx_Dia` int(11) DEFAULT NULL,
  `Ratio` float DEFAULT NULL,
  `Merma` float DEFAULT NULL,
  `Peso_Racimos` float DEFAULT NULL,
  `Area_Recorrida` float DEFAULT NULL,
  `Peso_Vastago` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbldet_tblproduccion`
--

INSERT INTO `tbldet_tblproduccion` (`PKId`, `FKId_TblProduccion`, `FKId_TblDias`, `Total_CE_Dia`, `Total_CR_Dia`, `Total_CEx_Dia`, `Ratio`, `Merma`, `Peso_Racimos`, `Area_Recorrida`, `Peso_Vastago`) VALUES
(1, 1, 1, 1174, 0, 1174, 1.03, 10, 20.4, 42.09, 2),
(2, 1, 2, 833, 2, 831, 0.94, 14, 23.9, 37.11, 2.4),
(3, 1, 3, 826, 109, 717, 1.13, 14.2, 23, 33.1, 2.3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tblracimos_tbldias`
--

DROP TABLE IF EXISTS `tbldet_tblracimos_tbldias`;
CREATE TABLE `tbldet_tblracimos_tbldias` (
  `PKId` int(11) NOT NULL,
  `FKId_TblRacimos` int(11) NOT NULL,
  `FKId_TblDias` int(11) NOT NULL,
  `N_RacimosC_Dia` int(11) NOT NULL,
  `N_RacimosR_Dia` int(11) NOT NULL,
  `Total_PEmbarque` int(11) NOT NULL,
  `Total_POtrasFincas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbldet_tblracimos_tbldias`
--

INSERT INTO `tbldet_tblracimos_tbldias` (`PKId`, `FKId_TblRacimos`, `FKId_TblDias`, `N_RacimosC_Dia`, `N_RacimosR_Dia`, `Total_PEmbarque`, `Total_POtrasFincas`) VALUES
(1, 1, 1, 1155, 11, 42, 5),
(2, 1, 2, 892, 8, 31, 0),
(3, 1, 3, 740, 10, 30, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldias`
--

DROP TABLE IF EXISTS `tbldias`;
CREATE TABLE `tbldias` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbldias`
--

INSERT INTO `tbldias` (`PKId`, `Descripcion`) VALUES
(1, 'LUNES'),
(2, 'MARTES'),
(3, 'MIERCOLES'),
(4, 'JUEVES'),
(5, 'VIERNES'),
(6, 'SÁBADO'),
(7, 'DOMINGO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblembarque`
--

DROP TABLE IF EXISTS `tblembarque`;
CREATE TABLE `tblembarque` (
  `PKCod` varchar(8) CHARACTER SET utf8mb4 NOT NULL,
  `FKId_TblSemanas` int(11) NOT NULL,
  `Anho` varchar(5) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblembolse`
--

DROP TABLE IF EXISTS `tblembolse`;
CREATE TABLE `tblembolse` (
  `PKId` int(11) NOT NULL,
  `FKId_TblSemanas` int(11) NOT NULL,
  `N_PlantasPrematuro` int(11) NOT NULL,
  `N_PlantasPresente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblembolse`
--

INSERT INTO `tblembolse` (`PKId`, `FKId_TblSemanas`, `N_PlantasPrematuro`, `N_PlantasPresente`) VALUES
(1, 50, 7510, 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempresas`
--

DROP TABLE IF EXISTS `tblempresas`;
CREATE TABLE `tblempresas` (
  `PKNit` varchar(11) CHARACTER SET utf8mb4 NOT NULL,
  `Nombre` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Direccion` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Telefono` varchar(10) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblempresas`
--

INSERT INTO `tblempresas` (`PKNit`, `Nombre`, `Direccion`, `Telefono`) VALUES
('811032708-5', 'AGRÍCOLA GUAIMARAL S.A.S', 'CRA 99 NO. 105B-11 BARRIO ORTÍZ', '2662861'),
('900305092-2', 'AGRÍCOLA MONTESOL S.A.S', 'CALLE 18 NO. 35-69 AV. LAS PALMAS', '2662861'),
('900306440-7', 'AGRÍCOLA YUMANÁ S.A.S', 'CALLE 18 NO. 35-69 AV. LAS PALMAS', '2662861'),
('900645788-8', 'BANANERAS AGROFUTURO S.A.S', 'CALLE 18 NO. 35-69 AV. LAS PALMAS', '2662861');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblestadousuario`
--

DROP TABLE IF EXISTS `tblestadousuario`;
CREATE TABLE `tblestadousuario` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblestadousuario`
--

INSERT INTO `tblestadousuario` (`PKId`, `Descripcion`) VALUES
(1, 'ACTIVO'),
(2, 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblestimativo`
--

DROP TABLE IF EXISTS `tblestimativo`;
CREATE TABLE `tblestimativo` (
  `PKId` int(11) NOT NULL,
  `Finca` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Premiun` int(11) DEFAULT NULL,
  `Especial` int(11) DEFAULT NULL,
  `FKCod_TblEmbarque` varchar(8) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblfincas`
--

DROP TABLE IF EXISTS `tblfincas`;
CREATE TABLE `tblfincas` (
  `PKIbm` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `Nombre` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Area_Neta` float NOT NULL,
  `Area_Bruta` float NOT NULL,
  `FKNit_TblEmpresas` varchar(11) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblfincas`
--

INSERT INTO `tblfincas` (`PKIbm`, `Nombre`, `Area_Neta`, `Area_Bruta`, `FKNit_TblEmpresas`) VALUES
('80004', 'TAIWÁN', 64.21, 79.16, '900306440-7'),
('80008', 'KALAMARI', 61.08, 70.49, '900306440-7'),
('80009', 'ZARZAMORA', 58.33, 70.85, '900305092-2'),
('80074', 'ÁLAMOS', 128.47, 150.43, '900645788-8'),
('80075', 'CANDELARIA', 83.08, 100.83, '900645788-8'),
('85747', 'GUAIMARAL', 45.82, 57.9, '811032708-5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbllotes`
--

DROP TABLE IF EXISTS `tbllotes`;
CREATE TABLE `tbllotes` (
  `PKId` int(11) NOT NULL,
  `Lote` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `Area_Neta` float NOT NULL,
  `Area_Bruta` float NOT NULL,
  `FKIbm_TblFincas` varchar(5) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbllotes`
--

INSERT INTO `tbllotes` (`PKId`, `Lote`, `Area_Neta`, `Area_Bruta`, `FKIbm_TblFincas`) VALUES
(1, 'Lote 1', 4.29, 4.94, '80074'),
(2, 'Lote 2', 5.69, 6.49, '80074'),
(3, 'Lote 3', 5.96, 6.78, '80074'),
(4, 'Lote 4', 5.92, 6.42, '80074'),
(5, 'Lote 5', 3.14, 3.94, '80074'),
(6, 'Lote 6', 4.89, 0, '80074'),
(7, 'Lote 7', 5.35, 0, '80074'),
(8, 'Lote 8', 4.2, 0, '80074'),
(9, 'Lote 9', 2.79, 0, '80074'),
(10, 'Lote 10', 4.46, 5.25, '80074'),
(11, 'Lote 11', 4.64, 5.58, '80074'),
(12, 'Lote 12', 5.22, 7.09, '80074'),
(13, 'Lote 13', 6.02, 7.31, '80074'),
(14, 'Lote 14', 7.23, 8.43, '80074'),
(15, 'Lote 15', 6.48, 7.38, '80074'),
(16, 'Lote 16', 3.51, 3.92, '80074'),
(17, 'Lote 17', 2.98, 3.47, '80074'),
(18, 'Lote 18', 3.29, 4.57, '80074'),
(19, 'Lote 19', 4.61, 5.07, '80074'),
(20, 'Lote 20', 5.49, 6.14, '80074'),
(21, 'Lote 21', 4.94, 5.56, '80074'),
(22, 'Lote 22', 9.49, 11.05, '80074'),
(23, 'Lote 23', 9.6, 10.33, '80074'),
(24, 'Lote 24', 8.28, 9.7, '80074'),
(25, 'Lote 1', 6.08, 7.42, '80075'),
(26, 'Lote 2', 3.28, 3.89, '80075'),
(27, 'Lote 3', 4.45, 5.4, '80075'),
(28, 'Lote 4', 4.83, 5.9, '80075'),
(29, 'Lote 5', 4.23, 5.5, '80075'),
(30, 'Lote 6', 4.57, 5.94, '80075'),
(31, 'Lote 7', 4.75, 5.67, '80075'),
(32, 'Lote 8', 6.24, 7.69, '80075'),
(33, 'Lote 9', 3.87, 5.75, '80075'),
(34, 'Lote 10', 3.75, 4.57, '80075'),
(35, 'Lote 11', 4.18, 5.02, '80075'),
(36, 'Lote 12', 3.78, 4.32, '80075'),
(37, 'Lote 13', 3.2, 3.63, '80075'),
(38, 'Lote 14', 2, 2.23, '80075'),
(39, 'Lote 15', 3.2, 3.47, '80075'),
(40, 'Lote 16', 5.21, 6.27, '80075'),
(41, 'Lote 17', 5.83, 6.65, '80075'),
(42, 'Lote 18', 7.15, 7.96, '80075'),
(43, 'Lote 19', 2.48, 3.05, '80075'),
(44, 'Lote 1', 0.96, 1.22, '85747'),
(45, 'Lote 2', 2.15, 2.67, '85747'),
(46, 'Lote 3', 3.22, 3.84, '85747'),
(47, 'Lote 4', 5.62, 6.55, '85747'),
(48, 'Lote 5', 3.55, 4.33, '85747'),
(49, 'Lote 6', 3.7, 4.72, '85747'),
(50, 'Lote 7', 3.3, 4.57, '85747'),
(51, 'Lote 8', 3.2, 4.4, '85747'),
(52, 'Lote 9', 4.45, 5.54, '85747'),
(53, 'Lote 10', 3.73, 4.72, '85747'),
(54, 'Lote 11', 1.85, 2.19, '85747'),
(55, 'Lote 12', 2.63, 3.14, '85747'),
(56, 'Lote 13', 3.46, 4.32, '85747'),
(57, 'Lote 14', 2.65, 4.03, '85747'),
(58, 'Lote 15', 1.35, 1.66, '85747'),
(59, 'Lote 1', 3.68, 3.98, '80008'),
(60, 'Lote 2', 3.42, 3.79, '80008'),
(61, 'Lote 3', 1.61, 2.35, '80008'),
(62, 'Lote 4', 5.34, 6.3, '80008'),
(63, 'Lote 5', 6.83, 8.3, '80008'),
(64, 'Lote 6', 5.27, 5.83, '80008'),
(65, 'Lote 7', 4.52, 5.08, '80008'),
(66, 'Lote 8', 1.25, 1.43, '80008'),
(67, 'Lote 9', 3.06, 3.39, '80008'),
(68, 'Lote 10', 3.66, 4.02, '80008'),
(69, 'Lote 11', 3.6, 4.03, '80008'),
(70, 'Lote 12', 4.18, 4.71, '80008'),
(71, 'Lote 13', 2.57, 2.99, '80008'),
(72, 'Lote 14', 2.45, 3.25, '80008'),
(73, 'Lote 15', 2.78, 3.12, '80008'),
(74, 'Lote 16', 3.56, 4.06, '80008'),
(75, 'Lote 17', 3.3, 3.86, '80008'),
(76, 'Lote 1', 3.22, 4.31, '80004'),
(77, 'Lote 2', 3.15, 3.89, '80004'),
(78, 'Lote 3', 4.36, 5.2, '80004'),
(79, 'Lote 4', 4.14, 5, '80004'),
(80, 'Lote 5', 4.15, 5.03, '80004'),
(81, 'Lote 6', 3.75, 4.78, '80004'),
(82, 'Lote 7', 2.13, 2.54, '80004'),
(83, 'Lote 8', 1.52, 1.84, '80004'),
(84, 'Lote 9', 1.18, 1.5, '80004'),
(85, 'Lote 10', 4.31, 5.13, '80004'),
(86, 'Lote 11', 2.93, 3.6, '80004'),
(87, 'Lote 12', 3.15, 4.02, '80004'),
(88, 'Lote 13', 3.56, 4.34, '80004'),
(89, 'Lote 14', 5, 5.93, '80004'),
(90, 'Lote 15', 2.28, 2.82, '80004'),
(91, 'Lote 16', 2.61, 3.23, '80004'),
(92, 'Lote 17', 2.41, 2.99, '80004'),
(93, 'Lote 18', 2.13, 2.63, '80004'),
(94, 'Lote 19', 2.72, 3.56, '80004'),
(95, 'Lote 20', 3.86, 4.71, '80004'),
(96, 'Lote 21', 1.65, 2.11, '80004'),
(97, 'Lote 1', 0.74, 0.85, '80009'),
(98, 'Lote 2', 1.01, 1.18, '80009'),
(99, 'Lote 3', 2.14, 2.55, '80009'),
(100, 'Lote 4', 1.7, 1.95, '80009'),
(101, 'Lote 5', 1.85, 2.17, '80009'),
(102, 'Lote 6', 2.82, 3.23, '80009'),
(103, 'Lote 7', 2.48, 2.96, '80009'),
(104, 'Lote 8', 2.55, 3.04, '80009'),
(105, 'Lote 9', 2.18, 2.53, '80009'),
(106, 'Lote 10', 2.34, 2.79, '80009'),
(107, 'Lote 11', 2.23, 2.63, '80009'),
(108, 'Lote 12', 1.43, 1.78, '80009'),
(109, 'Lote 13', 1.13, 1.37, '80009'),
(110, 'Lote 14', 2.5, 3.12, '80009'),
(111, 'Lote 15', 2.75, 3.3, '80009'),
(112, 'Lote 16', 3.11, 3.83, '80009'),
(113, 'Lote 17', 3.17, 4.02, '80009'),
(114, 'Lote 18', 5.17, 6.44, '80009'),
(115, 'Lote 19', 3.77, 4.77, '80009'),
(116, 'Lote 20', 3.06, 3.63, '80009'),
(117, 'Lote 21', 2.07, 2.46, '80009'),
(118, 'Lote 22', 1.41, 1.71, '80009'),
(119, 'Lote 23', 5.22, 6.86, '80009'),
(120, 'Lote 24', 1.5, 1.68, '80009');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmercadonacional`
--

DROP TABLE IF EXISTS `tblmercadonacional`;
CREATE TABLE `tblmercadonacional` (
  `PKId` int(11) NOT NULL,
  `FKId_TblCajasMercadoNacional` int(11) NOT NULL,
  `FKId_TblDias` int(11) NOT NULL,
  `Cantidad_Elaborado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblmercadonacional`
--

INSERT INTO `tblmercadonacional` (`PKId`, `FKId_TblCajasMercadoNacional`, `FKId_TblDias`, `Cantidad_Elaborado`) VALUES
(1, 1, 1, 86),
(2, 2, 1, 10),
(3, 1, 2, 94),
(4, 2, 2, 19),
(5, 1, 3, 70),
(6, 2, 3, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblproduccion`
--

DROP TABLE IF EXISTS `tblproduccion`;
CREATE TABLE `tblproduccion` (
  `PKId` int(11) NOT NULL,
  `FKIbm_TblFincas` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `FKId_TblEmbolse` int(11) NOT NULL,
  `FKId_TblRacimos` int(11) NOT NULL,
  `FKId_TblSemanas` int(11) NOT NULL,
  `FKId_TblMercadoNacional` int(11) NOT NULL,
  `Total_CElaboradas` int(11) DEFAULT NULL,
  `Total_CREchazadas` int(11) DEFAULT NULL,
  `Total_CExportadas` int(11) DEFAULT NULL,
  `Ratio` float DEFAULT NULL,
  `Merma` float DEFAULT NULL,
  `Peso_Racimos` float DEFAULT NULL,
  `Area_Recorrida` float DEFAULT NULL,
  `Peso_Vastago` float DEFAULT NULL,
  `Anho_Produccion` varchar(5) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblproduccion`
--

INSERT INTO `tblproduccion` (`PKId`, `FKIbm_TblFincas`, `FKId_TblEmbolse`, `FKId_TblRacimos`, `FKId_TblSemanas`, `FKId_TblMercadoNacional`, `Total_CElaboradas`, `Total_CREchazadas`, `Total_CExportadas`, `Ratio`, `Merma`, `Peso_Racimos`, `Area_Recorrida`, `Peso_Vastago`, `Anho_Produccion`) VALUES
(1, '80074', 1, 1, 50, 1, 2833, 111, 2722, 0.98, 12.73, 22.4, 112.3, 2.23, '2020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblracimos`
--

DROP TABLE IF EXISTS `tblracimos`;
CREATE TABLE `tblracimos` (
  `PKId` int(11) NOT NULL,
  `FKId_TblSemanas` int(11) NOT NULL,
  `N_RacimosC` int(11) NOT NULL,
  `N_RacimosR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblracimos`
--

INSERT INTO `tblracimos` (`PKId`, `FKId_TblSemanas`, `N_RacimosC`, `N_RacimosR`) VALUES
(1, 50, 2819, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblregistrosemanas`
--

DROP TABLE IF EXISTS `tblregistrosemanas`;
CREATE TABLE `tblregistrosemanas` (
  `PKId` int(11) NOT NULL,
  `Anho_generado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblregistrosemanas`
--

INSERT INTO `tblregistrosemanas` (`PKId`, `Anho_generado`) VALUES
(1, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsemanas`
--

DROP TABLE IF EXISTS `tblsemanas`;
CREATE TABLE `tblsemanas` (
  `PKId` int(11) NOT NULL,
  `N_Semana` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Anho` int(11) NOT NULL,
  `FKId_TblCintas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblsemanas`
--

INSERT INTO `tblsemanas` (`PKId`, `N_Semana`, `Fecha_Inicio`, `Fecha_Fin`, `Anho`, `FKId_TblCintas`) VALUES
(1, 'SEMANA 01', '2018-12-31', '2019-01-06', 2019, 1),
(2, 'SEMANA 02', '2019-01-07', '2019-01-13', 2019, 2),
(3, 'SEMANA 03', '2019-01-14', '2019-01-20', 2019, 3),
(4, 'SEMANA 04', '2019-01-21', '2019-01-27', 2019, 4),
(5, 'SEMANA 05', '2019-01-28', '2019-02-03', 2019, 5),
(6, 'SEMANA 06', '2019-02-04', '2019-02-10', 2019, 6),
(7, 'SEMANA 07', '2019-02-11', '2019-02-17', 2019, 7),
(8, 'SEMANA 08', '2019-02-18', '2019-02-24', 2019, 8),
(9, 'SEMANA 09', '2019-02-25', '2019-03-03', 2019, 9),
(10, 'SEMANA 10', '2019-03-04', '2019-03-10', 2019, 10),
(11, 'SEMANA 11', '2019-03-11', '2019-03-17', 2019, 1),
(12, 'SEMANA 12', '2019-03-18', '2019-03-24', 2019, 2),
(13, 'SEMANA 13', '2019-03-25', '2019-03-31', 2019, 3),
(14, 'SEMANA 14', '2019-04-01', '2019-04-07', 2019, 4),
(15, 'SEMANA 15', '2019-04-08', '2019-04-14', 2019, 5),
(16, 'SEMANA 16', '2019-04-15', '2019-04-21', 2019, 6),
(17, 'SEMANA 17', '2019-04-22', '2019-04-28', 2019, 7),
(18, 'SEMANA 18', '2019-04-29', '2019-05-05', 2019, 8),
(19, 'SEMANA 19', '2019-05-06', '2019-05-12', 2019, 9),
(20, 'SEMANA 20', '2019-05-13', '2019-05-19', 2019, 10),
(21, 'SEMANA 21', '2019-05-20', '2019-05-26', 2019, 1),
(22, 'SEMANA 22', '2019-05-27', '2019-06-02', 2019, 2),
(23, 'SEMANA 23', '2019-06-03', '2019-06-09', 2019, 3),
(24, 'SEMANA 24', '2019-06-10', '2019-06-16', 2019, 4),
(25, 'SEMANA 25', '2019-06-17', '2019-06-23', 2019, 5),
(26, 'SEMANA 26', '2019-06-24', '2019-06-30', 2019, 6),
(27, 'SEMANA 27', '2019-07-01', '2019-07-07', 2019, 7),
(28, 'SEMANA 28', '2019-07-08', '2019-07-14', 2019, 8),
(29, 'SEMANA 29', '2019-07-15', '2019-07-21', 2019, 9),
(30, 'SEMANA 30', '2019-07-22', '2019-07-28', 2019, 10),
(31, 'SEMANA 31', '2019-07-29', '2019-08-04', 2019, 1),
(32, 'SEMANA 32', '2019-08-05', '2019-08-11', 2019, 2),
(33, 'SEMANA 33', '2019-08-12', '2019-08-18', 2019, 3),
(34, 'SEMANA 34', '2019-08-19', '2019-08-25', 2019, 4),
(35, 'SEMANA 35', '2019-08-26', '2019-09-01', 2019, 5),
(36, 'SEMANA 36', '2019-09-02', '2019-09-08', 2019, 6),
(37, 'SEMANA 37', '2019-09-09', '2019-09-15', 2019, 7),
(38, 'SEMANA 38', '2019-09-16', '2019-09-22', 2019, 8),
(39, 'SEMANA 39', '2019-09-23', '2019-09-29', 2019, 9),
(40, 'SEMANA 40', '2019-09-30', '2019-10-06', 2019, 10),
(41, 'SEMANA 41', '2019-10-07', '2019-10-13', 2019, 1),
(42, 'SEMANA 42', '2019-10-14', '2019-10-20', 2019, 2),
(43, 'SEMANA 43', '2019-10-21', '2019-10-27', 2019, 3),
(44, 'SEMANA 44', '2019-10-28', '2019-11-03', 2019, 4),
(45, 'SEMANA 45', '2019-11-04', '2019-11-10', 2019, 5),
(46, 'SEMANA 46', '2019-11-11', '2019-11-17', 2019, 6),
(47, 'SEMANA 47', '2019-11-18', '2019-11-24', 2019, 7),
(48, 'SEMANA 48', '2019-11-25', '2019-12-01', 2019, 8),
(49, 'SEMANA 49', '2019-12-02', '2019-12-08', 2019, 9),
(50, 'SEMANA 50', '2019-12-09', '2019-12-15', 2019, 10),
(51, 'SEMANA 51', '2019-12-16', '2019-12-22', 2019, 1),
(52, 'SEMANA 52', '2019-12-23', '2019-12-29', 2019, 2),
(53, 'SEMANA 1', '2019-12-30', '2020-01-05', 2020, 3),
(54, 'SEMANA 2', '2020-01-06', '2020-01-12', 2020, 4),
(55, 'SEMANA 3', '2020-01-13', '2020-01-19', 2020, 5),
(56, 'SEMANA 4', '2020-01-20', '2020-01-26', 2020, 6),
(57, 'SEMANA 5', '2020-01-27', '2020-02-02', 2020, 7),
(58, 'SEMANA 6', '2020-02-03', '2020-02-09', 2020, 8),
(59, 'SEMANA 7', '2020-02-10', '2020-02-16', 2020, 9),
(60, 'SEMANA 8', '2020-02-17', '2020-02-23', 2020, 10),
(61, 'SEMANA 9', '2020-02-24', '2020-03-01', 2020, 1),
(62, 'SEMANA 10', '2020-03-02', '2020-03-08', 2020, 2),
(63, 'SEMANA 11', '2020-03-09', '2020-03-15', 2020, 3),
(64, 'SEMANA 12', '2020-03-16', '2020-03-22', 2020, 4),
(65, 'SEMANA 13', '2020-03-23', '2020-03-29', 2020, 5),
(66, 'SEMANA 14', '2020-03-30', '2020-04-05', 2020, 6),
(67, 'SEMANA 15', '2020-04-06', '2020-04-12', 2020, 7),
(68, 'SEMANA 16', '2020-04-13', '2020-04-19', 2020, 8),
(69, 'SEMANA 17', '2020-04-20', '2020-04-26', 2020, 9),
(70, 'SEMANA 18', '2020-04-27', '2020-05-03', 2020, 10),
(71, 'SEMANA 19', '2020-05-04', '2020-05-10', 2020, 1),
(72, 'SEMANA 20', '2020-05-11', '2020-05-17', 2020, 2),
(73, 'SEMANA 21', '2020-05-18', '2020-05-24', 2020, 3),
(74, 'SEMANA 22', '2020-05-25', '2020-05-31', 2020, 4),
(75, 'SEMANA 23', '2020-06-01', '2020-06-07', 2020, 5),
(76, 'SEMANA 24', '2020-06-08', '2020-06-14', 2020, 6),
(77, 'SEMANA 25', '2020-06-15', '2020-06-21', 2020, 7),
(78, 'SEMANA 26', '2020-06-22', '2020-06-28', 2020, 8),
(79, 'SEMANA 27', '2020-06-29', '2020-07-05', 2020, 9),
(80, 'SEMANA 28', '2020-07-06', '2020-07-12', 2020, 10),
(81, 'SEMANA 29', '2020-07-13', '2020-07-19', 2020, 1),
(82, 'SEMANA 30', '2020-07-20', '2020-07-26', 2020, 2),
(83, 'SEMANA 31', '2020-07-27', '2020-08-02', 2020, 3),
(84, 'SEMANA 32', '2020-08-03', '2020-08-09', 2020, 4),
(85, 'SEMANA 33', '2020-08-10', '2020-08-16', 2020, 5),
(86, 'SEMANA 34', '2020-08-17', '2020-08-23', 2020, 6),
(87, 'SEMANA 35', '2020-08-24', '2020-08-30', 2020, 7),
(88, 'SEMANA 36', '2020-08-31', '2020-09-06', 2020, 8),
(89, 'SEMANA 37', '2020-09-07', '2020-09-13', 2020, 9),
(90, 'SEMANA 38', '2020-09-14', '2020-09-20', 2020, 10),
(91, 'SEMANA 39', '2020-09-21', '2020-09-27', 2020, 1),
(92, 'SEMANA 40', '2020-09-28', '2020-10-04', 2020, 2),
(93, 'SEMANA 41', '2020-10-05', '2020-10-11', 2020, 3),
(94, 'SEMANA 42', '2020-10-12', '2020-10-18', 2020, 4),
(95, 'SEMANA 43', '2020-10-19', '2020-10-25', 2020, 5),
(96, 'SEMANA 44', '2020-10-26', '2020-11-01', 2020, 6),
(97, 'SEMANA 45', '2020-11-02', '2020-11-08', 2020, 7),
(98, 'SEMANA 46', '2020-11-09', '2020-11-15', 2020, 8),
(99, 'SEMANA 47', '2020-11-16', '2020-11-22', 2020, 9),
(100, 'SEMANA 48', '2020-11-23', '2020-11-29', 2020, 10),
(101, 'SEMANA 49', '2020-11-30', '2020-12-06', 2020, 1),
(102, 'SEMANA 50', '2020-12-07', '2020-12-13', 2020, 2),
(103, 'SEMANA 51', '2020-12-14', '2020-12-20', 2020, 3),
(104, 'SEMANA 52', '2020-12-21', '2020-12-27', 2020, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipofruta`
--

DROP TABLE IF EXISTS `tbltipofruta`;
CREATE TABLE `tbltipofruta` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbltipofruta`
--

INSERT INTO `tbltipofruta` (`PKId`, `Descripcion`) VALUES
(1, 'PRIMERA'),
(2, 'SEGUNDA'),
(3, 'ESPECIAL'),
(4, 'FRUTICA'),
(5, 'FRUTICA II'),
(6, 'FAIR TRADE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipousuario`
--

DROP TABLE IF EXISTS `tbltipousuario`;
CREATE TABLE `tbltipousuario` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbltipousuario`
--

INSERT INTO `tbltipousuario` (`PKId`, `Descripcion`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'ESTANDAR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

DROP TABLE IF EXISTS `tblusuarios`;
CREATE TABLE `tblusuarios` (
  `PKId` int(11) NOT NULL,
  `FKIbm_TblFincas` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `FKId_TblTipoUsuario` int(11) NOT NULL,
  `FKId_TblEstadoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblusuarios`
--

INSERT INTO `tblusuarios` (`PKId`, `FKIbm_TblFincas`, `Password`, `FKId_TblTipoUsuario`, `FKId_TblEstadoUsuario`) VALUES
(1, '80074', 'valencia', 1, 1),
(2, '80004', 'taiwan123', 2, 1),
(3, '80008', 'kalamari123', 2, 1),
(4, '80009', 'zarzamora123', 2, 1),
(5, '80075', 'candelaria123', 2, 1),
(6, '85747', 'guaimaral123', 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblcajasmercadonacional`
--
ALTER TABLE `tblcajasmercadonacional`
  ADD PRIMARY KEY (`PKId`);

--
-- Indices de la tabla `tblcajasproduccion`
--
ALTER TABLE `tblcajasproduccion`
  ADD PRIMARY KEY (`PKCodigo`),
  ADD KEY `FKId_TblTipoFruta` (`FKId_TblTipoFruta`);

--
-- Indices de la tabla `tblcargue`
--
ALTER TABLE `tblcargue`
  ADD PRIMARY KEY (`PKId_Cargue`),
  ADD KEY `FKIbm_TblFincas` (`FKIbm_TblFincas`),
  ADD KEY `FKDocumento_TblClientes` (`FKDocumento_TblClientes`);

--
-- Indices de la tabla `tblcintas`
--
ALTER TABLE `tblcintas`
  ADD PRIMARY KEY (`PKId`);

--
-- Indices de la tabla `tblclasificacion`
--
ALTER TABLE `tblclasificacion`
  ADD PRIMARY KEY (`PKId`);

--
-- Indices de la tabla `tblclientes`
--
ALTER TABLE `tblclientes`
  ADD PRIMARY KEY (`PKDocumento`);

--
-- Indices de la tabla `tbldet_tblcargue`
--
ALTER TABLE `tbldet_tblcargue`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_Cargue_TblCargue` (`FKId_Cargue_TblCargue`),
  ADD KEY `FKId_TblMercadoNacional` (`FKId_TblMercadoNacional`);

--
-- Indices de la tabla `tbldet_tbldet_tblproduccion`
--
ALTER TABLE `tbldet_tbldet_tblproduccion`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblDet_TblProduccion` (`FKId_TblDet_TblProduccion`),
  ADD KEY `FKCodigo_TblCajasProduccion` (`FKCodigo_TblCajasProduccion`);

--
-- Indices de la tabla `tbldet_tbldet_tblracimos_tbldias`
--
ALTER TABLE `tbldet_tbldet_tblracimos_tbldias`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblDet_TblRacimos_TblDias` (`FKId_TblDet_TblRacimos_TblDias`),
  ADD KEY `FKId_TblCintas` (`FKId_TblCintas`),
  ADD KEY `FKId_TblLotes` (`FKId_TblLotes`);

--
-- Indices de la tabla `tbldet_tblembarque`
--
ALTER TABLE `tbldet_tblembarque`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKCod_TblEmbarque` (`FKCod_TblEmbarque`),
  ADD KEY `FKIbm_TblFincas` (`FKIbm_TblFincas`),
  ADD KEY `FKCodigo_TblCajasProduccion` (`FKCodigo_TblCajasProduccion`);

--
-- Indices de la tabla `tbldet_tblproduccion`
--
ALTER TABLE `tbldet_tblproduccion`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblProduccion` (`FKId_TblProduccion`),
  ADD KEY `FKId_TblDias` (`FKId_TblDias`);

--
-- Indices de la tabla `tbldet_tblracimos_tbldias`
--
ALTER TABLE `tbldet_tblracimos_tbldias`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblRacimos` (`FKId_TblRacimos`),
  ADD KEY `FKId_TblDias` (`FKId_TblDias`);

--
-- Indices de la tabla `tbldias`
--
ALTER TABLE `tbldias`
  ADD PRIMARY KEY (`PKId`);

--
-- Indices de la tabla `tblembarque`
--
ALTER TABLE `tblembarque`
  ADD PRIMARY KEY (`PKCod`),
  ADD KEY `FKId_TblSemanas` (`FKId_TblSemanas`);

--
-- Indices de la tabla `tblembolse`
--
ALTER TABLE `tblembolse`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblSemanas` (`FKId_TblSemanas`);

--
-- Indices de la tabla `tblempresas`
--
ALTER TABLE `tblempresas`
  ADD PRIMARY KEY (`PKNit`);

--
-- Indices de la tabla `tblestadousuario`
--
ALTER TABLE `tblestadousuario`
  ADD PRIMARY KEY (`PKId`);

--
-- Indices de la tabla `tblestimativo`
--
ALTER TABLE `tblestimativo`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKCod_TblEmbarque` (`FKCod_TblEmbarque`);

--
-- Indices de la tabla `tblfincas`
--
ALTER TABLE `tblfincas`
  ADD PRIMARY KEY (`PKIbm`),
  ADD KEY `FKNit_TblEmpresas` (`FKNit_TblEmpresas`);

--
-- Indices de la tabla `tbllotes`
--
ALTER TABLE `tbllotes`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKIbm_TblFincas` (`FKIbm_TblFincas`);

--
-- Indices de la tabla `tblmercadonacional`
--
ALTER TABLE `tblmercadonacional`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblCajasMercadoNacional` (`FKId_TblCajasMercadoNacional`),
  ADD KEY `FKId_TblDias` (`FKId_TblDias`);

--
-- Indices de la tabla `tblproduccion`
--
ALTER TABLE `tblproduccion`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKIbm_TblFincas` (`FKIbm_TblFincas`),
  ADD KEY `FKId_TblEmbolse` (`FKId_TblEmbolse`),
  ADD KEY `FKId_TblRacimos` (`FKId_TblRacimos`),
  ADD KEY `FKId_TblSemanas` (`FKId_TblSemanas`),
  ADD KEY `FKId_TblMercadoNacional` (`FKId_TblMercadoNacional`);

--
-- Indices de la tabla `tblracimos`
--
ALTER TABLE `tblracimos`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblSemanas` (`FKId_TblSemanas`);

--
-- Indices de la tabla `tblregistrosemanas`
--
ALTER TABLE `tblregistrosemanas`
  ADD PRIMARY KEY (`PKId`);

--
-- Indices de la tabla `tblsemanas`
--
ALTER TABLE `tblsemanas`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblCintas` (`FKId_TblCintas`);

--
-- Indices de la tabla `tbltipofruta`
--
ALTER TABLE `tbltipofruta`
  ADD PRIMARY KEY (`PKId`);

--
-- Indices de la tabla `tbltipousuario`
--
ALTER TABLE `tbltipousuario`
  ADD PRIMARY KEY (`PKId`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKIbm_TblFincas` (`FKIbm_TblFincas`),
  ADD KEY `FKId_TblTipoUsuario` (`FKId_TblTipoUsuario`),
  ADD KEY `FKId_TblEstadoUsuario` (`FKId_TblEstadoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblcajasmercadonacional`
--
ALTER TABLE `tblcajasmercadonacional`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tblcargue`
--
ALTER TABLE `tblcargue`
  MODIFY `PKId_Cargue` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblcintas`
--
ALTER TABLE `tblcintas`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tblclasificacion`
--
ALTER TABLE `tblclasificacion`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbldet_tblcargue`
--
ALTER TABLE `tbldet_tblcargue`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbldet_tbldet_tblproduccion`
--
ALTER TABLE `tbldet_tbldet_tblproduccion`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tbldet_tbldet_tblracimos_tbldias`
--
ALTER TABLE `tbldet_tbldet_tblracimos_tbldias`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `tbldet_tblembarque`
--
ALTER TABLE `tbldet_tblembarque`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbldet_tblproduccion`
--
ALTER TABLE `tbldet_tblproduccion`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbldet_tblracimos_tbldias`
--
ALTER TABLE `tbldet_tblracimos_tbldias`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbldias`
--
ALTER TABLE `tbldias`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tblembolse`
--
ALTER TABLE `tblembolse`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblestadousuario`
--
ALTER TABLE `tblestadousuario`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblestimativo`
--
ALTER TABLE `tblestimativo`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbllotes`
--
ALTER TABLE `tbllotes`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `tblmercadonacional`
--
ALTER TABLE `tblmercadonacional`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tblproduccion`
--
ALTER TABLE `tblproduccion`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblracimos`
--
ALTER TABLE `tblracimos`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblregistrosemanas`
--
ALTER TABLE `tblregistrosemanas`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblsemanas`
--
ALTER TABLE `tblsemanas`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `tbltipofruta`
--
ALTER TABLE `tbltipofruta`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbltipousuario`
--
ALTER TABLE `tbltipousuario`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblcajasproduccion`
--
ALTER TABLE `tblcajasproduccion`
  ADD CONSTRAINT `tblcajasproduccion_ibfk_1` FOREIGN KEY (`FKId_TblTipoFruta`) REFERENCES `tbltipofruta` (`PKId`);

--
-- Filtros para la tabla `tblcargue`
--
ALTER TABLE `tblcargue`
  ADD CONSTRAINT `tblcargue_ibfk_1` FOREIGN KEY (`FKIbm_TblFincas`) REFERENCES `tblfincas` (`PKIbm`),
  ADD CONSTRAINT `tblcargue_ibfk_2` FOREIGN KEY (`FKDocumento_TblClientes`) REFERENCES `tblclientes` (`PKDocumento`);

--
-- Filtros para la tabla `tbldet_tblcargue`
--
ALTER TABLE `tbldet_tblcargue`
  ADD CONSTRAINT `tbldet_tblcargue_ibfk_1` FOREIGN KEY (`FKId_Cargue_TblCargue`) REFERENCES `tblcargue` (`PKId_Cargue`),
  ADD CONSTRAINT `tbldet_tblcargue_ibfk_2` FOREIGN KEY (`FKId_TblMercadoNacional`) REFERENCES `tblmercadonacional` (`PKId`);

--
-- Filtros para la tabla `tbldet_tbldet_tblproduccion`
--
ALTER TABLE `tbldet_tbldet_tblproduccion`
  ADD CONSTRAINT `tbldet_tbldet_tblproduccion_ibfk_1` FOREIGN KEY (`FKId_TblDet_TblProduccion`) REFERENCES `tbldet_tblproduccion` (`PKId`),
  ADD CONSTRAINT `tbldet_tbldet_tblproduccion_ibfk_2` FOREIGN KEY (`FKCodigo_TblCajasProduccion`) REFERENCES `tblcajasproduccion` (`PKCodigo`);

--
-- Filtros para la tabla `tbldet_tbldet_tblracimos_tbldias`
--
ALTER TABLE `tbldet_tbldet_tblracimos_tbldias`
  ADD CONSTRAINT `tbldet_tbldet_tblracimos_tbldias_ibfk_1` FOREIGN KEY (`FKId_TblDet_TblRacimos_TblDias`) REFERENCES `tbldet_tblracimos_tbldias` (`PKId`),
  ADD CONSTRAINT `tbldet_tbldet_tblracimos_tbldias_ibfk_2` FOREIGN KEY (`FKId_TblCintas`) REFERENCES `tblcintas` (`PKId`),
  ADD CONSTRAINT `tbldet_tbldet_tblracimos_tbldias_ibfk_3` FOREIGN KEY (`FKId_TblLotes`) REFERENCES `tbllotes` (`PKId`);

--
-- Filtros para la tabla `tbldet_tblembarque`
--
ALTER TABLE `tbldet_tblembarque`
  ADD CONSTRAINT `tbldet_tblembarque_ibfk_1` FOREIGN KEY (`FKCod_TblEmbarque`) REFERENCES `tblembarque` (`PKCod`),
  ADD CONSTRAINT `tbldet_tblembarque_ibfk_2` FOREIGN KEY (`FKIbm_TblFincas`) REFERENCES `tblfincas` (`PKIbm`),
  ADD CONSTRAINT `tbldet_tblembarque_ibfk_3` FOREIGN KEY (`FKCodigo_TblCajasProduccion`) REFERENCES `tblcajasproduccion` (`PKCodigo`);

--
-- Filtros para la tabla `tbldet_tblproduccion`
--
ALTER TABLE `tbldet_tblproduccion`
  ADD CONSTRAINT `tbldet_tblproduccion_ibfk_1` FOREIGN KEY (`FKId_TblProduccion`) REFERENCES `tblproduccion` (`PKId`),
  ADD CONSTRAINT `tbldet_tblproduccion_ibfk_2` FOREIGN KEY (`FKId_TblDias`) REFERENCES `tbldias` (`PKId`);

--
-- Filtros para la tabla `tbldet_tblracimos_tbldias`
--
ALTER TABLE `tbldet_tblracimos_tbldias`
  ADD CONSTRAINT `tbldet_tblracimos_tbldias_ibfk_1` FOREIGN KEY (`FKId_TblRacimos`) REFERENCES `tblracimos` (`PKId`),
  ADD CONSTRAINT `tbldet_tblracimos_tbldias_ibfk_2` FOREIGN KEY (`FKId_TblDias`) REFERENCES `tbldias` (`PKId`);

--
-- Filtros para la tabla `tblembarque`
--
ALTER TABLE `tblembarque`
  ADD CONSTRAINT `tblembarque_ibfk_1` FOREIGN KEY (`FKId_TblSemanas`) REFERENCES `tblsemanas` (`PKId`);

--
-- Filtros para la tabla `tblembolse`
--
ALTER TABLE `tblembolse`
  ADD CONSTRAINT `tblembolse_ibfk_1` FOREIGN KEY (`FKId_TblSemanas`) REFERENCES `tblsemanas` (`PKId`);

--
-- Filtros para la tabla `tblestimativo`
--
ALTER TABLE `tblestimativo`
  ADD CONSTRAINT `tblestimativo_ibfk_1` FOREIGN KEY (`FKCod_TblEmbarque`) REFERENCES `tblembarque` (`PKCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblfincas`
--
ALTER TABLE `tblfincas`
  ADD CONSTRAINT `tblfincas_ibfk_1` FOREIGN KEY (`FKNit_TblEmpresas`) REFERENCES `tblempresas` (`PKNit`);

--
-- Filtros para la tabla `tbllotes`
--
ALTER TABLE `tbllotes`
  ADD CONSTRAINT `tbllotes_ibfk_1` FOREIGN KEY (`FKIbm_TblFincas`) REFERENCES `tblfincas` (`PKIbm`);

--
-- Filtros para la tabla `tblmercadonacional`
--
ALTER TABLE `tblmercadonacional`
  ADD CONSTRAINT `tblmercadonacional_ibfk_1` FOREIGN KEY (`FKId_TblCajasMercadoNacional`) REFERENCES `tblcajasmercadonacional` (`PKId`),
  ADD CONSTRAINT `tblmercadonacional_ibfk_2` FOREIGN KEY (`FKId_TblDias`) REFERENCES `tbldias` (`PKId`);

--
-- Filtros para la tabla `tblproduccion`
--
ALTER TABLE `tblproduccion`
  ADD CONSTRAINT `tblproduccion_ibfk_1` FOREIGN KEY (`FKIbm_TblFincas`) REFERENCES `tblfincas` (`PKIbm`),
  ADD CONSTRAINT `tblproduccion_ibfk_2` FOREIGN KEY (`FKId_TblEmbolse`) REFERENCES `tblembolse` (`PKId`),
  ADD CONSTRAINT `tblproduccion_ibfk_3` FOREIGN KEY (`FKId_TblRacimos`) REFERENCES `tblracimos` (`PKId`),
  ADD CONSTRAINT `tblproduccion_ibfk_4` FOREIGN KEY (`FKId_TblSemanas`) REFERENCES `tblsemanas` (`PKId`),
  ADD CONSTRAINT `tblproduccion_ibfk_5` FOREIGN KEY (`FKId_TblMercadoNacional`) REFERENCES `tblmercadonacional` (`PKId`);

--
-- Filtros para la tabla `tblracimos`
--
ALTER TABLE `tblracimos`
  ADD CONSTRAINT `tblracimos_ibfk_1` FOREIGN KEY (`FKId_TblSemanas`) REFERENCES `tblsemanas` (`PKId`);

--
-- Filtros para la tabla `tblsemanas`
--
ALTER TABLE `tblsemanas`
  ADD CONSTRAINT `tblsemanas_ibfk_1` FOREIGN KEY (`FKId_TblCintas`) REFERENCES `tblcintas` (`PKId`);

--
-- Filtros para la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD CONSTRAINT `tblusuarios_ibfk_1` FOREIGN KEY (`FKIbm_TblFincas`) REFERENCES `tblfincas` (`PKIbm`),
  ADD CONSTRAINT `tblusuarios_ibfk_2` FOREIGN KEY (`FKId_TblTipoUsuario`) REFERENCES `tbltipousuario` (`PKId`),
  ADD CONSTRAINT `tblusuarios_ibfk_3` FOREIGN KEY (`FKId_TblEstadoUsuario`) REFERENCES `tblestadousuario` (`PKId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
