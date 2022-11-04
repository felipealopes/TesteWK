`testewk`.CREATE DATABASE `testewk` /*!40100 DEFAULT CHARACTER SET latin1 */;

DROP TABLE IF EXISTS `testewk`.`tblclientes`;
CREATE TABLE  `testewk`.`tblclientes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `testewk`.`tblprodutos`;
CREATE TABLE  `testewk`.`tblprodutos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) NOT NULL,
  `precovenda` decimal(11,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `testewk`.`tblpedidos`;
CREATE TABLE  `testewk`.`tblpedidos` (
  `numeropedido` int(11) NOT NULL AUTO_INCREMENT,
  `dataemissao` date NOT NULL,
  `codigocliente` int(11) NOT NULL,
  `valortotal` decimal(11,3) NOT NULL,
  PRIMARY KEY (`numeropedido`),
  KEY `FK_tblpedidos_1` (`codigocliente`),
  CONSTRAINT `FK_tblpedidos_1` FOREIGN KEY (`codigocliente`) REFERENCES `tblclientes` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `testewk`.`tblpedidosprodutos`;
CREATE TABLE  `testewk`.`tblpedidosprodutos` (
  `codigopedidoproduto` int(11) NOT NULL AUTO_INCREMENT,
  `numeropedido` int(11) NOT NULL,
  `codigoproduto` int(11) NOT NULL,
  `quantidade` decimal(11,3) NOT NULL,
  `valorunitario` decimal(11,3) NOT NULL,
  `valortotal` decimal(11,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`codigopedidoproduto`),
  KEY `FK_tblpedidosprodutos_1` (`codigoproduto`),
  KEY `FK_tblpedidosprodutos_2` (`numeropedido`),
  CONSTRAINT `FK_tblpedidosprodutos_1` FOREIGN KEY (`codigoproduto`) REFERENCES `tblprodutos` (`codigo`),
  CONSTRAINT `FK_tblpedidosprodutos_2` FOREIGN KEY (`numeropedido`) REFERENCES `tblpedidos` (`numeropedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

