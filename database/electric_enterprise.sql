-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2021 a las 11:08:15
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `electric_enterprise`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(1, 'Mayra Alexandra Castro Vargas', 'mayracv@gmail.com', '$2y$10$e/3VOfE1VKJBQk.FrSfVVeqaYSb7gQ8rquaoCbiRWrgzLFTxh8ByS', '0'),
(2, 'Luis Nina Estrada', 'luis.nina@gmail.com', '$2y$10$WTta9M/EmajTcxUc4M36zuzm9.Q1hCyZqlJVXDo8pwttVqXRGd.De', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(5, 'LG'),
(6, 'Asus'),
(7, 'Panasonic'),
(8, 'Otras'),
(9, 'Acer'),
(10, 'Indurama'),
(11, 'Coldex'),
(12, 'Lenovo'),
(13, 'Huawei'),
(14, 'Xiaomi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(2, 4, '::1', -1, 1),
(8, 6, '127.0.0.1', 1, 1),
(9, 15, '127.0.0.1', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electrohogar'),
(2, 'Tv & Video'),
(3, 'Computo & Tecnologia'),
(4, 'Audio'),
(6, 'Electrodomesticos'),
(12, 'Celulares');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '8AT7125245323433N', 'Completed'),
(3, 1, 12, 1, '1D308042Y1855945T', 'Completed');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 12, 2, 'SAMSUNG GALAXY S21 5G', 3699, 16, 'Modelo: S21 5G\r\nDimensiones: 7.12x15.17x0.79 cm\r\nPeso (kg): 169 g\r\nGarantía: 1 año\r\nMemoria interna: 128 GB\r\nMemoria RAM: 8 GB\r\nResolución de pantalla: Full HD\r\nTamaño de pantalla: 6.2\"', '1612859959_SM-G991BZILLTP_1.jpg', 'SAMSUNG GALAXY S21 5G 128GB'),
(2, 12, 3, 'APPLE IPHONE 11 64GB - ROJO', 3499, 11, 'Incluye:Cargador, cables y audífonos.\r\nModelo:A2111\r\nDimensiones:7.57 x 15.09 x 0.83 cm\r\nPeso (kg):0.194 kg\r\nGarantía:12 meses\r\nMemoria interna:64GB\r\nMemoria expandible:No\r\nResolución de pantalla:1792 x 828', '1612860222_APPIPHON11REDCH_1.jpg', 'APPLE, IPHONE, 11, 64GB'),
(3, 2, 8, 'TV LED ORIZON HD 24\"', 449, 47, 'Modelo: OR2419K4IP\r\nPuertos USB: 1\r\nWi-Fi: No\r\nPuerto Ethernet: No\r\nPuertos HDMI: 1\r\nReproduce formatos de audio: MPEG-1 Audio layer 3, MPEG-2 Audio layer 3, WMA, Vorbis, FLAC, AAC LC, AC3\r\nReproduce formatos de imagen:\r\nJPG, BMP, PNG', '1612481183_WhatsApp Image 2021-02-04 at 3.38.43 PM.jpeg', 'TV LED ORIZON HD 24\"'),
(4, 12, 2, 'SMARTPHONE SAMSUNG GALAXY A20S 32GB 3GB - AZUL', 1, 19, 'Modelo:Galaxy A20s\r\nMemoria interna:32GB\r\nMemoria expandible:Hasta 512GB\r\nMemoria RAM:3GB\r\nResolución de pantalla:720 x 1560 (HD+)\r\nTamaño de pantalla:6.5\"', '1612860776_SM-A207MZBAPEO-1b_1.jpg', 'SAMSUNG, GALAXY, A20S'),
(5, 12, 2, 'SAMSUNG GALAXY A01 32GB 2GB', 549, 50, 'Modelo:SM-A015MZKBPEO\r\nAlto:14.62 cm\r\nAncho:7.09 cm\r\nProfundidad:0.83 cm\r\nPeso (kg):0.149 kg\r\nGarantía:1 año\r\nMemoria interna:32GB\r\nMemoria expandible:Soporta MicroSD hasta 512 GB (no incluye)\r\nMemoria RAM:2GB', '1612860688_SM-A015MZKAPEO_1.jpg', 'SAMSUNG, GALAXY, A01'),
(6, 2, 5, 'TV LG ULTRA HD 4K SMART TV AI THINGQ 55\" UN7100', 2099, 23, 'Modelo:UN7100\r\nAlto:78.3 cm\r\nAncho:124.7 cm\r\nProfundidad:23.5 cm\r\nGarantía:1 año\r\nPuertos USB:2\r\nWi-Fi:Si', '1612469763_tv_lg3.jpeg', 'ULTRA HD, 4K, SMART TV'),
(7, 4, 8, 'AUDÍFONO LG BLUETOOTH LG TONE FREE HBS-FN4 - BLANCO', 339, 18, 'SKU:HBS-FN4.ABMSWH\r\nPrecio exclusivo en web                                                Modelo:FN4\r\nDimensiones:5.4c x 5.4 x 2.7cm\r\nPeso (kg):0.0054\r\nGarantía:1 año\r\nBluetooth:Si', '1612470899_WhatsApp Image 2021-02-04 at 3.00.28 PM.jpeg', 'audifono lg bluetooth lg'),
(8, 4, 7, 'PARLANTE BLUETOOTH PANASONIC ONE BOX', 599, 29, 'SC-TMAX10PUK 300W', '1612471016_WhatsApp Image 2021-02-04 at 2.57.00 PM.jpeg', 'parlante bluetooth panasonic'),
(9, 2, 2, 'TV SAMSUNG 65\" CRYSTAL ULTRA HD SMART TV ', 3199, 22, 'Modelo: UN65TU6900GXPE\r\nAlto: 90.52 cm\r\nAncho: 144.94 cm\r\nProfundidad: 28.35 cm\r\nPeso (kg): 20.9 kg\r\nGarantía: 2 años\r\nPuertos USB: 1\r\nWi-Fi: Si\r\nPuerto Ethernet: No\r\nPuertos HDMI: 2', '1612471231_WhatsApp Image 2021-02-04 at 3.23.06 PM.jpeg', 'ULTRA HD SMART TV '),
(10, 2, 2, 'TV SAMSUNG 55\"QLED 4K ULTRA HD SMART TV', 6349, 24, 'Modelo: QN55Q80TAGXPE\r\nAlto: 84.5 cm\r\nAncho: 145.9 cm\r\nProfundidad:17.8 cm\r\nPeso (kg): 27 kg\r\nGarantía: 1 año\r\nPuertos USB: 2\r\nWi-Fi: Si\r\nPuerto Ethernet: Si\r\nPuertos HDMI: 4\r\nConexión RCA: No\r\n3D: No\r\nBluetooth: Si\r\nControl por voz: No\r\nControl remoto: Si\r\nModo fútbol: No\r\nNivel de definición: Ultra HD', '1612475630_WhatsApp Image 2021-02-04 at 3.27.04 PM (1).jpeg', 'ultra hd smart tv 55'),
(11, 1, 10, 'COCINA 24\" INDURAMA VIENA', 679, 31, 'Tamaño: 24\" 60 cms\r\nTablero: Acero inoxidable\r\nNúmero de Quemadores: 4\r\nEncendido Eléctrico: Si', '1612853469_cocina-24-indurama-viena-4-hornillas.jpg', 'COCINA INDURAMA VIENA 4'),
(12, 2, 5, 'TV LG OLED 4K SMART THINQ AI OLED77GX 77\"', 19999, 24, 'Modelo: 77GX, OLED77GXPSA\r\nAlto: 105 cm\r\nAncho: 172.1 cm\r\nProfundidad: 1.9 cm, 19 mm\r\nGarantía: 2 año, 2 años\r\nPuertos USB:3\r\nWi-Fi: Si\r\nPuerto Ethernet: Si, No\r\nPuertos HDMI: 4', '1612477350_WhatsApp Image 2021-02-04 at 3.30.34 PM.jpeg', 'TV LG OLED 4K 77'),
(13, 2, 5, 'TV LG 65\" ULTRA HD 4K OLED SMART', 8999, 56, 'Modelo: OLED65B9PSB\r\nAlto: 83 cm\r\nAncho: 144.9 cm\r\nProfundidad: 4.69 cm\r\nPeso (kg): 25.2 kg\r\nGarantía: 2 años\r\nPuertos USB: Sí\r\nWi-Fi: Si\r\nPuertos HDMI: Sí', '1612477455_WhatsApp Image 2021-02-04 at 3.34.29 PM.jpeg', '65 ULTRA HD 4K OLED SMART'),
(14, 1, 10, 'COCINA INDURAMA FLORENCIA 4 QUEMADORES - CROMA', 1699, 13, 'Modelo: FLORENCIA\r\nAlto: 94 cm\r\nAncho: 60 cm\r\nProfundidad: 58 cm\r\nPeso (kg): 34.9 kg\r\nGarantía: 1 año\r\nTamaño Cocina: 60 a 69 cm\r\nTemporizador: Si', '1612483824_WhatsApp Image 2021-02-04 at 4.05.13 PM.jpeg', 'COCINA INDURAMA'),
(15, 1, 5, 'LAVADORA LG WT16BS6H 16 KG', 2299, 12, 'Tecnología TurboWash 3D\r\nProgramas 10\r\nTipo de carga Superior\r\nColor Negro\r\nCapacidad 16kg\r\nNiveles de agua 10\r\nTipo de motor TurboDrum\r\nModelo WT16BS6H\r\nDIMENSIONES 102CM67CM63.7CM\r\nAlto 102cm\r\nAncho 63.7cm\r\nProfundidad 67cm\r\nPeso 55kg', '1612481556_WhatsApp Image 2021-02-04 at 3.52.54 PM.jpeg', 'TurboWash 3D  TurboDrum LAVADORA LG 16 kg'),
(16, 1, 11, 'CONGELADORA COLDEX CH40 BL 339 LT', 2099, 25, 'Modelo: CH40\r\nAlto: 96\r\nAncho: 136\r\nProfundidad: 72\r\nPeso (kg): 73.2\r\nGarantía: 1 Año\r\nNúmero de puertas: 2\r\nCapacidad: 339 litros', '1612483578_WhatsApp Image 2021-02-04 at 3.56.43 PM.jpeg', 'CONGELADORA COLDEX CH40 BL 339 LT'),
(17, 1, 5, 'LAVADORA LG WD10WVC4S6 10.5 KG Y 7 KG', 2399, 14, 'Modelo: WD10WVC4S6\r\nAncho: 60 cm\r\nAlto: 85 cm\r\nProfundidad: 56 cm\r\nPeso (kg): 73 kg\r\nGarantía: 10 años en el motor', '1612484436_WhatsApp Image 2021-02-04 at 4.09.54 PM.jpeg', 'LAVADORA LG 10.5 7'),
(18, 1, 5, 'REFRIGERADORA 410 L. LG', 1899, 11, 'GT39WPPDC No frost Silver\r\nCapacidad: 410 L.\r\nSistema de Enfriamiento: No frost\r\nDispensador de Agua: Si\r\nBandejas: Vidrio Templado', '1612853759_refrigeradora-410-l-lg-gt39wppdc-no-frost-silver.jpg', 'Refrigeradora lg frost'),
(19, 3, 1, 'LAPTOP 14\" HP DK1003DX 4GB 128GB SSD', 1599, 15, '4GB RAM - 128GB SSD\r\nPantalla 14\" HD 1366 x 768\r\nProcesador: AMD Athlon Silver 3050u - generación, 2.3 GHz, 2 núcleos\r\nMemoria RAM: 4GB, Disco Duro: 128 GB SSD\r\nTarjeta de Video: - AMD Radeon Vega 3', '1612854626_laptop-14-hp-dk1003dx-a3050u-4gb-ram-128gb-ssd.jpg', '128GB SSD LAPTOP HP 14 4GB'),
(20, 3, 12, 'LAPTOP 15.6\" LENOVO V15 - IIL CI5 10ma ', 2899, 10, 'Lenovo V15-IIL CI5 10ma - 8GB RAM - 1TB\r\nPantalla 15.6\" HD (1366x768)\r\nProcesador: Intel Core i5-1035G1 10ma generación, 1.0GHz, Quad-Core núcleos\r\nMemoria RAM: 8GB DDR4, Disco Duro: 1TB HDD\r\nTarjeta de Video: Intel UHD Graphics', '1612855656_laptop-156-lenovo-v15-iil-ci5-10ma-8gb-ram-1tb.jpg', 'Lenovo V15-IIL CI5 10ma - 8GB RAM - 1TB'),
(21, 3, 9, 'LAPTOP ACER ASPIRE 3 15.6\" CORE I5 10°GEN ', 2699, 23, 'CORE I5 \r\n10°GEN \r\n1TB \r\n8GB \r\nVIDEO MX 330 2GB', '1612856593_A315-57G-50CW_1.jpg', 'CORE I5 10°GEN 1TB LAPTOP ACER ASPIRE 3 15.6\"'),
(22, 3, 6, 'LAPTOP ASUS VIVOBOOK X512F ', 2998, 10, 'LAPTOP ASUS \r\nVIVOBOOK X512F \r\nCORE I5 \r\n10°GEN \r\n512GB SSD \r\n8GB MX 130 2GB', '1612856703_X512JF-BR017T_1.jpg', 'LAPTOP ASUS VIVOBOOK X512F '),
(23, 3, 8, 'IMPRESORA MULTIFUNCIONAL EPSON ECOTANK L3110', 749, 56, 'Modelo: L3110\r\nDimensiones: 37.5 x 34.7 x 17.9 cm\r\nPeso (kg): 3.9 kg\r\nGarantía: 2 años\r\nCapacidad de papel (hojas): 100 hojas de papel normal, 20 hojas de papel Premium Glossy Photo Paper, 10 sobres o 30 tarjetas postales', '1612857093_L3110_1.jpg', 'IMPRESORA MULTIFUNCIONAL EPSON ECOTANK L3110'),
(24, 3, 9, 'LAPTOP GAMER ACER CORE I7 9°GEN 1TB + 256GB SSD', 4699, 15, 'Modelo: AN515-54-74JZ\r\nDimensiones: 2.5 cm x 36.3 cm x 25.5 cm\r\nPeso (kg): 2.5 kg\r\nGarantía: 1 año\r\nCapacidad: 256GB SSD+1TB HDD\r\nMemoria RAM: 8 GB\r\nTipo de memoria RAM: DDR4\r\nProcesador: Core i7-9750H\r\nTamaño de pantalla: 15.6\"', '1612857338_AN515-54-74JZ_1.jpg', 'LAPTOP GAMER ACER CORE I7 9°GEN 1TB + 256GB SSD'),
(25, 3, 8, 'IMPRESORA MULTIFUNCIONAL CANON PIXMA', 699, 26, '+ REPETIDOR AMPLIFICADOR DE SEÑAL MI WIFI PRO\r\n\r\nModelo: PIXMA G-3110\r\nDimensiones: 44.5 x 33.0 x 16.3 cm\r\nPeso (kg): 6.3 kg\r\nGarantía: 1 año\r\nCapacidad de papel (hojas): 100\r\n', '1612857559_MIMA2315C004AA_1REG.jpg', 'IMPRESORA MULTIFUNCIONAL CANON PIXMA'),
(26, 4, 5, 'EQUIPO DE SONIDO LG XBOOM CL87 2350W', 999, 10, 'Modelo: CL87\r\nDimensiones: 450mm x 167mm x 332mm\r\nPeso (kg): 24.4 kg\r\nGarantía: 1 año\r\nBluetooth: Si\r\nConexión Auxiliar: Si\r\nPotencia: 2350 W', '1612858498_CL87_11.jpg', 'EQUIPO DE SONIDO LG XBOOM CL87 2350W'),
(27, 4, 5, 'EQUIPO DE SONIDO LG CK99 5000W', 2999, 12, 'Modelo: CK99\r\nBluetooth: Si\r\nConexión Auxiliar: Si\r\nEcualizador: Si\r\nImpedancia (Ohmios): 8Ohm\r\nPotencia: 1250W x 2', '1612858590_CK99_1.jpg', 'EQUIPO DE SONIDO LG CK99 5000W'),
(28, 4, 5, 'PARLANTE PORTÁTIL BLUETOOTH LG', 400, 11, 'Modelo: PL5\r\nDimensiones: 249 x 149 x 130\r\nPeso (kg): 0.92 kg\r\nGarantía: 1 año\r\nBluetooth: Si\r\nConexión Auxiliar: Si\r\nImpedancia (Ohmios): 4?\r\nPotencia: 20w\r\nRadio AM: No', '1612858744_PL5_1Z.jpg', 'PARLANTE PORTÁTIL BLUETOOTH LG'),
(29, 4, 8, 'SOUNDBAR JBL 5.1 IMMERSIVE - NEGRO', 1597, 15, 'Modelo: JBL2GBAR51IMBLK\r\nAlto: 110.5 cm\r\nAncho: 48.8 cm\r\nProfundidad: 38.2 m\r\nPeso (kg): 13.4 kg\r\nGarantía: Si', '1612858839_JBL2GBAR51IMBLK_1.jpg', 'SOUNDBAR JBL 5.1'),
(30, 6, 8, 'LICUADORA OSTER BLSTMG-T15', 199, 60, 'Vaso: 1.5 L. Vidrio refractario\r\nPotencia: 450W.\r\nVelocidades: 8\r\nColor: Celeste', '1612859019_licuadora-oster-blstmg-t15.jpg', 'LICUADORA OSTER '),
(31, 6, 8, 'FREIDORA DE AIRE DIGITAL COMPACTA 1.8LT', 219, 15, 'Modelo: CKSTAF18D-053\r\nAlto: 29.3 cm\r\nAncho: 27.9 cm\r\nProfundidad: 21.5 cm\r\nPeso (kg): 2.6 kg\r\nGarantía: 1 año por falla de fábrica\r\nTipo: Freidoras', '1612859135_CKSTAF18D-053_1.jpg', 'FREIDORA DE AIRE'),
(32, 6, 8, 'WAFFLE MAKER BLANIK BWM032', 129, 12, 'Modelo: BWM032\r\nDimensiones: 11.5 x 20.5 x 31 cm\r\nPeso (kg): 2.3 kg\r\nTemporizador: No\r\nPotencia: 800 W', '1612859211_BWM032_1.jpg', 'WAFFLE MAKER BLANIK'),
(33, 6, 8, 'BATIDORA MANUAL THOMAS', 69, 10, 'Modelo: TH 8830M\r\nDimensiones: 25 x 18 x 10 cm\r\nPeso (kg): 1 kg\r\nGarantía: 2 años\r\nPotencia: 200 W\r\nVelocidad: 5 velocidades + Turbo\r\nNúmero de varillas: 2\r\nTipo de batidora: De mano', '1612859304_EBA-TH8830M_1.jpg', 'BATIDORA MANUAL THOMAS'),
(34, 6, 8, 'ARROCERA MULTIUSOS OSTER 12 TAZAS', 159, 13, 'Modelo:\r\n4730053\r\nAlto: 25,5\r\nAncho: 31,0\r\nProfundidad: 31,0\r\nPeso (kg): 3,8\r\nGarantía: 1 año por falla de fábrica\r\nCapacidad: 2.1 a 2.9 litros\r\nLuz indicadora de encendido: Si\r\nTemporizador: No\r\nPotencia: 900 W', '1612859413_4730-PRO_1.jpg', 'ARROCERA MULTIUSOS OSTER 12 TAZAS'),
(35, 6, 8, 'HORNO TOSTADOR OSTER 42 LT', 459, 12, 'Modelo: TSSTTVFDXL2053\r\nDimensiones: 62 x 42 52.5 cm\r\nPeso (kg): 11.54 kg\r\nGarantía: 1 año\r\nLuz indicadora de encendido: Si\r\nTemporizador: Si\r\nCapacidad: 42 Lt', '1612859496_TSSTTVFDXL2053_1.jpg', 'HORNO TOSTADOR OSTER 42 LT'),
(36, 6, 8, 'PARRILLA ELÉCTRICA OSTER BIOCERÁMICA', 219, 11, 'Modelo: CKSTGR4768053\r\nDimensiones: 34.7 x 13.2 x 49.3 cm\r\nPeso (kg): 3.04 kg\r\nGarantía: 1 año\r\nLuz indicadora de encendido: Si\r\nTemporizador: No\r\nMaterial: Biocerámica\r\nSuperficie antiadherente: Si', '1612859636_CKSTGR4768053_1.jpg', 'PARRILLA ELÉCTRICA OSTER BIOCERÁMICA'),
(37, 12, 3, 'IPHONE 12 64GB APPLE - NEGRO', 4799, 22, 'Modelo: A2403\r\nDimensiones: 7.15 x 7.4 x 14.67 cm\r\nPeso (kg): 0.162\r\nGarantía: 12 meses\r\nMemoria interna: 64gb\r\nMemoria expandible: No\r\nResolución de pantalla: 2532 x 1170\r\nTamaño de pantalla: 6.1\"', '1612859857_APPIPHON1264BK_1.jpg', 'IPHONE 12 64GB APPLE'),
(38, 12, 2, 'SAMSUNG GALAXY A51 128GB 4GB', 1649, 15, 'Modelo:SM-A515FZKLPEO\r\nAlto:15.85 cm\r\nAncho:7.36 cm\r\nProfundidad:0.79 cm\r\nPeso (kg):0.172 kg\r\nGarantía:1 año\r\nMemoria interna:128 GB', '1612860113_SM-A515FZKLPEO_1.jpg', 'SAMSUNG GALAXY A51 128GB'),
(39, 12, 14, 'XIAOMI REDMI 9 64GB 4GB RAM 6.53\"', 649, 14, 'Modelo:Redmi 9\r\nAlto:16.3 cm\r\nAncho:7.7 cm\r\nProfundidad:0.9 cm\r\nPeso (kg):0.19 kg\r\nGarantía:1 año\r\nMemoria interna:64 GB\r\nMemoria RAM:4 GB', '1612860397_CN0100019GY2_1.jpg', 'XIAOMI, REDMI, 9, 64GB'),
(40, 12, 14, 'SMARTPHONE XIAOMI REDMI 9C', 599, 20, 'Garantía:1 año\r\nCámara principal:13MP + 5MP + 2MP\r\nCámara frontal:5 MP\r\nCapacidad:64GB\r\nMemoria RAM:3GB\r\nProcesador:MediaTek Helio G35 octa-core 2.3GHz\r\nSistema operativo:Android 10\r\nTamaño de pantalla:6.5\"', '1612860482_CN0100022BK2_1.jpg', ' XIAOMI, REDMI, 9C'),
(41, 12, 8, 'NOKIA 7.2 128GB 4GB RAM 6.3\"', 1049, 10, 'Modelo:Nokia 7.2\r\nDimensiones:16 x 0.8 x 7.5 cm\r\nPeso (kg):180gr\r\nGarantía:1 año\r\nMemoria interna:128GB\r\nMemoria expandible:Hasta 512GB\r\nMemoria RAM:4GB\r\nResolución de pantalla:1080 x 2240 pixels', '1612860567_IN6830AA002607_1 (1).jpg', 'NOKIA, 7.2, 128GB, 4GB, RAM 6.3\"'),
(42, 12, 13, 'HUAWEI Y7P 4GB + 64GB', 829, 11, 'Modelo:KT000CPE25\r\nDimensiones:15.9*0.8*7.1 cm\r\nPeso (kg):0.2 kg\r\nGarantía:1 año\r\nMemoria interna:64 GB\r\nMemoria expandible:512 GB\r\nMemoria RAM:4GB\r\nResolución de pantalla:1600x720\r\nTamaño de pantalla:6.3\"', '1612860902_CE108HUA07-1_1.jpg', 'HUAWEI Y7P 4GB + 64GB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Cinthia Victoria', 'Quenta Bendita', 'cinthia@gmail.com', '7b0385352a98fc33e995ae209e87e3dd', '952461873', 'Asoc Los Rosales Mz K9', 'Tacna'),
(2, 'Alexandra', 'Camacho', 'alexandra@gmail.com', '62de630ea5dddf8d76afe176ff05f1aa', '952841634', 'Los proceres Mz K5', 'Tacna');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indices de la tabla `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
