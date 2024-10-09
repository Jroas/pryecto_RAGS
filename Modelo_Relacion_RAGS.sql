
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`roles` (
  `idroles` INT NOT NULL,
  `rol_nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idroles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `idusuarios` INT NOT NULL,
  `usuarios_nombre` VARCHAR(45) NULL,
  `usuarios_email` VARCHAR(45) NULL,
  `roles_idroles` INT NOT NULL,
  PRIMARY KEY (`idusuarios`, `roles_idroles`),
  INDEX `fk_usuarios_roles1_idx` (`roles_idroles` ASC) ,
  CONSTRAINT `fk_usuarios_roles1`
    FOREIGN KEY (`roles_idroles`)
    REFERENCES `mydb`.`roles` (`idroles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personas` (
  `idpersonas` INT NOT NULL,
  `Personas_nombre` VARCHAR(45) NULL,
  `roles_idroles` INT NOT NULL,
  PRIMARY KEY (`idpersonas`, `roles_idroles`),
  INDEX `fk_Personas_roles_idx` (`roles_idroles` ASC) ,
  CONSTRAINT `fk_Personas_roles`
    FOREIGN KEY (`roles_idroles`)
    REFERENCES `mydb`.`roles` (`idroles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reportes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reportes` (
  `idReportes` INT NOT NULL,
  `Reportes_Fecha` VARCHAR(45) NULL,
  `Reportes_Id_superv` VARCHAR(45) NULL,
  `Reportes_detalles` VARCHAR(45) NULL,
  PRIMARY KEY (`idReportes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Registros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Registros` (
  `idRegistros` INT NOT NULL,
  `Registros_fehca y hora` VARCHAR(45) NULL,
  `Registros_cdigo` VARCHAR(45) NULL,
  `Registros_id_persona` VARCHAR(45) NULL,
  `Registros_tipo_persona` VARCHAR(45) NULL,
  `Registros_Id_usuario` VARCHAR(45) NULL,
  `Reportes_idReportes` INT NOT NULL,
  PRIMARY KEY (`idRegistros`, `Reportes_idReportes`),
  INDEX `fk_Registros_Reportes1_idx` (`Reportes_idReportes` ASC) ,
  CONSTRAINT `fk_Registros_Reportes1`
    FOREIGN KEY (`Reportes_idReportes`)
    REFERENCES `mydb`.`Reportes` (`idReportes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_objeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_objeto` (
  `idTipo_objeto` INT NOT NULL,
  `Tipo_objeto_nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipo_objeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`objetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`objetos` (
  `idobjetos` INT NOT NULL,
  `objetos_marca` VARCHAR(45) NULL,
  `objetos_No_serie` VARCHAR(45) NULL,
  `objetos_descripcion` VARCHAR(45) NULL,
  `Tipo_objeto_idTipo_objeto` INT NOT NULL,
  PRIMARY KEY (`idobjetos`, `Tipo_objeto_idTipo_objeto`),
  INDEX `fk_objetos_Tipo_objeto1_idx` (`Tipo_objeto_idTipo_objeto` ASC) ,
  CONSTRAINT `fk_objetos_Tipo_objeto1`
    FOREIGN KEY (`Tipo_objeto_idTipo_objeto`)
    REFERENCES `mydb`.`Tipo_objeto` (`idTipo_objeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Registros_has_Personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Registros_has_Personas` (
  `Registros_idRegistros` INT NOT NULL,
  `Personas_idpersonas` INT NOT NULL,
  `Personas_roles_idroles` INT NOT NULL,
  PRIMARY KEY (`Registros_idRegistros`, `Personas_idpersonas`, `Personas_roles_idroles`),
  INDEX `fk_Registros_has_Personas_Personas1_idx` (`Personas_idpersonas` ASC, `Personas_roles_idroles` ASC) ,
  INDEX `fk_Registros_has_Personas_Registros1_idx` (`Registros_idRegistros` ASC) ,
  CONSTRAINT `fk_Registros_has_Personas_Registros1`
    FOREIGN KEY (`Registros_idRegistros`)
    REFERENCES `mydb`.`Registros` (`idRegistros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registros_has_Personas_Personas1`
    FOREIGN KEY (`Personas_idpersonas` , `Personas_roles_idroles`)
    REFERENCES `mydb`.`Personas` (`idpersonas` , `roles_idroles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Registros_has_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Registros_has_usuarios` (
  `Registros_idRegistros` INT NOT NULL,
  `usuarios_idusuarios` INT NOT NULL,
  `usuarios_roles_idroles` INT NOT NULL,
  PRIMARY KEY (`Registros_idRegistros`, `usuarios_idusuarios`, `usuarios_roles_idroles`),
  INDEX `fk_Registros_has_usuarios_usuarios1_idx` (`usuarios_idusuarios` ASC, `usuarios_roles_idroles` ASC) ,
  INDEX `fk_Registros_has_usuarios_Registros1_idx` (`Registros_idRegistros` ASC) ,
  CONSTRAINT `fk_Registros_has_usuarios_Registros1`
    FOREIGN KEY (`Registros_idRegistros`)
    REFERENCES `mydb`.`Registros` (`idRegistros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registros_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios` , `usuarios_roles_idroles`)
    REFERENCES `mydb`.`usuarios` (`idusuarios` , `roles_idroles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Registros_has_objetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Registros_has_objetos` (
  `Registros_idRegistros` INT NOT NULL,
  `objetos_idobjetos` INT NOT NULL,
  `objetos_Tipo_objeto_idTipo_objeto` INT NOT NULL,
  PRIMARY KEY (`Registros_idRegistros`, `objetos_idobjetos`, `objetos_Tipo_objeto_idTipo_objeto`),
  INDEX `fk_Registros_has_objetos_objetos1_idx` (`objetos_idobjetos` ASC, `objetos_Tipo_objeto_idTipo_objeto` ASC) ,
  INDEX `fk_Registros_has_objetos_Registros1_idx` (`Registros_idRegistros` ASC) ,
  CONSTRAINT `fk_Registros_has_objetos_Registros1`
    FOREIGN KEY (`Registros_idRegistros`)
    REFERENCES `mydb`.`Registros` (`idRegistros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registros_has_objetos_objetos1`
    FOREIGN KEY (`objetos_idobjetos` , `objetos_Tipo_objeto_idTipo_objeto`)
    REFERENCES `mydb`.`objetos` (`idobjetos` , `Tipo_objeto_idTipo_objeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



Error: MySQL shutdown unexpectedly.
 	This may be due to a blocked port, missing dependencies, 
 	improper privileges, a crash, or a shutdown by another method.
 	Press the Logs button to view error logs and check
 	the Windows Event Viewer for more clues
 	If you need more help, copy and post this
 	entire log window on the forums
