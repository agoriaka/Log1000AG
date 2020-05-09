--Antonina Trotska , 1995043

--drop database StockMat

create database StockMat
go

use StockMat 
go

--table Utilisateur---------
CREATE TABLE  Utilisateur
(
  IdUtilisateur int identity(1,1) primary key,
  nom varchar(50) not null,
  courriel varchar(150)  NULL,
  username varchar(20) NOT NULL,
  mot_de_passe varchar(20) NULL
)

--exemple Utilisateur----------
insert into Utilisateur (nom,courriel,username,mot_de_passe) values ('John Doe','j.doe@qc.ca','admin','0')

--select * from Utilisateur

--table Locaux---------
CREATE TABLE Locaux 
 (	
	NumeroLocal varchar(32) primary key, 
	NumeroTelephone varchar(32)  NULL, 
	Dimension varchar(32)  NULL
)

--exemple Locaux----------
insert into Locaux (NumeroLocal,NumeroTelephone,Dimension) values ('200','111 1111-1111','1000*2000')

--select * from Locaux

--table TypeEquipement---------
CREATE TABLE TypeEquipement
(	IdTypeEquipement int identity(1,1) primary key,
	NomTypeEquipement varchar(50)  NULL,
)

--Type Equipement----------
insert into TypeEquipement (NomTypeEquipement) values ('Projecteur')
insert into TypeEquipement (NomTypeEquipement) values ('Ordinateur')
insert into TypeEquipement (NomTypeEquipement) values ('Portable')
insert into TypeEquipement (NomTypeEquipement) values ('Tablette')


--select * from TypeEquipement

--table Equipement---------
CREATE TABLE Equipement
(   IdEquipement int identity(1,1) primary key,
	NumeroSerie varchar(32)  NOT NULL,
	IdTypeEquipement int references TypeEquipement(IdTypeEquipement ) null,
	Commentaire varchar(32)  NULL
)

--exemple Equipement---------
insert into Equipement (NumeroSerie,IdTypeEquipement) values ('B213.14.0.169',1)


--select * from Equipement

--table TypeReservation---------
CREATE TABLE TypeReservation
(	IdTypeReservation int identity(1,1) primary key,
	TypeReservation varchar(50)  NULL,
)

--Type Reservation--------------
insert into TypeReservation (TypeReservation) values ('Réservation d’un local')
insert into TypeReservation (TypeReservation) values ('Réservation d’un équipement')
insert into TypeReservation (TypeReservation) values ('Réservation d’un local et d’un équipement')

--select * from TypeReservation

--table Reservation---------
CREATE TABLE Reservation
(   
	IdReservation int identity(1,1) primary key,
	DateDebut datetime  NOT NULL,
	DateFin datetime    NOT NULL,
	NumeroLocal  varchar(32) references Locaux(NumeroLocal )  NULL,
	IdEquipement int references Equipement(IdEquipement )  NULL,
	IdUtilisateur int references Utilisateur(IdUtilisateur ) NOT NULL,
	IdTypeReservation int references TypeReservation(IdTypeReservation ) NOT NULL
)


--exemple transaction Réservation d’un local---------
insert into Reservation (DateDebut,DateFin,NumeroLocal,IdUtilisateur,IdTypeReservation)
				values ('2020-06-01','2020-06-30','200',1,1)

--exemple transaction Réservation d’un équipement---------
insert into Reservation (DateDebut,DateFin,IdEquipement,IdUtilisateur,IdTypeReservation)
				values ('2020-06-01','2020-06-02',1,1,2)

--exemple transaction Réservation d’un local et d’un équipement---------
insert into Reservation (DateDebut,DateFin,NumeroLocal,IdEquipement,IdUtilisateur,IdTypeReservation)
				values ('2020-06-01','2020-06-02','200',1,1,3)


--select * from Reservation

