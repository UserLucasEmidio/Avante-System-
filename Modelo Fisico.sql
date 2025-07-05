-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18/06/2025 às 20:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `avante_ong_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `semana` varchar(20) NOT NULL,
  `horario` time NOT NULL,
  `usuario_inseriu_id` int(11) DEFAULT NULL,
  `data_inseriu` timestamp NULL DEFAULT current_timestamp(),
  `usuario_removeu_id` int(11) DEFAULT NULL,
  `data_removeu` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda_historico_add_rm`
--

CREATE TABLE `agenda_historico_add_rm` (
  `id_historico` int(11) NOT NULL,
  `acao` varchar(10) NOT NULL,
  `id_agenda` int(11) NOT NULL,
  `usuario_acao_id` int(11) NOT NULL,
  `data_acao` timestamp NOT NULL DEFAULT current_timestamp(),
  `semana` varchar(20) NOT NULL,
  `horario` time NOT NULL,
  `usuario_agendado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agenda_historico_add_rm`
--

INSERT INTO `agenda_historico_add_rm` (`id_historico`, `acao`, `id_agenda`, `usuario_acao_id`, `data_acao`, `semana`, `horario`, `usuario_agendado_id`) VALUES
(1, 'ADICIONADO', 15, 1, '2025-04-30 05:06:18', 'Segunda-Feira', '08:00:00', 2),
(2, 'REMOVIDO', 15, 1, '2025-04-30 05:06:56', 'Segunda-Feira', '08:00:00', 2),
(3, 'ADICIONADO', 16, 1, '2025-04-30 13:35:40', 'Quarta-Feira', '12:00:00', 3),
(4, 'REMOVIDO', 16, 1, '2025-04-30 13:35:56', 'Quarta-Feira', '12:00:00', 3),
(5, 'ADICIONADO', 17, 2, '2025-04-30 13:38:46', 'Quinta-Feira', '08:00:00', 2),
(6, 'REMOVIDO', 17, 2, '2025-04-30 13:39:04', 'Quinta-Feira', '08:00:00', 2),
(7, 'ADICIONADO', 18, 2, '2025-04-30 13:40:07', 'Segunda-Feira', '08:00:00', 3),
(8, 'REMOVIDO', 18, 1, '2025-05-01 23:27:07', 'Segunda-Feira', '08:00:00', 3),
(9, 'ADICIONADO', 19, 1, '2025-05-10 20:31:02', 'Segunda-Feira', '08:00:00', 2),
(10, 'REMOVIDO', 19, 1, '2025-05-10 20:49:02', 'Segunda-Feira', '08:00:00', 2),
(11, 'ADICIONADO', 20, 1, '2025-05-10 21:34:50', 'Segunda-Feira', '08:00:00', 2),
(12, 'ADICIONADO', 21, 1, '2025-05-10 21:34:55', 'Terça-Feira', '08:00:00', 2),
(13, 'ADICIONADO', 22, 1, '2025-05-10 21:35:01', 'Segunda-Feira', '10:00:00', 2),
(14, 'ADICIONADO', 23, 1, '2025-05-10 21:35:10', 'Sexta-Feira', '08:00:00', 2),
(15, 'REMOVIDO', 20, 1, '2025-05-10 21:35:14', 'Segunda-Feira', '08:00:00', 2),
(16, 'REMOVIDO', 21, 1, '2025-05-10 21:35:19', 'Terça-Feira', '08:00:00', 2),
(17, 'REMOVIDO', 23, 1, '2025-05-10 21:35:25', 'Sexta-Feira', '08:00:00', 2),
(18, 'REMOVIDO', 22, 1, '2025-05-10 21:35:31', 'Segunda-Feira', '10:00:00', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cad_usuarios`
--

CREATE TABLE `cad_usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `numero` varchar(10) NOT NULL,
  `primeiro_contato` varchar(50) DEFAULT NULL,
  `primeiro_contato_tipo` varchar(50) DEFAULT NULL,
  `segundo_contato` varchar(50) DEFAULT NULL,
  `segundo_contato_tipo` varchar(50) DEFAULT NULL,
  `trabalha` enum('Sim','Não') NOT NULL,
  `profissao` varchar(100) DEFAULT NULL,
  `substancia_aquisicao` enum('Sim','Não') NOT NULL,
  `qual_substancia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cad_usuarios`
--

INSERT INTO `cad_usuarios` (`id`, `nome`, `cpf`, `rg`, `endereco`, `nascimento`, `numero`, `primeiro_contato`, `primeiro_contato_tipo`, `segundo_contato`, `segundo_contato_tipo`, `trabalha`, `profissao`, `substancia_aquisicao`, `qual_substancia`) VALUES
(1, 'Joninha Maia das Pimbas', '40423014233', '14248013029', 'Barra Funda, Bom Retiro, Luz, Ponte Pequena', NULL, 'A399', '1199552344', 'Celular', '1155885599', 'Telefone', 'Sim', 'Segurança', 'Sim', 'Maconha'),
(2, 'Luciano Hama LCD', '44433322211', '3911133344', 'Sé, Santa Efigênia, República', NULL, '-B444', '1198774444', 'Celular', '1159995555', 'Telefone', 'Não', 'Pintor', 'Sim', 'Cigarro'),
(3, 'Eduardo Monte Estoico Unido Orivaldo Valdemar Orlando', '33048977769', '38147416500', 'Av, Paulista, Rua Eliana', '2000-06-11', '9999', '1198868886', 'Celular', '1156788886', 'Telefone', 'Sim', 'Mecânico', 'Sim', 'Maconha'),
(4, '', '', '', '', '2010-04-16', '', '', '', '', '', 'Não', '', 'Não', ''),
(5, 'David Marcola Souza', '44438711578', '381111274', 'Av tester, rua tester1, bairro tester2', '2010-04-16', '999', '11111111111', '111111111111', '313', '123123', 'Sim', 'teste', 'Sim', ''),
(6, 'Jefferson Brown Junior', '00000000000', '000000000', 'Teste, teste, do Teste de Teste', '2010-04-30', '', '1199554433', 'Telefone', '', '', 'Não', '', 'Não', ''),
(7, 'Alberto Cabrito Forte', '01010101010', '010101010', 'Rua Metrópolis Cardilac 108', '2010-04-30', '500', '11944433333', 'Telefone', '', 'Celula', 'Sim', '', 'Sim', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `login_funcionario`
--

CREATE TABLE `login_funcionario` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `login_funcionario`
--

INSERT INTO `login_funcionario` (`id`, `login`, `senha`, `created_at`) VALUES
(1, 'Lucas Emidio', '123', '2025-04-11 23:01:34'),
(2, 'Clayton', '123', '2025-04-30 13:38:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_acessos`
--

CREATE TABLE `log_acessos` (
  `id_log` int(11) NOT NULL,
  `data_acesso` date NOT NULL,
  `horario_acesso` time NOT NULL,
  `login` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `log_acessos`
--

INSERT INTO `log_acessos` (`id_log`, `data_acesso`, `horario_acesso`, `login`) VALUES
(65, '2025-04-30', '00:38:15', 'Lucas Emidio'),
(66, '2025-04-30', '00:54:14', 'Lucas Emidio'),
(67, '2025-04-30', '00:57:33', 'Lucas Emidio'),
(68, '2025-04-30', '01:09:05', 'Lucas Emidio'),
(69, '2025-04-30', '01:10:54', 'Lucas Emidio'),
(70, '2025-04-30', '01:17:32', 'Lucas Emidio'),
(71, '2025-04-30', '01:29:11', 'Lucas Emidio'),
(72, '2025-04-30', '01:38:28', 'Lucas Emidio'),
(73, '2025-04-30', '01:39:36', 'Lucas Emidio'),
(74, '2025-04-30', '02:01:33', 'Lucas Emidio'),
(75, '2025-04-30', '02:05:31', 'Lucas Emidio'),
(76, '2025-04-30', '02:05:52', 'Lucas Emidio'),
(77, '2025-04-30', '02:06:06', 'Lucas Emidio'),
(78, '2025-04-30', '02:06:39', 'Lucas Emidio'),
(79, '2025-04-30', '09:57:16', 'Lucas Emidio'),
(80, '2025-04-30', '09:58:38', 'Lucas Emidio'),
(81, '2025-04-30', '10:01:34', 'Lucas Emidio'),
(82, '2025-04-30', '10:04:29', 'Lucas Emidio'),
(83, '2025-04-30', '10:34:54', 'Lucas Emidio'),
(84, '2025-04-30', '10:35:20', 'Lucas Emidio'),
(85, '2025-04-30', '10:38:31', 'Clayton'),
(86, '2025-04-30', '10:39:28', 'Clayton'),
(87, '2025-04-30', '10:39:51', 'Clayton'),
(88, '2025-04-30', '10:40:25', 'Lucas Emidio'),
(89, '2025-04-30', '10:45:40', 'Lucas Emidio'),
(90, '2025-04-30', '10:52:46', 'Lucas Emidio'),
(91, '2025-04-30', '10:58:48', 'Lucas Emidio'),
(92, '2025-04-30', '11:00:09', 'Lucas Emidio'),
(93, '2025-04-30', '11:07:38', 'Lucas Emidio'),
(94, '2025-04-30', '11:34:07', 'Lucas Emidio'),
(95, '2025-04-30', '11:40:04', 'Lucas Emidio'),
(96, '2025-04-30', '11:46:55', 'Lucas Emidio'),
(97, '2025-04-30', '11:47:50', 'Lucas Emidio'),
(98, '2025-04-30', '11:53:32', 'Lucas Emidio'),
(99, '2025-04-30', '11:54:30', 'Lucas Emidio'),
(100, '2025-04-30', '11:55:14', 'Lucas Emidio'),
(101, '2025-04-30', '12:01:37', 'Lucas Emidio'),
(102, '2025-04-30', '12:05:18', 'Lucas Emidio'),
(103, '2025-04-30', '12:07:03', 'Lucas Emidio'),
(104, '2025-04-30', '12:33:15', 'Lucas Emidio'),
(105, '2025-04-30', '12:42:36', 'Lucas Emidio'),
(106, '2025-04-30', '12:42:57', 'Lucas Emidio'),
(107, '2025-04-30', '12:43:12', 'Lucas Emidio'),
(108, '2025-04-30', '12:45:26', 'Lucas Emidio'),
(109, '2025-04-30', '12:50:36', 'Lucas Emidio'),
(110, '2025-04-30', '12:51:30', 'Lucas Emidio'),
(111, '2025-04-30', '12:58:49', 'Lucas Emidio'),
(112, '2025-04-30', '12:59:03', 'Clayton'),
(113, '2025-04-30', '13:04:30', 'Clayton'),
(114, '2025-04-30', '13:05:05', 'Lucas Emidio'),
(115, '2025-04-30', '13:13:04', 'Lucas Emidio'),
(116, '2025-04-30', '13:16:41', 'Lucas Emidio'),
(117, '2025-04-30', '13:17:59', 'Lucas Emidio'),
(118, '2025-04-30', '13:36:18', 'Lucas Emidio'),
(119, '2025-04-30', '13:37:23', 'Lucas Emidio'),
(120, '2025-05-01', '14:43:18', 'Lucas Emidio'),
(121, '2025-05-01', '20:26:06', 'Lucas Emidio'),
(122, '2025-05-01', '20:30:40', 'Lucas Emidio'),
(123, '2025-05-10', '09:15:42', 'Lucas Emidio'),
(124, '2025-05-10', '09:26:21', 'Lucas Emidio'),
(125, '2025-05-10', '09:31:12', 'Lucas Emidio'),
(126, '2025-05-10', '12:07:12', 'Clayton'),
(127, '2025-05-10', '12:14:35', 'Lucas Emidio'),
(128, '2025-05-10', '12:16:36', 'Lucas Emidio'),
(129, '2025-05-10', '12:18:29', 'Lucas Emidio'),
(130, '2025-05-10', '12:19:12', 'Lucas Emidio'),
(131, '2025-05-10', '12:21:25', 'Lucas Emidio'),
(132, '2025-05-10', '12:22:01', 'Lucas Emidio'),
(133, '2025-05-10', '12:25:36', 'Lucas Emidio'),
(134, '2025-05-10', '12:26:06', 'Lucas Emidio'),
(135, '2025-05-10', '12:26:23', 'Lucas Emidio'),
(136, '2025-05-10', '12:27:39', 'Lucas Emidio'),
(137, '2025-05-10', '12:28:17', 'Lucas Emidio'),
(138, '2025-05-10', '12:32:19', 'Lucas Emidio'),
(139, '2025-05-10', '12:33:46', 'Lucas Emidio'),
(140, '2025-05-10', '12:37:32', 'Lucas Emidio'),
(141, '2025-05-10', '12:40:24', 'Lucas Emidio'),
(142, '2025-05-10', '12:47:16', 'Lucas Emidio'),
(143, '2025-05-10', '12:47:47', 'Lucas Emidio'),
(144, '2025-05-10', '12:49:12', 'Lucas Emidio'),
(145, '2025-05-10', '12:49:29', 'Lucas Emidio'),
(146, '2025-05-10', '12:52:29', 'Lucas Emidio'),
(147, '2025-05-10', '12:55:03', 'Lucas Emidio'),
(148, '2025-05-10', '12:59:37', 'Lucas Emidio'),
(149, '2025-05-10', '13:03:47', 'Lucas Emidio'),
(150, '2025-05-10', '13:05:03', 'Lucas Emidio'),
(151, '2025-05-10', '13:05:34', 'Lucas Emidio'),
(152, '2025-05-10', '13:08:13', 'Lucas Emidio'),
(153, '2025-05-10', '13:14:44', 'Lucas Emidio'),
(154, '2025-05-10', '13:51:29', 'Lucas Emidio'),
(155, '2025-05-10', '13:54:54', 'Lucas Emidio'),
(156, '2025-05-10', '13:55:39', 'Lucas Emidio'),
(157, '2025-05-10', '13:58:39', 'Lucas Emidio'),
(158, '2025-05-10', '13:59:53', 'Lucas Emidio'),
(159, '2025-05-10', '14:00:39', 'Lucas Emidio'),
(160, '2025-05-10', '14:01:28', 'Lucas Emidio'),
(161, '2025-05-10', '14:05:21', 'Lucas Emidio'),
(162, '2025-05-10', '14:07:41', 'Lucas Emidio'),
(163, '2025-05-10', '14:09:55', 'Lucas Emidio'),
(164, '2025-05-10', '14:10:26', 'Lucas Emidio'),
(165, '2025-05-10', '14:11:47', 'Lucas Emidio'),
(166, '2025-05-10', '14:12:18', 'Lucas Emidio'),
(167, '2025-05-10', '14:12:41', 'Lucas Emidio'),
(168, '2025-05-10', '14:19:36', 'Lucas Emidio'),
(169, '2025-05-10', '14:20:08', 'Lucas Emidio'),
(170, '2025-05-10', '14:21:57', 'Lucas Emidio'),
(171, '2025-05-10', '14:24:02', 'Lucas Emidio'),
(172, '2025-05-10', '14:26:01', 'Lucas Emidio'),
(173, '2025-05-10', '14:26:24', 'Lucas Emidio'),
(174, '2025-05-10', '14:29:25', 'Lucas Emidio'),
(175, '2025-05-10', '14:31:15', 'Lucas Emidio'),
(176, '2025-05-10', '14:31:43', 'Lucas Emidio'),
(177, '2025-05-10', '14:32:23', 'Lucas Emidio'),
(178, '2025-05-10', '14:33:43', 'Lucas Emidio'),
(179, '2025-05-10', '14:36:33', 'Lucas Emidio'),
(180, '2025-05-10', '14:51:16', 'Lucas Emidio'),
(181, '2025-05-10', '14:51:31', 'Lucas Emidio'),
(182, '2025-05-10', '14:54:18', 'Lucas Emidio'),
(183, '2025-05-10', '14:56:15', 'Lucas Emidio'),
(184, '2025-05-10', '14:56:30', 'Lucas Emidio'),
(185, '2025-05-10', '15:05:57', 'Lucas Emidio'),
(186, '2025-05-10', '15:09:38', 'Lucas Emidio'),
(187, '2025-05-10', '15:10:49', 'Lucas Emidio'),
(188, '2025-05-10', '15:29:54', 'Lucas Emidio'),
(189, '2025-05-10', '15:32:14', 'Lucas Emidio'),
(190, '2025-05-10', '15:37:21', 'Lucas Emidio'),
(191, '2025-05-10', '15:38:31', 'Lucas Emidio'),
(192, '2025-05-10', '15:38:50', 'Lucas Emidio'),
(193, '2025-05-10', '15:55:10', 'Lucas Emidio'),
(194, '2025-05-10', '16:00:51', 'Lucas Emidio'),
(195, '2025-05-10', '16:01:57', 'Lucas Emidio'),
(196, '2025-05-10', '16:02:43', 'Lucas Emidio'),
(197, '2025-05-10', '16:03:48', 'Lucas Emidio'),
(198, '2025-05-10', '16:11:29', 'Lucas Emidio'),
(199, '2025-05-10', '16:15:05', 'Lucas Emidio'),
(200, '2025-05-10', '16:15:49', 'Lucas Emidio'),
(201, '2025-05-10', '16:16:46', 'Lucas Emidio'),
(202, '2025-05-10', '16:17:04', 'Lucas Emidio'),
(203, '2025-05-10', '16:17:23', 'Lucas Emidio'),
(204, '2025-05-10', '16:17:37', 'Lucas Emidio'),
(205, '2025-05-10', '16:18:06', 'Lucas Emidio'),
(206, '2025-05-10', '16:22:42', 'Lucas Emidio'),
(207, '2025-05-10', '16:23:18', 'Lucas Emidio'),
(208, '2025-05-10', '16:23:59', 'Lucas Emidio'),
(209, '2025-05-10', '16:24:19', 'Lucas Emidio'),
(210, '2025-05-10', '16:30:39', 'Lucas Emidio'),
(211, '2025-05-10', '16:34:00', 'Lucas Emidio'),
(212, '2025-05-10', '16:41:16', 'Lucas Emidio'),
(213, '2025-05-10', '16:41:59', 'Lucas Emidio'),
(214, '2025-05-10', '16:44:52', 'Lucas Emidio'),
(215, '2025-05-10', '16:46:24', 'Lucas Emidio'),
(216, '2025-05-10', '16:53:24', 'Lucas Emidio'),
(217, '2025-05-10', '16:54:06', 'Lucas Emidio'),
(218, '2025-05-10', '16:54:44', 'Lucas Emidio'),
(219, '2025-05-10', '16:57:36', 'Lucas Emidio'),
(220, '2025-05-10', '17:00:47', 'Lucas Emidio'),
(221, '2025-05-10', '17:01:06', 'Lucas Emidio'),
(222, '2025-05-10', '17:02:01', 'Lucas Emidio'),
(223, '2025-05-10', '17:03:01', 'Lucas Emidio'),
(224, '2025-05-10', '17:06:06', 'Lucas Emidio'),
(225, '2025-05-10', '17:06:41', 'Lucas Emidio'),
(226, '2025-05-10', '17:15:02', 'Lucas Emidio'),
(227, '2025-05-10', '17:22:45', 'Lucas Emidio'),
(228, '2025-05-10', '17:25:51', 'Lucas Emidio'),
(229, '2025-05-10', '17:30:42', 'Lucas Emidio'),
(230, '2025-05-10', '17:32:25', 'Lucas Emidio'),
(231, '2025-05-10', '17:32:57', 'Lucas Emidio'),
(232, '2025-05-10', '17:35:40', 'Lucas Emidio'),
(233, '2025-05-10', '17:36:18', 'Lucas Emidio'),
(234, '2025-05-10', '17:40:10', 'Lucas Emidio'),
(235, '2025-05-10', '17:43:38', 'Lucas Emidio'),
(236, '2025-05-10', '17:45:17', 'Lucas Emidio'),
(237, '2025-05-10', '17:45:58', 'Lucas Emidio'),
(238, '2025-05-10', '17:48:17', 'Lucas Emidio'),
(239, '2025-05-10', '17:53:41', 'Lucas Emidio'),
(240, '2025-05-10', '17:55:52', 'Lucas Emidio'),
(241, '2025-05-10', '17:56:57', 'Lucas Emidio'),
(242, '2025-05-10', '17:57:42', 'Lucas Emidio'),
(243, '2025-05-10', '17:58:18', 'Lucas Emidio'),
(244, '2025-05-10', '17:58:55', 'Lucas Emidio'),
(245, '2025-05-10', '18:15:18', 'Lucas Emidio'),
(246, '2025-05-10', '18:24:18', 'Lucas Emidio'),
(247, '2025-05-10', '18:26:08', 'Lucas Emidio'),
(248, '2025-05-10', '18:26:35', 'Lucas Emidio'),
(249, '2025-05-10', '18:30:40', 'Lucas Emidio'),
(250, '2025-05-10', '18:31:56', 'Lucas Emidio'),
(251, '2025-05-10', '18:32:47', 'Lucas Emidio'),
(252, '2025-05-10', '18:33:27', 'Lucas Emidio'),
(253, '2025-05-10', '18:34:08', 'Lucas Emidio'),
(254, '2025-05-10', '18:39:05', 'Lucas Emidio'),
(255, '2025-05-10', '18:40:03', 'Lucas Emidio'),
(256, '2025-05-10', '18:40:54', 'Lucas Emidio'),
(257, '2025-05-10', '18:41:37', 'Lucas Emidio'),
(258, '2025-05-10', '18:42:50', 'Lucas Emidio'),
(259, '2025-05-10', '18:43:29', 'Lucas Emidio'),
(260, '2025-05-10', '18:44:18', 'Lucas Emidio'),
(261, '2025-05-10', '18:44:51', 'Lucas Emidio'),
(262, '2025-05-10', '18:45:41', 'Lucas Emidio'),
(263, '2025-05-10', '18:46:16', 'Lucas Emidio'),
(264, '2025-05-10', '18:46:43', 'Lucas Emidio'),
(265, '2025-05-10', '18:47:55', 'Lucas Emidio'),
(266, '2025-05-10', '18:49:07', 'Lucas Emidio'),
(267, '2025-05-10', '18:50:15', 'Lucas Emidio'),
(268, '2025-05-10', '18:51:19', 'Lucas Emidio'),
(269, '2025-05-10', '18:58:14', 'Lucas Emidio'),
(270, '2025-05-10', '18:58:49', 'Lucas Emidio'),
(271, '2025-05-10', '19:01:58', 'Lucas Emidio'),
(272, '2025-05-10', '19:02:54', 'Lucas Emidio'),
(273, '2025-05-10', '19:04:59', 'Lucas Emidio'),
(274, '2025-05-10', '19:06:08', 'Lucas Emidio'),
(275, '2025-05-10', '19:06:39', 'Lucas Emidio'),
(276, '2025-05-10', '19:07:18', 'Lucas Emidio'),
(277, '2025-05-10', '19:08:17', 'Lucas Emidio'),
(278, '2025-05-10', '19:09:03', 'Lucas Emidio'),
(279, '2025-05-10', '19:10:09', 'Lucas Emidio'),
(280, '2025-05-10', '19:11:08', 'Lucas Emidio'),
(281, '2025-05-10', '19:15:35', 'Lucas Emidio'),
(282, '2025-05-10', '19:19:12', 'Lucas Emidio'),
(283, '2025-05-10', '19:21:17', 'Lucas Emidio'),
(284, '2025-05-10', '19:22:11', 'Lucas Emidio'),
(285, '2025-05-10', '19:23:23', 'Lucas Emidio'),
(286, '2025-05-10', '19:24:06', 'Lucas Emidio'),
(287, '2025-05-10', '19:27:09', 'Lucas Emidio'),
(288, '2025-05-10', '19:31:25', 'Lucas Emidio'),
(289, '2025-05-10', '19:36:17', 'Lucas Emidio'),
(290, '2025-05-10', '19:36:44', 'Lucas Emidio'),
(291, '2025-05-10', '19:40:45', 'Lucas Emidio'),
(292, '2025-05-10', '19:43:12', 'Lucas Emidio'),
(293, '2025-05-10', '19:43:41', 'Lucas Emidio'),
(294, '2025-05-10', '19:45:27', 'Lucas Emidio'),
(295, '2025-05-10', '19:51:09', 'Lucas Emidio'),
(296, '2025-05-10', '19:56:44', 'Lucas Emidio'),
(297, '2025-05-10', '19:58:46', 'Lucas Emidio'),
(298, '2025-05-10', '20:01:11', 'Lucas Emidio'),
(299, '2025-05-10', '20:03:21', 'Lucas Emidio'),
(300, '2025-05-10', '20:05:08', 'Lucas Emidio'),
(301, '2025-05-10', '20:07:54', 'Lucas Emidio'),
(302, '2025-05-10', '20:11:28', 'Lucas Emidio'),
(303, '2025-05-10', '20:12:50', 'Lucas Emidio'),
(304, '2025-05-10', '21:39:59', 'Lucas Emidio'),
(305, '2025-05-10', '21:42:22', 'Lucas Emidio'),
(306, '2025-05-10', '21:45:57', 'Lucas Emidio'),
(307, '2025-05-10', '21:48:57', 'Lucas Emidio'),
(308, '2025-05-10', '21:51:51', 'Lucas Emidio'),
(309, '2025-05-10', '21:53:03', 'Lucas Emidio'),
(310, '2025-05-10', '21:54:39', 'Lucas Emidio'),
(311, '2025-05-10', '21:55:41', 'Lucas Emidio'),
(312, '2025-05-10', '21:58:43', 'Lucas Emidio'),
(313, '2025-05-10', '21:59:31', 'Lucas Emidio'),
(314, '2025-05-10', '22:00:52', 'Lucas Emidio'),
(315, '2025-05-10', '22:01:25', 'Lucas Emidio'),
(316, '2025-05-10', '22:03:12', 'Lucas Emidio'),
(317, '2025-05-10', '22:06:10', 'Lucas Emidio'),
(318, '2025-05-10', '22:08:15', 'Lucas Emidio'),
(319, '2025-05-10', '22:08:42', 'Lucas Emidio'),
(320, '2025-05-10', '22:09:09', 'Lucas Emidio'),
(321, '2025-05-10', '22:09:34', 'Lucas Emidio'),
(322, '2025-05-10', '22:10:12', 'Lucas Emidio'),
(323, '2025-05-10', '22:10:48', 'Lucas Emidio'),
(324, '2025-05-10', '22:11:47', 'Lucas Emidio'),
(325, '2025-05-10', '22:12:16', 'Lucas Emidio'),
(326, '2025-05-10', '22:12:40', 'Lucas Emidio'),
(327, '2025-05-10', '22:13:09', 'Lucas Emidio'),
(328, '2025-05-10', '22:13:54', 'Lucas Emidio'),
(329, '2025-05-10', '22:15:50', 'Lucas Emidio'),
(330, '2025-05-10', '22:19:06', 'Lucas Emidio'),
(331, '2025-05-10', '22:20:14', 'Lucas Emidio'),
(332, '2025-05-10', '22:20:59', 'Lucas Emidio'),
(333, '2025-06-11', '16:14:21', 'Lucas Emidio');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_agendamento` (`usuario_id`,`semana`,`horario`),
  ADD KEY `fk_inseriu_funcionario` (`usuario_inseriu_id`),
  ADD KEY `fk_removeu_funcionario` (`usuario_removeu_id`);

--
-- Índices de tabela `agenda_historico_add_rm`
--
ALTER TABLE `agenda_historico_add_rm`
  ADD PRIMARY KEY (`id_historico`),
  ADD KEY `usuario_acao_id` (`usuario_acao_id`),
  ADD KEY `usuario_agendado_id` (`usuario_agendado_id`);

--
-- Índices de tabela `cad_usuarios`
--
ALTER TABLE `cad_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `login_funcionario`
--
ALTER TABLE `login_funcionario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Índices de tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `fk_log_acessos_login_funcionario` (`login`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `agenda_historico_add_rm`
--
ALTER TABLE `agenda_historico_add_rm`
  MODIFY `id_historico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `cad_usuarios`
--
ALTER TABLE `cad_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `login_funcionario`
--
ALTER TABLE `login_funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `cad_usuarios` (`id`),
  ADD CONSTRAINT `fk_inseriu_funcionario` FOREIGN KEY (`usuario_inseriu_id`) REFERENCES `login_funcionario` (`id`),
  ADD CONSTRAINT `fk_removeu_funcionario` FOREIGN KEY (`usuario_removeu_id`) REFERENCES `login_funcionario` (`id`);

--
-- Restrições para tabelas `agenda_historico_add_rm`
--
ALTER TABLE `agenda_historico_add_rm`
  ADD CONSTRAINT `agenda_historico_add_rm_ibfk_1` FOREIGN KEY (`usuario_acao_id`) REFERENCES `login_funcionario` (`id`),
  ADD CONSTRAINT `agenda_historico_add_rm_ibfk_2` FOREIGN KEY (`usuario_agendado_id`) REFERENCES `cad_usuarios` (`id`);

--
-- Restrições para tabelas `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD CONSTRAINT `fk_log_acessos_login_funcionario` FOREIGN KEY (`login`) REFERENCES `login_funcionario` (`login`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
