-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 17:11:01
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
-- Base de datos: `nautico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barcos`
--

CREATE TABLE `barcos` (
  `id_barco` int(11) NOT NULL,
  `numamarre_barco` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `cuota_pago` int(50) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patrones`
--

CREATE TABLE `patrones` (
  `id_patron` int(11) NOT NULL,
  `nombre_patron` varchar(50) DEFAULT NULL,
  `apellido_patron` varchar(50) DEFAULT NULL,
  `dni_patron` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id_salida` int(11) NOT NULL,
  `id_socio` int(11) DEFAULT NULL,
  `id_barco` int(11) DEFAULT NULL,
  `id_patron` int(11) DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `destino_salida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `id_socio` int(11) NOT NULL,
  `id_barco` int(11) DEFAULT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `nombre_socio` varchar(50) DEFAULT NULL,
  `apellido_socio` varchar(50) DEFAULT NULL,
  `nummatricula_socio` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barcos`
--
ALTER TABLE `barcos`
  ADD PRIMARY KEY (`id_barco`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `patrones`
--
ALTER TABLE `patrones`
  ADD PRIMARY KEY (`id_patron`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `id_socio` (`id_socio`),
  ADD KEY `id_barco` (`id_barco`),
  ADD KEY `id_patron` (`id_patron`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id_socio`),
  ADD KEY `id_barco` (`id_barco`),
  ADD KEY `id_pago` (`id_pago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barcos`
--
ALTER TABLE `barcos`
  MODIFY `id_barco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `patrones`
--
ALTER TABLE `patrones`
  MODIFY `id_patron` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `id_socio` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD CONSTRAINT `salidas_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`),
  ADD CONSTRAINT `salidas_ibfk_2` FOREIGN KEY (`id_barco`) REFERENCES `barcos` (`id_barco`),
  ADD CONSTRAINT `salidas_ibfk_3` FOREIGN KEY (`id_patron`) REFERENCES `patrones` (`id_patron`);

--
-- Filtros para la tabla `socios`
--
ALTER TABLE `socios`
  ADD CONSTRAINT `socios_ibfk_1` FOREIGN KEY (`id_barco`) REFERENCES `barcos` (`id_barco`),
  ADD CONSTRAINT `socios_ibfk_2` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
