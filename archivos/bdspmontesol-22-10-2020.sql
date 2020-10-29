-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2020 a las 22:08:11
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
-- Base de datos: `bdspmontesol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcajasmercadonacional`
--

CREATE TABLE `tblcajasmercadonacional` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tblcajasproduccion` (
  `PKCodigo` varchar(5) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `FactorConversion` float NOT NULL,
  `FKId_TblTipoFruta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblcajasproduccion`
--

INSERT INTO `tblcajasproduccion` (`PKCodigo`, `Descripcion`, `FactorConversion`, `FKId_TblTipoFruta`) VALUES
('1003', 'PR ORSERO BANANAS --', 1, 1),
('1010', 'PR TURBANA 3 LBS BAN', 1, 1),
('1011', 'FT TESCO*', 0.94, 6),
('1014', 'FLO FAIR TRADE EU***', 1, 6),
('1015', 'FT JS FAIR TRADE 17K', 0.94, 6),
('1016', 'FT 14 KLS- 75 DEDOS*', 0.77, 6),
('1017', 'FT FLO FAIR TRADE EU', 1, 6),
('1019', 'FT TESCO 17 KG EU**', 0.94, 6),
('1020', 'FT SMALL 13 KG*', 0.7, 6),
('1021', 'FT TESCO 17 KG CLUSTER BAG', 0.94, 6),
('1025', 'FT FAIR T 3LB EEUU', 1, 6),
('1028', 'FAIR TRADE TROPY DED', 1, 6),
('1036', 'PRIMERA BANANAS', 1, 1),
('1041', 'PIMERA MIX SIMBA BANANAS', 1, 1),
('1043', 'PR BAHIA HD SIN SELLO  54', 1, 1),
('1044', 'MIX SIMBA BANANAS 5', 1, 1),
('1046', 'PREMIUM TROPY HD 54', 1, 1),
('1047', 'PREMIUM ADRIA BANANA ', 1, 1),
('1048', 'SEGUNDA DARIEN BVC 54 (SEGUNDA)', 1, 2),
('1051', 'MENOR ESPECIFICACION  - BANANAS X 54', 1, 2),
('1054', 'PR DM EUROMINI 17KG', 0.94, 1),
('1056', 'PR 14 KL EU 75 DEDOS', 0.77, 1),
('1059', 'PR LD17 TRIAL 2', 0.94, 1),
('1062', 'FT JSFTX5 17 K EU', 0.94, 6),
('1073', 'PR SUPREME BANANAS', 1, 1),
('1075', 'PR LD17 AL 55', 0.94, 1),
('1078', 'ME FREDY F BAG 13 KG ', 0.74, 1),
('1079', 'ME FYFFES 12.7 KGS (SEGUNDA).', 0.7, 1),
('1080', 'ME ALDI BAG 1B 13 KGS.', 0.74, 1),
('1081', 'SEGUNDA FT SMALL 12.7 KG EU*', 0.7, 6),
('1085', 'PR FRUTIA BANANAS', 1, 1),
('1089', 'PR TROPY MEDITERRAN', 1, 1),
('1103', 'PR DERBY BANANAS', 1, 1),
('1106', 'SEGUNDA DARIEN BVC 54', 1, 2),
('1107', 'MENOR ESPECIFICACION - BANANAS AL 54', 1, 2),
('1108', 'PR TURBANA RAINFOREST', 1, 1),
('1114', 'PR  LD17RA  KGS.', 0.94, 1),
('1120', 'PR FYFFES STDW 54', 1, 1),
('1124', 'DARIEN 54 RAINFORES', 1, 2),
('1125', 'PR TURBANA 3 LBS BA', 1, 1),
('1126', 'PR FYFFES USA.', 1, 1),
('1129', 'PR FYFFES MED 54', 1, 1),
('1133', 'PR MOR5STD - 54', 0.92, 1),
('1137', 'PR CHIQUITA BANAVAC', 1, 1),
('1138', 'DARIEN BVC RAINFORE', 1, 2),
('1140', 'SEGUNDA CUMBIA BANANAS 54', 1, 2),
('1141', 'SEGUNDA CUMBIA HD BANANAS 4', 1, 2),
('1142', 'SEGUNDA CUMBIA HD BANANAS 5', 1, 2),
('1143', 'SEGUNDA ME HAPPY BANANAS BV', 1, 2),
('1148', 'SEGUNDA ME SLOBANA', 1, 2),
('1149', 'STDRA', 1, 1),
('1153', 'PR DERBY - 48', 0.77, 1),
('1154', 'MIX DARIEN BANANA', 1, 1),
('1155', 'PR SUPREME SARL', 1, 1),
('1163', 'PR SUPREME MEDITERR', 1, 1),
('1165', 'PR DERBY BANANAS 48', 1, 1),
('1166', 'ME ALDI BAG 13 KGS.', 0.74, 1),
('1167', 'FT JSFTX5 17 K EU -', 0.94, 6),
('1168', 'PRIMERA MIX TROPY RA', 1, 1),
('1170', 'PR TURBANA RAINFOREST -', 1, 1),
('1171', 'PR FYFFES STDHD RAI', 1, 1),
('1186', 'MIX ORSERO 41.5 LB', 1, 1),
('1189', 'FT JS FAIR TRADE 17', 0.94, 6),
('1191', 'PR FYFFES SRDHD 18.14 K', 1, 1),
('1192', 'PR FYFFES FYFMED 18.14 K', 1, 1),
('1193', 'PR FYFFES STDHDRA 18.14 K. RAIN', 1, 1),
('1194', 'PR CHIQUITA RAC BAN', 1, 1),
('1195', 'MIX ORSERO 41.5 LB -', 1, 1),
('1198', 'PR CLUSTER BAG FYFF', 1, 1),
('1200', 'ME ALDI BAG RA 13 K', 0.74, 1),
('1202', 'SEGUNDA ME ALDI BAG RA 13 K', 0.74, 2),
('1209', 'FT MHFT17 - EU-55', 0.94, 6),
('1214', 'PR MOR5STDRA - 54', 0.92, 1),
('1215', 'ME FYFFES 12.7 KGS.', 0.7, 1),
('1216', 'PR MSTDRA - 54', 1, 1),
('1219', 'PR FYFFES 3 LBS BAN', 1, 1),
('1223', 'PR YELLOW RAINFORES', 1, 1),
('1224', 'PR YELLOW RAINFORES ', 1, 1),
('1225', 'PR PAMELA BANANAS', 1, 1),
('1231', 'FT TROPY EU - 48', 1, 1),
('1233', 'PR FYFFES STDWR 54', 1, 1),
('1239', 'DARIEN BVC*', 1, 2),
('1242', 'DARIEN 54*', 1, 2),
('1243', 'DARIEN BVC 54*', 1, 2),
('1253', 'PR ALDI RAINFOREST', 0.94, 1),
('1255', 'MIX TROPY RAINFORES 17 KLOS', 0.94, 1),
('1259', 'PR CHIQUITA RAC BANAVAC 54 REF', 1, 1),
('1268', 'PR CHIQUITA RAC BAN -', 1, 1),
('1271', 'FT FT22X5 EU*', 1, 6),
('1278', 'MENOR ESPECIFICACION FYFFES 13 KL CLUSTER BAG', 0.7, 1),
('1283', 'PR DERBY BANANAS -', 1, 1),
('1285', 'PR DERBY BANANAS RA', 1, 1),
('1287', 'PR ORSERO EUROMINI 17 KGS', 0.95, 1),
('1290', 'FT PLUSFT5', 1, 1),
('1292', 'PR YELLOW RAINFOREST MOTTED', 1, 1),
('1298', 'FT JSFTIF17-55EU', 0.94, 1),
('1303', 'MENOR ESPECIFICACION DEDO SUELTO 10 LBS.', 0.25, 2),
('1304', 'PR ORSERO BANANAS', 1, 1),
('1313', 'FT - MHFTF517 - 55 EU', 0.94, 1),
('1316', 'FT - DELMONTE - 54 EU', 1, 1),
('1320', 'SEGUNDA BANAKING BVC - 54', 1, 1),
('1324', 'PR GOODFARMER 4 HANDS 13.5 K', 0.74, 1),
('1327', 'PR GOODFARMER 6 HANDS 13.5 K', 0.74, 1),
('1328', 'PR GOODFARMER 5 HANDS 13.5 K', 0.74, 1),
('1329', 'FT TROPY 17 KGS - 55 EU', 0.94, 1),
('1333', 'PR GOODFARMER 5 HANDS 13.5 K -', 0.74, 1),
('1336', 'PR BANANAS KRAFT SIN SELLO - 5', 1, 1),
('1339', 'MENOR ESPECIFICACION ME BANANEN EVERY DAY', 1, 2),
('1341', 'MENOR ESPECIFICACION - BANANAS 5 DEDOS', 1, 2),
('1342', 'MENOR ESPECIFICACION ME SIMBARICA 6 DEDO', 1, 2),
('1345', 'PR BAHIA HD RAINFOREST', 1, 1),
('1350', 'FT DELMONTE 17 KGS-EU-55', 0.94, 1),
('1351', 'MENOR ESPECIFICACION YUMMYBAN UCRANIA BANANAS 54', 1, 2),
('1353', 'FT JS - FAIR TRADE 17K EU - 55', 0.94, 1),
('1354', 'FT JSFTX5 17 K EU -55', 0.94, 1),
('1355', 'FT JS FAIR TRADE 17K JSFTB13K', 0.94, 1),
('1356', 'MHFT17-EU-55', 0.94, 1),
('1357', 'FT DELMONTE 17 KGS-EU-55 -', 0.94, 1),
('1359', 'MENOR ESPECIFICACION - YUMMYBAN UCRANIA BA', 1, 2),
('1361', 'MENOR ESPICIFICACION - YUMMYBAN UCRANIA BANANAS 54', 1, 2),
('200', 'CLUSTER BAG DEDO SUELTO LARGO KILOS 20', 1, 1),
('354', 'PRIMERA NORMAL TROPICAL  EDEN EUROBOX KILOS 20', 1, 1),
('376', 'PREMIUM BANANAS EN BAG PALLET EUROPA URA', 1, 1),
('392', 'MENOR ESPECIFICACION CLUSTER BAG QUAD PACK KILOS 20', 1, 1),
('426', 'TROPICAL EDEN EUROBOX 80*120', 1, 1),
('462', 'SEGUNDA DARIEN BVC 20 KLOS', 1, 2),
('474', 'SELECT SUN SWEET', 1, 1),
('489', 'PREMIUM TURBANA ECUADOR', 1, 1),
('494', 'PRIMERA NORMAL IRANI ESTRELLA KILOS 20', 0.71, 1),
('511', '13 KLS MANOS TURBANA KILOS', 0.71, 1),
('512', 'PRIMERA NORMAL FYFFES EUROBOX KILOS 20', 1, 1),
('519', 'SEVEN BBANANAS PACK', 1, 1),
('528', 'PR FYFF EUBOX 20 K45', 1, 1),
('534', 'PRIMERA NORMAL TURBANA PALLET KILOS 20', 1, 1),
('538', 'PRIMERA NORMAL FYFFES 20 KILOS KILOS 20', 1, 1),
('540', 'PRIMERA NORMAL BLANCOS BAG KILOS 20', 1, 1),
('542', 'FREDY FYFFES 20 KL BAG KILOS', 1, 6),
('545', 'PRIMERA NORMAL FYFFES CL B 48 KILOS 20', 1, 1),
('550', 'PR TURBANA EUROPA 18.14 KG - 48', 1, 1),
('552', '1B FREDY FYFFES BAG 22 18.14 KG - 48 SM', 1, 1),
('553', 'PR FYFFES STD 18.14 KG -48 SM', 1, 1),
('554', 'SEVEN BANANAS PACK', 1, 1),
('559', 'CLUSTERT BAG 12X1 KG EXPOCARIBE', 0.71, 1),
('562', 'PRIMERA NORMAL IRANI FRUTTIA KILOS 20', 0.71, 1),
('568', 'DOLE USA', 1, 1),
('574', 'FLO FT EUROPA 18.14 KG - FT', 1, 6),
('575', 'DARIEN KILOS', 1, 2),
('584', 'PRIMERA NORMAL STOP AND SHOP KILOS 20', 1, 1),
('587', 'PRIMERA NORMAL BONI BAG KILOS 20', 1, 1),
('589', 'PRIMERA NORMAL DON CARLOS KILOS 20', 1, 1),
('595', '13 KLS MANO ENTER EXPOCA-56', 0.71, 1),
('601', 'SEVEN BANANAS BLANCO BAG -48', 1, 1),
('603', '1B 7-BANANAS BLANCO BAG 22 18.14 KG SM -48', 1, 1),
('604', 'CLUSTER BAG DOLPHIN BAG KILOS 20', 1, 1),
('608', 'PRIMERA NORMAL TURBANA PREMIUM KILOS 20', 1, 1),
('609', 'PRIMERA CLUSTER BAG KILOS 20', 1, 1),
('610', 'PRIMERA NORMAL FIVE A DAY PREMIUM KILOS 20', 1, 1),
('611', 'PRIMERA NORMAL PRICE CHOPPER KILOS 20', 1, 1),
('612', 'KORA KILOS', 1, 1),
('613', 'PRIMERA NORMAL PREMIUM TROPY KILOS 20', 1, 1),
('614', 'SEGUNDA DARIEN ESTÁNDAR KILOS 20', 1, 2),
('615', 'DARIEN BAG (SEGUNDA)', 1, 2),
('616', 'SEGUNDA DARIEN 3 LIBRAS KILOS 17', 1, 2),
('617', 'PRIMERA NORMAL WEISS PREMIUM KILOS 20', 1, 1),
('618', 'PRIMERA NORMAL UNIFRUIT KILOS 20', 1, 1),
('619', 'PRIMERA NORMAL TURBANA SPOT KILOS 20', 1, 1),
('620', 'PRIMERA NORMAL GIOIA KILOS 20', 1, 1),
('621', 'PRIMERA NORMAL COMACO KILOS 20', 1, 1),
('624', 'PRIMERA DOLE USA  KILOS 20', 1, 1),
('625', 'PRIMERA NORMAL SHURFINE PREMIUM KILOS 20', 1, 1),
('626', 'PREMIUM FAIR TRADE USA', 1, 1),
('627', 'CLUSTER BAG FREDY FYFFES 13 KL BAG KILOS 13', 0.74, 1),
('629', 'PRIMERA NORMAL FAIR TRADE BAG KILOS 20', 1, 1),
('630', 'PRIMERA NORMAL ANITA PREMIUM KILOS 20', 1, 1),
('631', '1B FREDY FYFFES BAG 16 13 KG SM - 60', 0.71, 1),
('637', 'PRIMERA NORMAL FYFFES EUROBOX CHEP KILOS 20', 1, 1),
('638', 'PRIMERA NORMAL DOLE PREMIO POLYPAC KILOS 20', 1, 1),
('642', 'CLUSTER BAG FYFFES 13 KLS CLUSTER KILOS 13', 0.71, 1),
('645', 'PRIMERA NORMAL FYFFES BAG BLANK KILOS 20', 1, 1),
('649', 'DECO BAG KILOS', 1, 1),
('650', 'FREDDY FYFFES USA', 1, 6),
('654', 'CLUSTER BAG DEDO SUELTO CORTO KILOS', 1, 1),
('655', 'NATURAL TASTY INV. KILOS', 1, 1),
('656', 'PRIMERA NORMAL PREMIUM HOYA EUROBOX KILOS 20', 1, 1),
('657', 'PR FYFFES 12.7K -60 SM', 0.71, 1),
('658', 'PR FYFFE BAG BLANCO 18.14K SM - 48', 1, 1),
('660', 'PR BONI BAG 18.14K SM-48', 1, 1),
('661', 'PR FYFFES PRINTED BAG SM-48', 1, 1),
('663', 'FYFFES SMOLL BAG KILOS', 0.71, 1),
('665', 'TURBANA 5 LIBRAS KILOS 20', 0.14, 1),
('667', 'PRIMERA NORMAL DELMONTE ITALIANO KILOS 21', 1, 1),
('668', 'PR BANASUN', 1, 1),
('669', 'PRIMERA NORMAL DISNEY PREMIUM KILOS 20', 1, 1),
('670', 'PR HOYA 12.7 KG SM -60', 0.71, 1),
('673', 'PRIMERA NORMAL PREMIUM HOYA ESTÁNDAR KILOS 20', 1, 1),
('674', 'FYFFES HD  KILOS', 1, 1),
('675', 'JS FAIR TRADE 17 KG EU-50', 0.94, 1),
('676', 'SAINSBURY EUROPA KILOS', 0.94, 1),
('678', 'FYFFES 13KL C BAG UK KILOS', 0.72, 1),
('679', 'PRIMERA NORMAL TURBANA PRMIUN KILOS 20', 1, 1),
('681', 'PR ASDA CHEP 17 K', 0.94, 1),
('682', 'PRIMERA NORMAL PR TURBANA HD KILOS 20', 1, 1),
('683', 'PRIMERA NORMAL FYFFES HD  KILOS 20', 1, 1),
('685', 'CLUSTER BAG JUNIOR DISNEY KILOS 20', 1, 1),
('686', 'PRIMERA NORMAL  DIAMANTE HD KILOS 20', 1, 1),
('687', 'CHIQUITA BANAVACK EUROPALLET', 1, 1),
('688', 'CLUSTER BAG DISNEY PREMIUN BAG KILOS 20', 1, 1),
('689', 'PRIMERA NORMAL FRUIT DU MONDE KILOS 20', 1, 1),
('690', 'PRIMERA NORMAL ASDA  KILOS 17', 0.95, 1),
('691', 'JS FAIRTRADE 17K SM - 55', 0.94, 1),
('692', 'CLUSTER BAG BLANCO 7 18.14 KGS KILOS 20', 1, 1),
('693', 'PRIMERA NORMAL TURBANA BANA FRESH KILOS 20', 1, 1),
('694', 'PRIMERA MED STDHD NORMAL FYFFES KILOS 20 SIN SELLO', 1, 1),
('695', 'PR TURBANA HANDS 13K SM - 56', 0.71, 1),
('696', 'CLUSTER BAG COOP 7 KILOS 13', 0.74, 1),
('698', 'PRFYFFES STD 18.14 K ALTA VENTILACIÓN', 1, 1),
('699', 'PRIMERA NORMAL RIO GRANDE  KILOS 20', 1, 1),
('700', 'RACIMO BANANO ENMEPADO', 1, 1),
('701', 'FAIR TRADE 12 KG-SM', 0.66, 6),
('702', 'FLO FT EUROPA 18.14 KG - FT -', 1, 6),
('703', 'ORGANICO BAG NAKED', 1, 1),
('704', 'FAIR TRADE 13 KG-UR', 0.72, 6),
('705', 'PR BANANEC MEDIT EURO KILOS 20', 1, 1),
('706', 'PR BANANEC MEDIT PAL KILOS 20', 1, 1),
('707', 'FAITRADE 3LB BAG USA', 1, 6),
('708', 'FAIR TRADE BAG 13 KLS', 0.72, 6),
('709', 'BLANC BAG TURBANA SM', 1, 1),
('710', 'FLO FT 12 BAG 15 KLS', 0.83, 6),
('711', 'FLO FT 12 BAG 15 KLS SM', 0.83, 6),
('712', 'PRIMERA NORMAL DOLPHIN HD KILOS 20', 1, 1),
('713', 'SEGUNDA DARIEN ESTÁNDAR KILOS 20 -', 1, 2),
('714', 'PRIMERA NORMAL TURBANA PREMIUM KILOS 20 -', 1, 1),
('716', 'PR FYFFE PEV-EURO-45', 1, 1),
('717', 'PRIMERA NORMAL TROPY DARIÉN KILOS 20', 1, 1),
('719', 'FLO FT 20BAG MORRISONS', 1, 6),
('720', 'CLUSTER BAG TURBANA BAG 3LBS KILOS 20', 1, 1),
('7200', 'DEL MONTE PB-EU DM-COVER PP', 1, 1),
('721', 'DEL MONTE PB EU DM-COVER BVC', 1, 1),
('7210', 'DEL MONTE PB-EU DM-COVER B.BULK PP', 1, 1),
('7215', 'DEL MONTE PB-EU DM-COVER B.BULK BVC', 1, 1),
('722', 'COSTCO TB-BAG 3 LBS', 1, 1),
('7220', 'DEL MONTE EUROBOX-EU EEPB6 B.BULK', 1, 1),
('7225', 'DEL MONTE EUROBOX-EU EEPB6', 1, 1),
('723', 'FAIRTRADE PINTED BAG 13KG', 0.72, 6),
('7230', 'DEL MONTE PB-UK DM-COVER BVC', 1, 1),
('7235', 'DEL MONTE PREMIUM EUROMINI', 1, 1),
('724', 'FLO FT 24BAG MORRISONS', 1, 6),
('7240', 'DEL MONTE PB-DM-COVER BVC B.BULK', 1, 1),
('7245', 'DEL MONTE PB-EU DM-COVER BVC', 1, 1),
('725', 'CLUSTER BAG FYFFES 3 LBS BAG KILOS 20', 1, 1),
('726', 'PRIMERA NORMAL DOLE PREMIO BANAVAC KILOS 20', 1, 1),
('727', 'TROPY PREMIO', 1, 1),
('7270', 'UTC PB-EU DM-COVER BVC', 1, 1),
('7275', 'UTC PB-EU DM-COVER PP', 1, 1),
('728', 'ELABORADO MERCADO NACIONAL LARGO UNIBAN', 1, 1),
('7280', 'UTC PB-EU DM-COVER B.BULK PP', 1, 1),
('7285', 'UTC EUROPEO GRANEL BVC', 1, 1),
('729', 'ELABORADO DEDO SUELTO 25 KLS', 1, 1),
('730', 'RECH 20 KLS MDO NAL', 1, 1),
('7300', 'DEL MONTE PREMIUM ITALIANO', 1, 1),
('731', 'RECH 13 KLS MDO NAL', 0.71, 1),
('732', 'PR DOLE MEDITERRANEO PALLET', 1, 1),
('733', 'PR DOLE MED. GRANEL', 1, 1),
('7330', 'UTC ITALIANO DM-COVER', 1, 1),
('734', 'TURBANA 4 LBS', 1, 1),
('735', 'CLUSTER BAG 1B CLUSTER BAG KILOS 15', 0.84, 1),
('736', 'ANITA SPOT COMACO', 1, 1),
('737', 'PRIMERA NORMAL FYFFES EUROBOX KILOS 20 -', 1, 1),
('738', 'PR PLOP BAG SM-48', 1, 1),
('739', 'BUMPER PACK', 0.74, 1),
('740', 'CLUSTER BAG DOLE EXTRA SF-95 BANAVAC KILOS', 1, 1),
('741', 'DOLE CABANITA BANAVAC KILOS', 1, 1),
('742', 'PR DON MARIO KILOS', 1, 1),
('743', 'CLUSTER BAG MORRISONS BUMPER PACK KILOS 13', 0.71, 1),
('744', 'PRIMERA NORMAL PREMIUM LOBLAW KILOS 20', 1, 1),
('745', 'FT WHOLE FOODS', 1, 6),
('746', 'PRIMERA NORMAL PREMIUM TROPY HD KILOS 20', 1, 1),
('747', 'MORRISON 16 MOR8', 1, 1),
('748', 'FLO FT 13 BAG 16.5 K', 0.91, 6),
('749', 'PRIMERA NORMAL DOLE BAJELLA BANAVAC  KILOS 20', 1, 1),
('750', 'PR TROPICAL EDEN -48', 1, 1),
('767', 'FT 14 KLS- 75 DEDOS', 0.77, 6),
('771', 'CLUSTER BAG 1B-ASDA GARDEN 15CB8 KILOS 15', 0.79, 1),
('780', 'MI CASA', 1, 1),
('781', 'BAHIA SPOT COMACO EUROPALLET 20K BANAV', 1, 1),
('783', 'PR TURBANA COLOMBIA', 1, 1),
('794', 'FT 13 KLS 16CB7 BAG', 0.71, 6),
('799', 'JS FAIR TRADE EU-50', 0.94, 1),
('8100', '5 A DAY USA', 1, 1),
('811', 'PREMIUM TURBANA NEW LOGO 48 KILOS 20', 1, 1),
('8118', 'PRIMERA NORMAL DOLE EXTRA SF-95 POLYPACK KILOS 20', 1, 1),
('8123', 'CLUSTER BAG DOLE BARE CLUSTER BAG KILOS 20', 1, 1),
('8124', 'SEGUNDA NORMAL DOLE BAJELLA POLYPACK KILOS 20', 1, 2),
('8125', 'PRIMERA NORMAL DOLE FIRST PRICE KILOS 20', 1, 1),
('8127', 'PRIMERA NORMAL DOLE FIRST PRICE KILOS 21', 1, 1),
('8136', 'PRIMERA NORMAL DOLE CABANITA POLYPACK KILOS 20', 1, 1),
('817', 'DEDO SUELTO CORTO', 1, 1),
('818', 'FT WHOLE FOODS -', 1, 6),
('820', 'PREMIUM UNIFRUIT KRAFT 20 KLOS', 1, 1),
('823', 'PRIMERA TROPY KRAFT', 1, 1),
('833', 'FLO FT 13 BAG 16.5 K -', 0.91, 6),
('834', 'FT-WAITROSE 17', 0.94, 6),
('839', 'FAIRTRADE 3 LB BAG USA', 1, 6),
('840', 'PRIMERA B FYFFES 12.7 KL 60 13 KLS CLUSTERG', 0.72, 1),
('844', 'FAIR TRADE 18 KL', 1, 6),
('845', 'FLO FT EUROPEA 18.14 KG - FTMH18', 1, 6),
('847', 'PR SUPREME MEDIT EUR', 1, 1),
('851', 'PRIMERA TROPY MEDITERRANEO PACIFIC', 1, 1),
('853', 'FLO TROPY HD', 1, 6),
('862', 'DEL MONTE  FRANCIA PB EU DM-COVER BVC', 1, 1),
('863', 'FLO FT EUROPA 18.14 KG - FT18', 1, 6),
('865', 'FT SMALL 13 KG', 0.71, 6),
('868', 'SEGUNDA HAPPY BANANAS', 1, 2),
('877', 'FTJS FAIR T17K EU-50', 0.94, 6),
('878', 'FT 13 BAG 16.5 K', 0.91, 6),
('880', 'DOLE PREMIUM', 1, 1),
('882', 'PRIMERA DOLE BAJELLA POLYPACK 20 KLOS', 1, 1),
('883', 'PREMIO BAJELLA POLYPACK', 1, 1),
('887', 'DEL MONTE  PORTUGAL PB EU DM-COVER BVC', 1, 1),
('888', 'SELEC ORSERO BANANAS', 1, 1),
('889', 'SELEC ORSERO BANANAS -', 1, 1),
('891', 'FT PRIMERA WAITROSD 17 KILOS', 0.94, 6),
('897', 'FT EUROPA 18.14 KLOS FTNS', 1, 6),
('906', 'PRIMERA ASDA 17 KLOS', 0.94, 1),
('9100', 'DM USA', 1, 1),
('9110', 'ROSY', 1, 1),
('9120', '3 LBS BAG', 1, 1),
('913', 'PR AS17 NEW', 0.95, 1),
('9135', 'U.T.C', 1, 1),
('918', 'FT PRIMERA ST FIRE 3 LIBRAS BAG', 1, 6),
('919', 'FT PRIMERA WHOLE FOODS', 1, 6),
('9200', 'DM 27 BD PALLET POLYPACK', 1, 1),
('9210', 'DM GRANEL', 1, 1),
('9220', 'EUROBOX', 1, 1),
('9225', 'DM EUBOX-EU-EEPB-6', 1, 1),
('9230', 'DM PALLET', 1, 1),
('9245', 'DM PALLET BVC', 1, 1),
('9260', 'ROSY PALLET BVC', 1, 1),
('9270', 'U.T.C PALLET BVC', 1, 1),
('9275', 'U.T.C PALLET POLY P.', 1, 1),
('9280', 'U.T.C GRANEL', 1, 1),
('930', 'PRIMERA TROPY HD KRAFT', 1, 1),
('9300', 'DM ITALIANO', 1, 1),
('9330', 'UTC MEDITERRANEO BVC PALLET', 1, 1),
('934', 'PR BAHIA HDSIN SELLO', 1, 1),
('935', 'PR SIMBA BANANAS', 1, 1),
('942', 'PRIMERA SLOBANA PREMIUM HD', 1, 1),
('945', 'PR FYFFES STD - HD', 1, 1),
('946', 'PR FYFFES MED 18.14', 1, 1),
('947', 'SELECT PEV FYFFES 18K', 1, 1),
('950', 'FT WALTROSE  17', 0.94, 6),
('956', 'PR CONAD', 1, 1),
('96', 'FRUTA PREMIUN BANANAS 1 X 1', 1, 3),
('960', 'FT 14 CB 6 EU-60 BAG', 0.78, 6),
('967', 'FT FAIRTRADE FTFY18 20 KLOS', 1, 6),
('97', 'FRUTA MERCADO NACIONAL ESPECIAL', 1, 3),
('970', 'PR SUPREME MEDIT EUR (BANAFRUT) ', 1, 1),
('972', 'FTJS FAIR T17K EU-50 -', 0.94, 6),
('975', 'PR SUPREME MEDIT EUR -', 1, 1),
('98', 'FRUTA PREMIUN FRUTICA', 1, 4),
('983', 'FT PRIMERA WAITROSD 17 KILOS -', 0.94, 6),
('985', 'FT DOCE KILOS', 0.66, 6),
('99', 'FRUTA CATEGORIA II FRUTICA ', 1, 5),
('991', 'FT TEFTB 15 EU-50 17 KL BAG', 0.94, 6),
('999', 'JS FAIR TRADE 17K E', 0.94, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcargue`
--

CREATE TABLE `tblcargue` (
  `PKId_Cargue` int(11) NOT NULL,
  `FKIbm_TblFincas` varchar(5) NOT NULL,
  `Cliente` varchar(200) NOT NULL,
  `Fecha_Cargue` date NOT NULL,
  `N_Poma` varchar(5) NOT NULL,
  `DedoSuelto` int(11) DEFAULT NULL,
  `Cluster` int(11) DEFAULT NULL,
  `ManoEntera` int(11) DEFAULT NULL,
  `Especial` int(11) DEFAULT NULL,
  `Bolsa20Kilos` int(11) DEFAULT NULL,
  `Bolsa25Kilos` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `Placa_Vehiculo` varchar(8) NOT NULL,
  `Conductor` varchar(200) NOT NULL,
  `FKCod_TblEmbarque` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblcargue`
--

INSERT INTO `tblcargue` (`PKId_Cargue`, `FKIbm_TblFincas`, `Cliente`, `Fecha_Cargue`, `N_Poma`, `DedoSuelto`, `Cluster`, `ManoEntera`, `Especial`, `Bolsa20Kilos`, `Bolsa25Kilos`, `Total`, `Placa_Vehiculo`, `Conductor`, `FKCod_TblEmbarque`) VALUES
(1, '80074', 'Nombre cliente1', '2020-10-21', '1010', 25, 0, 0, 0, 0, 0, 25, 'ABC123', 'No hay', 'EMB-202010'),
(2, '80074', 'Nombre cliente2', '2020-10-22', '1011', 26, 0, 0, 0, 0, 0, 26, 'ABC124', 'Si hubo', 'EMB-202010'),
(3, '80074', 'Nombre cliente3', '2020-10-23', '1012', 27, 0, 0, 0, 0, 0, 27, 'ABC125', 'El mismo', 'EMB-202010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcintas`
--

CREATE TABLE `tblcintas` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Estructura de tabla para la tabla `tbldet_tbldet_tblproduccion`
--

CREATE TABLE `tbldet_tbldet_tblproduccion` (
  `PKId` int(11) NOT NULL,
  `FKId_TblDet_TblProduccion` int(11) NOT NULL,
  `FKCodigo_TblCajasProduccion` varchar(5) NOT NULL,
  `N_CajasProducidas_Dia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbldet_tbldet_tblproduccion`
--

INSERT INTO `tbldet_tbldet_tblproduccion` (`PKId`, `FKId_TblDet_TblProduccion`, `FKCodigo_TblCajasProduccion`, `N_CajasProducidas_Dia`) VALUES
(1, 1, '1103', 5),
(2, 1, '1114', NULL),
(3, 1, '1313', NULL),
(4, 2, '1103', NULL),
(5, 2, '1114', NULL),
(6, 2, '1313', NULL),
(7, 3, '1103', NULL),
(8, 3, '1114', NULL),
(9, 3, '1313', NULL),
(10, 4, '1103', NULL),
(11, 4, '1114', NULL),
(12, 4, '1313', NULL),
(13, 5, '1103', NULL),
(14, 5, '1114', NULL),
(15, 5, '1313', NULL),
(16, 6, '1103', NULL),
(17, 6, '1114', NULL),
(18, 6, '1313', NULL),
(19, 7, '1103', NULL),
(20, 7, '1114', NULL),
(21, 7, '1313', NULL),
(22, 8, '1298', NULL),
(23, 8, '1304', NULL),
(24, 8, '1313', NULL),
(25, 8, '1333', NULL),
(26, 8, '200', NULL),
(27, 9, '1298', NULL),
(28, 9, '1304', NULL),
(29, 9, '1313', NULL),
(30, 9, '1333', NULL),
(31, 9, '200', NULL),
(32, 10, '1298', NULL),
(33, 10, '1304', NULL),
(34, 10, '1313', NULL),
(35, 10, '1333', NULL),
(36, 10, '200', NULL),
(37, 11, '1298', NULL),
(38, 11, '1304', NULL),
(39, 11, '1313', NULL),
(40, 11, '1333', NULL),
(41, 11, '200', NULL),
(42, 12, '1298', NULL),
(43, 12, '1304', NULL),
(44, 12, '1313', NULL),
(45, 12, '1333', NULL),
(46, 12, '200', NULL),
(47, 13, '1298', NULL),
(48, 13, '1304', NULL),
(49, 13, '1313', NULL),
(50, 13, '1333', NULL),
(51, 13, '200', NULL),
(52, 14, '1298', NULL),
(53, 14, '1304', NULL),
(54, 14, '1313', NULL),
(55, 14, '1333', NULL),
(56, 14, '200', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tbldet_tblracimos_tbldias`
--

CREATE TABLE `tbldet_tbldet_tblracimos_tbldias` (
  `PKId` int(11) NOT NULL,
  `FKId_TblDet_TblRacimos_TblDias` int(11) NOT NULL,
  `FKId_TblCintas` int(11) NOT NULL,
  `N_RacimosC_Cintas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbldet_tbldet_tblracimos_tbldias`
--

INSERT INTO `tbldet_tbldet_tblracimos_tbldias` (`PKId`, `FKId_TblDet_TblRacimos_TblDias`, `FKId_TblCintas`, `N_RacimosC_Cintas`) VALUES
(1, 1, 5, 0),
(2, 1, 6, 0),
(3, 1, 7, 0),
(4, 1, 8, 0),
(5, 2, 5, 0),
(6, 2, 6, 0),
(7, 2, 7, 0),
(8, 2, 8, 0),
(9, 3, 5, 0),
(10, 3, 6, 0),
(11, 3, 7, 0),
(12, 3, 8, 0),
(13, 4, 5, 0),
(14, 4, 6, 55),
(15, 4, 7, 0),
(16, 4, 8, 0),
(17, 5, 5, 0),
(18, 5, 6, 0),
(19, 5, 7, 0),
(20, 5, 8, 0),
(21, 6, 5, 0),
(22, 6, 6, 0),
(23, 6, 7, 0),
(24, 6, 8, 0),
(25, 7, 5, 0),
(26, 7, 6, 0),
(27, 7, 7, 0),
(28, 7, 8, 0),
(29, 8, 10, 0),
(30, 8, 1, 0),
(31, 8, 2, 0),
(32, 8, 3, 0),
(33, 9, 10, 0),
(34, 9, 1, 0),
(35, 9, 2, 0),
(36, 9, 3, 0),
(37, 10, 10, 0),
(38, 10, 1, 0),
(39, 10, 2, 0),
(40, 10, 3, 0),
(41, 11, 10, 0),
(42, 11, 1, 0),
(43, 11, 2, 0),
(44, 11, 3, 0),
(45, 12, 10, 0),
(46, 12, 1, 0),
(47, 12, 2, 0),
(48, 12, 3, 0),
(49, 13, 10, 0),
(50, 13, 1, 0),
(51, 13, 2, 0),
(52, 13, 3, 0),
(53, 14, 10, 0),
(54, 14, 1, 0),
(55, 14, 2, 0),
(56, 14, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tblembarque`
--

CREATE TABLE `tbldet_tblembarque` (
  `PKId` int(11) NOT NULL,
  `FKCod_TblEmbarque` varchar(10) NOT NULL,
  `FKIbm_TblFincas` varchar(5) NOT NULL,
  `FKCodigo_TblCajasProduccion` varchar(5) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbldet_tblembarque`
--

INSERT INTO `tbldet_tblembarque` (`PKId`, `FKCod_TblEmbarque`, `FKIbm_TblFincas`, `FKCodigo_TblCajasProduccion`, `Cantidad`) VALUES
(1, 'EMB-20205', '80009', '1103', 900),
(2, 'EMB-20205', '85747', '1103', 900),
(3, 'EMB-20205', '80004', '1103', 900),
(4, 'EMB-20205', '80075', '1103', 900),
(5, 'EMB-20205', '80074', '1103', 900),
(6, 'EMB-20205', '80008', '1103', 900),
(7, 'EMB-20205', '80009', '1114', 800),
(8, 'EMB-20205', '85747', '1114', 800),
(9, 'EMB-20205', '80004', '1114', 800),
(10, 'EMB-20205', '80075', '1114', 800),
(11, 'EMB-20205', '80074', '1114', 800),
(12, 'EMB-20205', '80008', '1114', 800),
(13, 'EMB-20205', '80009', '1313', 200),
(14, 'EMB-20205', '85747', '1313', 200),
(15, 'EMB-20205', '80004', '1313', 200),
(16, 'EMB-20205', '80075', '1313', 200),
(17, 'EMB-20205', '80074', '1313', 200),
(18, 'EMB-20205', '80008', '1313', 200),
(19, 'EMB-202010', '80009', '1298', 900),
(20, 'EMB-202010', '85747', '1298', 900),
(21, 'EMB-202010', '80004', '1298', 900),
(22, 'EMB-202010', '80075', '1298', 900),
(23, 'EMB-202010', '80074', '1298', 900),
(24, 'EMB-202010', '80008', '1298', 900),
(25, 'EMB-202010', '80009', '1304', 800),
(26, 'EMB-202010', '85747', '1304', 800),
(27, 'EMB-202010', '80004', '1304', 800),
(28, 'EMB-202010', '80075', '1304', 800),
(29, 'EMB-202010', '80074', '1304', 800),
(30, 'EMB-202010', '80008', '1304', 800),
(31, 'EMB-202010', '80009', '1313', 700),
(32, 'EMB-202010', '85747', '1313', 700),
(33, 'EMB-202010', '80004', '1313', 700),
(34, 'EMB-202010', '80075', '1313', 700),
(35, 'EMB-202010', '80074', '1313', 700),
(36, 'EMB-202010', '80008', '1313', 700),
(37, 'EMB-202010', '80009', '1333', 600),
(38, 'EMB-202010', '85747', '1333', 600),
(39, 'EMB-202010', '80004', '1333', 600),
(40, 'EMB-202010', '80075', '1333', 600),
(41, 'EMB-202010', '80074', '1333', 600),
(42, 'EMB-202010', '80008', '1333', 600),
(43, 'EMB-202010', '80009', '200', 50),
(44, 'EMB-202010', '85747', '200', 50),
(45, 'EMB-202010', '80004', '200', 50),
(46, 'EMB-202010', '80075', '200', 50),
(47, 'EMB-202010', '80074', '200', 0),
(48, 'EMB-202010', '80008', '200', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tblmercadonacional`
--

CREATE TABLE `tbldet_tblmercadonacional` (
  `PKId` int(11) NOT NULL,
  `FKId_TblMercadoNacional` int(11) NOT NULL,
  `FKId_TblDias` int(11) NOT NULL,
  `FKId_TblCajasMercadoNacional` int(11) NOT NULL,
  `Cantidad_Elaborado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbldet_tblmercadonacional`
--

INSERT INTO `tbldet_tblmercadonacional` (`PKId`, `FKId_TblMercadoNacional`, `FKId_TblDias`, `FKId_TblCajasMercadoNacional`, `Cantidad_Elaborado`) VALUES
(1, 1, 1, 1, 0),
(2, 1, 1, 2, 0),
(3, 1, 1, 3, 0),
(4, 1, 1, 4, 0),
(5, 1, 1, 5, 0),
(6, 1, 1, 6, 0),
(7, 1, 2, 1, 0),
(8, 1, 2, 2, 0),
(9, 1, 2, 3, 0),
(10, 1, 2, 4, 0),
(11, 1, 2, 5, 0),
(12, 1, 2, 6, 0),
(13, 1, 3, 1, 0),
(14, 1, 3, 2, 0),
(15, 1, 3, 3, 0),
(16, 1, 3, 4, 0),
(17, 1, 3, 5, 0),
(18, 1, 3, 6, 0),
(19, 1, 4, 1, 0),
(20, 1, 4, 2, 0),
(21, 1, 4, 3, 0),
(22, 1, 4, 4, 0),
(23, 1, 4, 5, 0),
(24, 1, 4, 6, 0),
(25, 1, 5, 1, 0),
(26, 1, 5, 2, 0),
(27, 1, 5, 3, 0),
(28, 1, 5, 4, 0),
(29, 1, 5, 5, 0),
(30, 1, 5, 6, 0),
(31, 1, 6, 1, 0),
(32, 1, 6, 2, 0),
(33, 1, 6, 3, 0),
(34, 1, 6, 4, 0),
(35, 1, 6, 5, 0),
(36, 1, 6, 6, 0),
(37, 1, 7, 1, 0),
(38, 1, 7, 2, 0),
(39, 1, 7, 3, 0),
(40, 1, 7, 4, 0),
(41, 1, 7, 5, 0),
(42, 1, 7, 6, 0),
(43, 2, 1, 1, 0),
(44, 2, 1, 2, 0),
(45, 2, 1, 3, 0),
(46, 2, 1, 4, 0),
(47, 2, 1, 5, 0),
(48, 2, 1, 6, 0),
(49, 2, 2, 1, 0),
(50, 2, 2, 2, 0),
(51, 2, 2, 3, 0),
(52, 2, 2, 4, 0),
(53, 2, 2, 5, 0),
(54, 2, 2, 6, 0),
(55, 2, 3, 1, 0),
(56, 2, 3, 2, 0),
(57, 2, 3, 3, 0),
(58, 2, 3, 4, 0),
(59, 2, 3, 5, 0),
(60, 2, 3, 6, 0),
(61, 2, 4, 1, 0),
(62, 2, 4, 2, 0),
(63, 2, 4, 3, 0),
(64, 2, 4, 4, 0),
(65, 2, 4, 5, 0),
(66, 2, 4, 6, 0),
(67, 2, 5, 1, 0),
(68, 2, 5, 2, 0),
(69, 2, 5, 3, 0),
(70, 2, 5, 4, 0),
(71, 2, 5, 5, 0),
(72, 2, 5, 6, 0),
(73, 2, 6, 1, 0),
(74, 2, 6, 2, 0),
(75, 2, 6, 3, 0),
(76, 2, 6, 4, 0),
(77, 2, 6, 5, 0),
(78, 2, 6, 6, 0),
(79, 2, 7, 1, 0),
(80, 2, 7, 2, 0),
(81, 2, 7, 3, 0),
(82, 2, 7, 4, 0),
(83, 2, 7, 5, 0),
(84, 2, 7, 6, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tblproduccion`
--

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
  `Peso_Vastago` float DEFAULT NULL,
  `Lotes_Cortados` varchar(50) NOT NULL,
  `Lotes_Iniciados` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbldet_tblproduccion`
--

INSERT INTO `tbldet_tblproduccion` (`PKId`, `FKId_TblProduccion`, `FKId_TblDias`, `Total_CE_Dia`, `Total_CR_Dia`, `Total_CEx_Dia`, `Ratio`, `Merma`, `Peso_Racimos`, `Area_Recorrida`, `Peso_Vastago`, `Lotes_Cortados`, `Lotes_Iniciados`) VALUES
(1, 1, 1, 5, 2, 3, NULL, NULL, NULL, 0, NULL, '1-2-3-4-5', ''),
(2, 1, 2, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(3, 1, 3, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(4, 1, 4, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(5, 1, 5, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(6, 1, 6, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(7, 1, 7, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(8, 2, 1, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(9, 2, 2, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(10, 2, 3, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(11, 2, 4, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(12, 2, 5, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(13, 2, 6, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', ''),
(14, 2, 7, 0, 0, 0, NULL, NULL, NULL, 0, NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tblracimos_tbldias`
--

CREATE TABLE `tbldet_tblracimos_tbldias` (
  `PKId` int(11) NOT NULL,
  `FKId_TblRacimos` int(11) NOT NULL,
  `FKId_TblDias` int(11) NOT NULL,
  `N_RacimosC_Dia` int(11) NOT NULL,
  `N_RacimosR_Dia` int(11) NOT NULL,
  `Total_PEmbarque` int(11) NOT NULL,
  `Total_POtrasFincas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbldet_tblracimos_tbldias`
--

INSERT INTO `tbldet_tblracimos_tbldias` (`PKId`, `FKId_TblRacimos`, `FKId_TblDias`, `N_RacimosC_Dia`, `N_RacimosR_Dia`, `Total_PEmbarque`, `Total_POtrasFincas`) VALUES
(1, 1, 1, 0, 0, 0, 0),
(2, 1, 2, 0, 0, 0, 0),
(3, 1, 3, 0, 0, 0, 0),
(4, 1, 4, 55, 0, 0, 0),
(5, 1, 5, 0, 0, 0, 0),
(6, 1, 6, 0, 0, 0, 0),
(7, 1, 7, 0, 0, 0, 0),
(8, 2, 1, 0, 0, 0, 0),
(9, 2, 2, 0, 0, 0, 0),
(10, 2, 3, 0, 0, 0, 0),
(11, 2, 4, 0, 0, 0, 0),
(12, 2, 5, 0, 0, 0, 0),
(13, 2, 6, 0, 0, 0, 0),
(14, 2, 7, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldias`
--

CREATE TABLE `tbldias` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tblembarque` (
  `PKCod` varchar(10) NOT NULL,
  `FKId_TblSemanas` int(11) NOT NULL,
  `Anho` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblembarque`
--

INSERT INTO `tblembarque` (`PKCod`, `FKId_TblSemanas`, `Anho`) VALUES
('EMB-202010', 10, '2020'),
('EMB-20205', 5, '2020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblembolse`
--

CREATE TABLE `tblembolse` (
  `PKId` int(11) NOT NULL,
  `FKId_TblSemanas` int(11) NOT NULL,
  `N_PlantasPresente` int(11) NOT NULL,
  `N_PlantasPrematuro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblembolse`
--

INSERT INTO `tblembolse` (`PKId`, `FKId_TblSemanas`, `N_PlantasPresente`, `N_PlantasPrematuro`) VALUES
(1, 5, 0, 0),
(2, 10, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempresas`
--

CREATE TABLE `tblempresas` (
  `PKNit` varchar(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tblestadousuario` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tblestimativo` (
  `PKId` int(11) NOT NULL,
  `Finca` varchar(50) NOT NULL,
  `Premiun` int(11) DEFAULT NULL,
  `Especial` int(11) DEFAULT NULL,
  `FKCod_TblEmbarque` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblestimativo`
--

INSERT INTO `tblestimativo` (`PKId`, `Finca`, `Premiun`, `Especial`, `FKCod_TblEmbarque`) VALUES
(1, 'ZARZAMORA', 20, 10, 'EMB-20205'),
(2, 'GUAIMARAL', 20, 10, 'EMB-20205'),
(3, 'TAIWÁN', 20, 10, 'EMB-20205'),
(4, 'CANDELARIA', 20, 10, 'EMB-20205'),
(5, 'ÁLAMOS', 20, 10, 'EMB-20205'),
(6, 'KALAMARÍ', 20, 10, 'EMB-20205'),
(7, 'ZARZAMORA', 90, 50, 'EMB-202010'),
(8, 'GUAIMARAL', 90, 50, 'EMB-202010'),
(9, 'TAIWÁN', 90, 50, 'EMB-202010'),
(10, 'CANDELARIA', 90, 50, 'EMB-202010'),
(11, 'ÁLAMOS', 90, 50, 'EMB-202010'),
(12, 'KALAMARÍ', 90, 50, 'EMB-202010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblfincas`
--

CREATE TABLE `tblfincas` (
  `PKIbm` varchar(5) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Area_Neta` float NOT NULL,
  `Area_Bruta` float NOT NULL,
  `FKNit_TblEmpresas` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tbllotes` (
  `PKId` int(11) NOT NULL,
  `Lote` varchar(20) NOT NULL,
  `Area_Neta` float NOT NULL,
  `Area_Bruta` float NOT NULL,
  `FKIbm_TblFincas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tblmercadonacional` (
  `PKId` int(11) NOT NULL,
  `Total_Elaborado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblmercadonacional`
--

INSERT INTO `tblmercadonacional` (`PKId`, `Total_Elaborado`) VALUES
(1, 0),
(2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblproduccion`
--

CREATE TABLE `tblproduccion` (
  `PKId` int(11) NOT NULL,
  `FKIbm_TblFincas` varchar(5) NOT NULL,
  `FKId_TblEmbolse` int(11) NOT NULL,
  `FKId_TblRacimos` int(11) NOT NULL,
  `FKId_TblSemanas` int(11) NOT NULL,
  `FKId_TblMercadoNacional` int(11) DEFAULT NULL,
  `Cod_Embarque` varchar(10) NOT NULL,
  `Total_CElaboradas` int(11) DEFAULT NULL,
  `Total_CREchazadas` int(11) DEFAULT NULL,
  `Total_CExportadas` int(11) DEFAULT NULL,
  `Ratio` float DEFAULT NULL,
  `Merma` float DEFAULT NULL,
  `Peso_Racimos` float DEFAULT NULL,
  `Area_Recorrida` float DEFAULT NULL,
  `Peso_Vastago` float DEFAULT NULL,
  `Anho_Produccion` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblproduccion`
--

INSERT INTO `tblproduccion` (`PKId`, `FKIbm_TblFincas`, `FKId_TblEmbolse`, `FKId_TblRacimos`, `FKId_TblSemanas`, `FKId_TblMercadoNacional`, `Cod_Embarque`, `Total_CElaboradas`, `Total_CREchazadas`, `Total_CExportadas`, `Ratio`, `Merma`, `Peso_Racimos`, `Area_Recorrida`, `Peso_Vastago`, `Anho_Produccion`) VALUES
(1, '80074', 1, 1, 5, 1, 'EMB-20205', 5, 2, 3, NULL, NULL, NULL, 0, NULL, '2020'),
(2, '80074', 2, 2, 10, 2, 'EMB-202010', 0, 0, 0, NULL, NULL, NULL, 0, NULL, '2020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblracimos`
--

CREATE TABLE `tblracimos` (
  `PKId` int(11) NOT NULL,
  `FKId_TblSemanas` int(11) NOT NULL,
  `N_RacimosC` int(11) NOT NULL,
  `N_RacimosR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblracimos`
--

INSERT INTO `tblracimos` (`PKId`, `FKId_TblSemanas`, `N_RacimosC`, `N_RacimosR`) VALUES
(1, 5, 55, 0),
(2, 10, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblregistrosemanas`
--

CREATE TABLE `tblregistrosemanas` (
  `PKId` int(11) NOT NULL,
  `Anho_generado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsemanas`
--

CREATE TABLE `tblsemanas` (
  `PKId` int(11) NOT NULL,
  `N_Semana` varchar(50) DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Anho` int(11) NOT NULL,
  `FKId_TblCintas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblsemanas`
--

INSERT INTO `tblsemanas` (`PKId`, `N_Semana`, `Fecha_Inicio`, `Fecha_Fin`, `Anho`, `FKId_TblCintas`) VALUES
(1, 'SEMANA 1', '2019-12-30', '2020-01-05', 2020, 3),
(2, 'SEMANA 2', '2020-01-06', '2020-01-12', 2020, 4),
(3, 'SEMANA 3', '2020-01-13', '2020-01-19', 2020, 5),
(4, 'SEMANA 4', '2020-01-20', '2020-01-26', 2020, 6),
(5, 'SEMANA 5', '2020-01-27', '2020-02-02', 2020, 7),
(6, 'SEMANA 6', '2020-02-03', '2020-02-09', 2020, 8),
(7, 'SEMANA 7', '2020-02-10', '2020-02-16', 2020, 9),
(8, 'SEMANA 8', '2020-02-17', '2020-02-23', 2020, 10),
(9, 'SEMANA 9', '2020-02-24', '2020-03-01', 2020, 1),
(10, 'SEMANA 10', '2020-03-02', '2020-03-08', 2020, 2),
(11, 'SEMANA 11', '2020-03-09', '2020-03-15', 2020, 3),
(12, 'SEMANA 12', '2020-03-16', '2020-03-22', 2020, 4),
(13, 'SEMANA 13', '2020-03-23', '2020-03-29', 2020, 5),
(14, 'SEMANA 14', '2020-03-30', '2020-04-05', 2020, 6),
(15, 'SEMANA 15', '2020-04-06', '2020-04-12', 2020, 7),
(16, 'SEMANA 16', '2020-04-13', '2020-04-19', 2020, 8),
(17, 'SEMANA 17', '2020-04-20', '2020-04-26', 2020, 9),
(18, 'SEMANA 18', '2020-04-27', '2020-05-03', 2020, 10),
(19, 'SEMANA 19', '2020-05-04', '2020-05-10', 2020, 1),
(20, 'SEMANA 20', '2020-05-11', '2020-05-17', 2020, 2),
(21, 'SEMANA 21', '2020-05-18', '2020-05-24', 2020, 3),
(22, 'SEMANA 22', '2020-05-25', '2020-05-31', 2020, 4),
(23, 'SEMANA 23', '2020-06-01', '2020-06-07', 2020, 5),
(24, 'SEMANA 24', '2020-06-08', '2020-06-14', 2020, 6),
(25, 'SEMANA 25', '2020-06-15', '2020-06-21', 2020, 7),
(26, 'SEMANA 26', '2020-06-22', '2020-06-28', 2020, 8),
(27, 'SEMANA 27', '2020-06-29', '2020-07-05', 2020, 9),
(28, 'SEMANA 28', '2020-07-06', '2020-07-12', 2020, 10),
(29, 'SEMANA 29', '2020-07-13', '2020-07-19', 2020, 1),
(30, 'SEMANA 30', '2020-07-20', '2020-07-26', 2020, 2),
(31, 'SEMANA 31', '2020-07-27', '2020-08-02', 2020, 3),
(32, 'SEMANA 32', '2020-08-03', '2020-08-09', 2020, 4),
(33, 'SEMANA 33', '2020-08-10', '2020-08-16', 2020, 5),
(34, 'SEMANA 34', '2020-08-17', '2020-08-23', 2020, 6),
(35, 'SEMANA 35', '2020-08-24', '2020-08-30', 2020, 7),
(36, 'SEMANA 36', '2020-08-31', '2020-09-06', 2020, 8),
(37, 'SEMANA 37', '2020-09-07', '2020-09-13', 2020, 9),
(38, 'SEMANA 38', '2020-09-14', '2020-09-20', 2020, 10),
(39, 'SEMANA 39', '2020-09-21', '2020-09-27', 2020, 1),
(40, 'SEMANA 40', '2020-09-28', '2020-10-04', 2020, 2),
(41, 'SEMANA 41', '2020-10-05', '2020-10-11', 2020, 3),
(42, 'SEMANA 42', '2020-10-12', '2020-10-18', 2020, 4),
(43, 'SEMANA 43', '2020-10-19', '2020-10-25', 2020, 5),
(44, 'SEMANA 44', '2020-10-26', '2020-11-01', 2020, 6),
(45, 'SEMANA 45', '2020-11-02', '2020-11-08', 2020, 7),
(46, 'SEMANA 46', '2020-11-09', '2020-11-15', 2020, 8),
(47, 'SEMANA 47', '2020-11-16', '2020-11-22', 2020, 9),
(48, 'SEMANA 48', '2020-11-23', '2020-11-29', 2020, 10),
(49, 'SEMANA 49', '2020-11-30', '2020-12-06', 2020, 1),
(50, 'SEMANA 50', '2020-12-07', '2020-12-13', 2020, 2),
(51, 'SEMANA 51', '2020-12-14', '2020-12-20', 2020, 3),
(52, 'SEMANA 52', '2020-12-21', '2020-12-27', 2020, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipofruta`
--

CREATE TABLE `tbltipofruta` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tbltipousuario` (
  `PKId` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tblusuarios` (
  `PKId` int(11) NOT NULL,
  `FKIbm_TblFincas` varchar(5) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FKId_TblTipoUsuario` int(11) NOT NULL,
  `FKId_TblEstadoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `FKCod_TblEmbarque` (`FKCod_TblEmbarque`);

--
-- Indices de la tabla `tblcintas`
--
ALTER TABLE `tblcintas`
  ADD PRIMARY KEY (`PKId`);

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
  ADD KEY `FKId_TblCintas` (`FKId_TblCintas`);

--
-- Indices de la tabla `tbldet_tblembarque`
--
ALTER TABLE `tbldet_tblembarque`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKCod_TblEmbarque` (`FKCod_TblEmbarque`),
  ADD KEY `FKIbm_TblFincas` (`FKIbm_TblFincas`),
  ADD KEY `FKCodigo_TblCajasProduccion` (`FKCodigo_TblCajasProduccion`);

--
-- Indices de la tabla `tbldet_tblmercadonacional`
--
ALTER TABLE `tbldet_tblmercadonacional`
  ADD PRIMARY KEY (`PKId`),
  ADD KEY `FKId_TblMercadoNacional` (`FKId_TblMercadoNacional`),
  ADD KEY `FKId_TblDias` (`FKId_TblDias`),
  ADD KEY `FKId_TblCajasMercadoNacional` (`FKId_TblCajasMercadoNacional`);

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
  ADD PRIMARY KEY (`PKId`);

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
  MODIFY `PKId_Cargue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tblcintas`
--
ALTER TABLE `tblcintas`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbldet_tbldet_tblproduccion`
--
ALTER TABLE `tbldet_tbldet_tblproduccion`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `tbldet_tbldet_tblracimos_tbldias`
--
ALTER TABLE `tbldet_tbldet_tblracimos_tbldias`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `tbldet_tblembarque`
--
ALTER TABLE `tbldet_tblembarque`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `tbldet_tblmercadonacional`
--
ALTER TABLE `tbldet_tblmercadonacional`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `tbldet_tblproduccion`
--
ALTER TABLE `tbldet_tblproduccion`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbldet_tblracimos_tbldias`
--
ALTER TABLE `tbldet_tblracimos_tbldias`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbldias`
--
ALTER TABLE `tbldias`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tblembolse`
--
ALTER TABLE `tblembolse`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblestadousuario`
--
ALTER TABLE `tblestadousuario`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblestimativo`
--
ALTER TABLE `tblestimativo`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbllotes`
--
ALTER TABLE `tbllotes`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `tblmercadonacional`
--
ALTER TABLE `tblmercadonacional`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblproduccion`
--
ALTER TABLE `tblproduccion`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblracimos`
--
ALTER TABLE `tblracimos`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblregistrosemanas`
--
ALTER TABLE `tblregistrosemanas`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblsemanas`
--
ALTER TABLE `tblsemanas`
  MODIFY `PKId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
  ADD CONSTRAINT `tblcargue_ibfk_2` FOREIGN KEY (`FKCod_TblEmbarque`) REFERENCES `tblembarque` (`PKCod`);

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
  ADD CONSTRAINT `tbldet_tbldet_tblracimos_tbldias_ibfk_2` FOREIGN KEY (`FKId_TblCintas`) REFERENCES `tblcintas` (`PKId`);

--
-- Filtros para la tabla `tbldet_tblembarque`
--
ALTER TABLE `tbldet_tblembarque`
  ADD CONSTRAINT `tbldet_tblembarque_ibfk_1` FOREIGN KEY (`FKCod_TblEmbarque`) REFERENCES `tblembarque` (`PKCod`),
  ADD CONSTRAINT `tbldet_tblembarque_ibfk_2` FOREIGN KEY (`FKIbm_TblFincas`) REFERENCES `tblfincas` (`PKIbm`),
  ADD CONSTRAINT `tbldet_tblembarque_ibfk_3` FOREIGN KEY (`FKCodigo_TblCajasProduccion`) REFERENCES `tblcajasproduccion` (`PKCodigo`);

--
-- Filtros para la tabla `tbldet_tblmercadonacional`
--
ALTER TABLE `tbldet_tblmercadonacional`
  ADD CONSTRAINT `tbldet_tblmercadonacional_ibfk_1` FOREIGN KEY (`FKId_TblMercadoNacional`) REFERENCES `tblmercadonacional` (`PKId`),
  ADD CONSTRAINT `tbldet_tblmercadonacional_ibfk_2` FOREIGN KEY (`FKId_TblDias`) REFERENCES `tbldias` (`PKId`),
  ADD CONSTRAINT `tbldet_tblmercadonacional_ibfk_3` FOREIGN KEY (`FKId_TblCajasMercadoNacional`) REFERENCES `tblcajasmercadonacional` (`PKId`);

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
  ADD CONSTRAINT `tblestimativo_ibfk_1` FOREIGN KEY (`FKCod_TblEmbarque`) REFERENCES `tblembarque` (`PKCod`);

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
