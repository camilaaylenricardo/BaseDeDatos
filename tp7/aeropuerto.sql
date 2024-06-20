-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 20:09:55
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
-- Base de datos: `aeropuerto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuertos`
--

CREATE TABLE `aeropuertos` (
  `id_aeropuerto` int(11) NOT NULL,
  `id_compania` int(11) DEFAULT NULL,
  `direccion_aeropuerto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviones`
--

CREATE TABLE `aviones` (
  `id_avion` int(11) NOT NULL,
  `descripcion_avion` varchar(200) DEFAULT NULL,
  `tipo_avion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companias`
--

CREATE TABLE `companias` (
  `id_compania` int(11) NOT NULL,
  `id_avion` int(11) DEFAULT NULL,
  `nombre_compania` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id_destino` int(11) NOT NULL,
  `id_aeropuerto` int(11) DEFAULT NULL,
  `ciudad_destino` varchar(50) DEFAULT NULL,
  `pais_destino` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llegadas`
--

CREATE TABLE `llegadas` (
  `id_llegadas` int(11) NOT NULL,
  `id_origen` int(11) DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origenes`
--

CREATE TABLE `origenes` (
  `id_origen` int(11) NOT NULL,
  `id_aeropuerto` int(11) DEFAULT NULL,
  `ciudad_origen` varchar(50) DEFAULT NULL,
  `pais_origen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros`
--

CREATE TABLE `pasajeros` (
  `id_pasajero` int(11) NOT NULL,
  `nombre_pasajero` varchar(50) DEFAULT NULL,
  `apellido_pasajero` varchar(50) DEFAULT NULL,
  `edad_pasajero` int(3) DEFAULT NULL,
  `asiento_pasajero` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id_salida` int(11) NOT NULL,
  `id_destino` int(11) DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

CREATE TABLE `vuelos` (
  `id_vuelo` int(11) NOT NULL,
  `id_compania` int(11) DEFAULT NULL,
  `id_pasajero` int(11) DEFAULT NULL,
  `id_salida` int(11) DEFAULT NULL,
  `id_llegadas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aeropuertos`
--
ALTER TABLE `aeropuertos`
  ADD PRIMARY KEY (`id_aeropuerto`),
  ADD KEY `id_compania` (`id_compania`);

--
-- Indices de la tabla `aviones`
--
ALTER TABLE `aviones`
  ADD PRIMARY KEY (`id_avion`);

--
-- Indices de la tabla `companias`
--
ALTER TABLE `companias`
  ADD PRIMARY KEY (`id_compania`),
  ADD KEY `id_avion` (`id_avion`);

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id_destino`),
  ADD KEY `id_aeropuerto` (`id_aeropuerto`);

--
-- Indices de la tabla `llegadas`
--
ALTER TABLE `llegadas`
  ADD PRIMARY KEY (`id_llegadas`),
  ADD KEY `id_origen` (`id_origen`);

--
-- Indices de la tabla `origenes`
--
ALTER TABLE `origenes`
  ADD PRIMARY KEY (`id_origen`),
  ADD KEY `id_aeropuerto` (`id_aeropuerto`);

--
-- Indices de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`id_pasajero`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `id_destino` (`id_destino`);

--
-- Indices de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD PRIMARY KEY (`id_vuelo`),
  ADD KEY `id_compania` (`id_compania`),
  ADD KEY `id_pasajero` (`id_pasajero`),
  ADD KEY `id_salida` (`id_salida`),
  ADD KEY `id_llegadas` (`id_llegadas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aeropuertos`
--
ALTER TABLE `aeropuertos`
  MODIFY `id_aeropuerto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aviones`
--
ALTER TABLE `aviones`
  MODIFY `id_avion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `companias`
--
ALTER TABLE `companias`
  MODIFY `id_compania` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id_destino` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `llegadas`
--
ALTER TABLE `llegadas`
  MODIFY `id_llegadas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `origenes`
--
ALTER TABLE `origenes`
  MODIFY `id_origen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  MODIFY `id_pasajero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  MODIFY `id_vuelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aeropuertos`
--
ALTER TABLE `aeropuertos`
  ADD CONSTRAINT `aeropuertos_ibfk_1` FOREIGN KEY (`id_compania`) REFERENCES `companias` (`id_compania`);

--
-- Filtros para la tabla `companias`
--
ALTER TABLE `companias`
  ADD CONSTRAINT `companias_ibfk_1` FOREIGN KEY (`id_avion`) REFERENCES `aviones` (`id_avion`);

--
-- Filtros para la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD CONSTRAINT `destinos_ibfk_1` FOREIGN KEY (`id_aeropuerto`) REFERENCES `aeropuertos` (`id_aeropuerto`);

--
-- Filtros para la tabla `llegadas`
--
ALTER TABLE `llegadas`
  ADD CONSTRAINT `llegadas_ibfk_1` FOREIGN KEY (`id_origen`) REFERENCES `origenes` (`id_origen`);

--
-- Filtros para la tabla `origenes`
--
ALTER TABLE `origenes`
  ADD CONSTRAINT `origenes_ibfk_1` FOREIGN KEY (`id_aeropuerto`) REFERENCES `aeropuertos` (`id_aeropuerto`);

--
-- Filtros para la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD CONSTRAINT `salidas_ibfk_1` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id_destino`);

--
-- Filtros para la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`id_compania`) REFERENCES `companias` (`id_compania`),
  ADD CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`id_pasajero`) REFERENCES `pasajeros` (`id_pasajero`),
  ADD CONSTRAINT `vuelos_ibfk_3` FOREIGN KEY (`id_salida`) REFERENCES `salidas` (`id_salida`),
  ADD CONSTRAINT `vuelos_ibfk_4` FOREIGN KEY (`id_llegadas`) REFERENCES `llegadas` (`id_llegadas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
