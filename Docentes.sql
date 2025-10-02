-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-10-2025 a las 15:11:54
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Docentes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comentarios`
--

CREATE TABLE `Comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_resena` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Comentarios`
--

INSERT INTO `Comentarios` (`id_comentario`, `id_resena`, `comentario`, `fecha`) VALUES
(1, 1, 'No es tan bueno', '2025-05-18 18:55:40'),
(2, 1, 'Yo creo que si\r\n', '2025-05-18 18:55:50'),
(3, 2, 'Mas o menos', '2025-05-18 18:57:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Docentes`
--

CREATE TABLE `Docentes` (
  `id_docente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `semestres` varchar(50) DEFAULT NULL,
  `materias` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Docentes`
--

INSERT INTO `Docentes` (`id_docente`, `nombre`, `semestres`, `materias`) VALUES
(1, 'Carlos Gómez', '1, 2', 'Matemáticas Básicas, Cálculo I'),
(2, 'María Rodríguez', '3, 4', 'Física General, Electromagnetismo'),
(3, 'Luis Fernández', '5, 6', 'Programación Orientada a Objetos, Estructuras de Datos'),
(4, 'Ana Torres', '1, 3, 5', 'Lógica Matemática, Álgebra Lineal'),
(5, 'José Martínez', '4, 6', 'Bases de Datos, Ingeniería de Software'),
(6, 'Claudia Jiménez', '2, 3', 'Introducción a la Ingeniería, Ética Profesional'),
(7, 'Andrés Castillo', '7, 8', 'Sistemas Distribuidos, Seguridad Informática'),
(8, 'Laura Sánchez', '6, 7', 'Redes de Computadores, Administración de Sistemas'),
(9, 'Jorge Herrera', '2, 4', 'Estadística, Probabilidades'),
(10, 'Natalia Ríos', '1, 2', 'Lectura Crítica, Comunicación Oral y Escrita'),
(11, 'David Moreno', '5, 6', 'Diseño de Interfaces, Experiencia de Usuario'),
(12, 'Paola Pérez', '3, 4', 'Ingeniería Económica, Emprendimiento'),
(13, 'Ricardo Salazar', '8', 'Inteligencia Artificial, Minería de Datos'),
(14, 'Luisa Acosta', '2, 5', 'Análisis de Algoritmos, Teoría de la Computación'),
(15, 'Camilo Vargas', '6, 8', 'Proyecto de Grado, Investigación Aplicada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Resenas`
--

CREATE TABLE `Resenas` (
  `id_resena` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `resena` text NOT NULL,
  `fecha` datetime NOT NULL,
  `valor_calificacion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Resenas`
--

INSERT INTO `Resenas` (`id_resena`, `id_docente`, `resena`, `fecha`, `valor_calificacion`) VALUES
(1, 1, 'Excelente Profesor', '2025-05-18 18:55:32', 5),
(2, 1, 'No le gusta explicar', '2025-05-18 18:56:12', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Comentarios`
--
ALTER TABLE `Comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_resena` (`id_resena`);

--
-- Indices de la tabla `Docentes`
--
ALTER TABLE `Docentes`
  ADD PRIMARY KEY (`id_docente`);

--
-- Indices de la tabla `Resenas`
--
ALTER TABLE `Resenas`
  ADD PRIMARY KEY (`id_resena`),
  ADD KEY `id_docente` (`id_docente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Comentarios`
--
ALTER TABLE `Comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Docentes`
--
ALTER TABLE `Docentes`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `Resenas`
--
ALTER TABLE `Resenas`
  MODIFY `id_resena` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Comentarios`
--
ALTER TABLE `Comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_resena`) REFERENCES `Resenas` (`id_resena`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Resenas`
--
ALTER TABLE `Resenas`
  ADD CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `Docentes` (`id_docente`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
