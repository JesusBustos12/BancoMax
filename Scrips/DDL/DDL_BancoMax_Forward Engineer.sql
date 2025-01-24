-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bancomax
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bancomax
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bancomax` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bancomax` ;

-- -----------------------------------------------------
-- Table `bancomax`.`bancomax`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`bancomax` (
  `id` INT NOT NULL,
  `nombreBanco` VARCHAR(25) NOT NULL,
  `servicios` VARCHAR(50) NULL DEFAULT NULL,
  `diasServicio` VARCHAR(30) NULL DEFAULT NULL,
  `plasaPrincipal` VARCHAR(50) NULL DEFAULT NULL,
  `numEmpleadosTotales` INT NOT NULL,
  `numContacto` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`juntadirectiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`juntadirectiva` (
  `id` INT NOT NULL,
  `bancoMax_id` INT NOT NULL,
  `totalDeIntegrantes` INT NOT NULL,
  `totalDeReuniones` INT NOT NULL,
  `LugarDeJunta` VARCHAR(25) NOT NULL,
  `fechaDeJunta` TIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_BancoMax_JuntaDirectiva` (`bancoMax_id` ASC) VISIBLE,
  CONSTRAINT `fk_BancoMax_JuntaDirectiva`
    FOREIGN KEY (`bancoMax_id`)
    REFERENCES `bancomax`.`bancomax` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`nombresintegrantesjuntadirectiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`nombresintegrantesjuntadirectiva` (
  `id` INT NOT NULL,
  `JuntaDirectiva_Id` INT NOT NULL,
  `nombreCompleto` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_JuntaDirectiva_nombresIntegrantesJuntaDirectiva` (`JuntaDirectiva_Id` ASC) VISIBLE,
  CONSTRAINT `fk_JuntaDirectiva_nombresIntegrantesJuntaDirectiva`
    FOREIGN KEY (`JuntaDirectiva_Id`)
    REFERENCES `bancomax`.`juntadirectiva` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`fundador1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`fundador1` (
  `id` INT NOT NULL,
  `juntaDirectiva_id` INT NOT NULL,
  `nombreCompleto` VARCHAR(50) NOT NULL,
  `sexo` VARCHAR(20) NOT NULL,
  `edad` INT NOT NULL,
  `nivelDeEducacion` VARCHAR(60) NULL DEFAULT NULL,
  `cargoJuntaDirectiva` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nombresIntegrantesJuntaDirectiva_Fundador1` (`juntaDirectiva_id` ASC) VISIBLE,
  CONSTRAINT `fk_nombresIntegrantesJuntaDirectiva_Fundador1`
    FOREIGN KEY (`juntaDirectiva_id`)
    REFERENCES `bancomax`.`nombresintegrantesjuntadirectiva` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`ceo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`ceo` (
  `id` INT NOT NULL,
  `fundador1_id` INT NOT NULL,
  `responsabilidades` VARCHAR(100) NOT NULL,
  `departamentosAcargo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Fundador1_CEO` (`fundador1_id` ASC) VISIBLE,
  CONSTRAINT `fk_Fundador1_CEO`
    FOREIGN KEY (`fundador1_id`)
    REFERENCES `bancomax`.`fundador1` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`cfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`cfo` (
  `id` INT NOT NULL,
  `nombreCompleto` VARCHAR(50) NOT NULL,
  `sexo` VARCHAR(20) NOT NULL,
  `edad` INT NOT NULL,
  `nivelDeEducacion` VARCHAR(60) NULL DEFAULT NULL,
  `responsabilidades` VARCHAR(100) NOT NULL,
  `departamentosAcargo` VARCHAR(100) NOT NULL,
  `ceo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cfo_ceo1_idx` (`ceo_id` ASC) VISIBLE,
  CONSTRAINT `fk_cfo_ceo1`
    FOREIGN KEY (`ceo_id`)
    REFERENCES `bancomax`.`ceo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`chro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`chro` (
  `id` INT NOT NULL,
  `nombreCompleto` VARCHAR(50) NOT NULL,
  `sexo` VARCHAR(20) NOT NULL,
  `edad` INT NOT NULL,
  `nivelDeEducacion` VARCHAR(60) NULL DEFAULT NULL,
  `responsabilidades` VARCHAR(100) NOT NULL,
  `departamentosAcargo` VARCHAR(100) NOT NULL,
  `ceo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chro_ceo1_idx` (`ceo_id` ASC) VISIBLE,
  CONSTRAINT `fk_chro_ceo1`
    FOREIGN KEY (`ceo_id`)
    REFERENCES `bancomax`.`ceo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`departamentogeneral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`departamentogeneral` (
  `id` INT NOT NULL,
  `Responsabilidades` VARCHAR(100) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `nombreCompletoEmpleados` VARCHAR(50) NOT NULL,
  `ceo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departamentogeneral_ceo1_idx` (`ceo_id` ASC) VISIBLE,
  CONSTRAINT `fk_departamentogeneral_ceo1`
    FOREIGN KEY (`ceo_id`)
    REFERENCES `bancomax`.`ceo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`lugardondeopera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`lugardondeopera` (
  `id` INT NOT NULL,
  `Pais` VARCHAR(10) NOT NULL,
  `departamentogeneral_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lugardondeopera_departamentogeneral1_idx` (`departamentogeneral_id` ASC) VISIBLE,
  CONSTRAINT `fk_lugardondeopera_departamentogeneral1`
    FOREIGN KEY (`departamentogeneral_id`)
    REFERENCES `bancomax`.`departamentogeneral` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`ciudaddemexico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`ciudaddemexico` (
  `id` INT NOT NULL,
  `num_Sucursales` INT NOT NULL,
  `lugardondeopera_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ciudaddemexico_lugardondeopera1_idx` (`lugardondeopera_id` ASC) VISIBLE,
  CONSTRAINT `fk_ciudaddemexico_lugardondeopera1`
    FOREIGN KEY (`lugardondeopera_id`)
    REFERENCES `bancomax`.`lugardondeopera` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`cmo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`cmo` (
  `id` INT NOT NULL,
  `nombreCompleto` VARCHAR(50) NOT NULL,
  `sexo` VARCHAR(20) NOT NULL,
  `edad` INT NOT NULL,
  `nivelDeEducacion` VARCHAR(60) NULL DEFAULT NULL,
  `responsabilidades` VARCHAR(100) NOT NULL,
  `departamentosAcargo` VARCHAR(100) NOT NULL,
  `ceo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cmo_ceo1_idx` (`ceo_id` ASC) VISIBLE,
  CONSTRAINT `fk_cmo_ceo1`
    FOREIGN KEY (`ceo_id`)
    REFERENCES `bancomax`.`ceo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`fundador2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`fundador2` (
  `id` INT NOT NULL,
  `juntaDirectiva_id` INT NOT NULL,
  `nombreCompleto` VARCHAR(50) NOT NULL,
  `sexo` VARCHAR(20) NOT NULL,
  `edad` INT NOT NULL,
  `nivelDeEducacion` VARCHAR(60) NULL DEFAULT NULL,
  `cargoJuntaDirectiva` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nombresIntegrantesJuntaDirectiva_Fundador2` (`juntaDirectiva_id` ASC) VISIBLE,
  CONSTRAINT `fk_nombresIntegrantesJuntaDirectiva_Fundador2`
    FOREIGN KEY (`juntaDirectiva_id`)
    REFERENCES `bancomax`.`nombresintegrantesjuntadirectiva` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`coo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`coo` (
  `id` INT NOT NULL,
  `fundador2_id` INT NOT NULL,
  `responsabilidades` VARCHAR(100) NOT NULL,
  `departamentosAcargo` VARCHAR(100) NOT NULL,
  `ceo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Fundador2_COO_idx` (`fundador2_id` ASC) VISIBLE,
  INDEX `fk_coo_ceo1_idx` (`ceo_id` ASC) VISIBLE,
  CONSTRAINT `fk_coo_ceo1`
    FOREIGN KEY (`ceo_id`)
    REFERENCES `bancomax`.`ceo` (`id`),
  CONSTRAINT `fk_Fundador2_COO`
    FOREIGN KEY (`fundador2_id`)
    REFERENCES `bancomax`.`fundador2` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`cto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`cto` (
  `id` INT NOT NULL,
  `nombreCompleto` VARCHAR(50) NOT NULL,
  `sexo` VARCHAR(20) NOT NULL,
  `edad` INT NOT NULL,
  `nivelDeEducacion` VARCHAR(60) NULL DEFAULT NULL,
  `responsabilidades` VARCHAR(100) NOT NULL,
  `departamentosAcargo` VARCHAR(100) NOT NULL,
  `ceo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cto_ceo1_idx` (`ceo_id` ASC) VISIBLE,
  CONSTRAINT `fk_cto_ceo1`
    FOREIGN KEY (`ceo_id`)
    REFERENCES `bancomax`.`ceo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`departamentocontabilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`departamentocontabilidad` (
  `id` INT NOT NULL,
  `Responsabilidades` VARCHAR(100) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `nombreCompletoEmpleados` VARCHAR(50) NOT NULL,
  `cfo_id` INT NOT NULL,
  `departamentogeneral_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departamentocontabilidad_cfo1_idx` (`cfo_id` ASC) VISIBLE,
  INDEX `fk_departamentocontabilidad_departamentogeneral1_idx` (`departamentogeneral_id` ASC) VISIBLE,
  CONSTRAINT `fk_departamentocontabilidad_cfo1`
    FOREIGN KEY (`cfo_id`)
    REFERENCES `bancomax`.`cfo` (`id`),
  CONSTRAINT `fk_departamentocontabilidad_departamentogeneral1`
    FOREIGN KEY (`departamentogeneral_id`)
    REFERENCES `bancomax`.`departamentogeneral` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`departamentomarketing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`departamentomarketing` (
  `id` INT NOT NULL,
  `Responsabilidades` VARCHAR(100) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `nombreCompletoEmpleados` VARCHAR(50) NOT NULL,
  `cmo_id` INT NOT NULL,
  `departamentogeneral_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departamentomarketing_cmo1_idx` (`cmo_id` ASC) VISIBLE,
  INDEX `fk_departamentomarketing_departamentogeneral1_idx` (`departamentogeneral_id` ASC) VISIBLE,
  CONSTRAINT `fk_departamentomarketing_cmo1`
    FOREIGN KEY (`cmo_id`)
    REFERENCES `bancomax`.`cmo` (`id`),
  CONSTRAINT `fk_departamentomarketing_departamentogeneral1`
    FOREIGN KEY (`departamentogeneral_id`)
    REFERENCES `bancomax`.`departamentogeneral` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`departamentooperacionesbancarias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`departamentooperacionesbancarias` (
  `id` INT NOT NULL,
  `Responsabilidades` VARCHAR(100) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `nombreCompletoEmpleados` VARCHAR(50) NOT NULL,
  `coo_id` INT NOT NULL,
  `departamentogeneral_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departamentooperacionesbancarias_coo1_idx` (`coo_id` ASC) VISIBLE,
  INDEX `fk_departamentooperacionesbancarias_departamentogeneral1_idx` (`departamentogeneral_id` ASC) VISIBLE,
  CONSTRAINT `fk_departamentooperacionesbancarias_coo1`
    FOREIGN KEY (`coo_id`)
    REFERENCES `bancomax`.`coo` (`id`),
  CONSTRAINT `fk_departamentooperacionesbancarias_departamentogeneral1`
    FOREIGN KEY (`departamentogeneral_id`)
    REFERENCES `bancomax`.`departamentogeneral` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`departamentorecursoshumanos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`departamentorecursoshumanos` (
  `id` INT NOT NULL,
  `Responsabilidades` VARCHAR(100) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `nombreCompletoEmpleados` VARCHAR(50) NOT NULL,
  `chro_id` INT NOT NULL,
  `departamentogeneral_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departamentorecursoshumanos_chro1_idx` (`chro_id` ASC) VISIBLE,
  INDEX `fk_departamentorecursoshumanos_departamentogeneral1_idx` (`departamentogeneral_id` ASC) VISIBLE,
  CONSTRAINT `fk_departamentorecursoshumanos_chro1`
    FOREIGN KEY (`chro_id`)
    REFERENCES `bancomax`.`chro` (`id`),
  CONSTRAINT `fk_departamentorecursoshumanos_departamentogeneral1`
    FOREIGN KEY (`departamentogeneral_id`)
    REFERENCES `bancomax`.`departamentogeneral` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`departamentoseguridadinformatica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`departamentoseguridadinformatica` (
  `id` INT NOT NULL,
  `Responsabilidades` VARCHAR(100) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `nombreCompletoEmpleados` VARCHAR(50) NOT NULL,
  `cto_id` INT NOT NULL,
  `departamentogeneral_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departamentoseguridadinformatica_cto1_idx` (`cto_id` ASC) VISIBLE,
  INDEX `fk_departamentoseguridadinformatica_departamentogeneral1_idx` (`departamentogeneral_id` ASC) VISIBLE,
  CONSTRAINT `fk_departamentoseguridadinformatica_cto1`
    FOREIGN KEY (`cto_id`)
    REFERENCES `bancomax`.`cto` (`id`),
  CONSTRAINT `fk_departamentoseguridadinformatica_departamentogeneral1`
    FOREIGN KEY (`departamentogeneral_id`)
    REFERENCES `bancomax`.`departamentogeneral` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`toluca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`toluca` (
  `id` INT NOT NULL,
  `num_Sucursales` INT NOT NULL,
  `lugardondeopera_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_toluca_lugardondeopera1_idx` (`lugardondeopera_id` ASC) VISIBLE,
  CONSTRAINT `fk_toluca_lugardondeopera1`
    FOREIGN KEY (`lugardondeopera_id`)
    REFERENCES `bancomax`.`lugardondeopera` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursalcacalomacán`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursalcacalomacán` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `toluca_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalCacalomacán_toluca1_idx` (`toluca_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalCacalomacán_toluca1`
    FOREIGN KEY (`toluca_id`)
    REFERENCES `bancomax`.`toluca` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursalcentrohistórico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursalcentrohistórico` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `toluca_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalCentroHistórico_toluca1_idx` (`toluca_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalCentroHistórico_toluca1`
    FOREIGN KEY (`toluca_id`)
    REFERENCES `bancomax`.`toluca` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursalcondesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursalcondesa` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `ciudaddemexico_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalCondesa_ciudaddemexico1_idx` (`ciudaddemexico_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalCondesa_ciudaddemexico1`
    FOREIGN KEY (`ciudaddemexico_id`)
    REFERENCES `bancomax`.`ciudaddemexico` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursalcoyoacán`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursalcoyoacán` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `ciudaddemexico_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalCoyoacán_ciudaddemexico1_idx` (`ciudaddemexico_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalCoyoacán_ciudaddemexico1`
    FOREIGN KEY (`ciudaddemexico_id`)
    REFERENCES `bancomax`.`ciudaddemexico` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursalindustrial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursalindustrial` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `toluca_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalIndustrial_toluca1_idx` (`toluca_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalIndustrial_toluca1`
    FOREIGN KEY (`toluca_id`)
    REFERENCES `bancomax`.`toluca` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursalpolanco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursalpolanco` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `ciudaddemexico_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalPolanco_ciudaddemexico1_idx` (`ciudaddemexico_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalPolanco_ciudaddemexico1`
    FOREIGN KEY (`ciudaddemexico_id`)
    REFERENCES `bancomax`.`ciudaddemexico` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursalreforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursalreforma` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `toluca_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalReforma_toluca1_idx` (`toluca_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalReforma_toluca1`
    FOREIGN KEY (`toluca_id`)
    REFERENCES `bancomax`.`toluca` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursalromanorte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursalromanorte` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `ciudaddemexico_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalRomaNorte_ciudaddemexico1_idx` (`ciudaddemexico_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalRomaNorte_ciudaddemexico1`
    FOREIGN KEY (`ciudaddemexico_id`)
    REFERENCES `bancomax`.`ciudaddemexico` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursalsantafe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursalsantafe` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `ciudaddemexico_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalSantaFe_ciudaddemexico1_idx` (`ciudaddemexico_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalSantaFe_ciudaddemexico1`
    FOREIGN KEY (`ciudaddemexico_id`)
    REFERENCES `bancomax`.`ciudaddemexico` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`sucursaluniversidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`sucursaluniversidad` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `horasServicio` TIME NOT NULL,
  `nombreEmpleados` VARCHAR(100) NOT NULL,
  `cargoEmpleados` VARCHAR(50) NOT NULL,
  `numEmpleados` INT NOT NULL,
  `toluca_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SucursalUniversidad_toluca1_idx` (`toluca_id` ASC) VISIBLE,
  CONSTRAINT `fk_SucursalUniversidad_toluca1`
    FOREIGN KEY (`toluca_id`)
    REFERENCES `bancomax`.`toluca` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancomax`.`Inversionistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancomax`.`Inversionistas` (
  `id` INT NOT NULL,
  `nombreCompletoInversionistas` VARCHAR(50) NOT NULL,
  `Sexo` VARCHAR(20) NOT NULL,
  `edad` INT NOT NULL,
  `juntadirectiva_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Inversionistas_juntadirectiva1_idx` (`juntadirectiva_id` ASC) VISIBLE,
  CONSTRAINT `fk_Inversionistas_juntadirectiva1`
    FOREIGN KEY (`juntadirectiva_id`)
    REFERENCES `bancomax`.`juntadirectiva` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
