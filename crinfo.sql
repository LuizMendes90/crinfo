-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 14, 2018 at 06:21 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crinfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cartas`
--

CREATE TABLE `cartas` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `custo` int(11) NOT NULL,
  `descricao` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cartas`
--

INSERT INTO `cartas` (`id`, `nome`, `custo`, `descricao`, `status`) VALUES
(1, 'Gigante', 6, 'forte 1', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `grupo_permissoes`
--

CREATE TABLE `grupo_permissoes` (
  `id` int(11) NOT NULL,
  `grupo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('A','D') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `grupo_permissoes`
--

INSERT INTO `grupo_permissoes` (`id`, `grupo`, `status`) VALUES
(20, 'Administrador', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `menu` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('A','D') COLLATE utf8_unicode_ci DEFAULT NULL,
  `icone` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu`, `status`, `icone`) VALUES
(4, 'Menus', 'A', 'fa fa-sitemap'),
(5, 'Usuário', 'A', 'fa fa-user'),
(18, 'Permissões', 'A', 'fa fa-thumbs-o-up'),
(19, 'Configuração', 'A', 'fa fa-cogs'),
(21, 'Cartas', 'A', 'fa fa-book');

-- --------------------------------------------------------

--
-- Table structure for table `permissoes_tela`
--

CREATE TABLE `permissoes_tela` (
  `id` int(11) NOT NULL,
  `id_sub_menu` int(11) DEFAULT NULL,
  `id_grupo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissoes_tela`
--

INSERT INTO `permissoes_tela` (`id`, `id_sub_menu`, `id_grupo`) VALUES
(1385, NULL, 0),
(1399, 59, 20),
(1400, 58, 20),
(1401, 60, 20),
(1402, 5, 20),
(1403, 6, 20),
(1404, 32, 20),
(1405, 33, 20),
(1406, 7, 20);

-- --------------------------------------------------------

--
-- Table structure for table `raridades`
--

CREATE TABLE `raridades` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `raridades`
--

INSERT INTO `raridades` (`id`, `nome`, `descricao`, `status`) VALUES
(1, 'Comum', 'Grupo comum de cartas', 'A'),
(2, 'Rara', 'Grupo de cartas raras', 'A'),
(3, 'Lendária', 'Grupo de cartas lendárias', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menus`
--

CREATE TABLE `sub_menus` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `subMenu` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomeArquivo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('A','D') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_menus`
--

INSERT INTO `sub_menus` (`id`, `id_menu`, `subMenu`, `nomeArquivo`, `status`) VALUES
(5, 4, 'Menu', 'menu', 'A'),
(6, 4, 'Sub Menu', 'subMenu', 'A'),
(7, 5, 'Usuário', 'usuario', 'A'),
(32, 18, 'Permissão Telas', 'permissaoTela', 'A'),
(33, 18, 'Grupo', 'grupoPermissao', 'A'),
(58, 21, 'Cartas', 'carta', 'A'),
(59, 21, 'Raridade', 'raridade', 'A'),
(60, 21, 'Tipo', 'tipo', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) CHARACTER SET utf8 NOT NULL,
  `descricao` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tipos`
--

INSERT INTO `tipos` (`id`, `tipo`, `descricao`, `status`) VALUES
(1, 'Feitiço', 'Cartas Magicas', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('A','D') COLLATE utf8_unicode_ci DEFAULT 'D',
  `id_grupo_permissao` int(11) DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'user_default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `senha`, `status`, `id_grupo_permissao`, `imagem`) VALUES
(1, 'luiz.mendes@outlook.com', 'teste', 'A', 20, 'user_default');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartas`
--
ALTER TABLE `cartas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grupo_permissoes`
--
ALTER TABLE `grupo_permissoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissoes_tela`
--
ALTER TABLE `permissoes_tela`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raridades`
--
ALTER TABLE `raridades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_menus`
--
ALTER TABLE `sub_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartas`
--
ALTER TABLE `cartas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grupo_permissoes`
--
ALTER TABLE `grupo_permissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `permissoes_tela`
--
ALTER TABLE `permissoes_tela`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1407;

--
-- AUTO_INCREMENT for table `raridades`
--
ALTER TABLE `raridades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_menus`
--
ALTER TABLE `sub_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
