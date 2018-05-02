/*!40101 set names utf8 */;

drop database if exists johannesp;

create database johannesp;

use johannesp;



create table address(
	addressid int not null auto_increment,
    addressline1 varchar(20) not null,
    addressline2 varchar(20) null,
    zipcode varchar(6) not null,
    city varchar(20) not null,
	primary key ( addressid )
);


create table director(
	directorid int not null auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    primary key ( directorid )
);


create table movie(
   movieid int not null auto_increment,
   title varchar(50) not null,
   description varchar(600) not null,
   realeseyear date,
   lengthinminutes int not null,
   directorid int null,
   foreign key (directorid)
   references director (directorid),
   primary key ( movieid )
);


create table actor(
	actorid int not null auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    primary key ( actorid )
);

create table genre(
	genreid int not null auto_increment,
    genre varchar(50) not null,
    primary key ( genreid )
);


create table customer(
   customerid int not null auto_increment,
   firstname varchar(50) not null,
   lastname varchar(50) not null,
   email varchar(50) not null,
   phonenumber varchar (20) not null,
   addressid int not null,
   key adressid ( addressid ),
   foreign key (addressid)
   references address (addressid),
   primary key ( customerid )
);


create table employee(
   employeeid int not null auto_increment,
   firstname varchar(50) not null,
   lastname varchar(50) not null,
   email varchar(50) not null,
   phonenumber varchar (20) not null,
   addressid int not null,
   foreign key (addressid)
   references address(addressid),
   primary key ( employeeid )
);


    create table movieactor(
	actorid int not null,
    movieid int not null,
    foreign key ( actorid )
    references actor( actorid ),
    foreign key ( movieid ) 
    references movie( movieid )
);


    create table moviegenre(
	genreid int not null,
    movieid int not null,
    foreign key ( genreid )
    references genre( genreid ),
    foreign key ( movieid ) 
    references movie( movieid )
);


create table moviecopy(
	moviecopyid int not null auto_increment,
	movieid int not null,
    foreign key ( movieid ) 
    references movie( movieid ),
    primary key ( moviecopyid )
);

create table rental(
	rentalid int not null auto_increment,
	customerid int not null,
	employeeid int not null,
    foreign key ( customerid )
    references customer( customerid ),
    foreign key ( employeeid )
    references employee( employeeid ),
    primary key ( rentalid )
);


create table rentalitem(
	rentalid int not null,
    moviecopyid int not null,
    rentaldate date not null,
    returndate date null,
    foreign key ( rentalid )
	references rental( rentalid ),
	foreign key ( moviecopyid )
	references moviecopy( moviecopyid )
);


create table rentallog(
	rentallogid int not null auto_increment,
    moviecopyid int not null, 
    rentaldate date not null,
    primary key(rentallogid)
);

-- genre data

insert into `johannesp`.`genre`
(`genre`)
values
('comedy');

select last_insert_id() into @comedy;

insert into `johannesp`.`genre`
(`genre`)
values
('adventure');

select last_insert_id() into @adventure;

insert into `johannesp`.`genre`
(`genre`)
values
('drama');

select last_insert_id() into @drama;

insert into `johannesp`.`genre`
(`genre`)
values
('sci-fi');

select last_insert_id() into @scifi;

insert into `johannesp`.`genre`
(`genre`)
values
('romance');

select last_insert_id() into @romance;

insert into `johannesp`.`genre`
(`genre`)
values
('war');

select last_insert_id() into @war;

insert into `johannesp`.`genre`
(`genre`)
values
('action');

select last_insert_id() into @actions; -- actions istället för action eftersom action är reserverat ord.

insert into `johannesp`.`genre`
(`genre`)
values
('thriller');

select last_insert_id() into @thriller;

insert into `johannesp`.`genre`
(`genre`)
values
('crime');

select last_insert_id() into @crime;

-- actor data

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('will',
'smith');

select last_insert_id() into @willsmith;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('jeff',
'goldblum');

select last_insert_id() into @jeffgoldblum;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('matthew',
'mcconaughey');

select last_insert_id() into @matthewmcconaughey;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('anne',
'hathaway');

select last_insert_id() into @annehathaway;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('brad',
'pitt');

select last_insert_id() into @bradpitt;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('edward',
'norton');

select last_insert_id() into @edwardnorton;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('kate',
'hudson');

select last_insert_id() into @katehudson;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('patrick',
'fugit');

select last_insert_id() into @patrickfugit;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('anthony',
'hopkins');

select last_insert_id() into @anthonyhopkins;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('jodie',
'foster');

select last_insert_id() into @jodiefoster;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('humphrey',
'bogart');
 
select last_insert_id() into @humphreybogart;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('ingrid',
'bergman');

select last_insert_id() into @ingridbergman;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('morgan',
'freeman');

select last_insert_id() into @morganfreeman;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('tim',
'robbins');

select last_insert_id() into @timrobbins;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('jim',
'carrey');

select last_insert_id() into @jimcarrey;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('jeff',
'daniels');

select last_insert_id() into @jeffdaniels;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('eric',
'balfour');
 
select last_insert_id() into @ericbalfour;
 
insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('donald',
'faison');

select last_insert_id() into @donaldfaison;

insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('pauley',
'shore');
 
select last_insert_id() into @pauleyshore;
 
insert into `johannesp`.`actor`
(`firstname`,
`lastname`)
values
('stephen',
'baldwin');

select last_insert_id() into @stephenbaldwin;

-- director data

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('roland',
'emmerich');

select last_insert_id() into @rolandemmerich;

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('christoffer',
'nolan');

select last_insert_id() into @christoffernolan;

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('david',
'fincher');

select last_insert_id() into @davidfincher;

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('cameron',
'crowe');

select last_insert_id() into @cameroncrowe;

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('jonathan',
'demme');

select last_insert_id() into @jonathandemme;

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('max',
'steiner');

select last_insert_id() into @maxsteiner;

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('frank',
'darabont');

select last_insert_id() into @frankdarabont;

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('peter',
'farrelley');

select last_insert_id() into @peterfarrelley;

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('greg',
'strause');

select last_insert_id() into @gregstrause;

insert into `johannesp`.`director`
(`firstname`,
`lastname`)
values
('jason',
'bloom');

select last_insert_id() into @jasonbloom;

-- movie data

-- film 1

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('idependence day',
'ett gigantiskt rymdskepp från en utomjordisk civilisation flyger in över månen och skickar ut mindre skepp som svävar över new york, los angeles, washington, dc, moskva, london, paris med flera storstäder. de är så stora att de får städerna att bokstavligen falla i skugga. mänskligheten är till synes försvarslös mot utomjordingarnas synnerligen effektiva massförstörelsevapen. utomjordingarna är nomadiska parasiter som förflyttar sig från planet till planet efter att alla naturresurser förbrukats. deras nästa mål är jorden.',
'1996-10-03',
145,
@rolandemmerich);

select last_insert_id() into @independeceday;

 
insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@willsmith,
@independeceday);

insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@jeffgoldblum,
@independeceday);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@actions,
@independeceday);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@adventure,
@independeceday);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@scifi,
@independeceday);

-- film 2

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('interstellar',
'interstellar är en amerikansk-brittisk episk science fiction-film om en grupp astronauter som via ett maskhål ger sig ut på en interstellär resa.',
'2014-11-07',
169,
@christoffernolan);

select last_insert_id() into @interstellar;
 
insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@matthewmcconaughey,
@interstellar);

insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@annehathaway,
@interstellar);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@adventure,
@interstellar);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@drama,
@interstellar);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@scifi,
@interstellar);

-- film3

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('fight club',
'filmens berättare (edward norton), som inte nämns vid namn, är en kroniskt sömnlös man som desperat försöker fly från sitt tråkiga liv. en dag träffar han tyler durden (brad pitt) och allting förändras. ',
'1999-09-10',
139,
@davidfincher);

select last_insert_id() into @fightclub;
 
insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@bradpitt,
@fightclub);

insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@edwardnorton,
@fightclub);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@drama,
@fightclub);

-- film 4

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('almost famous',
'året är 1973. william är 15 år gammal och hans mamma vill att han ska bli advokat en dag. william själv har dock helt andra planer. hans stora intresse är rockmusik och han vill bli rockjournalist. och plötsligt en dag verkar det som att hans dröm kan bli verklighet.',
'2001-01-19',
155,
@cameroncrowe);

select last_insert_id() into @almostfamous;
 
 insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@katehudson,
@almostfamous);

insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@patrickfugit,
@almostfamous);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@adventure,
@almostfamous);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@comedy,
@almostfamous);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@drama,
@almostfamous);

-- film 5

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('the silence of the lambs',
'seriemördaren "buffalo bill" kidnappar, mördar och skinnflår unga kvinnor. en fbi-agent under utbildning, clarice starling, skickas till den inspärrade, extremt farlige, psykopatiske seriemördaren och psykiatern hannibal lecter för att möjligen få någon information om mördaren från honom.',
'1991-02-14',
118,
@jonathandemme);

select last_insert_id() into @lambs;
 
 insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@anthonyhopkins,
@lambs);
 
insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@jodiefoster,
@lambs);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@crime,
@lambs);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@drama,
@lambs);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@thriller,
@lambs);

-- film 6

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('casablanca',
'casablanca är en amerikansk romantisk dramafilm från 1942 i regi av michael curtiz, baserad på murray burnetts och joan alisons opublicerade teaterpjäs everybody comes to rick´s. huvudrollerna spelas av humphrey bogart och ingrid bergman. filmen brukar räknas som en av de största klassikerna inom amerikansk film.',
'1942-11-26',
102,
@maxsteiner);

select last_insert_id() into @casablanca;
 
 insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@humphreybogart,
@casablanca);
 
insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@ingridbergman,
@casablanca);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@drama,
@casablanca);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@romance,
@casablanca);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@war,
@casablanca);

-- film 7

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('the shawshank redemption',
'andy dufresne (tim robbins) är en tystlåten och ambitiös man med en lysande karriär som bankman. hans förhållande med frun är däremot långt ifrån lyckligt. hon vill skilja sig och har inlett ett förhållande med en annan. när frun och hennes älskare brutalt skjuts ihjäl åtalas andy och fälls för morden då han inte kan bevisa sin oskuld. ',
'1994-09-23',
142,
@frankdarabont);

select last_insert_id() into @shawshankredemption;
 
insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@morganfreeman,
@shawshankredemption);

insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@timrobbins,
@shawshankredemption);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@crime,
@shawshankredemption);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@drama,
@shawshankredemption);

-- film 8

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('dumb & dumber',
'den lokalsinneslöse limousinchauffören lloyd christmas (jim carrey) och hans bäste vän hundfrisören harry dunne (jeff daniels) bor i en liten sliten lägenhet i providence, rhode island, usa, i ett hyreshus av lägsta standard. trots deras minimala budget har de förhoppningar om att kunna spara ihop pengar till en maskaffär, men både lloyd och harry får dessvärre sparken samma da',
'1994-12-16',
107,
@peterfarrelley);

select last_insert_id() into @dumbdumber;

insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@jimcarrey,
@dumbdumber);

insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@jeffdaniels,
@dumbdumber);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@comedy,
@dumbdumber);

-- film 9

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('skyline',
'när solen går upp två timmar för tidigt i form av ett märkligt ljusfenomen på himlen ser en grupp vänner till sin fasa hur människor från hela staden dras ut på gatan och sugs upp mot ett enormt rymdskepp som svävar i luften ovanför l.a. bland tanks, androider och skrämmande aliens som är omöjliga att undfly står det klart att det bara finns en chans att överleva. att slå tillbaka!',
'2010-11-11',
94,
@gregstrause);

select last_insert_id() into @skyline;
 
insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@ericbalfour,
@skyline);

insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@donaldfaison,
@skyline);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@actions,
@skyline);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@scifi,
@skyline);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@thriller,
@skyline);

-- film 10

insert into `johannesp`.`movie`
(`title`,
`description`,
`realeseyear`,
`lengthinminutes`,
`directorid`)
values
('bio-dome',
'bud och doyle är två oduglingar som inte gör något vettigt med sina liv. deras flickvänner är aktiva i miljörörelsen, men bud och doyle är ointresserade av att försöka rädda världen. av misstag blir de involverade i ett forskningsprojekt - de skall leva ett år i en "bio-dome", utan kontakt med omvärlden.',
'1996-01-12',
145,
@jasonbloom);

select last_insert_id() into @biodome;
 
insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@pauleyshore,
@biodome);

insert into `johannesp`.`movieactor`
(`actorid`,
`movieid`)
values
(@stephenbaldwin,
@biodome);

insert into `johannesp`.`moviegenre`
(`genreid`,
`movieid`)
values
(@comedy,
@biodome);

-- moviecopies

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@independeceday);

select last_insert_id() into @independencedaycopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@independeceday);

select last_insert_id() into @independencedaycopy2;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@interstellar);

select last_insert_id() into @interstellarcopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@interstellar);

select last_insert_id() into @interstellarcopy2;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@fightclub);

select last_insert_id() into @fightclubcopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@fightclub);

select last_insert_id() into @fightclubcopy2;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@almostfamous);

select last_insert_id() into @almostfamouscopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@almostfamous);

select last_insert_id() into @almostfamouscopy2;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@lambs);

select last_insert_id() into @lambscopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@lambs);

select last_insert_id() into @lambscopy2;


insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@casablanca);

select last_insert_id() into @casablancacopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@casablanca);

select last_insert_id() into @casablancacopy2;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@shawshankredemption);

select last_insert_id() into @shawshankredemptioncopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@shawshankredemption);

select last_insert_id() into @shawshankredemptioncopy2;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@dumbdumber);

select last_insert_id() into @dumbdumbercopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@dumbdumber);

select last_insert_id() into @dumbdumbercopy2;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@skyline);

select last_insert_id() into @skylinecopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@skyline);

select last_insert_id() into @skylinecopy2;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@biodome);

select last_insert_id() into @biodomecopy1;

insert into `johannesp`.`moviecopy`
(`movieid`)
values
(@biodome);

select last_insert_id() into @biodomecopy2;

-- address 1

insert into `johannesp`.`address`
(`addressline1`,
`addressline2`,
`zipcode`,
`city`)
values
('storgatan 4c',
null,
'57332',
'tranås');

-- kund 1

select last_insert_id() into @customeradressid1;
insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('johannes',
'palm',
'johannes@itpalm.se',
'070-6957568',
@customeradressid1);

-- kund2

insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('angelica',
'lindh',
'angelica@itpalm.se',
'070-3378744',
@customeradressid1);

-- address 2

insert into `johannesp`.`address`
(`addressline1`,
`addressline2`,
`zipcode`,
`city`)
values
('framnäsgatan 20',
null,
'57339',
'tranås');

-- kund 3

select last_insert_id() into @customeradressid2;
insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('håkan',
'palm',
'palm@tranastaxi.se',
'070-3488833',
@customeradressid2);

-- kund 4

insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('rosita',
'palm',
'rosita@alpa.se',
'070-5433884',
@customeradressid2);

-- address 3

insert into `johannesp`.`address`
(`addressline1`,
`addressline2`,
`zipcode`,
`city`)
values
('datalinjen 1',
null,
'58330',
'linköping');

-- kund 5

select last_insert_id() into @customeradressid3;
insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('mark',
'zuckerberg',
'mark@facebook.com',
'073-5574788',
@customeradressid3);

-- address 4

insert into `johannesp`.`address`
(`addressline1`,
`addressline2`,
`zipcode`,
`city`)
values
('vävar johans gata 8',
null,
'120 69',
'stockholm');

-- kund 6

select last_insert_id() into @customeradressid4;
insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('alexander',
'palm',
'alexander@alpa.se',
'070-3333999',
@customeradressid4);

-- kund 7

insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('emma',
'gustavsson',
'emma@alpa.se',
'072-3948457',
@customeradressid4);

-- address 5

insert into `johannesp`.`address`
(`addressline1`,
`addressline2`,
`zipcode`,
`city`)
values
('midsommarvägen 17',
null,
'126 35',
'hägersten');

-- kund 8

select last_insert_id() into @customeradressid5;
insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('kristoffer',
'palm',
'kristoffer@iveo.se',
'070-3037388',
@customeradressid5);

-- kund 9

insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('bea',
'hult',
'bea@beastickar.se',
'070-8844499',
@customeradressid5);

-- address 6

insert into `johannesp`.`address`
(`addressline1`,
`addressline2`,
`zipcode`,
`city`)
values
('trumpetaregatan 3u1',
null,
'603 67',
'norrköping');

-- kund 10

select last_insert_id() into @customeradressid6;
insert into `johannesp`.`customer`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('gustav',
'wahlström',
'gustav@wasst.se',
'070-4947488',
@customeradressid6);

-- address 7

insert into `johannesp`.`address`
(`addressline1`,
`addressline2`,
`zipcode`,
`city`)
values
('torpgatan 30',
null,
'57340',
'tranås');

-- employee 1

select last_insert_id() into @employeeadressid7;
insert into `johannesp`.`employee`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('alexander',
'borg',
'borg@hotmail.com',
'070-4845559',
@employeeadressid7
);

-- address 8

insert into `johannesp`.`address`
(`addressline1`,
`addressline2`,
`zipcode`,
`city`)
values
('nygatan 6',
null,
'57333',
'tranås');

-- employee 2

select last_insert_id() into @employeeadressid8;
insert into `johannesp`.`employee`
(`firstname`,
`lastname`,
`email`,
`phonenumber`,
`addressid`)
values
('johan',
'blomqvist',
'blomqvist@hotmail.com',
'076-8555995',
@employeeadressid8
);


-- trigger rental-history

use `johannesp`;

delimiter $$
create trigger `rentalhistory`
after insert
on rentalitem
for each row
begin
insert into rentallog (moviecopyid, rentaldate) values (new.moviecopyid, new.rentaldate);

end$$

delimiter ;

-- old rentals

-- rental 1

insert into `johannesp`.`rental`
(`customerid`,
`employeeid`)
values
(1,
1);

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(1,
@independencedaycopy1,
"2018-03-01",
"2018-03-10");

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(1,
@interstellarcopy1,
"2018-03-01",
"2018-03-10");

-- rental 2

insert into `johannesp`.`rental`
(`customerid`,
`employeeid`)
values
(2,
2);

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(2,
@dumbdumbercopy1,
"2018-03-05",
"2018-03-11");

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(2,
@interstellarcopy2,
"2018-03-05",
"2018-03-11");

-- rental 3

insert into `johannesp`.`rental`
(`customerid`,
`employeeid`)
values
(3,
1);

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(3,
@shawshankredemptioncopy1,
"2018-03-10",
"2018-03-14");

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(3,
@skylinecopy1,
"2018-03-11",
"2018-03-17");

-- rental 4

insert into `johannesp`.`rental`
(`customerid`,
`employeeid`)
values
(1,
1);

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(4,
@fightclubcopy1,
"2018-03-20",
"2018-03-25");

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(4,
@lambscopy1,
"2018-03-20",
"2018-03-25");

-- rental 5, rented at the moment, late and not returned.

insert into `johannesp`.`rental`
(`customerid`,
`employeeid`)
values
(5,
2);

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(5,
@interstellarcopy1,
"2018-04-02",
null);

-- rental 6 rented at the moment, late and not returned.

insert into `johannesp`.`rental`
(`customerid`,
`employeeid`)
values
(10,
1);

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(6,
@shawshankredemptioncopy2,
"2018-04-01",
null);

-- rental 7 rented at the moment, late and not returned.

insert into `johannesp`.`rental`
(`customerid`,
`employeeid`)
values
(9,
2);

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(7,
@fightclubcopy2,
"2018-03-30",
null);

insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(7,
@lambscopy2,
"2018-03-30",
null);

-- views

create view view_moviesinstore as

select m.title title, m.description description, m.realeseyear releaseyear, group_concat(distinct ' ', g.genre) genres, m.lengthinminutes length, concat(d.firstname,' ', d.lastname) as director,
group_concat(distinct' ',a.firstname,' ', a.lastname) actors
from movie m
inner join director d on d.directorid = m.directorid
inner join movieactor ma on ma.movieid = m.movieid
inner join actor a on a.actorid = ma.actorid
inner join moviegenre mg on mg.movieid = m.movieid
inner join genre g on g.genreid = mg.genreid
group by m.movieid
order by m.title;

create view view_moviesindrama as

select m.title title, m.description description, m.realeseyear releaseyear, group_concat(distinct ' ', g.genre) genres, m.lengthinminutes length, concat(d.firstname,' ', d.lastname) as director,
group_concat(distinct' ',a.firstname,' ', a.lastname) actors
from movie m
inner join director d on d.directorid = m.directorid
inner join movieactor ma on ma.movieid = m.movieid
inner join actor a on a.actorid = ma.actorid
inner join moviegenre mg on mg.movieid = m.movieid
inner join genre g on g.genreid = mg.genreid
group by m.movieid
having genres like '%drama%'
order by m.title;

create view view_rentalinfo as

select group_concat(' ', m.title) 'rented movies', 
concat(c.firstname, ' ', c.lastname) customer, c.phonenumber 'customer phone', 
concat(e.firstname, ' ',e.lastname) employee from rental r
inner join rentalitem ri on ri.rentalid = r.rentalid
inner join moviecopy mc on mc.moviecopyid = ri.moviecopyid
inner join movie m on m.movieid = mc.movieid
inner join employee e on e.employeeid = r.employeeid
inner join customer c on c.customerid = r.customerid
where ri.returndate is null
group by r.rentalid 
order by m.title;

create view view_overduemovies as

select group_concat(' ', m.title) 'rented movies', ri.rentaldate 'rented on',
ri.returndate 'returned on',
concat(c.firstname, ' ', c.lastname) customer, c.phonenumber 'customer phone'
from rental r
inner join rentalitem ri on ri.rentalid = r.rentalid
inner join moviecopy mc on mc.moviecopyid = ri.moviecopyid
inner join movie m on m.movieid = mc.movieid
inner join employee e on e.employeeid = r.employeeid
inner join customer c on c.customerid = r.customerid
where datediff(ri.returndate, ri.rentaldate) > 4 or 
(ri.returndate is null and datediff(current_date(), ri.rentaldate) > 4)
group by r.rentalid 
order by m.title;

create view view_employeerentalinfo as

select concat(e.firstname, ' ',e.lastname) employees,
count(ri.moviecopyid) 'number of movies rented out'
from employee e
inner join rental r on r.employeeid = e.employeeid
inner join rentalitem ri on ri.rentalid = r.rentalid
where ri.rentaldate is not null
group by e.employeeid
order by count(ri.moviecopyid) desc;

create view view_movierentalslastmonth as

select m.title 'title',
count(r.moviecopyid) 'times rented'
from rentallog r
inner join moviecopy mc on mc.moviecopyid = r.moviecopyid
inner join movie m on m.movieid = mc.movieid
where month(r.rentaldate) = month(current_date - interval 1 month)
group by m.title
order by count(r.moviecopyid) desc;

use `johannesp`;
drop procedure if exists `sp_onrental`;

delimiter $$
use `johannesp`$$
create definer=`root`@`localhost` procedure `sp_onrental`(
	in custid int,
    in empid int,
    in movcopyid int)
begin

if((select count(*) from rentalitem where moviecopyid = movcopyid and returndate is null) = 0)
then
insert into `johannesp`.`rental`
(`customerid`,
`employeeid`)
values
(empid,
custid);
 
 insert into `johannesp`.`rentalitem`
(`rentalid`,
`moviecopyid`,
`rentaldate`,
`returndate`)
values
(last_insert_id(),
movcopyid,
current_date(),
null);

end if;

end$$

delimiter ;

use `johannesp`;
drop function if exists `isitlate`;

delimiter $$
use `johannesp`$$
create definer=`root`@`localhost` function `isitlate`(movcopyid varchar(20)) returns varchar(20) charset utf8
begin

if((select ri.rentaldate from rentalitem ri
where (ri.moviecopyid = movcopyid and ri.returndate is null) and datediff(current_date, ri.rentaldate) > 4))
then
return 'true';
else
return 'false';
end if;
end$$

delimiter ;

use `johannesp`;
drop procedure if exists `sp_onreturn`;

delimiter $$
use `johannesp`$$
create definer=`root`@`localhost` procedure `sp_onreturn`(in movcopyid varchar(20))
begin

if ((select count(*) from rentalitem where movcopyid = moviecopyid and returndate is null) = 1)
then
select isitlate(movcopyid);
update `johannesp`.`rentalitem`
set
`returndate` = current_date
where moviecopyid = movcopyid;


end if;

end$$
delimiter ;