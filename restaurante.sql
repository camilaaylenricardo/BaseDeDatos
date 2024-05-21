-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2024 a las 01:44:46
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
-- Base de datos: `diagnostico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `idrestaurante` int(11) NOT NULL,
  `plato` varchar(25) NOT NULL,
  `precioporcion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `restaurante`
--

INSERT INTO `restaurante` (`idrestaurante`, `plato`, `precioporcion`) VALUES
(1, 'Milanesa Napolitana con P', 10),
(2, 'Pastel de Papas', 9.5),
(3, 'Canelones de Verdura', 11.45),
(4, 'Hamburguesa con Papas', 8.5),
(5, 'Pollo al horno con Pure', 10.8),
(6, 'Asado con Papas', 15.3),
(7, 'Raviolones con salsa mixt', 9.7),
(8, 'Sorrentinos de Jamon y Qu', 10),
(9, 'Bife de Chorizo con Pure', 8.45),
(10, 'Salchica Alemana con Ensa', 9.6),
(11, 'Tallarines con Crema', 8.39),
(12, 'Rabas', 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`idrestaurante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `idrestaurante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
