-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Little_Lemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Little_Lemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Little_Lemon` DEFAULT CHARACTER SET utf8 ;
USE `Little_Lemon` ;

-- -----------------------------------------------------
-- Table `Little_Lemon`.`Customer_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon`.`Customer_Details` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `ContactNumber` DOUBLE NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon`.`Order_Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon`.`Order_Delivery_Status` (
  `StatusID` INT NOT NULL AUTO_INCREMENT,
  `StatusName` VARCHAR(45) NOT NULL,
  `StatusDescription` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`StatusID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `TotalCost` DECIMAL NOT NULL,
  `Date` DATE NOT NULL,
  `CustomerID` INT NOT NULL,
  `OrderStatus` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `order_status_fk_idx` (`OrderStatus` ASC) VISIBLE,
  CONSTRAINT `customer_id_orders_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Little_Lemon`.`Customer_Details` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_status_fk`
    FOREIGN KEY (`OrderStatus`)
    REFERENCES `Little_Lemon`.`Order_Delivery_Status` (`StatusID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon`.`Staff_Information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon`.`Staff_Information` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  `Role` VARCHAR(75) NOT NULL,
  `HireDate` DATE NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNumber` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `CustomerID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `customer_id_booking_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Little_Lemon`.`Customer_Details` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`StaffID`)
    REFERENCES `Little_Lemon`.`Staff_Information` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon`.`Menu` (
  `MenuItemID` INT NOT NULL AUTO_INCREMENT,
  `ItemName` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Cost` DECIMAL NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon`.`Order_Line_Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon`.`Order_Line_Items` (
  `OrderID` INT NOT NULL,
  `OrderLineID` INT NOT NULL,
  `MenuItem` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`OrderID`, `OrderLineID`),
  INDEX `menu_item_fk_idx` (`MenuItem` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `Little_Lemon`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_item_fk`
    FOREIGN KEY (`MenuItem`)
    REFERENCES `Little_Lemon`.`Menu` (`MenuItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
