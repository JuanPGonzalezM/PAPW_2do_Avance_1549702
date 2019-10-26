CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL,
  `articulo_nombre` varchar(45) DEFAULT NULL,
  `articulo_precio` decimal(10,0) DEFAULT NULL,
  `idarticulo_categoria` int(11) DEFAULT NULL,
  `articulo_unidadesdisponibles` int(11) DEFAULT NULL,
  `articulo_descripcion` varchar(200) DEFAULT NULL,
  `idarticulo_imagen` int(11) DEFAULT NULL,
  `idarticulo_video` int(11) DEFAULT NULL,
  PRIMARY KEY (`idarticulo`),
  KEY `idarticulo_imagen_idx` (`idarticulo_imagen`),
  KEY `idarticulo_video_idx` (`idarticulo_video`),
  KEY `idarticulo_categoria_idx` (`idarticulo_categoria`),
  CONSTRAINT `idarticulo_categoria` FOREIGN KEY (`idarticulo_categoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `idarticulo_imagen` FOREIGN KEY (`idarticulo_imagen`) REFERENCES `imagen` (`idimagen`),
  CONSTRAINT `idarticulo_video` FOREIGN KEY (`idarticulo_video`) REFERENCES `video` (`idvideo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `idcomentario_articulo` int(11) DEFAULT NULL,
  `estrellas` int(11) DEFAULT NULL COMMENT 'del 1 al 5',
  PRIMARY KEY (`idcomentario`),
  KEY `idcomentario_articulo_idx` (`idcomentario_articulo`),
  CONSTRAINT `idcomentario_articulo` FOREIGN KEY (`idcomentario_articulo`) REFERENCES `articulo` (`idarticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `compra` (
  `idcompra` int(11) NOT NULL,
  `idcompra_articulo` int(11) DEFAULT NULL,
  `statuscompra` varchar(45) DEFAULT NULL,
  `idcompra_folio` int(11) DEFAULT NULL,
  `idcompra_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `idcompra_folio_idx` (`idcompra_folio`),
  KEY `idcompra_usuario_idx` (`idcompra_usuario`),
  KEY `idcompra_articulo_idx` (`idcompra_articulo`),
  CONSTRAINT `idcompra_articulo` FOREIGN KEY (`idcompra_articulo`) REFERENCES `articulo` (`idarticulo`),
  CONSTRAINT `idcompra_folio` FOREIGN KEY (`idcompra_folio`) REFERENCES `folio` (`idfolio`),
  CONSTRAINT `idcompra_usuario` FOREIGN KEY (`idcompra_usuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `folio` (
  `idfolio` int(11) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `numero_tarjeta` varchar(45) DEFAULT NULL,
  `nombre_tarjeta` varchar(45) DEFAULT NULL,
  `exo_mes` varchar(45) DEFAULT NULL,
  `stado` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `exp_year` varchar(45) DEFAULT NULL,
  `cvv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `imagen` (
  `idimagen` int(11) NOT NULL,
  `imagen` blob,
  PRIMARY KEY (`idimagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pedidos` (
  `idpedidos` int(11) NOT NULL,
  `idpedidos_usuario` int(11) DEFAULT NULL,
  `idpedidos_articulo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpedidos`),
  KEY `idpedidos_articulo_idx` (`idpedidos_articulo`),
  KEY `idpedidos_usuario_idx` (`idpedidos_usuario`),
  CONSTRAINT `idpedidos_articulo` FOREIGN KEY (`idpedidos_articulo`) REFERENCES `articulo` (`idarticulo`),
  CONSTRAINT `idpedidos_usuario` FOREIGN KEY (`idpedidos_usuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `video` (
  `idvideo` int(11) NOT NULL,
  `video` blob,
  PRIMARY KEY (`idvideo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

