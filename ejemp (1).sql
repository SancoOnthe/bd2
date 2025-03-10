-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2025 a las 19:59:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejemp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'disponible',
  `precio` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `estado`, `precio`) VALUES
(1, 'Laptop', 'disponible', 1500),
(2, 'Mouse', 'disponible', 25.5),
(3, 'Teclado', 'agotado', 45.99),
(4, 'Monitor', 'disponible', 200),
(5, 'Impresora', 'en reparación', 120.75),
(6, 'Cargador', 'disponible', 30),
(7, 'Auriculares', 'disponible', 55);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_disponibles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_disponibles` (
`id` int(11)
,`nombre` varchar(20)
,`precio` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_no_disponibles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_no_disponibles` (
`id` int(11)
,`nombre` varchar(20)
,`estado` varchar(20)
,`precio` float
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_disponibles`
--
DROP TABLE IF EXISTS `vista_productos_disponibles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_disponibles`  AS SELECT `productos`.`id` AS `id`, `productos`.`nombre` AS `nombre`, `productos`.`precio` AS `precio` FROM `productos` WHERE `productos`.`estado` = 'disponible' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_no_disponibles`
--
DROP TABLE IF EXISTS `vista_productos_no_disponibles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_no_disponibles`  AS SELECT `productos`.`id` AS `id`, `productos`.`nombre` AS `nombre`, `productos`.`estado` AS `estado`, `productos`.`precio` AS `precio` FROM `productos` WHERE `productos`.`estado` <> 'disponible' ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
