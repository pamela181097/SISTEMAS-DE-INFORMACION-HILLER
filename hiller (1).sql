-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2019 a las 18:34:16
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hiller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblalmacen`
--

CREATE TABLE `tblalmacen` (
  `idalmacen` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL,
  `idjefe_almacen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcargo`
--

CREATE TABLE `tblcargo` (
  `idCargo` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `tblcargo`
--

INSERT INTO `tblcargo` (`idCargo`, `Nombre`, `Descripcion`) VALUES
(1, 'Proveedor', ''),
(2, 'Mecanico', ''),
(3, 'Jefe de Almacen', ''),
(4, 'Almacenero', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblestado`
--

CREATE TABLE `tblestado` (
  `idestado` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `describcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblinventario_falladas`
--

CREATE TABLE `tblinventario_falladas` (
  `idinventario` int(11) NOT NULL,
  `idmaquina` int(11) NOT NULL,
  `codigo_maquina` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `idproveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmaquina`
--

CREATE TABLE `tblmaquina` (
  `idmaquina` int(11) NOT NULL,
  `idestado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblorden_entrega`
--

CREATE TABLE `tblorden_entrega` (
  `idorden_entrega` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblorden_pedido`
--

CREATE TABLE `tblorden_pedido` (
  `nro_orden_pedido` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_requerida` date NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `monto` float NOT NULL,
  `observaciones` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpersona`
--

CREATE TABLE `tblpersona` (
  `IdPersona` int(10) NOT NULL,
  `Nonbre` varchar(30) NOT NULL,
  `ApellidoPaterno` varchar(30) NOT NULL,
  `ApellidoMaterno` varchar(30) NOT NULL,
  `Telefono` int(10) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `FechaNacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `tblpersona`
--

INSERT INTO `tblpersona` (`IdPersona`, `Nonbre`, `ApellidoPaterno`, `ApellidoMaterno`, `Telefono`, `Direccion`, `FechaNacimiento`) VALUES
(1, 'Pamela', 'Garcia', 'Claros', 987653, 'Av. Paragua', '2000-01-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblproducto`
--

CREATE TABLE `tblproducto` (
  `idproducto` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `medida` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblreparacion`
--

CREATE TABLE `tblreparacion` (
  `idreparacion` int(11) NOT NULL,
  `numero_serie` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `idmecanico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltraslado`
--

CREATE TABLE `tbltraslado` (
  `idtraslado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idalmacendestino` int(11) NOT NULL,
  `id_persona_que_alisto` int(11) NOT NULL,
  `idtransportador` int(11) NOT NULL,
  `idrecepcionador` int(11) NOT NULL,
  `idjefe_almacen_origen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `Nombre` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idCargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `tblusuarios`
--

INSERT INTO `tblusuarios` (`Nombre`, `Password`, `idPersona`, `idCargo`) VALUES
('pgarcia', '09bfc14f7435c09b70f0bf695888198b', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblalmacen`
--
ALTER TABLE `tblalmacen`
  ADD PRIMARY KEY (`idalmacen`),
  ADD KEY `idjefe_almacen` (`idjefe_almacen`);

--
-- Indices de la tabla `tblcargo`
--
ALTER TABLE `tblcargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `tblestado`
--
ALTER TABLE `tblestado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `tblinventario_falladas`
--
ALTER TABLE `tblinventario_falladas`
  ADD PRIMARY KEY (`idinventario`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `tblmaquina`
--
ALTER TABLE `tblmaquina`
  ADD PRIMARY KEY (`idmaquina`),
  ADD KEY `idestado` (`idestado`);

--
-- Indices de la tabla `tblorden_entrega`
--
ALTER TABLE `tblorden_entrega`
  ADD PRIMARY KEY (`idorden_entrega`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `tblorden_pedido`
--
ALTER TABLE `tblorden_pedido`
  ADD PRIMARY KEY (`nro_orden_pedido`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `tblpersona`
--
ALTER TABLE `tblpersona`
  ADD PRIMARY KEY (`IdPersona`);

--
-- Indices de la tabla `tblproducto`
--
ALTER TABLE `tblproducto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `tblreparacion`
--
ALTER TABLE `tblreparacion`
  ADD PRIMARY KEY (`idreparacion`),
  ADD KEY `idmecanico` (`idmecanico`);

--
-- Indices de la tabla `tbltraslado`
--
ALTER TABLE `tbltraslado`
  ADD PRIMARY KEY (`idtraslado`),
  ADD KEY `id_persona_que_alisto` (`id_persona_que_alisto`),
  ADD KEY `idtransportador` (`idtransportador`),
  ADD KEY `idrecepcionador` (`idrecepcionador`),
  ADD KEY `idjefe_almacen_origen` (`idjefe_almacen_origen`),
  ADD KEY `idalmacendestino` (`idalmacendestino`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`Nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblalmacen`
--
ALTER TABLE `tblalmacen`
  MODIFY `idalmacen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblcargo`
--
ALTER TABLE `tblcargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblestado`
--
ALTER TABLE `tblestado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblinventario_falladas`
--
ALTER TABLE `tblinventario_falladas`
  MODIFY `idinventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblmaquina`
--
ALTER TABLE `tblmaquina`
  MODIFY `idmaquina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblorden_entrega`
--
ALTER TABLE `tblorden_entrega`
  MODIFY `idorden_entrega` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblorden_pedido`
--
ALTER TABLE `tblorden_pedido`
  MODIFY `nro_orden_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblpersona`
--
ALTER TABLE `tblpersona`
  MODIFY `IdPersona` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblproducto`
--
ALTER TABLE `tblproducto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblreparacion`
--
ALTER TABLE `tblreparacion`
  MODIFY `idreparacion` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
