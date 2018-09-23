-- MySQL dump 10.16  Distrib 10.1.33-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: crinfo
-- ------------------------------------------------------
-- Server version	10.1.33-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carta_composicoes`
--

DROP TABLE IF EXISTS `carta_composicoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carta_composicoes` (
  `id_carta` int(11) NOT NULL,
  `id_personagem` int(11) NOT NULL,
  `quantidade_personagem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_carta`,`id_personagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carta_composicoes`
--

LOCK TABLES `carta_composicoes` WRITE;
/*!40000 ALTER TABLE `carta_composicoes` DISABLE KEYS */;
INSERT INTO `carta_composicoes` VALUES (1,2,1),(2,1,123),(8,5,3),(9,6,1),(10,1,3),(11,10,1),(12,12,5),(13,14,3),(14,15,3),(15,22,1),(16,5,7),(16,23,1),(17,16,1),(18,20,1),(19,19,3),(20,39,1),(21,46,1),(22,56,2),(22,57,1),(23,8,4),(24,19,6),(25,75,2),(26,74,1),(27,81,6),(28,13,1),(29,17,1),(30,29,1),(31,30,1),(32,5,13),(32,21,1),(33,50,1),(34,45,1),(35,47,1),(36,8,2),(36,37,1),(37,14,10),(37,35,1),(38,34,1),(39,52,1),(40,43,1),(41,33,1),(42,51,3),(43,63,1),(44,15,10),(44,62,1),(45,2,1),(46,58,4),(47,59,1),(48,70,1),(49,8,8),(49,77,1),(50,33,3),(51,4,1),(52,11,1),(53,8,1),(53,9,1),(54,5,14),(55,18,1),(56,28,3),(57,40,1),(58,53,1),(59,44,1),(60,41,1),(61,32,1),(62,61,1),(63,54,1),(64,64,1),(65,55,1),(66,67,1),(67,60,1),(68,15,2),(68,71,1),(69,73,1),(70,72,1),(71,69,1),(72,79,1),(73,83,1),(73,84,2),(74,24,1),(75,25,1),(76,31,1),(77,26,1),(78,49,1),(79,42,1),(80,38,1),(81,36,1),(82,48,1),(83,5,1),(83,65,1),(84,76,1),(85,78,1),(86,80,1),(86,82,6),(87,85,1),(88,86,1),(89,1,3),(89,87,1),(90,1,3),(90,15,2),(91,88,1),(92,89,1),(93,90,1),(94,91,1),(95,27,2);
/*!40000 ALTER TABLE `carta_composicoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartas`
--

DROP TABLE IF EXISTS `cartas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `custo` int(11) NOT NULL,
  `descricao` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `id_raridade` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas`
--

LOCK TABLES `cartas` WRITE;
/*!40000 ALTER TABLE `cartas` DISABLE KEYS */;
INSERT INTO `cartas` VALUES (8,'Esqueletos',1,'','A',1),(9,'Bola de Neve',2,'','A',1),(10,'Goblins',2,'','A',1),(11,'Zap',2,'','A',1),(12,'Morcegos',2,'','A',1),(13,'Espíritos de Fogo',2,'','A',1),(14,'Goblins Lanceiros',2,'','A',1),(15,'Canhão',3,'','A',1),(16,'Barril de Esqueletos',3,'','A',1),(17,'Bombardeiro',3,'','A',1),(18,'Flechas',3,'','A',1),(19,'Servos',3,'','A',1),(20,'Tesla',4,'','A',1),(21,'Morteiro',4,'','A',1),(22,'Patifes',5,'','A',1),(23,'Bárbaros',5,'','A',1),(24,'Horda de Servos',6,'','A',1),(25,'Barbáros de Elite',6,'','A',1),(26,'Gigante Real',6,'','A',1),(27,'Recrutas Reais',8,'','A',1),(28,'Golem de Gelo',2,'','A',2),(29,'Cura',3,'','A',2),(30,'Goblin com Dardo',3,'','A',2),(31,'Megasservo',3,'','A',2),(32,'Lápide',3,'','A',2),(33,'Corredor',4,'','A',2),(34,'Torre de Bombas',4,'','A',2),(35,'Valquíria',4,'','A',2),(36,'Aríete de Batalha',4,'','A',2),(37,'Fornalha',4,'','A',2),(38,'Mini P.E.K.K.A',4,'','A',2),(39,'Máquina Voadora',4,'','A',2),(40,'Bola de Fogo',4,'','A',2),(41,'Mosqueteira',4,'','A',2),(42,'Eletrocutadores',4,'','A',2),(43,'Torre Inferno',5,'','A',2),(44,'Cabana de Goblins',5,'','A',2),(45,'Gigante',5,'','A',2),(46,'Porcos Reais',5,'','A',2),(47,'Mago',5,'','A',2),(48,'Coletor de Elixir',6,'','A',2),(49,'Cabana de Bárbaros',6,'','A',2),(50,'Três Mosqueteiras',9,'','A',2),(51,'Espelho',0,'','A',4),(52,'Fúria',2,'','A',4),(53,'Barril de Bárbaro',2,'','A',4),(54,'Exército de Esqueletos',3,'','A',4),(55,'Clone',3,'','A',4),(56,'Guardas',3,'','A',4),(57,'Dragão Bebê',4,'','A',4),(58,'Gelo',4,'','A',4),(59,'Veneno',4,'','A',4),(60,'Príncipe das Trevas',4,'','A',4),(61,'Caçador',4,'','A',4),(62,'Príncipe',5,'','A',4),(63,'Carrinho de Canhão',5,'','A',4),(64,'Executor',5,'','A',4),(65,'Balão',5,'','A',4),(66,'Lançador',5,'','A',4),(67,'Bruxa',5,'','A',4),(68,'Goblin Gigante',6,'','A',4),(69,'Relâmpago',6,'','A',4),(70,'Esqueleto Gigante',6,'','A',4),(71,'X-Besta',6,'','A',4),(72,'P.E.K.K.A',7,'','A',4),(73,'Golem',8,'','A',4),(74,'Fantasma Real',3,'','A',3),(75,'Bandida',3,'','A',3),(76,'Mineiro',3,'','A',3),(77,'Mago de Gelo',3,'','A',3),(78,'Arqueiro Mágico',4,'','A',3),(79,'Mago Elétrico',4,'','A',3),(80,'Dragão Infernal',4,'','A',3),(81,'Lenhador',4,'','A',3),(82,'Bruxa Sombria',4,'','A',3),(83,'Cemitério',5,'','A',3),(84,'Sparky',6,'','A',3),(85,'Megacavaleiro',7,'','A',3),(86,'Lava Hound',7,'','A',3),(87,'Foguete',6,'','A',2),(88,'Tornado',3,'','A',4),(89,'Barril de Goblins',3,'','A',4),(90,'Gangue de Goblins',3,'','A',1),(91,'Cavaleiro',3,'','A',1),(92,'Princesa',3,'','A',3),(93,'Tronco',2,'','A',3),(94,'Espírito de Gelo',1,'','A',1),(95,'Arqueiras',3,'','A',1);
/*!40000 ALTER TABLE `cartas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decks`
--

DROP TABLE IF EXISTS `decks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deck` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carta_1` int(11) DEFAULT NULL,
  `carta_2` int(11) DEFAULT NULL,
  `carta_3` int(11) DEFAULT NULL,
  `carta_4` int(11) DEFAULT NULL,
  `carta_5` int(11) DEFAULT NULL,
  `carta_6` int(11) DEFAULT NULL,
  `carta_7` int(11) DEFAULT NULL,
  `carta_8` int(11) DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decks`
--

LOCK TABLES `decks` WRITE;
/*!40000 ALTER TABLE `decks` DISABLE KEYS */;
INSERT INTO `decks` VALUES (10,'11',12,10,8,8,36,24,36,8,'A');
/*!40000 ALTER TABLE `decks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_permissoes`
--

DROP TABLE IF EXISTS `grupo_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_permissoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('A','D') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_permissoes`
--

LOCK TABLES `grupo_permissoes` WRITE;
/*!40000 ALTER TABLE `grupo_permissoes` DISABLE KEYS */;
INSERT INTO `grupo_permissoes` VALUES (20,'Administrador','A');
/*!40000 ALTER TABLE `grupo_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `habilidade` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `habilidade_UNIQUE` (`habilidade`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades`
--

LOCK TABLES `habilidades` WRITE;
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
INSERT INTO `habilidades` VALUES (1,'Dano em área','Dano em área','A'),(2,'Dano','','A'),(3,'Dano por segundo','','A'),(4,'Velocidade do impacto','','A'),(5,'Velocidade','Velocidade de movimento da carta','A'),(6,'Pontos de vida','','A'),(7,'Alvos','Qual a preferência de ataque da carta.','A'),(8,'Alcance','','A'),(10,'Dano à torre da coroa','','A'),(11,'Raio','','A'),(13,'Duração','','A'),(15,'Dano de carga','','A'),(16,'Duração de desaceleração','','A'),(17,'Duração de paralisar','','A'),(18,'Melhorar','','A'),(19,'Dano de morte','','A'),(20,'Cura / seg','','A'),(21,'Velocidade de geração','','A'),(22,'Tempo de efeito','','A'),(23,'Alcance por colisão','','A'),(24,'Dano por colisão','','A'),(25,'Vida do escudo','','A'),(26,'Alcance do projétil','','A'),(27,'Dano de geração','','A'),(29,'Dano à torre da coroa / seg','','A'),(30,'Tempo de mobilização','','A'),(31,'Duração de gelo','','A'),(32,'Velocidade de produção','','A'),(33,'Dano em salto','','A'),(34,'Alcance de salto','','A'),(35,'Nível comum espelhado','','A'),(36,'Nível épico espelhado','','A'),(37,'Nível raro espelhado','','A'),(38,'Nível lendário espelhado','','A'),(39,'Nível comum clonado','','A'),(40,'Nível raro clonado','','A'),(41,'Nível épico clonado','','A'),(42,'Nível lendário clonado','','A'),(43,'Pontos de vida do clone','','A'),(44,'Pontos de vida do escudo do clone','','A');
/*!40000 ALTER TABLE `habilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('A','D') COLLATE utf8_unicode_ci DEFAULT NULL,
  `icone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (4,'Menus','A','fa fa-sitemap'),(5,'Usuário','A','fa fa-user'),(18,'Permissões','A','fa fa-thumbs-o-up'),(19,'Configuração','A','fa fa-cogs'),(21,'Cartas','A','fa fa-book'),(22,'Deck','A','fa fa-file-o');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveis`
--

DROP TABLE IF EXISTS `niveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nivel_UNIQUE` (`nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveis`
--

LOCK TABLES `niveis` WRITE;
/*!40000 ALTER TABLE `niveis` DISABLE KEYS */;
INSERT INTO `niveis` VALUES (3,'1','Primeiro nível','A'),(4,'2','Segundo nivel','A'),(5,'3','','A'),(6,'4','','A'),(7,'5','','A'),(8,'6','','A'),(9,'7','','A'),(10,'8','','A'),(11,'9','','A'),(12,'10','','A'),(13,'11','','A'),(14,'12','','A'),(15,'13','','A'),(16,'14','','A');
/*!40000 ALTER TABLE `niveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissoes_tela`
--

DROP TABLE IF EXISTS `permissoes_tela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissoes_tela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sub_menu` int(11) DEFAULT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1449 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissoes_tela`
--

LOCK TABLES `permissoes_tela` WRITE;
/*!40000 ALTER TABLE `permissoes_tela` DISABLE KEYS */;
INSERT INTO `permissoes_tela` VALUES (1385,NULL,0),(1437,58,20),(1438,63,20),(1439,60,20),(1440,62,20),(1441,59,20),(1442,61,20),(1443,64,20),(1444,6,20),(1445,5,20),(1446,33,20),(1447,32,20),(1448,7,20);
/*!40000 ALTER TABLE `permissoes_tela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personagem_habilidades`
--

DROP TABLE IF EXISTS `personagem_habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personagem_habilidades` (
  `id_personagem` int(11) NOT NULL,
  `id_habilidade` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `valor` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_personagem`,`id_habilidade`,`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personagem_habilidades`
--

LOCK TABLES `personagem_habilidades` WRITE;
/*!40000 ALTER TABLE `personagem_habilidades` DISABLE KEYS */;
INSERT INTO `personagem_habilidades` VALUES (1,1,3,'123'),(1,1,4,'123'),(2,1,3,'123'),(2,1,4,'123');
/*!40000 ALTER TABLE `personagem_habilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personagens`
--

DROP TABLE IF EXISTS `personagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personagens`
--

LOCK TABLES `personagens` WRITE;
/*!40000 ALTER TABLE `personagens` DISABLE KEYS */;
INSERT INTO `personagens` VALUES (1,'Goblin','Personagem Verde','A'),(2,'Gigante','Grande','A'),(4,'Espelho','','A'),(5,'Esqueleto','','A'),(6,'Bola de Neve','','A'),(8,'Bárbaro','','A'),(9,'Barril de Bárbaro','','A'),(10,'Zap','','A'),(11,'Fúria','','A'),(12,'Morcego','','A'),(13,'Golen de Gelo','','A'),(14,'Espírito de Fogo','','A'),(15,'Goblin Lanceiro','','A'),(16,'Bombardeiro','','A'),(17,'Cura','','A'),(18,'Clone','','A'),(19,'Servo','','A'),(20,'Flechas','','A'),(21,'Lápide','','A'),(22,'Canhão','','A'),(23,'Barril de Esqueletos','','A'),(24,'Fantasma Real','','A'),(25,'Bandida','','A'),(26,'Mago de Gelo','','A'),(27,'Arqueira','','A'),(28,'Guarda','','A'),(29,'Goblin com Dardo','','A'),(30,'Megasservo','','A'),(31,'Mineiro','','A'),(32,'Caçador','','A'),(33,'Mosqueteira','','A'),(34,'Mini P.E.K.K.A','','A'),(35,'Fornalha','','A'),(36,'Lenhador','','A'),(37,'Aríete de Batalha','','A'),(38,'Dragão Infernal','','A'),(39,'Tesla','','A'),(40,'Dragão Bebê','','A'),(41,'Príncipe das Trevas','','A'),(42,'Mago Elétrico','','A'),(43,'Bola de Fogo','','A'),(44,'Veneno','','A'),(45,'Torre de Bombas','','A'),(46,'Morteiro','','A'),(47,'Valquíria','','A'),(48,'Bruxa Sombria','','A'),(49,'Arqueiro Mágico','','A'),(50,'Corredor','','A'),(51,'Eletrocutadores','','A'),(52,'Máquina Voadora','','A'),(53,'Gelo','','A'),(54,'Carrinho de Canhão','','A'),(55,'Balão','','A'),(56,'Patifa','','A'),(57,'Patife','','A'),(58,'Porcos Reais','','A'),(59,'Mago','','A'),(60,'Bruxa','','A'),(61,'Príncipe','','A'),(62,'Cabana de Goblins','','A'),(63,'Torre Inferno','','A'),(64,'Executor','','A'),(65,'Cemitério','','A'),(67,'Lançador','','A'),(69,'X-Besta','','A'),(70,'Coletor de Elixir','','A'),(71,'Goblin Gigante','','A'),(72,'Esqueleto Gigante','','A'),(73,'Relâmpago','','A'),(74,'Gigante Real','','A'),(75,'Bárbaro de Elite','','A'),(76,'Sparky','','A'),(77,'Cabana de Bárbaros','','A'),(78,'Megacavaleiro','','A'),(79,'P.E.K.K.A','','A'),(80,'Lava Hound','','A'),(81,'Recruta Real','','A'),(82,'Lava Pup','','A'),(83,'Golem','','A'),(84,'Golemita','','A'),(85,'Foguete','','A'),(86,'Tornado','','A'),(87,'Barril de Goblins','','A'),(88,'Cavaleiro','','A'),(89,'Princesa','','A'),(90,'Tronco','','A'),(91,'Espírito de Gelo','','A');
/*!40000 ALTER TABLE `personagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raridades`
--

DROP TABLE IF EXISTS `raridades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raridades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raridades`
--

LOCK TABLES `raridades` WRITE;
/*!40000 ALTER TABLE `raridades` DISABLE KEYS */;
INSERT INTO `raridades` VALUES (1,'Comum','Grupo comum de cartas','A'),(2,'Rara','Grupo de cartas raras','A'),(3,'Lendária','Grupo de cartas lendárias','A'),(4,'Épica','','A');
/*!40000 ALTER TABLE `raridades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_menus`
--

DROP TABLE IF EXISTS `sub_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `subMenu` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomeArquivo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('A','D') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_menus`
--

LOCK TABLES `sub_menus` WRITE;
/*!40000 ALTER TABLE `sub_menus` DISABLE KEYS */;
INSERT INTO `sub_menus` VALUES (5,4,'Menu','menu','A'),(6,4,'Sub Menu','subMenu','A'),(7,5,'Usuário','usuario','A'),(32,18,'Permissão Telas','permissaoTela','A'),(33,18,'Grupo','grupoPermissao','A'),(58,21,'Cartas','carta','A'),(59,21,'Raridade','raridade','A'),(60,21,'Tipo','tipo','A'),(61,21,'Personagens','personagem','A'),(62,21,'Habilidades','habilidade','A'),(63,21,'Níveis','nivel','A'),(64,22,'Deck','deck','A');
/*!40000 ALTER TABLE `sub_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) CHARACTER SET utf8 NOT NULL,
  `descricao` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (1,'Feitiço','Cartas Magicas','A'),(2,'Construção','','A'),(3,'Tropa','','A');
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('A','D') COLLATE utf8_unicode_ci DEFAULT 'D',
  `id_grupo_permissao` int(11) DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'user_default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'luiz.mendes@outlook.com','teste','A',20,'user_default');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-23 11:37:47
