-- 1.a
CREATE TABLE Student (
	studentnr			integer			NOT NULL,
	naam				varchar(255)	NOT NULL,
	adres				varchar(255)	NOT NULL,
	plaats				char(50)		NOT NULL,
	geboortedatum		date			NOT NULL,
	CONSTRAINT PK_Student				PRIMARY KEY (studentnr),
);

CREATE TABLE Cijfer (
	studentnr			integer			NOT NULL,
	vak					varchar(10)		NOT NULL,
	cijfer				numeric(2,1)	NOT NULL,
	docent				char(10)		NOT NULL,
	toetsdatum			date			NOT NULL,
	CONSTRAINT PK_Cijfer				PRIMARY KEY (studentnr, vak),
);

CREATE TABLE Vak (
	vak					varchar(10)		NOT NULL,
	naam				varchar(50)		NOT NULL,
	CONSTRAINT PK_Vak					PRIMARY KEY (vak),
);

-- 1.b

ALTER TABLE Cijfer	ADD
	CONSTRAINT FK_Cijfer_Student
		FOREIGN KEY (studentnr)
		REFERENCES Student(studentnr)
		ON UPDATE CASCADE,
	CONSTRAINT FK_Cijfer_Vak
		FOREIGN KEY (vak)
		REFERENCES Vak(vak)
		ON UPDATE CASCADE;

-- 1.c

ALTER TABLE Cijfer ADD
	CONSTRAINT UQ_Cijfer
		UNIQUE (studentnr, toetsdatum);


-- Voeg testdata toe aan tabellen

INSERT INTO Student (studentnr, naam, adres, plaats, geboortedatum) VALUES 
	(1,	'John Doe',	'testadres',	'zevenaar',	'2017-09-17'),
	(2,	'Mary Sue',	'testadres',	'arnhem',	'2012-06-11');

INSERT INTO Vak (vak, naam) VALUES 
	('SAQ',	'System Analyses & Quality'),
	('DB',	'Databases'),
	('DMDD', 'Data Modelling and Database Design');


INSERT INTO Cijfer (studentnr, vak, cijfer, docent, toetsdatum) VALUES 
	(1,	'SAQ',	5.7,	'MKE',	'2017-09-17'),
	(1,	'DB',	4.8,	'BDRT',	'2017-09-19'),
	(2,	'DMDD',	8.1,	'MKE',	'2017-09-28');


-- 1.d

ALTER TABLE Cijfer ADD
	CONSTRAINT BTWN_Cijfer
		CHECK (cijfer BETWEEN 1 AND 10);