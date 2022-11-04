-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.4-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema testewk
--

CREATE DATABASE IF NOT EXISTS testewk;
USE testewk;

--
-- Definition of table `tblclientes`
--

DROP TABLE IF EXISTS `tblclientes`;
CREATE TABLE `tblclientes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclientes`
--

/*!40000 ALTER TABLE `tblclientes` DISABLE KEYS */;
INSERT INTO `tblclientes` (`codigo`,`nome`,`cidade`,`uf`) VALUES 
 (1,'FELIPE','MARICA','RJ'),
 (2,'WK TECHOLOGY ','AGUAS MORNAS','SC'),
 (3,'UNIQUESYSTEMS','SAO GONÇALO','RJ'),
 (4,'CLIENTE 4','RIO DE JANEIRO','RJ'),
 (5,'CLIENTE 5','SÃO PAULO','SP'),
 (6,'CLIENTE 6','MACEIO','AL'),
 (7,'CLIENTE 7','ARACAJU','SE'),
 (8,'CLIENTE 8','ITABAIANINHA','SE'),
 (9,'CLIENTE 9','TOBIAS BARRETO.','SE'),
 (10,'CLIENTE 10','BELO HORIZONTE','MG'),
 (11,'CLIENTE 11','MARIANA','MG'),
 (12,'CLIENTE 12','OURO BRANCO','MG'),
 (13,'CLIENTE 13','FRIBURGO','RJ'),
 (14,'CLIENTE 14','SALVADOR','BA'),
 (15,'CLIENTE 15','FEIRA DE SANTANA','BA'),
 (16,'CLIENTE 16','Camaçari','BA'),
 (17,'CLIENTE 17','NATAL','RN'),
 (18,'CLIENTE 18','MOSSORO','RN'),
 (19,'CLIENTE 19','PORTO ALEGRE','RS'),
 (20,'CLIENTE 20','CANOAS','RS');
/*!40000 ALTER TABLE `tblclientes` ENABLE KEYS */;


--
-- Definition of table `tblpedidos`
--

DROP TABLE IF EXISTS `tblpedidos`;
CREATE TABLE `tblpedidos` (
  `numeropedido` int(11) NOT NULL AUTO_INCREMENT,
  `dataemissao` date NOT NULL,
  `codigocliente` int(11) NOT NULL,
  `valortotal` decimal(11,3) NOT NULL,
  PRIMARY KEY (`numeropedido`),
  KEY `FK_tblpedidos_1` (`codigocliente`),
  CONSTRAINT `FK_tblpedidos_1` FOREIGN KEY (`codigocliente`) REFERENCES `tblclientes` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpedidos`
--

/*!40000 ALTER TABLE `tblpedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpedidos` ENABLE KEYS */;


--
-- Definition of table `tblpedidosprodutos`
--

DROP TABLE IF EXISTS `tblpedidosprodutos`;
CREATE TABLE `tblpedidosprodutos` (
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

--
-- Dumping data for table `tblpedidosprodutos`
--

/*!40000 ALTER TABLE `tblpedidosprodutos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpedidosprodutos` ENABLE KEYS */;


--
-- Definition of table `tblprodutos`
--

DROP TABLE IF EXISTS `tblprodutos`;
CREATE TABLE `tblprodutos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) NOT NULL,
  `precovenda` decimal(11,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblprodutos`
--

/*!40000 ALTER TABLE `tblprodutos` DISABLE KEYS */;
INSERT INTO `tblprodutos` (`codigo`,`descricao`,`precovenda`) VALUES 
 (1,'PRODUTO 2','25.000'),
 (2,'PRODUTO 3','40.000'),
 (3,'PRODUTO 6','150.000'),
 (4,'PRODUTO 9','2000.000'),
 (5,'PRODUTO 11','555.000'),
 (6,'PRODUTO 12','48.000'),
 (7,'PRODUTO 13','42.000'),
 (8,'PRODUTO 14','79.000'),
 (9,'PRODUTO 15','53.000'),
 (10,'PRODUTO 16','15.000'),
 (11,'PRODUTO 17','11.000'),
 (12,'PRODUTO 20','3.000'),
 (13,'PRODUTO 1','5.000'),
 (14,'PRODUTO 4','65.550'),
 (15,'PRODUTO 5','70.770'),
 (16,'PRODUTO 7','29.900'),
 (17,'PRODUTO 8','3.550'),
 (18,'PRODUTO 10','2220.500'),
 (19,'PRODUTO 18','0.550'),
 (20,'PRODUTO 19','2.540');
/*!40000 ALTER TABLE `tblprodutos` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
