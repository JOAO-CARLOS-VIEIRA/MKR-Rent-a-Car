create database mkr_locar;

use mkr_locar;

CREATE TABLE `cliente` (
  `id_cliente` int(5) NOT NULL,
  `c_senha` varchar(8) NOT NULL,
  `c_cpf` varchar(11) NOT NULL,
  `c_nome` varchar(60) NOT NULL,
  `c_end` varchar(60) NOT NULL,
  `c_bairro` varchar(40) NOT NULL,
  `c_cep` varchar(8) NOT NULL,
  `c_cidade` varchar(40) NOT NULL,
  `c_uf` varchar(2) NOT NULL,
  `c_email` varchar(40) NOT NULL,
  `c_fone_w` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `c_cpf` (`c_cpf`),
  ADD UNIQUE KEY `c_email` (`c_email`);

CREATE TABLE `loca` (
  `id_loca` int(5) NOT NULL,
  `l_codveic` varchar(5) NOT NULL,
  `l_codcli` varchar(5) NOT NULL,
  `l_dta_l` varchar(10) NOT NULL,
  `l_dta_devolve` varchar(10) NOT NULL,
  `l_valor_dia` varchar(6) NOT NULL,
  `l_total_diaria` varchar(6) NOT NULL,
  `l_obs` varchar(100) NOT NULL,
  `l_devolucao` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `loca`
  ADD PRIMARY KEY (`id_loca`);

CREATE TABLE `veiculo` (
  `id_car` int(5) NOT NULL,
  `c_desc` varchar(50) NOT NULL,
  `c_mod` varchar(5) NOT NULL,
  `c_ano` varchar(4) NOT NULL,
  `c_cor` varchar(15) NOT NULL,
  `c_obs` varchar(150) NOT NULL,
  `c_apto` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id_car`);

CREATE TABLE `modelo` (
  `id_model` int(5) NOT NULL,
  `md_marca` varchar(5) NOT NULL,
  `md_desc` varchar(150) NOT NULL,
  `md_ativo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_model`);

CREATE TABLE `marca` (
  `id_mar` int(5) NOT NULL,
  `mc_desc` varchar(150) NOT NULL,
  `mc_ativo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_mar`),
  ADD UNIQUE KEY `mc_desc` (`mc_desc`);