/*!40101 SET NAMES utf8 */;

DROP DATABASE IF EXISTS johannesp;

CREATE DATABASE johannesp;

USE johannesp;



CREATE TABLE address(
	addressId INT NOT NULL AUTO_INCREMENT,
    addressLine1 VARCHAR(20) NOT NULL,
    addressLine2 VARCHAR(20) NULL,
    zipCode VARCHAR(6) NOT NULL,
    city VARCHAR(20) NOT NULL,
	PRIMARY KEY ( addressId )
);


CREATE TABLE director(
	directorId INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY ( directorId )
);


CREATE TABLE movie(
   movieId INT NOT NULL AUTO_INCREMENT,
   title VARCHAR(50) NOT NULL,
   description VARCHAR(600) NOT NULL,
   realeseYear DATE,
   lengthInMinutes INT NOT NULL,
   directorId INT NULL,
   FOREIGN KEY (directorId)
   REFERENCES director (directorId),
   PRIMARY KEY ( movieId )
);


CREATE TABLE actor(
	actorId INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY ( actorId )
);

CREATE TABLE genre(
	genreId INT NOT NULL AUTO_INCREMENT,
    genre VARCHAR(50) NOT NULL,
    PRIMARY KEY ( genreId )
);


CREATE TABLE customer(
   customerId INT NOT NULL AUTO_INCREMENT,
   firstName VARCHAR(50) NOT NULL,
   lastName VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   phoneNumber VARCHAR (20) NOT NULL,
   addressId INT NOT NULL,
   KEY adressId ( addressId ),
   FOREIGN KEY (addressId)
   REFERENCES address (addressId),
   PRIMARY KEY ( customerId )
);


CREATE TABLE employee(
   employeeId INT NOT NULL AUTO_INCREMENT,
   firstName VARCHAR(50) NOT NULL,
   lastName VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   phoneNumber VARCHAR (20) NOT NULL,
   addressId INT NOT NULL,
   FOREIGN KEY (addressId)
   REFERENCES address(addressId),
   PRIMARY KEY ( employeeId )
);


    CREATE TABLE movieActor(
	actorId INT NOT NULL,
    movieId INT NOT NULL,
    FOREIGN KEY ( actorId )
    REFERENCES actor( actorId ),
    FOREIGN KEY ( movieId ) 
    REFERENCES movie( movieId )
);


    CREATE TABLE movieGenre(
	genreId INT NOT NULL,
    movieId INT NOT NULL,
    FOREIGN KEY ( genreId )
    REFERENCES genre( genreId ),
    FOREIGN KEY ( movieId ) 
    REFERENCES movie( movieId )
);


CREATE TABLE movieCopy(
	movieCopyId INT NOT NULL AUTO_INCREMENT,
	movieId INT NOT NULL,
    FOREIGN KEY ( movieId ) 
    REFERENCES movie( movieId ),
    PRIMARY KEY ( movieCopyId )
);

CREATE TABLE rental(
	rentalId INT NOT NULL AUTO_INCREMENT,
	customerId INT NOT NULL,
	employeeId INT NOT NULL,
    rentalDate DATE NOT NULL,
    returnDate DATE NULL,
	rentalDuration INT NOT NULL,
    FOREIGN KEY ( customerId )
    REFERENCES customer( customerId ),
    FOREIGN KEY ( employeeId )
    REFERENCES employee( employeeId ),
    PRIMARY KEY ( rentalId )
);

CREATE TABLE rentalItem(
	rentalId INT NOT NULL,
    movieCopyId INT NOT NULL,
    FOREIGN KEY ( rentalId )
	REFERENCES rental( rentalId ),
	FOREIGN KEY ( movieCopyId )
	REFERENCES movieCopy( movieCopyId )
);

-- genre data

INSERT INTO `johannesp`.`genre`
(`genre`)
VALUES
('Comedy');

SELECT LAST_INSERT_ID() INTO @comedy;

INSERT INTO `johannesp`.`genre`
(`genre`)
VALUES
('Adventure');

SELECT LAST_INSERT_ID() INTO @adventure;

INSERT INTO `johannesp`.`genre`
(`genre`)
VALUES
('Drama');

SELECT LAST_INSERT_ID() INTO @drama;

INSERT INTO `johannesp`.`genre`
(`genre`)
VALUES
('Sci-Fi');

SELECT LAST_INSERT_ID() INTO @sciFi;

INSERT INTO `johannesp`.`genre`
(`genre`)
VALUES
('Romance');

SELECT LAST_INSERT_ID() INTO @romance;

INSERT INTO `johannesp`.`genre`
(`genre`)
VALUES
('War');

SELECT LAST_INSERT_ID() INTO @war;

INSERT INTO `johannesp`.`genre`
(`genre`)
VALUES
('Action');

SELECT LAST_INSERT_ID() INTO @actions; -- Actions istället för action eftersom action är reserverat ord.

INSERT INTO `johannesp`.`genre`
(`genre`)
VALUES
('Thriller');

SELECT LAST_INSERT_ID() INTO @thriller;

INSERT INTO `johannesp`.`genre`
(`genre`)
VALUES
('Crime');

SELECT LAST_INSERT_ID() INTO @crime;

-- actor data

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Will',
'Smith');

SELECT LAST_INSERT_ID() INTO @willSmith;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Jeff',
'Goldblum');

SELECT LAST_INSERT_ID() INTO @jeffGoldblum;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Matthew',
'McConaughey');

SELECT LAST_INSERT_ID() INTO @matthewMcConaughey;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Anne',
'Hathaway');

SELECT LAST_INSERT_ID() INTO @anneHathaway;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Brad',
'Pitt');

SELECT LAST_INSERT_ID() INTO @bradPitt;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Edward',
'Norton');

SELECT LAST_INSERT_ID() INTO @edwardNorton;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Kate',
'Hudson');

SELECT LAST_INSERT_ID() INTO @kateHudson;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Patrick',
'Fugit');

SELECT LAST_INSERT_ID() INTO @patrickFugit;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Anthony',
'Hopkins');

SELECT LAST_INSERT_ID() INTO @anthonyHopkins;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Jodie',
'Foster');

SELECT LAST_INSERT_ID() INTO @jodieFoster;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Humphrey',
'Bogart');
 
SELECT LAST_INSERT_ID() INTO @humphreyBogart;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Ingrid',
'Bergman');

SELECT LAST_INSERT_ID() INTO @ingridBergman;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Morgan',
'Freeman');

SELECT LAST_INSERT_ID() INTO @morganFreeman;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Tim',
'Robbins');

SELECT LAST_INSERT_ID() INTO @timRobbins;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Jim',
'Carrey');

SELECT LAST_INSERT_ID() INTO @jimCarrey;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Jeff',
'Daniels');

SELECT LAST_INSERT_ID() INTO @jeffDaniels;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Eric',
'Balfour');
 
SELECT LAST_INSERT_ID() INTO @ericBalfour;
 
INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Donald',
'Faison');

SELECT LAST_INSERT_ID() INTO @donaldFaison;

INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Pauley',
'Shore');
 
SELECT LAST_INSERT_ID() INTO @pauleyShore;
 
INSERT INTO `johannesp`.`actor`
(`firstName`,
`lastName`)
VALUES
('Stephen',
'Baldwin');

SELECT LAST_INSERT_ID() INTO @stephenBaldwin;

-- director data

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('Roland',
'Emmerich');

SELECT LAST_INSERT_ID() INTO @rolandEmmerich;

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('Christoffer',
'Nolan');

SELECT LAST_INSERT_ID() INTO @christofferNolan;

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('David',
'Fincher');

SELECT LAST_INSERT_ID() INTO @davidFincher;

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('Cameron',
'Crowe');

SELECT LAST_INSERT_ID() INTO @cameronCrowe;

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('Jonathan',
'Demme');

SELECT LAST_INSERT_ID() INTO @jonathanDemme;

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('Max',
'Steiner');

SELECT LAST_INSERT_ID() INTO @maxSteiner;

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('Frank',
'Darabont');

SELECT LAST_INSERT_ID() INTO @frankDarabont;

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('Peter',
'Farrelley');

SELECT LAST_INSERT_ID() INTO @peterFarrelley;

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('Greg',
'Strause');

SELECT LAST_INSERT_ID() INTO @gregStrause;

INSERT INTO `johannesp`.`director`
(`firstName`,
`lastName`)
VALUES
('Jason',
'Bloom');

SELECT LAST_INSERT_ID() INTO @jasonBloom;

-- movie data

-- film 1

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('Idependence day',
'Ett gigantiskt rymdskepp från en utomjordisk civilisation flyger in över månen och skickar ut mindre skepp som svävar över New York, Los Angeles, Washington, DC, Moskva, London, Paris med flera storstäder. De är så stora att de får städerna att bokstavligen falla i skugga. Mänskligheten är till synes försvarslös mot utomjordingarnas synnerligen effektiva massförstörelsevapen. Utomjordingarna är nomadiska parasiter som förflyttar sig från planet till planet efter att alla naturresurser förbrukats. Deras nästa mål är jorden.',
'1996-10-03',
145,
@rolandEmmerich);

SELECT LAST_INSERT_ID() INTO @independeceDay;

 
INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@willSmith,
@independeceDay);

INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@jeffGoldblum,
@independeceDay);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@actions,
@independeceDay);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@adventure,
@independeceDay);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@sciFi,
@independeceDay);

-- film 2

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('Interstellar',
'Interstellar är en amerikansk-brittisk episk science fiction-film om en grupp astronauter som via ett maskhål ger sig ut på en interstellär resa.',
'2014-11-07',
169,
@christofferNolan);

SELECT LAST_INSERT_ID() INTO @interstellar;
 
INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@matthewMcConaughey,
@interstellar);

INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@anneHathaway,
@interstellar);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@adventure,
@interstellar);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@drama,
@interstellar);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@sciFi,
@interstellar);

-- film3

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('Fight Club',
'Filmens berättare (Edward Norton), som inte nämns vid namn, är en kroniskt sömnlös man som desperat försöker fly från sitt tråkiga liv. En dag träffar han Tyler Durden (Brad Pitt) och allting förändras. ',
'1999-09-10',
139,
@davidFincher);

SELECT LAST_INSERT_ID() INTO @fightClub;
 
INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@bradPitt,
@fightClub);

INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@edwardNorton,
@fightClub);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@drama,
@fightClub);

-- film 4

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('Almost Famous',
'Året är 1973. William är 15 år gammal och hans mamma vill att han ska bli advokat en dag. William själv har dock helt andra planer. Hans stora intresse är rockmusik och han vill bli rockjournalist. Och plötsligt en dag verkar det som att hans dröm kan bli verklighet.',
'2001-01-19',
155,
@cameronCrowe);

SELECT LAST_INSERT_ID() INTO @almostFamous;
 
 INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@kateHudson,
@almostFamous);

INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@patrickFugit,
@almostFamous);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@adventure,
@almostFamous);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@comedy,
@almostFamous);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@drama,
@almostFamous);

-- film 5

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('The Silence of the Lambs',
'Seriemördaren "Buffalo Bill" kidnappar, mördar och skinnflår unga kvinnor. En FBI-agent under utbildning, Clarice Starling, skickas till den inspärrade, extremt farlige, psykopatiske seriemördaren och psykiatern Hannibal Lecter för att möjligen få någon information om mördaren från honom.',
'1991-02-14',
118,
@jonathanDemme);

SELECT LAST_INSERT_ID() INTO @lambs;
 
 INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@anthonyHopkins,
@lambs);
 
INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@jodieFoster,
@lambs);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@crime,
@lambs);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@drama,
@lambs);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@thriller,
@lambs);

-- film 6

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('Casablanca',
'Casablanca är en amerikansk romantisk dramafilm från 1942 i regi av Michael Curtiz, baserad på Murray Burnetts och Joan Alisons opublicerade teaterpjäs Everybody Comes to Rick´s. Huvudrollerna spelas av Humphrey Bogart och Ingrid Bergman. Filmen brukar räknas som en av de största klassikerna inom amerikansk film.',
'1942-11-26',
102,
@maxSteiner);

SELECT LAST_INSERT_ID() INTO @casablanca;
 
 INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@humphreyBogart,
@casablanca);
 
INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@ingridBergman,
@casablanca);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@drama,
@casablanca);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@romance,
@casablanca);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@war,
@casablanca);

-- film 7

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('The Shawshank Redemption',
'Andy Dufresne (Tim Robbins) är en tystlåten och ambitiös man med en lysande karriär som bankman. Hans förhållande med frun är däremot långt ifrån lyckligt. Hon vill skilja sig och har inlett ett förhållande med en annan. När frun och hennes älskare brutalt skjuts ihjäl åtalas Andy och fälls för morden då han inte kan bevisa sin oskuld. ',
'1994-09-23',
142,
@frankDarabont);

SELECT LAST_INSERT_ID() INTO @shawshankRedemption;
 
INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@morganFreeman,
@shawshankRedemption);

INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@timRobbins,
@shawshankRedemption);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@crime,
@shawshankRedemption);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@drama,
@shawshankRedemption);

-- film 8

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('Dumb & Dumber',
'Den lokalsinneslöse limousinchauffören Lloyd Christmas (Jim Carrey) och hans bäste vän hundfrisören Harry Dunne (Jeff Daniels) bor i en liten sliten lägenhet i Providence, Rhode Island, USA, i ett hyreshus av lägsta standard. Trots deras minimala budget har de förhoppningar om att kunna spara ihop pengar till en maskaffär, men både Lloyd och Harry får dessvärre sparken samma da',
'1994-12-16',
107,
@peterFarrelley);

SELECT LAST_INSERT_ID() INTO @dumbDumber;

INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@jimCarrey,
@dumbDumber);

INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@jeffDaniels,
@dumbDumber);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@comedy,
@dumbDumber);

-- film 9

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('Skyline',
'När solen går upp två timmar för tidigt i form av ett märkligt ljusfenomen på himlen ser en grupp vänner till sin fasa hur människor från hela staden dras ut på gatan och sugs upp mot ett enormt rymdskepp som svävar i luften ovanför L.A. Bland tanks, androider och skrämmande aliens som är omöjliga att undfly står det klart att det bara finns en chans att överleva. Att slå tillbaka!',
'2010-11-11',
94,
@gregStrause);

SELECT LAST_INSERT_ID() INTO @skyline;
 
INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@ericBalfour,
@skyline);

INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@donaldFaison,
@skyline);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@actions,
@skyline);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@sciFi,
@skyline);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@thriller,
@skyline);

-- film 10

INSERT INTO `johannesp`.`movie`
(`title`,
`description`,
`realeseYear`,
`lengthInMinutes`,
`directorId`)
VALUES
('Bio-Dome',
'Bud och Doyle är två oduglingar som inte gör något vettigt med sina liv. Deras flickvänner är aktiva i miljörörelsen, men Bud och Doyle är ointresserade av att försöka rädda världen. Av misstag blir de involverade i ett forskningsprojekt - de skall leva ett år i en "Bio-Dome", utan kontakt med omvärlden.',
'1996-01-12',
145,
@jasonBloom);

SELECT LAST_INSERT_ID() INTO @bioDome;
 
INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@pauleyShore,
@bioDome);

INSERT INTO `johannesp`.`movieactor`
(`actorId`,
`movieId`)
VALUES
(@stephenBaldwin,
@bioDome);

INSERT INTO `johannesp`.`moviegenre`
(`genreId`,
`movieId`)
VALUES
(@comedy,
@bioDome);

-- movieCopies

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@independeceDay);

SELECT LAST_INSERT_ID() INTO @independenceDayCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@independeceDay);

SELECT LAST_INSERT_ID() INTO @independenceDayCopy2;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@interstellar);

SELECT LAST_INSERT_ID() INTO @interstellarCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@interstellar);

SELECT LAST_INSERT_ID() INTO @interstellarCopy2;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@fightClub);

SELECT LAST_INSERT_ID() INTO @fightClubCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@fightClub);

SELECT LAST_INSERT_ID() INTO @fightClubCopy2;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@almostFamous);

SELECT LAST_INSERT_ID() INTO @almostFamousCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@almostFamous);

SELECT LAST_INSERT_ID() INTO @almostFamousCopy2;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@lambs);

SELECT LAST_INSERT_ID() INTO @lambsCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@lambs);

SELECT LAST_INSERT_ID() INTO @lambsCopy2;


INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@casablanca);

SELECT LAST_INSERT_ID() INTO @casablancaCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@casablanca);

SELECT LAST_INSERT_ID() INTO @casablancaCopy2;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@shawshankRedemption);

SELECT LAST_INSERT_ID() INTO @shawshankRedemptionCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@shawshankRedemption);

SELECT LAST_INSERT_ID() INTO @shawshankRedemptionCopy2;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@dumbDumber);

SELECT LAST_INSERT_ID() INTO @dumbDumberCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@dumbDumber);

SELECT LAST_INSERT_ID() INTO @dumbDumberCopy2;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@skyline);

SELECT LAST_INSERT_ID() INTO @skylineCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@skyline);

SELECT LAST_INSERT_ID() INTO @skylineCopy2;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@bioDome);

SELECT LAST_INSERT_ID() INTO @bioDomeCopy1;

INSERT INTO `johannesp`.`moviecopy`
(`movieId`)
VALUES
(@bioDome);

SELECT LAST_INSERT_ID() INTO @bioDomeCopy2;

-- address 1

INSERT INTO `johannesp`.`address`
(`addressLine1`,
`addressLine2`,
`zipCode`,
`city`)
VALUES
('Storgatan 4c',
NULL,
'57332',
'Tranås');

-- kund 1

SELECT LAST_INSERT_ID() INTO @customerAdressId1;
INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Johannes',
'Palm',
'Johannes@itpalm.se',
'070-6957568',
@customerAdressId1);

-- kund2

INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Angelica',
'Lindh',
'Angelica@itpalm.se',
'070-3378744',
@customerAdressId1);

-- address 2

INSERT INTO `johannesp`.`address`
(`addressLine1`,
`addressLine2`,
`zipCode`,
`city`)
VALUES
('Framnäsgatan 20',
NULL,
'57339',
'Tranås');

-- kund 3

SELECT LAST_INSERT_ID() INTO @customerAdressId2;
INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Håkan',
'Palm',
'Palm@tranastaxi.se',
'070-3488833',
@customerAdressId2);

-- kund 4

INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Rosita',
'Palm',
'rosita@alpa.se',
'070-5433884',
@customerAdressId2);

-- address 3

INSERT INTO `johannesp`.`address`
(`addressLine1`,
`addressLine2`,
`zipCode`,
`city`)
VALUES
('Datalinjen 1',
NULL,
'58330',
'Linköping');

-- kund 5

SELECT LAST_INSERT_ID() INTO @customerAdressId3;
INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Mark',
'Zuckerberg',
'Mark@facebook.com',
'073-5574788',
@customerAdressId3);

-- address 4

INSERT INTO `johannesp`.`address`
(`addressLine1`,
`addressLine2`,
`zipCode`,
`city`)
VALUES
('Vävar Johans gata 8',
NULL,
'120 69',
'Stockholm');

-- kund 6

SELECT LAST_INSERT_ID() INTO @customerAdressId4;
INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Alexander',
'Palm',
'alexander@alpa.se',
'070-3333999',
@customerAdressId4);

-- kund 7

INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Emma',
'Gustavsson',
'emma@alpa.se',
'072-3948457',
@customerAdressId4);

-- address 5

INSERT INTO `johannesp`.`address`
(`addressLine1`,
`addressLine2`,
`zipCode`,
`city`)
VALUES
('Midsommarvägen 17',
NULL,
'126 35',
'Hägersten');

-- kund 8

SELECT LAST_INSERT_ID() INTO @customerAdressId5;
INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Kristoffer',
'Palm',
'kristoffer@iveo.se',
'070-3037388',
@customerAdressId5);

-- kund 9

INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Bea',
'Hult',
'Bea@beastickar.se',
'070-8844499',
@customerAdressId5);

-- address 6

INSERT INTO `johannesp`.`address`
(`addressLine1`,
`addressLine2`,
`zipCode`,
`city`)
VALUES
('Trumpetaregatan 3U1',
NULL,
'603 67',
'Norrköping');

-- kund 10

SELECT LAST_INSERT_ID() INTO @customerAdressId6;
INSERT INTO `johannesp`.`customer`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Gustav',
'Wahlström',
'gustav@wasst.se',
'070-4947488',
@customerAdressId6);

-- address 7

INSERT INTO `johannesp`.`address`
(`addressLine1`,
`addressLine2`,
`zipCode`,
`city`)
VALUES
('Torpgatan 30',
NULL,
'57340',
'Tranås');

-- employee 1

SELECT LAST_INSERT_ID() INTO @employeeAdressId7;
INSERT INTO `johannesp`.`employee`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Alexander',
'Borg',
'borg@hotmail.com',
'070-4845559',
@employeeAdressId7
);

-- address 8

INSERT INTO `johannesp`.`address`
(`addressLine1`,
`addressLine2`,
`zipCode`,
`city`)
VALUES
('Nygatan 6',
NULL,
'57333',
'Tranås');

-- employee 2

SELECT LAST_INSERT_ID() INTO @employeeAdressId8;
INSERT INTO `johannesp`.`employee`
(`firstName`,
`lastName`,
`email`,
`phoneNumber`,
`addressId`)
VALUES
('Johan',
'Blomqvist',
'blomqvist@hotmail.com',
'076-8555995',
@employeeAdressId8
);

-- rentalInfo

-- rental 1

INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`)
VALUES
(1,
1,
"2018-03-20",
"2018-03-29",
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(1,
@independenceDayCopy1);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(1,
@interstellarCopy1);

-- rental 2

INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`)
VALUES
(2,
1,
"2018-02-18",
"2018-02-28",
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(2,
@independenceDayCopy2);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(2,
@fightClubCopy1);

-- rental 3

INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`)
VALUES
(3,
2,
"2018-01-01",
"2018-01-04",
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(3,
@fightClubCopy2);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(3,
@interstellarCopy2);

-- rental 4

INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`)
VALUES
(4,
2,
"2018-04-01",
NULL,
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(4,
@almostFamousCopy1);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(4,
@casablancaCopy1);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(4,
@lambsCopy1);

-- rental 5

INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`
)
VALUES
(5,
1,
"2018-04-01",
"2018-03-04",
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(5,
@lambsCopy2);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(4,
@casablancaCopy2);

-- rental 6

INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`)
VALUES
(6,
1,
"2018-04-02",
"2018-04-03",
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(6,
@almostFamousCopy2);

-- rental 7

UPDATE `johannesp`.`rental`
SET
`customerId` = 7,
`employeeId` = 2,
`rentalDate` = "2018-03-30",
`returnDate` = NULL
WHERE `rentalId` = 7;


INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`)
VALUES
(7,
2,
"2018-03-30",
NULL,
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(7,
@shawshankRedemptionCopy1);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(7,
@bioDomeCopy1);

-- rental 8

INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`)
VALUES
(8,
2,
"2018-02-25",
"2018-03-30",
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(8,
@bioDomeCopy2);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(8,
@skylineCopy1);

-- rental 9

INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`)
VALUES
(9,
2,
"2018-04-04",
NULL,
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(9,
@skylineCopy2);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(9,
@dumbDumberCopy1);

-- rental 10

INSERT INTO `johannesp`.`rental`
(`customerId`,
`employeeId`,
`rentalDate`,
`returnDate`,
`rentalDuration`)
VALUES
(10,
2,
"2018-03-25",
"2018-03-30",
4);

INSERT INTO `johannesp`.`rentalitem`
(`rentalId`,
`movieCopyId`)
VALUES
(10,
@dumbDumberCopy2);

-- views

CREATE VIEW view_moviesInStore AS

SELECT m.title Title, m.description Description, m.realeseYear Releaseyear, GROUP_CONCAT(DISTINCT ' ', g.genre) Genres, m.lengthInMinutes Length, CONCAT(d.firstName,' ', d.lastName) as Director,
GROUP_CONCAT(DISTINCT' ',a.firstName,' ', a.lastName) Actors
from movie m
INNER JOIN director d ON d.directorId = m.directorId
INNER JOIN movieActor mA ON mA.movieId = m.movieid
INNER JOIN actor a ON a.actorId = mA.actorId
INNER JOIN moviegenre mG ON mG.movieId = m.movieId
INNER JOIN genre g ON g.genreId = mG.genreId
GROUP BY m.movieId
ORDER BY m.title;

CREATE VIEW view_moviesInDrama AS

SELECT m.title Title, m.description Description, m.realeseYear Releaseyear, GROUP_CONCAT(DISTINCT ' ', g.genre) Genres, m.lengthInMinutes Length, CONCAT(d.firstName,' ', d.lastName) as Director,
GROUP_CONCAT(DISTINCT' ',a.firstName,' ', a.lastName) Actors
from movie m
INNER JOIN director d ON d.directorId = m.directorId
INNER JOIN movieActor mA ON mA.movieId = m.movieid
INNER JOIN actor a ON a.actorId = mA.actorId
INNER JOIN moviegenre mG ON mG.movieId = m.movieId
INNER JOIN genre g ON g.genreId = mG.genreId
GROUP BY m.movieId
HAVING Genres LIKE '%Drama%'
ORDER BY m.title;

CREATE VIEW view_rentalInfo AS

SELECT GROUP_CONCAT(' ', m.title) 'Rented movies', 
CONCAT(c.firstName, ' ', c.lastName) Customer, c.phoneNumber 'Customer phone', 
CONCAT(e.firstName, ' ',e.lastName) Employee FROM rental r
INNER JOIN rentalItem rI ON rI.rentalId = r.rentalId
INNER JOIN movieCopy mC ON mC.movieCopyId = rI.movieCopyId
INNER JOIN movie m ON m.movieId = mC.movieId
INNER JOIN employee e on e.employeeId = r.employeeId
INNER JOIN customer c ON c.customerId = r.customerId
WHERE r.returnDate IS NULL
GROUP BY r.rentalId 
ORDER BY m.title;

CREATE VIEW view_overdueMovies AS

SELECT GROUP_CONCAT(' ', m.title) 'Rented movies', r.rentalDate 'Rented on',
r.returnDate 'Returned on',
CONCAT(c.firstName, ' ', c.lastName) Customer, c.phoneNumber 'Customer phone'
FROM rental r
INNER JOIN rentalItem rI ON rI.rentalId = r.rentalId
INNER JOIN movieCopy mC ON mC.movieCopyId = rI.movieCopyId
INNER JOIN movie m ON m.movieId = mC.movieId
INNER JOIN employee e on e.employeeId = r.employeeId
INNER JOIN customer c ON c.customerId = r.customerId
WHERE DATEDIFF(r.returnDate, r.rentalDate) > r.rentalDuration OR 
(r.returnDate IS NULL AND DATEDIFF(CURRENT_DATE(), r.rentalDate) > r.rentalDuration)
GROUP BY r.rentalId 
ORDER BY m.title;
