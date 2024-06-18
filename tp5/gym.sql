-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2024 a las 20:29:52
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
-- Base de datos: `gym`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aparatos`
--

CREATE TABLE `aparatos` (
  `id_aparato` int(11) NOT NULL,
  `descripcion_aparato` varchar(100) DEFAULT NULL,
  `estado_aparato` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cardios`
--

CREATE TABLE `cardios` (
  `id_cardio` int(11) NOT NULL,
  `tamanio_cardio` int(50) DEFAULT NULL,
  `ubicacion_cardio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id_clase` int(11) NOT NULL,
  `descripcion_clase` varchar(255) DEFAULT NULL,
  `dia_clase` date DEFAULT NULL,
  `horainicio_clase` time DEFAULT NULL,
  `horafin_clase` time DEFAULT NULL,
  `id_tiposala` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichasmedicas`
--

CREATE TABLE `fichasmedicas` (
  `id_ficha` int(11) NOT NULL,
  `descripcion_ficha` varchar(100) DEFAULT NULL,
  `certificadomedico_ficha` varchar(100) DEFAULT NULL,
  `acuerdoterminoycondiciones_ficha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generales`
--

CREATE TABLE `generales` (
  `id_general` int(11) NOT NULL,
  `tamanio_general` int(50) DEFAULT NULL,
  `ubicacion_general` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitores`
--

CREATE TABLE `monitores` (
  `id_monitor` int(11) NOT NULL,
  `dni_monitor` varchar(20) DEFAULT NULL,
  `nombre_monitor` varchar(100) DEFAULT NULL,
  `telefono_monitor` varchar(20) DEFAULT NULL,
  `titulacion_monitor` tinyint(1) DEFAULT NULL,
  `experiencia_monitor` int(11) DEFAULT NULL,
  `capacidades_monitor` text DEFAULT NULL,
  `id_clase` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `musculares`
--

CREATE TABLE `musculares` (
  `id_muscular` int(11) NOT NULL,
  `tamanio_muscular` int(50) DEFAULT NULL,
  `ubicacion_muscular` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `metodo_pago` varchar(20) DEFAULT NULL,
  `monto_pago` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pistassquash`
--

CREATE TABLE `pistassquash` (
  `id_pista` int(11) NOT NULL,
  `tamanio_pista` int(50) DEFAULT NULL,
  `ubicacion_pista` varchar(100) DEFAULT NULL,
  `estado_pista` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaspistas`
--

CREATE TABLE `reservaspistas` (
  `id_reserva` int(11) NOT NULL,
  `id_pista` int(11) DEFAULT NULL,
  `id_socio` int(11) DEFAULT NULL,
  `fecha_reserva` date DEFAULT NULL,
  `horainicio_reserva` time DEFAULT NULL,
  `horafinal_reserva` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `id_tiposala` int(11) NOT NULL,
  `id_cardio` int(11) DEFAULT NULL,
  `id_general` int(11) DEFAULT NULL,
  `id_muscular` int(11) DEFAULT NULL,
  `id_pista` int(11) DEFAULT NULL,
  `id_aparato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `id_socio` int(11) NOT NULL,
  `nombre_socio` varchar(100) DEFAULT NULL,
  `telefono_socio` varchar(20) DEFAULT NULL,
  `profesion_socio` varchar(50) DEFAULT NULL,
  `datosbancarios_socio` int(50) DEFAULT NULL,
  `clases_socio` varchar(50) DEFAULT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `id_ficha` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aparatos`
--
ALTER TABLE `aparatos`
  ADD PRIMARY KEY (`id_aparato`);

--
-- Indices de la tabla `cardios`
--
ALTER TABLE `cardios`
  ADD PRIMARY KEY (`id_cardio`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id_clase`),
  ADD KEY `id_tiposala` (`id_tiposala`);

--
-- Indices de la tabla `fichasmedicas`
--
ALTER TABLE `fichasmedicas`
  ADD PRIMARY KEY (`id_ficha`);

--
-- Indices de la tabla `generales`
--
ALTER TABLE `generales`
  ADD PRIMARY KEY (`id_general`);

--
-- Indices de la tabla `monitores`
--
ALTER TABLE `monitores`
  ADD PRIMARY KEY (`id_monitor`),
  ADD KEY `id_clase` (`id_clase`);

--
-- Indices de la tabla `musculares`
--
ALTER TABLE `musculares`
  ADD PRIMARY KEY (`id_muscular`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `pistassquash`
--
ALTER TABLE `pistassquash`
  ADD PRIMARY KEY (`id_pista`);

--
-- Indices de la tabla `reservaspistas`
--
ALTER TABLE `reservaspistas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_pista` (`id_pista`),
  ADD KEY `id_socio` (`id_socio`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id_tiposala`),
  ADD KEY `id_cardio` (`id_cardio`),
  ADD KEY `id_general` (`id_general`),
  ADD KEY `id_muscular` (`id_muscular`),
  ADD KEY `id_pista` (`id_pista`),
  ADD KEY `id_aparato` (`id_aparato`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id_socio`),
  ADD KEY `id_pago` (`id_pago`),
  ADD KEY `id_ficha` (`id_ficha`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aparatos`
--
ALTER TABLE `aparatos`
  MODIFY `id_aparato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cardios`
--
ALTER TABLE `cardios`
  MODIFY `id_cardio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id_clase` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fichasmedicas`
--
ALTER TABLE `fichasmedicas`
  MODIFY `id_ficha` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `generales`
--
ALTER TABLE `generales`
  MODIFY `id_general` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `monitores`
--
ALTER TABLE `monitores`
  MODIFY `id_monitor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `musculares`
--
ALTER TABLE `musculares`
  MODIFY `id_muscular` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pistassquash`
--
ALTER TABLE `pistassquash`
  MODIFY `id_pista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservaspistas`
--
ALTER TABLE `reservaspistas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `id_tiposala` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `id_socio` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`id_tiposala`) REFERENCES `salas` (`id_tiposala`);

--
-- Filtros para la tabla `monitores`
--
ALTER TABLE `monitores`
  ADD CONSTRAINT `monitores_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`);

--
-- Filtros para la tabla `reservaspistas`
--
ALTER TABLE `reservaspistas`
  ADD CONSTRAINT `reservaspistas_ibfk_1` FOREIGN KEY (`id_pista`) REFERENCES `pistassquash` (`id_pista`),
  ADD CONSTRAINT `reservaspistas_ibfk_2` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`);

--
-- Filtros para la tabla `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`id_cardio`) REFERENCES `cardios` (`id_cardio`),
  ADD CONSTRAINT `salas_ibfk_2` FOREIGN KEY (`id_general`) REFERENCES `generales` (`id_general`),
  ADD CONSTRAINT `salas_ibfk_3` FOREIGN KEY (`id_muscular`) REFERENCES `musculares` (`id_muscular`),
  ADD CONSTRAINT `salas_ibfk_4` FOREIGN KEY (`id_pista`) REFERENCES `pistassquash` (`id_pista`),
  ADD CONSTRAINT `salas_ibfk_5` FOREIGN KEY (`id_aparato`) REFERENCES `aparatos` (`id_aparato`);

--
-- Filtros para la tabla `socios`
--
ALTER TABLE `socios`
  ADD CONSTRAINT `socios_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`),
  ADD CONSTRAINT `socios_ibfk_2` FOREIGN KEY (`id_ficha`) REFERENCES `fichasmedicas` (`id_ficha`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
