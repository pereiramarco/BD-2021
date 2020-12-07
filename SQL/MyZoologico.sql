-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BD_Zoologico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BD_Zoologico
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BD_Zoologico` ;
CREATE SCHEMA IF NOT EXISTS `BD_Zoologico` ;
-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------
USE `BD_Zoologico` ;

-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Padrinho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Padrinho` (
  `idPadrinho` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `nib` VARCHAR(39) NOT NULL,
  `cartao_cidadao` VARCHAR(14) NOT NULL,
  `nif` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idPadrinho`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Zona` (
  `idZona` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idZona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Recinto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Recinto` (
  `ID` INT NOT NULL,
  `coord_y` INT NOT NULL,
  `coord_x` INT NOT NULL,
  `area` FLOAT NOT NULL,
  `bioma` VARCHAR(100) NOT NULL,
  `Zona_idZona` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Recinto_Zona1_idx` (`Zona_idZona` ASC) VISIBLE,
  CONSTRAINT `fk_Recinto_Zona1`
    FOREIGN KEY (`Zona_idZona`)
    REFERENCES `BD_Zoologico`.`Zona` (`idZona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
ROW_FORMAT = Default;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Especie` (
  `idEspecie` INT NOT NULL,
  `nome_comum` VARCHAR(45) NOT NULL,
  `nome_cientifico` VARCHAR(45) NOT NULL,
  `valor_de_apadrinhamento` INT NOT NULL,
  PRIMARY KEY (`idEspecie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Animal` (
  `idAnimal` INT NOT NULL,
  `genero` VARCHAR(9) NOT NULL,
  `nome` VARCHAR(100) NULL,
  `data_nascimento` DATE NOT NULL,
  `altura` DECIMAL(3,2) NOT NULL,
  `comprimento` DECIMAL(3,2) NOT NULL,
  `peso` DECIMAL(7,3) NOT NULL,
  `vivo` TINYINT NOT NULL,
  `Padrinho_idPadrinho` INT NULL,
  `Recinto_ID` INT NULL,
  `Especie_idEspecie` INT NOT NULL,
  PRIMARY KEY (`idAnimal`),
  INDEX `fk_Animal_Padrinho1_idx` (`Padrinho_idPadrinho` ASC) VISIBLE,
  INDEX `fk_Animal_Recinto1_idx` (`Recinto_ID` ASC) VISIBLE,
  INDEX `fk_Animal_Especie1_idx` (`Especie_idEspecie` ASC) VISIBLE,
  CONSTRAINT `fk_Animal_Padrinho1`
    FOREIGN KEY (`Padrinho_idPadrinho`)
    REFERENCES `BD_Zoologico`.`Padrinho` (`idPadrinho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animal_Recinto1`
    FOREIGN KEY (`Recinto_ID`)
    REFERENCES `BD_Zoologico`.`Recinto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animal_Especie1`
    FOREIGN KEY (`Especie_idEspecie`)
    REFERENCES `BD_Zoologico`.`Especie` (`idEspecie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Tipo` (
  `idTipo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Bilhete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Bilhete` (
  `idBilhete` INT NOT NULL,
  `momento_aquisicao` DATETIME NOT NULL,
  `Tipo_idTipo` INT NOT NULL,
  PRIMARY KEY (`idBilhete`),
  INDEX `fk_Bilhete_Tipo1_idx` (`Tipo_idTipo` ASC) VISIBLE,
  CONSTRAINT `fk_Bilhete_Tipo1`
    FOREIGN KEY (`Tipo_idTipo`)
    REFERENCES `BD_Zoologico`.`Tipo` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Vacina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Vacina` (
  `idVacina` INT NOT NULL,
  `doenca` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idVacina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Veterinario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Veterinario` (
  `idVeterinario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVeterinario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Animal_has_Vacina_has_Veterinario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Animal_has_Vacina_has_Veterinario` (
  `Animal_idAnimal` INT NOT NULL,
  `Vacina_idVacina` INT NOT NULL,
  `Veterinario_idVeterinario` INT NOT NULL,
  `data_administracao` DATE NOT NULL,
  INDEX `fk_Animal_has_Vacina_Vacina1_idx` (`Vacina_idVacina` ASC) VISIBLE,
  INDEX `fk_Animal_has_Vacina_Animal1_idx` (`Animal_idAnimal` ASC) VISIBLE,
  INDEX `fk_Animal_has_Vacina_has_Veterinario_Veterinario1_idx` (`Veterinario_idVeterinario` ASC) VISIBLE,
  PRIMARY KEY (`Animal_idAnimal`, `Vacina_idVacina`, `Veterinario_idVeterinario`, `data_administracao`),
  CONSTRAINT `fk_Animal_has_Vacina_Animal1`
    FOREIGN KEY (`Animal_idAnimal`)
    REFERENCES `BD_Zoologico`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animal_has_Vacina_Vacina1`
    FOREIGN KEY (`Vacina_idVacina`)
    REFERENCES `BD_Zoologico`.`Vacina` (`idVacina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animal_has_Vacina_has_Veterinario_Veterinario1`
    FOREIGN KEY (`Veterinario_idVeterinario`)
    REFERENCES `BD_Zoologico`.`Veterinario` (`idVeterinario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Tipo_has_Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Tipo_has_Zona` (
  `Zona_idZona` INT NOT NULL,
  `Tipo_idTipo` INT NOT NULL,
  INDEX `fk_Tipo_has_Zona_Zona1_idx` (`Zona_idZona` ASC) VISIBLE,
  INDEX `fk_Tipo_has_Zona_Tipo1_idx` (`Tipo_idTipo` ASC) VISIBLE,
  PRIMARY KEY (`Zona_idZona`, `Tipo_idTipo`),
  CONSTRAINT `fk_Tipo_has_Zona_Tipo1`
    FOREIGN KEY (`Tipo_idTipo`)
    REFERENCES `BD_Zoologico`.`Tipo` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tipo_has_Zona_Zona1`
    FOREIGN KEY (`Zona_idZona`)
    REFERENCES `BD_Zoologico`.`Zona` (`idZona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Contacto_Padrinho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Contacto_Padrinho` (
  `Padrinho_idPadrinho` INT NOT NULL,
  `contacto` VARCHAR(50) NOT NULL,
  INDEX `fk_Contacto_Padrinho1_idx` (`Padrinho_idPadrinho` ASC) VISIBLE,
  PRIMARY KEY (`Padrinho_idPadrinho`, `contacto`),
  CONSTRAINT `fk_Contacto_Padrinho1`
    FOREIGN KEY (`Padrinho_idPadrinho`)
    REFERENCES `BD_Zoologico`.`Padrinho` (`idPadrinho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Especie_has_Vacina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Especie_has_Vacina` (
  `Especie_idEspecie` INT NOT NULL,
  `Vacina_idVacina` INT NOT NULL,
  `limite_temporal` INT NOT NULL,
  `intervalo_temporal` INT NULL,
  `doses_necessarias` INT NOT NULL,
  `dosagem` INT NOT NULL,
  INDEX `fk_Especie_has_Vacina_Vacina1_idx` (`Vacina_idVacina` ASC) VISIBLE,
  INDEX `fk_Especie_has_Vacina_Especie1_idx` (`Especie_idEspecie` ASC) VISIBLE,
  PRIMARY KEY (`Especie_idEspecie`, `Vacina_idVacina`),
  CONSTRAINT `fk_Especie_has_Vacina_Especie1`
    FOREIGN KEY (`Especie_idEspecie`)
    REFERENCES `BD_Zoologico`.`Especie` (`idEspecie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Especie_has_Vacina_Vacina1`
    FOREIGN KEY (`Vacina_idVacina`)
    REFERENCES `BD_Zoologico`.`Vacina` (`idVacina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Animal_has_Animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Animal_has_Animal` (
  `Animal_idAnimalProgenitor` INT NOT NULL,
  `Animal_idAnimalFilho` INT NOT NULL,
  INDEX `fk_Animal_has_Animal_Animal2_idx` (`Animal_idAnimalFilho` ASC) VISIBLE,
  INDEX `fk_Animal_has_Animal_Animal1_idx` (`Animal_idAnimalProgenitor` ASC) VISIBLE,
  PRIMARY KEY (`Animal_idAnimalProgenitor`, `Animal_idAnimalFilho`),
  CONSTRAINT `fk_Animal_has_Animal_Animal1`
    FOREIGN KEY (`Animal_idAnimalProgenitor`)
    REFERENCES `BD_Zoologico`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animal_has_Animal_Animal2`
    FOREIGN KEY (`Animal_idAnimalFilho`)
    REFERENCES `BD_Zoologico`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Contacto_Veterinario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Zoologico`.`Contacto_Veterinario` (
  `Veterinario_idVeterinario` INT NOT NULL,
  `contacto` VARCHAR(50) NOT NULL,
  INDEX `fk_Contacto_Padrinho_copy1_Veterinario1_idx` (`Veterinario_idVeterinario` ASC) VISIBLE,
  PRIMARY KEY (`Veterinario_idVeterinario`, `contacto`),
  CONSTRAINT `fk_Contacto_Padrinho_copy1_Veterinario1`
    FOREIGN KEY (`Veterinario_idVeterinario`)
    REFERENCES `BD_Zoologico`.`Veterinario` (`idVeterinario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
