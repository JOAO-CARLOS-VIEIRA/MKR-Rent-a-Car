-- MySQL Script generated by MySQL Workbench
-- Sun Apr 16 22:06:45 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mkr_locar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mkr_locar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mkr_locar` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `mkr_locar` ;

-- -----------------------------------------------------
-- Table `mkr_locar`.`MARCA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mkr_locar`.`MARCA` (
  `id_mar` INT(5) NOT NULL AUTO_INCREMENT,
  `mc_desc` VARCHAR(150) NOT NULL,
  `mc_ativo` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id_mar`),
  UNIQUE INDEX `mc_desc_UNIQUE` (`mc_desc` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mkr_locar`.`MODELO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mkr_locar`.`MODELO` (
  `id_model` INT(5) NOT NULL AUTO_INCREMENT,
  `md_marca` VARCHAR(5) NOT NULL,
  `md_desc` VARCHAR(150) NOT NULL,
  `md_ativo` VARCHAR(9) NOT NULL,
  `MARCA_id_mar` INT(5) NOT NULL,
  PRIMARY KEY (`id_model`),
  INDEX `fk_MODELO_MARCA1_idx` (`MARCA_id_mar` ASC),
  CONSTRAINT `fk_MODELO_MARCA1`
    FOREIGN KEY (`MARCA_id_mar`)
    REFERENCES `mkr_locar`.`MARCA` (`id_mar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mkr_locar`.`VEICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mkr_locar`.`VEICULO` (
  `id_car` INT(5) NOT NULL,
  `c_desc` VARCHAR(50) NOT NULL,
  `c_mod` VARCHAR(5) NOT NULL,
  `c_ano` VARCHAR(4) NOT NULL,
  `c_cor` VARCHAR(15) NOT NULL,
  `c_obs` VARCHAR(150) NOT NULL,
  `c_apto` VARCHAR(8) NOT NULL,
  `MODELO_id_model` INT(5) NOT NULL,
  PRIMARY KEY (`id_car`),
  INDEX `fk_VEICULO_MODELO1_idx` (`MODELO_id_model` ASC),
  CONSTRAINT `fk_VEICULO_MODELO1`
    FOREIGN KEY (`MODELO_id_model`)
    REFERENCES `mkr_locar`.`MODELO` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mkr_locar`.`LOCACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mkr_locar`.`LOCACAO` (
  `id_loca` INT(5) NOT NULL,
  `l_codveic` VARCHAR(5) NOT NULL,
  `l_codcli` VARCHAR(5) NOT NULL,
  `l_dta_l` VARCHAR(10) NOT NULL,
  `l_dta_devolve` VARCHAR(10) NOT NULL,
  `l_valor_dia` VARCHAR(6) NOT NULL,
  `l_total_dia` VARCHAR(6) NOT NULL,
  `l_obs` VARCHAR(100) NOT NULL,
  `l_devolucao` VARCHAR(1) NOT NULL,
  `CLIENTE_Id_cliente` INT(5) NOT NULL,
  `VEICULO_id_car` INT(5) NOT NULL,
  PRIMARY KEY (`id_loca`, `CLIENTE_Id_cliente`),
  INDEX `fk_LOCACAO_CLIENTE1_idx` (`CLIENTE_Id_cliente` ASC),
  INDEX `fk_LOCACAO_VEICULO1_idx` (`VEICULO_id_car` ASC),
  CONSTRAINT `fk_LOCACAO_CLIENTE1`
    FOREIGN KEY (`CLIENTE_Id_cliente`)
    REFERENCES `mkr_locar`.`CLIENTE` (`Id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LOCACAO_VEICULO1`
    FOREIGN KEY (`VEICULO_id_car`)
    REFERENCES `mkr_locar`.`VEICULO` (`id_car`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mkr_locar`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mkr_locar`.`CLIENTE` (
  `Id_cliente` INT(5) NOT NULL AUTO_INCREMENT,
  `c_senha` VARCHAR(8) NOT NULL,
  `c_cpf` VARCHAR(11) NOT NULL,
  `c_nome` VARCHAR(60) NOT NULL,
  `c_end` VARCHAR(60) NOT NULL,
  `c_bairo` VARCHAR(40) NOT NULL,
  `c_cep` VARCHAR(8) NOT NULL,
  `c_cidade` VARCHAR(40) NOT NULL,
  `c_uf` VARCHAR(2) NOT NULL,
  `c_email` VARCHAR(40) NOT NULL,
  `c_fone_w` VARCHAR(11) NOT NULL,
  `LOCA_id_loca` INT(5) NOT NULL,
  PRIMARY KEY (`Id_cliente`),
  UNIQUE INDEX `c_cpf_UNIQUE` (`c_cpf` ASC),
  UNIQUE INDEX `C_email_UNIQUE` (`c_email` ASC),
  INDEX `fk_CLIENTE_LOCA_idx` (`LOCA_id_loca` ASC),
  CONSTRAINT `fk_CLIENTE_LOCA`
    FOREIGN KEY (`LOCA_id_loca`)
    REFERENCES `mkr_locar`.`LOCACAO` (`id_loca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
