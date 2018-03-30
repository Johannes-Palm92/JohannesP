/*!40101 SET NAMES utf8 */;

DROP DATABASE IF EXISTS johannesp;

CREATE DATABASE johannesp;

USE johannesp;

DROP TABLE IF EXISTS movie;

CREATE TABLE movie(
   movieId INT NOT NULL AUTO_INCREMENT,
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

DROP TABLE IF EXISTS actor;

CREATE TABLE actor(
	actorId INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY ( actorId )
);

DROP TABLE IF EXISTS movieActor;

CREATE TABLE movieActor(
	actorId INT NOT NULL,
    movieId INT NOT NULL,
    FOREIGN KEY ( actorId ) REFERENCES actor( actorId ),
    FOREIGN KEY ( movieId ) REFERENCES movie( movieId )
);

DROP TABLE IF EXISTS director;

CREATE TABLE director(
	directorId INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY ( directorId )
);

DROP TABLE IF EXISTS directorMovie;

CREATE TABLE directorMovie(
	actorId INT NOT NULL,
    movieId INT NOT NULL,
    FOREIGN KEY ( actorId ) REFERENCES actor( actorId ),
    FOREIGN KEY ( movieId ) REFERENCES movie( movieId )
);


