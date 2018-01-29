-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` DECIMAL(10,0) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`producto_has_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto_has_categoria` (
  `producto_idproducto` INT NOT NULL,
  `categoria_idcategoria` INT NOT NULL,
  PRIMARY KEY (`producto_idproducto`, `categoria_idcategoria`),
  INDEX `fk_producto_has_categoria_categoria1_idx` (`categoria_idcategoria` ASC),
  INDEX `fk_producto_has_categoria_producto_idx` (`producto_idproducto` ASC),
  CONSTRAINT `fk_producto_has_categoria_producto`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `mydb`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_has_categoria_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `mydb`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`perfil` (
  `idperfil` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idperfil`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `perfil_idperfil` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_perfil1_idx` (`perfil_idperfil` ASC),
  CONSTRAINT `fk_usuario_perfil1`
    FOREIGN KEY (`perfil_idperfil`)
    REFERENCES `mydb`.`perfil` (`idperfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`sistema_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sistema_pago` (
  `idsistema_pago` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsistema_pago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orden` (
  `idorden` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  `paisEnvio` VARCHAR(45) NOT NULL,
  `CiudadEnvio` VARCHAR(45) NOT NULL,
  `direccionEnvio` VARCHAR(45) NOT NULL,
  `sistema_pago_idsistema_pago` INT NOT NULL,
  PRIMARY KEY (`idorden`),
  INDEX `fk_orden_usuario1_idx` (`usuario_idusuario` ASC),
  INDEX `fk_orden_sistema_pago1_idx` (`sistema_pago_idsistema_pago` ASC),
  CONSTRAINT `fk_orden_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `mydb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_sistema_pago1`
    FOREIGN KEY (`sistema_pago_idsistema_pago`)
    REFERENCES `mydb`.`sistema_pago` (`idsistema_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`orde_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orde_detalle` (
  `idorde_detalle` INT NOT NULL AUTO_INCREMENT,
  `orden_idorden` INT NOT NULL,
  `producto_idproducto` INT NOT NULL,
  `productoNombre` VARCHAR(45) NOT NULL,
  `productoPrecio` DECIMAL(10,0) NOT NULL,
  `cantidad` SMALLINT NOT NULL,
  PRIMARY KEY (`idorde_detalle`),
  INDEX `fk_orde_detalle_orden1_idx` (`orden_idorden` ASC),
  INDEX `fk_orde_detalle_producto1_idx` (`producto_idproducto` ASC),
  CONSTRAINT `fk_orde_detalle_orden1`
    FOREIGN KEY (`orden_idorden`)
    REFERENCES `mydb`.`orden` (`idorden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orde_detalle_producto1`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `mydb`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
