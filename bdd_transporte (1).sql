-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2026 a las 17:25:50
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
-- Base de datos: `bdd_transporte`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_buses`
--

CREATE TABLE `tb_buses` (
  `id_bus` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `modelo` varchar(40) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_buses`
--

INSERT INTO `tb_buses` (`id_bus`, `placa`, `modelo`, `capacidad`, `estado`) VALUES
(1, 'ABC123', 'Mercedes Benz', 40, NULL),
(2, 'DEF456', 'Chevrolet NPR', 35, NULL),
(3, 'GHI789', 'Volvo B290', 45, NULL),
(4, 'JKL012', 'Mercedes Benz', 40, NULL),
(5, 'MNO345', 'Hino Dutro', 30, NULL),
(6, 'PQR678', 'Chevrolet NPR', 35, NULL),
(7, 'STU901', 'Volvo B290', 45, NULL),
(8, 'VWX234', 'Hino Dutro', 30, NULL),
(9, 'YZA567', 'Mercedes Benz', 40, NULL),
(10, 'BCD890', 'Chevrolet NPR', 35, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_conductores`
--

CREATE TABLE `tb_conductores` (
  `id_conductor` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `licencia` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_estaciones`
--

CREATE TABLE `tb_estaciones` (
  `id_estacion` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pasajeros`
--

CREATE TABLE `tb_pasajeros` (
  `id_pasajero` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rutas`
--

CREATE TABLE `tb_rutas` (
  `id_ruta` int(11) NOT NULL,
  `numero_ruta` varchar(15) NOT NULL,
  `origen` varchar(60) DEFAULT NULL,
  `destino` varchar(60) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tarjetas`
--

CREATE TABLE `tb_tarjetas` (
  `id_tarjeta` int(11) NOT NULL,
  `numero_tarjeta` varchar(30) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `id_pasajero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_viajes`
--

CREATE TABLE `tb_viajes` (
  `id_viaje` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `valor_pasaje` decimal(10,2) DEFAULT NULL,
  `id_pasajero` int(11) DEFAULT NULL,
  `id_tarjeta` int(11) DEFAULT NULL,
  `id_bus` int(11) DEFAULT NULL,
  `id_ruta` int(11) DEFAULT NULL,
  `id_estacion` int(11) DEFAULT NULL,
  `id_conductor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_buses`
--
ALTER TABLE `tb_buses`
  ADD PRIMARY KEY (`id_bus`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Indices de la tabla `tb_conductores`
--
ALTER TABLE `tb_conductores`
  ADD PRIMARY KEY (`id_conductor`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Indices de la tabla `tb_estaciones`
--
ALTER TABLE `tb_estaciones`
  ADD PRIMARY KEY (`id_estacion`);

--
-- Indices de la tabla `tb_pasajeros`
--
ALTER TABLE `tb_pasajeros`
  ADD PRIMARY KEY (`id_pasajero`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Indices de la tabla `tb_rutas`
--
ALTER TABLE `tb_rutas`
  ADD PRIMARY KEY (`id_ruta`);

--
-- Indices de la tabla `tb_tarjetas`
--
ALTER TABLE `tb_tarjetas`
  ADD PRIMARY KEY (`id_tarjeta`),
  ADD UNIQUE KEY `numero_tarjeta` (`numero_tarjeta`),
  ADD KEY `id_pasajero` (`id_pasajero`);

--
-- Indices de la tabla `tb_viajes`
--
ALTER TABLE `tb_viajes`
  ADD PRIMARY KEY (`id_viaje`),
  ADD KEY `id_pasajero` (`id_pasajero`),
  ADD KEY `id_tarjeta` (`id_tarjeta`),
  ADD KEY `id_bus` (`id_bus`),
  ADD KEY `id_ruta` (`id_ruta`),
  ADD KEY `id_estacion` (`id_estacion`),
  ADD KEY `id_conductor` (`id_conductor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_buses`
--
ALTER TABLE `tb_buses`
  MODIFY `id_bus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tb_conductores`
--
ALTER TABLE `tb_conductores`
  MODIFY `id_conductor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_estaciones`
--
ALTER TABLE `tb_estaciones`
  MODIFY `id_estacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_pasajeros`
--
ALTER TABLE `tb_pasajeros`
  MODIFY `id_pasajero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_rutas`
--
ALTER TABLE `tb_rutas`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_tarjetas`
--
ALTER TABLE `tb_tarjetas`
  MODIFY `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_viajes`
--
ALTER TABLE `tb_viajes`
  MODIFY `id_viaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_tarjetas`
--
ALTER TABLE `tb_tarjetas`
  ADD CONSTRAINT `tb_tarjetas_ibfk_1` FOREIGN KEY (`id_pasajero`) REFERENCES `tb_pasajeros` (`id_pasajero`);

--
-- Filtros para la tabla `tb_viajes`
--
ALTER TABLE `tb_viajes`
  ADD CONSTRAINT `tb_viajes_ibfk_1` FOREIGN KEY (`id_pasajero`) REFERENCES `tb_pasajeros` (`id_pasajero`),
  ADD CONSTRAINT `tb_viajes_ibfk_2` FOREIGN KEY (`id_tarjeta`) REFERENCES `tb_tarjetas` (`id_tarjeta`),
  ADD CONSTRAINT `tb_viajes_ibfk_3` FOREIGN KEY (`id_bus`) REFERENCES `tb_buses` (`id_bus`),
  ADD CONSTRAINT `tb_viajes_ibfk_4` FOREIGN KEY (`id_ruta`) REFERENCES `tb_rutas` (`id_ruta`),
  ADD CONSTRAINT `tb_viajes_ibfk_5` FOREIGN KEY (`id_estacion`) REFERENCES `tb_estaciones` (`id_estacion`),
  ADD CONSTRAINT `tb_viajes_ibfk_6` FOREIGN KEY (`id_conductor`) REFERENCES `tb_conductores` (`id_conductor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
