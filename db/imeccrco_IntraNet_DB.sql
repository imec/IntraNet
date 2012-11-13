-- phpMyAdmin SQL Dump
-- version 3.4.11.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-11-2012 a las 00:25:08
-- Versión del servidor: 5.1.65
-- Versión de PHP: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `imeccrco_IntraNet_DB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonoFacturas`
--

CREATE TABLE IF NOT EXISTS `abonoFacturas` (
  `numeroAbono` int(11) NOT NULL AUTO_INCREMENT,
  `misFacturas_numeroFactura` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(11) NOT NULL,
  PRIMARY KEY (`numeroAbono`),
  KEY `misFacturas_numeroFactura` (`misFacturas_numeroFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contDeptos`
--

CREATE TABLE IF NOT EXISTS `contDeptos` (
  `id` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contDeptos`
--

INSERT INTO `contDeptos` (`id`, `nombre`) VALUES
('cf', 'Costos Fijos'),
('og', 'Otros Gastos'),
('pub', 'Publicidad'),
('sal', 'Salarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contDptosDetalle`
--

CREATE TABLE IF NOT EXISTS `contDptosDetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contDptos_id` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contDptos_id` (`contDptos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `contDptosDetalle`
--

INSERT INTO `contDptosDetalle` (`id`, `contDptos_id`, `nombre`) VALUES
(1, 'cf', 'Luz'),
(2, 'cf', 'Telefono'),
(3, 'cf', 'Alquiler'),
(4, 'cf', 'Prestamo'),
(5, 'cf', 'Amnet'),
(6, 'sal', 'Juan Rafael'),
(7, 'sal', 'Victor Araya'),
(8, 'sal', 'Diana Ramirez'),
(9, 'og', 'Sumistros de oficina'),
(10, 'og', 'Suministros Cocina'),
(11, 'og', 'Suministros Limpieza'),
(12, 'pub', 'Volantes'),
(13, 'pub', 'Comisiones'),
(14, 'pub', 'Anuncios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credenciales`
--

CREATE TABLE IF NOT EXISTS `credenciales` (
  `usuarios_id` int(11) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `clave` varchar(50) NOT NULL,
  PRIMARY KEY (`usuarios_id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla para almacenar las password';

--
-- Volcado de datos para la tabla `credenciales`
--

INSERT INTO `credenciales` (`usuarios_id`, `usuario`, `clave`) VALUES
(2, 'varaya', 'toto2012');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `codigo` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`codigo`, `nombre`, `descripcion`) VALUES
('OSI', 'Operador de Computadoras', 'Curso básico de computación, niños, jovenes, adultos, adultos mayores ... etc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE IF NOT EXISTS `dias` (
  `id` varchar(1) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`id`, `nombre`) VALUES
('D', 'Domingo'),
('J', 'Jueves'),
('L', 'Lunes'),
('M', 'Martes'),
('S', 'Sabado'),
('V', 'Viernes'),
('W', 'Miercoles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE IF NOT EXISTS `fotos` (
  `usuarios_id` int(11) NOT NULL,
  `nombreFoto` varchar(50) NOT NULL,
  KEY `Llave foranea` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`usuarios_id`, `nombreFoto`) VALUES
(2, 'perfil.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE IF NOT EXISTS `generos` (
  `id` int(11) NOT NULL,
  `genero` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `codigo` varchar(15) NOT NULL,
  `cursos_codigo` varchar(15) NOT NULL,
  `horarios_id` varchar(15) NOT NULL,
  `profesor_usuarios_id` int(11) NOT NULL,
  `actual_modulos_codigo` varchar(15) NOT NULL,
  `siguiente_modulos_codigo` varchar(15) NOT NULL,
  `fechaInicio` date NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cursos_codigo` (`cursos_codigo`),
  KEY `horarios_id` (`horarios_id`),
  KEY `profesor_usuarios_id` (`profesor_usuarios_id`),
  KEY `actual_modulos_codigo` (`actual_modulos_codigo`),
  KEY `siguiente_modulos_codigo` (`siguiente_modulos_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`codigo`, `cursos_codigo`, `horarios_id`, `profesor_usuarios_id`, `actual_modulos_codigo`, `siguiente_modulos_codigo`, `fechaInicio`) VALUES
('L8-11OSI', 'OSI', 'L8-11', 3, 'OSI-Win7', 'OSI-Word', '2012-12-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE IF NOT EXISTS `horarios` (
  `id` varchar(15) NOT NULL,
  `dias_id` varchar(1) NOT NULL,
  `hora` varchar(15) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dias_id` (`dias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `dias_id`, `hora`, `descripcion`) VALUES
('L2-5', 'L', '2:00 pm - 5:00 ', 'Lunes de 2:00 pm - 5:00 pm'),
('L8-11', 'L', '8:00 am - 11:00', 'Lunes de 8:00 am  a 11:00 am');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `misCursosMatriculados`
--

CREATE TABLE IF NOT EXISTS `misCursosMatriculados` (
  `usuarios_id` int(11) NOT NULL,
  `cursos_codigo` varchar(15) NOT NULL,
  `grupos_codigo` varchar(15) NOT NULL,
  PRIMARY KEY (`usuarios_id`,`cursos_codigo`),
  KEY `usuarios_id` (`usuarios_id`),
  KEY `cursos_codigo` (`cursos_codigo`),
  KEY `grupos_codigo` (`grupos_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `misCursosMatriculados`
--

INSERT INTO `misCursosMatriculados` (`usuarios_id`, `cursos_codigo`, `grupos_codigo`) VALUES
(4, 'OSI', 'L8-11OSI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `misFacturas`
--

CREATE TABLE IF NOT EXISTS `misFacturas` (
  `numeroFactura` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(11) NOT NULL,
  `cursos_codigo` varchar(15) NOT NULL,
  `detalle` varchar(200) NOT NULL,
  `fechaPago` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `Saldo` int(11) NOT NULL,
  PRIMARY KEY (`numeroFactura`),
  KEY `usuarios_id` (`usuarios_id`),
  KEY `cursos_codigo` (`cursos_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `misModulosMatriculados`
--

CREATE TABLE IF NOT EXISTS `misModulosMatriculados` (
  `usuarios_id` int(15) NOT NULL,
  `modulos_codigo` varchar(15) NOT NULL,
  PRIMARY KEY (`usuarios_id`,`modulos_codigo`),
  KEY `usuarios_id` (`usuarios_id`),
  KEY `modulos_codigo` (`modulos_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `misModulosMatriculados`
--

INSERT INTO `misModulosMatriculados` (`usuarios_id`, `modulos_codigo`) VALUES
(4, 'OSI-Excel'),
(4, 'OSI-Win7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `misNotas`
--

CREATE TABLE IF NOT EXISTS `misNotas` (
  `usuarios_id` int(11) NOT NULL,
  `modulos_codigo` varchar(15) NOT NULL,
  `nota` int(11) NOT NULL,
  `observaciones` varchar(200) NOT NULL,
  PRIMARY KEY (`usuarios_id`,`modulos_codigo`),
  KEY `modulos_codigo` (`modulos_codigo`),
  KEY `usuarios_id` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE IF NOT EXISTS `modulos` (
  `codigo` varchar(15) NOT NULL,
  `cursos_codigo` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cursos_codigo` (`cursos_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`codigo`, `cursos_codigo`, `nombre`, `descripcion`) VALUES
('OSI-Excel', 'OSI', 'MS Office Excel', 'Hoja electronica'),
('OSI-Win7', 'OSI', 'Windows 7 Ultimate', 'Curso introductorio a la computación'),
('OSI-Word', 'OSI', 'MS Office Word', 'Procesador de texto mas utilizado en Informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE IF NOT EXISTS `telefonos` (
  `usuarios_id` int(11) NOT NULL,
  `tiposTelefonos_id` int(11) NOT NULL,
  `numeroTelefono` int(11) NOT NULL,
  PRIMARY KEY (`usuarios_id`,`numeroTelefono`),
  KEY `tiposTelefonos_id` (`tiposTelefonos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`usuarios_id`, `tiposTelefonos_id`, `numeroTelefono`) VALUES
(2, 1, 24425186),
(2, 1, 24435856),
(2, 2, 24304654),
(2, 3, 70101918);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposTelefonos`
--

CREATE TABLE IF NOT EXISTS `tiposTelefonos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposTelefonos`
--

INSERT INTO `tiposTelefonos` (`id`, `tipo`) VALUES
(1, 'Habitacion'),
(2, 'Trabajo'),
(3, 'Celular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoUsuarios`
--

CREATE TABLE IF NOT EXISTS `tipoUsuarios` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoUsuarios`
--

INSERT INTO `tipoUsuarios` (`id`, `tipo`) VALUES
(1, 'Estudiante'),
(2, 'Profesor'),
(3, 'Administrativo'),
(4, 'Vendedor'),
(5, 'Gerencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechaRegistro` date NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `generos_id` int(11) NOT NULL,
  `tipoUsuarios_id` int(11) NOT NULL,
  `identificacion` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipoUsuarios_id` (`tipoUsuarios_id`),
  KEY `generos_id` (`generos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='en esta tabla se almacenan todos los usuarios del sistema' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `fechaRegistro`, `nombre`, `apellido1`, `apellido2`, `generos_id`, `tipoUsuarios_id`, `identificacion`, `fechaNacimiento`, `direccion`, `observaciones`) VALUES
(2, '0000-00-00', 'Victor', 'Araya', 'Jiménez', 1, 5, '206860157', '1991-02-16', '50m Este de tios bar, Calle Loria', NULL),
(3, '2012-01-09', 'Juan', 'Araya', 'Mesen', 1, 2, '601960439', '1973-01-31', 'Itiquis Calle Loria', NULL),
(4, '2012-06-06', 'Angel Gabriel', 'Araya', 'Jiménez', 1, 1, '65416546', '2000-11-01', 'Itiquis Calle Loria', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abonoFacturas`
--
ALTER TABLE `abonoFacturas`
  ADD CONSTRAINT `abonoFacturas_ibfk_1` FOREIGN KEY (`misFacturas_numeroFactura`) REFERENCES `misFacturas` (`numeroFactura`);

--
-- Filtros para la tabla `contDptosDetalle`
--
ALTER TABLE `contDptosDetalle`
  ADD CONSTRAINT `contDptosDetalle_ibfk_1` FOREIGN KEY (`contDptos_id`) REFERENCES `contDeptos` (`id`);

--
-- Filtros para la tabla `credenciales`
--
ALTER TABLE `credenciales`
  ADD CONSTRAINT `credenciales_ibfk_2` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fotos_ibfk_2` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_5` FOREIGN KEY (`siguiente_modulos_codigo`) REFERENCES `modulos` (`codigo`),
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`cursos_codigo`) REFERENCES `cursos` (`codigo`),
  ADD CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`horarios_id`) REFERENCES `horarios` (`id`),
  ADD CONSTRAINT `grupos_ibfk_3` FOREIGN KEY (`profesor_usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `grupos_ibfk_4` FOREIGN KEY (`actual_modulos_codigo`) REFERENCES `modulos` (`codigo`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`dias_id`) REFERENCES `dias` (`id`);

--
-- Filtros para la tabla `misCursosMatriculados`
--
ALTER TABLE `misCursosMatriculados`
  ADD CONSTRAINT `misCursosMatriculados_ibfk_3` FOREIGN KEY (`grupos_codigo`) REFERENCES `grupos` (`codigo`),
  ADD CONSTRAINT `misCursosMatriculados_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `misCursosMatriculados_ibfk_2` FOREIGN KEY (`cursos_codigo`) REFERENCES `cursos` (`codigo`);

--
-- Filtros para la tabla `misFacturas`
--
ALTER TABLE `misFacturas`
  ADD CONSTRAINT `misFacturas_ibfk_2` FOREIGN KEY (`cursos_codigo`) REFERENCES `cursos` (`codigo`),
  ADD CONSTRAINT `misFacturas_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `misModulosMatriculados`
--
ALTER TABLE `misModulosMatriculados`
  ADD CONSTRAINT `misModulosMatriculados_ibfk_2` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `misModulosMatriculados_ibfk_1` FOREIGN KEY (`modulos_codigo`) REFERENCES `modulos` (`codigo`);

--
-- Filtros para la tabla `misNotas`
--
ALTER TABLE `misNotas`
  ADD CONSTRAINT `misNotas_ibfk_2` FOREIGN KEY (`modulos_codigo`) REFERENCES `modulos` (`codigo`),
  ADD CONSTRAINT `misNotas_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD CONSTRAINT `modulos_ibfk_1` FOREIGN KEY (`cursos_codigo`) REFERENCES `cursos` (`codigo`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `telefonos_ibfk_2` FOREIGN KEY (`tiposTelefonos_id`) REFERENCES `tiposTelefonos` (`id`),
  ADD CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`generos_id`) REFERENCES `generos` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`tipoUsuarios_id`) REFERENCES `tipoUsuarios` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
