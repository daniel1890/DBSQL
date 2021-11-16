-- 1.a

create database Forumele1

CREATE TABLE Coureur (
	coureurnr			varchar(25)			NOT NULL,
	naam				varchar(25),
	geboorte_datum		date,
	geslacht			char(1),
	telnr				varchar(11)			NOT NULL,
	team				integer,
	CONSTRAINT PK_Coureur					PRIMARY KEY (coureurnr),
);

CREATE TABLE Team (
	teamcode			integer				NOT NULL,
	omschrijving		varchar(25),
	teamlead			varchar(25)			NOT NULL,
	CONSTRAINT PK_Team						PRIMARY KEY (teamcode),
);

-- 1.b

ALTER TABLE Coureur ADD
	CONSTRAINT FK_Coureur_Team
	FOREIGN KEY (team)
	REFERENCES Team (teamcode);

-- 1.c

INSERT INTO Coureur (coureurnr, naam, geboorte_datum, geslacht, telnr, team) VALUES
	(	650133,	'max verstappen',	NULL,		'M',	06-12121212,	2),
	(	659912,	'lewis hamilton',	'7-1-1985',	'M',	06-12345678,	3),
	(	660117,	'sebastian vettel',	'3-7-1987',	NULL,	06-12341234,	1),
	(	651209,	'beitske visser',	NULL,		'V',	06-12312312,	NULL);

INSERT INTO Team (teamcode, omschrijving, teamlead) VALUES
	(1,	'aston martin',	'otmar sfaz'),
	(2,	'red bull',		'christian horner'),
	(3, 'mercedes',		'toto wolff');

SELECT * FROM Coureur
SELECT * FROM Team

-- 1.d

ALTER TABLE Coureur
	ALTER COLUMN Telnr varchar(11);

ALTER TABLE Coureur 
	DROP COLUMN geslacht

ALTER TABLE Coureur
	ADD
	landcode char(3);

ALTER TABLE Coureur
	ALTER COLUMN telnr char(10);

ALTER TABLE Coureur
	ADD Provincie varchar(25) NOT NULL;

-- een kolom kan alleen toegevoegd worden aan een tabel wanneer deze nulls toelaat
-- dus de kolom kan niet NOT NULL bevatten.