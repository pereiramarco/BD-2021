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
DROP SCHEMA BD_Zoologico;
CREATE SCHEMA BD_Zoologico;
USE BD_Zoologico;

-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Contacto`
-- -----------------------------------------------------
CREATE TABLE Contacto (
  `idContacto` INT NOT NULL,
  `contacto` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idContacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Padrinho`
-- -----------------------------------------------------
CREATE TABLE Padrinho (
  `idPadrinho` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `nib` VARCHAR(45) NOT NULL,
  `morada` VARCHAR(45) NOT NULL,
  `cartao_cidadao` VARCHAR(15) NOT NULL,
  `nif` VARCHAR(15) NOT NULL,
  `Contacto_idContacto` INT NOT NULL,
  PRIMARY KEY (`idPadrinho`),
  INDEX `fk_Padrinho_Contacto1_idx` (`Contacto_idContacto` ASC) VISIBLE,
  CONSTRAINT `fk_Padrinho_Contacto1`
    FOREIGN KEY (`Contacto_idContacto`)
    REFERENCES `BD_Zoologico`.`Contacto` (`idContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Animal`
-- -----------------------------------------------------
CREATE TABLE Animal (
  `idAnimal` INT NOT NULL,
  `genero` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(100) NULL,
  `data_nascimento` DATE NOT NULL,
  `altura` DECIMAL(3,2) NOT NULL,
  `comprimento` DECIMAL(3,2) NOT NULL,
  `peso` DECIMAL(7,2) NOT NULL,
  `vivo` TINYINT NOT NULL,
  `Animal_idAnimal` INT NULL,
  `Padrinho_idPadrinho` INT NULL,
  PRIMARY KEY (`idAnimal`),
  INDEX `fk_Animal_Animal1_idx` (`Animal_idAnimal` ASC) VISIBLE,
  INDEX `fk_Animal_Padrinho1_idx` (`Padrinho_idPadrinho` ASC) VISIBLE,
  CONSTRAINT `fk_Animal_Animal1`
    FOREIGN KEY (`Animal_idAnimal`)
    REFERENCES `BD_Zoologico`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animal_Padrinho1`
    FOREIGN KEY (`Padrinho_idPadrinho`)
    REFERENCES `BD_Zoologico`.`Padrinho` (`idPadrinho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE Tipo (
  `idTipo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Bilhete`
-- -----------------------------------------------------
CREATE TABLE Bilhete (
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
-- Table `BD_Zoologico`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE Cliente (
  `idCliente` INT NOT NULL,
  `idade` INT UNSIGNED NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `Bilhete_idBilhete` INT NOT NULL,
  `cartao_cidadao` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Bilhete1_idx` (`Bilhete_idBilhete` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Bilhete1`
    FOREIGN KEY (`Bilhete_idBilhete`)
    REFERENCES `BD_Zoologico`.`Bilhete` (`idBilhete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Recinto`
-- -----------------------------------------------------
CREATE TABLE Recinto (
  `ID` INT NOT NULL,
  `coord_y` INT NOT NULL,
  `coord_x` INT NOT NULL,
  `area` FLOAT NOT NULL,
  `bioma` VARCHAR(100) NOT NULL,
  `Animal_idAnimal` INT NOT NULL,
  INDEX `fk_Recinto_Animal1_idx` (`Animal_idAnimal` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Recinto_Animal1`
    FOREIGN KEY (`Animal_idAnimal`)
    REFERENCES `BD_Zoologico`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Vacina`
-- -----------------------------------------------------
CREATE TABLE Vacina (
  `idVacina` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVacina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Veterinario`
-- -----------------------------------------------------
CREATE TABLE Veterinario (
  `idVeterinario` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `Contacto_idContacto` INT NOT NULL,
  PRIMARY KEY (`idVeterinario`),
  INDEX `fk_Veterinario_Contacto1_idx` (`Contacto_idContacto` ASC) VISIBLE,
  CONSTRAINT `fk_Veterinario_Contacto1`
    FOREIGN KEY (`Contacto_idContacto`)
    REFERENCES `BD_Zoologico`.`Contacto` (`idContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Animal_has_Vacina_has_Veterinario`
-- -----------------------------------------------------
CREATE TABLE Animal_has_Vacina_has_Veterinario (
  `Animal_idAnimal` INT NOT NULL,
  `Vacina_idVacina` INT NOT NULL,
  `Veterinario_idVeterinario` INT NOT NULL,
  `data_administracao` DATE NULL,
  INDEX `fk_Animal_has_Vacina_Vacina1_idx` (`Vacina_idVacina` ASC) VISIBLE,
  INDEX `fk_Animal_has_Vacina_Animal1_idx` (`Animal_idAnimal` ASC) VISIBLE,
  INDEX `fk_Animal_has_Vacina_has_Veterinario_Veterinario1_idx` (`Veterinario_idVeterinario` ASC) VISIBLE,
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
-- Table `BD_Zoologico`.`Zona`
-- -----------------------------------------------------
CREATE TABLE Zona (
  `idZona` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Recinto_ID` INT NOT NULL,
  PRIMARY KEY (`idZona`),
  INDEX `fk_Zona_Recinto1_idx` (`Recinto_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Zona_Recinto1`
    FOREIGN KEY (`Recinto_ID`)
    REFERENCES `BD_Zoologico`.`Recinto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Tipo_has_Zona`
-- -----------------------------------------------------
CREATE TABLE Tipo_has_Zona (
  `idTipoZona` INT NOT NULL,
  `Zona_idZona` INT NOT NULL,
  `Tipo_idTipo` INT NOT NULL,
  INDEX `fk_Tipo_has_Zona_Zona1_idx` (`Zona_idZona` ASC) VISIBLE,
  INDEX `fk_Tipo_has_Zona_Tipo1_idx` (`Tipo_idTipo` ASC) VISIBLE,
  PRIMARY KEY (`idTipoZona`),
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
-- Table `BD_Zoologico`.`Especie`
-- -----------------------------------------------------
CREATE TABLE Especie (
  `idEspecie` INT NOT NULL,
  `nome_comum` VARCHAR(45) NOT NULL,
  `nome_cientifico` VARCHAR(45) NOT NULL,
  `valor_de_apadrinhamento` FLOAT NOT NULL,
  `Animal_idAnimal` INT NOT NULL,
  PRIMARY KEY (`idEspecie`),
  INDEX `fk_Especie_Animal1_idx` (`Animal_idAnimal` ASC) VISIBLE,
  CONSTRAINT `fk_Especie_Animal1`
    FOREIGN KEY (`Animal_idAnimal`)
    REFERENCES `BD_Zoologico`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Zoologico`.`Especie_has_Vacina`
-- -----------------------------------------------------
CREATE TABLE Especie_has_Vacina (
  `idEspecieVacina` INT NOT NULL,
  `Especie_idEspecie` INT NOT NULL,
  `Vacina_idVacina` INT NOT NULL,
  `limite_temporal` FLOAT NOT NULL,
  `intervalo_temporal` FLOAT NULL,
  `doses_necessarias` INT NOT NULL,
  `dosagem` FLOAT NOT NULL,
  INDEX `fk_Especie_has_Vacina_Vacina1_idx` (`Vacina_idVacina` ASC) VISIBLE,
  INDEX `fk_Especie_has_Vacina_Especie1_idx` (`Especie_idEspecie` ASC) VISIBLE,
  PRIMARY KEY (`idEspecieVacina`),
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
