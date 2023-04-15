create database MkRVeiculos;

use MKRVeiculos;

CREATE TABLE `cliente` (
  `id` int(5) NOT NULL,
  `cli_senha` varchar(8) NOT NULL,
  `cli_cpf` varchar(11) NOT NULL,
  `cli_nome` varchar(60) NOT NULL,
  `cli_end` varchar(60) NOT NULL,
  `cli_bairro` varchar(40) NOT NULL,
  `cli_cep` varchar(8) NOT NULL,
  `cli_cidade` varchar(40) NOT NULL,
  `cli_uf` varchar(2) NOT NULL,
  `cli_email` varchar(40) NOT NULL,
  `cli_fone_w` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cli_cpf` (`cli_cpf`),
  ADD UNIQUE KEY `cli_email` (`cli_email`);

CREATE TABLE `locar` (
  `loc_id` int(5) NOT NULL,
  `loc_codveic` varchar(5) NOT NULL,
  `loc_codcli` varchar(5) NOT NULL,
  `loc_dta_loc` varchar(10) NOT NULL,
  `loc_dta_devolve` varchar(10) NOT NULL,
  `loc_valor_dia` varchar(6) NOT NULL,
  `loc_total_diaria` varchar(6) NOT NULL,
  `loc_obs` varchar(100) NOT NULL,
  `loc_devolucao` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `locar`
  ADD PRIMARY KEY (`loc_id`);

CREATE TABLE `veiculo` (
  `car_id` int(5) NOT NULL,
  `car_desc` varchar(50) NOT NULL,
  `car_mod` varchar(5) NOT NULL,
  `car_ano` varchar(4) NOT NULL,
  `car_cor` varchar(15) NOT NULL,
  `car_obs` varchar(150) NOT NULL,
  `car_apto` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`car_id`);

CREATE TABLE `modelo` (
  `mod_id` int(5) NOT NULL,
  `mod_marca` varchar(5) NOT NULL,
  `mod_desc` varchar(150) NOT NULL,
  `mod_ativo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `modelo`
  ADD PRIMARY KEY (`mod_id`);

CREATE TABLE `marca` (
  `mar_id` int(5) NOT NULL,
  `mar_desc` varchar(150) NOT NULL,
  `mar_ativo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `marca`
  ADD PRIMARY KEY (`mar_id`),
  ADD UNIQUE KEY `mar_desc` (`mar_desc`);