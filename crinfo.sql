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
INSERT INTO `carta_composicoes` VALUES (1,2,1),(2,1,123);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas`
--

LOCK TABLES `cartas` WRITE;
/*!40000 ALTER TABLE `cartas` DISABLE KEYS */;
INSERT INTO `cartas` VALUES (1,'Gigante',6,'forte 1','A',2),(2,'Lápide',4,'teste','A',3);
/*!40000 ALTER TABLE `cartas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (4,'Menus','A','fa fa-sitemap'),(5,'Usuário','A','fa fa-user'),(18,'Permissões','A','fa fa-thumbs-o-up'),(19,'Configuração','A','fa fa-cogs'),(21,'Cartas','A','fa fa-book');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveis`
--

LOCK TABLES `niveis` WRITE;
/*!40000 ALTER TABLE `niveis` DISABLE KEYS */;
INSERT INTO `niveis` VALUES (3,'1','Primeiro nível','A'),(4,'2','Segundo nivel','A'),(5,'3','','A'),(6,'4','','A'),(7,'5','','A'),(8,'6','','A'),(9,'7','','A'),(10,'8','','A'),(11,'9','','A'),(12,'10','','A'),(13,'11','','A'),(14,'12','','A'),(15,'13','','A');
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
) ENGINE=InnoDB AUTO_INCREMENT=1437 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissoes_tela`
--

LOCK TABLES `permissoes_tela` WRITE;
/*!40000 ALTER TABLE `permissoes_tela` DISABLE KEYS */;
INSERT INTO `permissoes_tela` VALUES (1385,NULL,0),(1426,63,20),(1427,60,20),(1428,62,20),(1429,59,20),(1430,61,20),(1431,58,20),(1432,6,20),(1433,5,20),(1434,33,20),(1435,32,20),(1436,7,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personagens`
--

LOCK TABLES `personagens` WRITE;
/*!40000 ALTER TABLE `personagens` DISABLE KEYS */;
INSERT INTO `personagens` VALUES (1,'Goblin','Personagem Verde','A'),(2,'Gigante','Grande','A');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raridades`
--

LOCK TABLES `raridades` WRITE;
/*!40000 ALTER TABLE `raridades` DISABLE KEYS */;
INSERT INTO `raridades` VALUES (1,'Comum','Grupo comum de cartas','A'),(2,'Rara','Grupo de cartas raras','A'),(3,'Lendária','Grupo de cartas lendárias','A');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_menus`
--

LOCK TABLES `sub_menus` WRITE;
/*!40000 ALTER TABLE `sub_menus` DISABLE KEYS */;
INSERT INTO `sub_menus` VALUES (5,4,'Menu','menu','A'),(6,4,'Sub Menu','subMenu','A'),(7,5,'Usuário','usuario','A'),(32,18,'Permissão Telas','permissaoTela','A'),(33,18,'Grupo','grupoPermissao','A'),(58,21,'Cartas','carta','A'),(59,21,'Raridade','raridade','A'),(60,21,'Tipo','tipo','A'),(61,21,'Personagens','personagem','A'),(62,21,'Habilidades','habilidade','A'),(63,21,'Níveis','nivel','A');
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

-- Dump completed on 2018-09-19 11:51:40
