/*!40101 SET NAMES utf8 */;

DROP DATABASE IF EXISTS johannesp;

CREATE DATABASE johannesp;

USE johannesp;

DROP TABLE IF EXISTS movie;

CREATE TABLE movie(
   movieId INT NOT NULL AUTO_INCREMENT,
   actor VARCHAR(50) NOT NULL,
   director VARCHAR(50) NOT NULL,
   title VARCHAR(50) NOT NULL,
   description VARCHAR(59) NOT NULL,
   realeseYear DATE,
   length datetime NOT NULL,
   PRIMARY KEY ( movieId )
);

DROP TABLE IF EXISTS customer;

CREATE TABLE customer(
   customerId INT NOT NULL AUTO_INCREMENT,
   firstName VARCHAR(50) NOT NULL,
   lastName VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   movieHistory VARCHAR(50) NOT NULL,
   PRIMARY KEY ( customerId )
);

DROP TABLE IF EXISTS employee;

CREATE TABLE employee(
   employeeId INT NOT NULL AUTO_INCREMENT,
   firstName VARCHAR(50) NOT NULL,
   lastName VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   PRIMARY KEY ( employeeId )
);