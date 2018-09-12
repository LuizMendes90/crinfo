-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 12, 2018 at 04:44 PM
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
(19, 'Configuração', 'A', 'fa fa-cogs');

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
(1380, 5, 20),
(1381, 6, 20),
(1382, 7, 20),
(1383, 32, 20),
(1384, 33, 20),
(1385, NULL, 0);

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
(33, 18, 'Grupo', 'grupoPermissao', 'A');

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
-- Indexes for table `sub_menus`
--
ALTER TABLE `sub_menus`
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
-- AUTO_INCREMENT for table `grupo_permissoes`
--
ALTER TABLE `grupo_permissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permissoes_tela`
--
ALTER TABLE `permissoes_tela`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1386;

--
-- AUTO_INCREMENT for table `sub_menus`
--
ALTER TABLE `sub_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
