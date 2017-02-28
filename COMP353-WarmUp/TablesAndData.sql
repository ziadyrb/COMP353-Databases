create table Employee (
	eid INT(9) AUTO_INCREMENT PRIMARY KEY,
	did INT(4),
	firstName VARCHAR(255),
	lastName VARCHAR(255),
	gender ENUM('M', 'F'),
	dob DATE,
	phoneNum BIGINT,
	email VARCHAR(255),
	startDate DATE,
	endDate DATE,
	jobTitle VARCHAR(255),
	civicNum VARCHAR(255),
	city VARCHAR(255),
	country VARCHAR(255),
	zipCode VARCHAR(6)
);

create table Patient (
	medicareNum INT(9) PRIMARY KEY,
	firstName VARCHAR(255),
	lastName VARCHAR(255),
	gender ENUM('M', 'F'),
	dob DATE,
	phoneNum BIGINT,
	civicNum VARCHAR(255),
	city VARCHAR(255),
	postalCode VARCHAR(6),
	country VARCHAR(255)
);

create table Doctor (
	eid INT(9) PRIMARY KEY,
	visitFee DECIMAL(5,2),
	specialty VARCHAR(255),
	CONSTRAINT fk_doctor FOREIGN KEY (eid) REFERENCES Employee (eid) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Nurse (
	eid INT(9) PRIMARY KEY,
	visitFee DECIMAL(5,2),
	specialty VARCHAR(255),
	CONSTRAINT fk_nurse FOREIGN KEY (eid) REFERENCES Employee (eid) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Admin_Staff (
	eid INT(9) PRIMARY KEY,
	CONSTRAINT fk_admin FOREIGN KEY (eid) REFERENCES Employee (eid) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Department (
	did INT(4) AUTO_INCREMENT PRIMARY KEY,
	deptName VARCHAR(255),
	administrator INT(9),
	numOfBeds INT(4),
	CONSTRAINT fk_dep FOREIGN KEY (administrator) REFERENCES Doctor(eid)
);

create table Admission (
	cdate DATE,
	medicareNum INT(9),
	assignedDoctor INT(9),
	reasonForAdmission VARCHAR(255),
	dateAdmitted DATE,
	dateDischarged DATE,
	PRIMARY KEY (cdate, medicareNum, assignedDoctor),
	FOREIGN KEY (medicareNum) REFERENCES Patient (medicareNum),
	FOREIGN KEY (assignedDoctor) REFERENCES Doctor (eid)
);

create table Visit (
	ctime TIME,
	cdate DATE,
	medicareNum INT(9),
	doctorID INT(9),
	diagnosis VARCHAR(255),
	medicalReport VARCHAR(255),
	PRIMARY KEY (ctime, cdate, medicareNum, doctorID),
	FOREIGN KEY (medicareNum) REFERENCES Patient (medicareNum),
	FOREIGN KEY (doctorID) REFERENCES Doctor (eid)
);

INSERT INTO Employee VALUES
(100000001,1001,'Blair','Ryker','M','1972-07-08','5140861984','Blryk@geocities.com','1999-12-21',NULL,'admin','698 Ste. Catherine Ouest','Montreal','Canada','H4I5D9'),
(100000002,1001,'Cassarah','Christabelle','F','1965-01-15','5140709832','cachr@info.com','2004-10-12',NULL,'doctor','654 Cork St','Montreal','Canada','H3OE09'),
(100000003,1002,'Min','Yong','M','1969-12-27','5147491391','min-yong@webmail.com','1998-09-01',NULL,'doctor','1293 White Point Road','Laval','Canada','H6S82K'),
(100000004,1003,'Julie','Aishah','F','1956-09-12','5144255587','jul_ais@infoseller.com','2002-12-29',NULL,'doctor','1489 Queens Bay','Montreal','Canada','H3L0D0'),
(100000005,1002,'Setare','Ahmad','F','1988-02-03','5141055072','setare_ah@mail.com','1999-06-08',NULL,'admin','1380 René-Lévesque Blvd','Laval','Canada','H5J8D9'),
(100000006,1001,'Gaspare','Gustavo','M','1984-08-29','5145900449','gasparegu@webmine.com','2012-01-27',NULL,'nurse','1045  Levy','Laval','Canada','H0K9W9'),
(100000007,1003,'Celia','Berker','F','1985-07-29','5148676343','cel-berker@mail.com','2012-09-30',NULL,'admin','4751 Alaska Hwy','Montreal','Canada','H1M0X9'),
(100000008,1002,'Umukoro','Mamadou','M','1987-02-15','5148397185','umukoroma@google.com','2013-06-15','2014-05-21','nurse','345 acme','Montreal','Canada','HC9V8S'),
(100000009,1004,'Tafadzwa','Jengo','F','1975-09-12','5149161816','ta-je@hotmail.com','2003-11-30','2016-09-02','doctor','3777 Sheppard Ave','Longueuil','Canada','J3Y9S8'),
(100000010,1004,'Gafar','Navid','M','1979-08-29','5148350817','gafar-na@hotmail.com','2010-09-20',NULL,'doctor','4273 Shaughnessy St','Brossard','Canada','J9S7D5'),
(100000011,1004,'Zaynab','Duha','F','1969-07-29','5148281446','zaynab_du@google.com','2001-09-27','2015-06-21','admin','410 James Street','Montreal','Canada','H3F7Q6'),
(100000012,1005,'Shu','Cheng','F','1962-08-05','5141053601','shu-cheng@webmine.com','2013-05-18',NULL,'doctor','4782 Adelaide St','Montreal','Canada','H7G9B6'),
(100000013,1003,'Pete','Gill','M','1982-03-13','5140759302','petegill@mail.com','2014-09-06',NULL,'nurse','910 43rd Avenue','Montreal','Canada','H6N1R5'),
(100000014,1005,'Laval','Wayne','F','1960-04-21','5147710149','ca _wayne@booksmart.com','2002-06-22',NULL,'admin','2827 Ste. Catherine Ouest','Montreal','Canada','H8V8P5'),
(100000015,1004,'Christine','Joseph','F','1978-03-10','5146015325','christine_joseph@freewebmail.com','2013-08-07',NULL,'nurse','2415 184th Street','Montreal','Canada','H6B5X6'),
(100000016,1005,'Dushyant','Indu','M','1964-08-12','5147129864','ppprp@msn.com','2008-10-23',NULL,'nurse','729 Cordova Street','Brossard','Canada','J4Y76S'),
(100000017,1005,'Ram','Ist','M','1974-09-21','5148658321','daaafdf@msn.com','2012-02-22',NULL,'doctor','654 Whatevah Street','Montreal','Canada','I8II8I'),
(100000018,1005,'Jam','Pb','M','1924-04-22','5147128795','dfjjkjn@msn.com','2011-11-21',NULL,'doctor','312 Quan Street','Laval','Canada','Y7Y7Y7'),
(100000019,1001,'Ban','Dera','M','1946-09-02','5147127121','hellohola@google.com','2001-05-25',NULL,'doctor','711 Ova Street','WI','Canada','T4TT4T'),
(100000020,1002,'Palo','Marron','M','1966-06-16','5149879864','quero@gmail.com','2005-05-05',NULL,'doctor','812 Ram Street','Montreal','Canada','U7UU7U'),
(100000021,1003,'Quieto','Menor','M','1955-05-15','5144629864','nomas@hotmail.com','2006-06-27',NULL,'doctor','901 Dova Street','Candiac','Canada','B5BB5B'),
(100000022,1003,'Quela','Dilla','M','1974-07-17','5145514522','outlook@outlook.com','1992-12-12',NULL,'doctor','290 Coma Street','Delson','Canada','A2AA4A'),
(100000023,1003,'Esta','Cosa','M','1988-03-28','5147212222','degim@gimal.com','2002-12-22',NULL,'doctor','09 Va Street','LaSalle','Canada','S4Y67S'),
(100000024,1004,'Dejad','Asi','M','1933-03-23','5148795222','mailhot@hotmail.com','2005-10-11',NULL,'doctor','29 Rido Street','HoMa','Canada','H5JU6S'),
(100000025,1001,'Porfa','Vor','M','1987-12-30','5141112222','yareyare@yare.com','2001-09-13',NULL,'doctor','79 Cova Street','Montreal','Canada','H6ND6S');


INSERT INTO Patient VALUES 
(823584242,'Shereen','Shahin','F','1996-12-20',5146266787,'782 Silver Springs Blvd','Quebec','G0Q2V6','Canada'),
(234234234,'Mohammad','Erfan','M','1995-03-17',5149631478,'778 Alness Street','Longueuil','J7Q4G6','Canada'),
(357334666,'Nur','Adil','F','1937-03-10',5141479632,'3334 Brew Creek Rd','Montreal','H3S9G7', 'Canada'),
(235474547,'Cevdet','Ender','M','1997-09-28',5141478520,'771 Nelson Street','Montreal','H9H2G5','Canada'),
(234745784,'Ju','Xue','F','1985-11-08',5149632580,'2848 Reserve St','Montreal','H8R7J8','Canada'),
(325784433,'Zhen','Lan','M','1947-10-18',5148520741,'42 Yonge Street','Montreal','H8B7W2','Canada'),
(958487637,'Emelina','Sabas','F','2006-11-03',5143578521,'4799 St. John Street','Longueuil','J0Q3X2','Canada'),
(295758499,'Adriana','Macaria','F','1920-11-13',5141793248,'2655 Eglinton Avenue','Boucherville','J3W5G5','Canada'),
(237395072,'Domingo','Roldan','M','2001-08-04',5142684231,'1648 King George Hwy','Laval','H4J5R4','Canada'),
(578590838,'Amadeo','Immacolata','M','1955-10-14',5146542891,'2004 St. Paul Street','Montreal','H6L1Y6','Canada'),
(103947867,'Patrizia','Sebastiana','F','1986-01-02',5143498751,'1949 Parkdale Ave','Montreal','H6H8A3','Canada'),
(493023836,'Ankita','Aniruddha','F','1985-08-20',5141597532,'3377 Burdett Avenue','Montreal','H3L3D2','Canada'),
(697978584,'Gebhard','Maximilian','M','1925-10-31',5145461945,'1489 Sunny Glen Lane','Chateauguay','J8M3I7','Canada'),
(130948743,'Chidiebube','Ayomide','M','2000-11-22',5143164979,'2697 Pearlman Avenue','Longueuil','J3W3U4','Canada'),
(978474737,'Clothilde','Édith','F','1952-03-17',5143416466,'3522 Grant Street','Montreal','H2A7S9','Canada'),
(746352829,'Bernard','François','M','1976-02-13',5143289554,'3512 Joyce Street','Montreal','H4Z8N6','Canada'),
(578389397,'Damian','Wilfred','M','1998-08-01',5145626867,'1944 Loving Acres Road','Montreal','H5J1X9','Canada');

INSERT INTO Doctor VALUES
(100000002, 105.5, "Cardiologist"),
(100000003, 150, "Dermatologist"),
(100000004, 235, "Dialysis"),
(100000009, 150, "General"),
(100000010, 90.5, "General"),
(100000012, 85, "Neurologist"),
(100000017, 230, "Neurologist"),
(100000018, 320, "Neurologist"),
(100000019, 150, "Cardiologist"),
(100000020, 520, "Dermatologist"),
(100000021, 125, "Dialysis"),
(100000022, 185, "Dialysis"),
(100000023, 285, "Dialysis"),
(100000024, 255, "General"),
(100000025, 395, "Cardiologist");

INSERT INTO Department values
(1001,'Cardiology',100000002,35),
(1002,'Dermatology',100000003,22),
(1003,'Dialysis',100000004,36),
(1004,'Emergency',100000010,58),
(1005,'Neurology',100000012,29);

INSERT INTO Nurse VALUES
(100000006, 100, "Assistant"),
(100000008, 120, "Shots"),
(100000013, 85, "Surgery"),
(100000015, 90, "General"),
(100000016, 95, "General");

INSERT INTO Admin_Staff VALUES
(100000001),
(100000005),
(100000007),
(100000011),
(100000014);

INSERT INTO Admission VALUES
('2017-01-01',823584242,100000002,'Heart','2017-01-01','2017-01-02'),
('2017-01-02',234234234,100000003,'Skin','2017-01-02','2017-01-03'),	
('2017-01-03',357334666,100000004,'Kidney','2017-01-03','2017-01-04'),	
('2017-01-04',235474547,100000010,'Examination','2017-01-04','2017-01-05'),	
('2017-01-05',234745784,100000012,'Brain','2017-01-05','2017-01-06'),	
('2017-01-06',325784433,100000009,'Heart','2017-01-06','2017-01-07'),	
('2017-01-07',958487637,100000020,'Skin','2017-01-07','2017-01-08'),	
('2017-01-08',295758499,100000021,'Kidney','2017-01-08','2017-01-09'),	
('2017-01-09',237395072,100000024,'Examination','2017-01-09','2017-01-10'),	
('2017-01-10',578590838,100000017,'Brain','2017-01-10','2017-01-11'),	
('2017-01-11',103947867,100000025,'Heart','2017-01-11','2017-01-12'),	
('2017-01-12',493023836,100000020,'Skin','2017-01-12','2017-01-13'),	
('2017-01-13',697978584,100000022,'Kidney','2017-01-13','2017-01-14'),	
('2017-01-14',130948743,100000024,'Examination','2017-01-14','2017-01-15'),	
('2017-01-15',978474737,100000018,'Brain','2017-01-15','2017-01-16'),	
('2017-01-16',746352829,100000025,'Heart','2017-01-16','2017-01-17'),	
('2017-01-17',578389397,100000003,'Skin','2017-01-17','2017-01-18');	

INSERT INTO Visit VALUES
('12:24:55','2017-02-01',823584242,100000003,'Skin','Rash cream'),
('10:34:55','2017-03-12',234234234,100000002,'Heart','Surgery needed'),		
('13:55:24','2017-02-03',357334666,100000009,'Examination','Everything normal'),	
('12:12:12','2014-04-14',235474547,100000004,'Kidney','More water intake'),		
('15:24:35','2017-02-05',234745784,100000012,'Brain','Headache pills'),		
('22:10:32','2017-06-16',325784433,100000020,'Skin','Cream treatment'),		
('15:15:02','2017-02-07',958487637,100000019,'Heart','Tention Pills'),		
('23:11:28','2017-08-18',295758499,100000010,'Examination','Referral to Neurology'),		
('17:30:25','2017-02-09',237395072,100000021,'Kidney','Everything normal'),		
('20:17:18','2017-11-10',578590838,100000017,'Brain','Tumor'),		
('18:32:06','2017-02-11',103947867,100000003,'Skin','Hydration'),		
('02:22:06','2017-04-12',493023836,100000025,'Heart','More exercise'),		
('11:20:58','2017-02-13',697978584,100000024,'Examination','Referral to Cardiology'),	
('12:12:21','2017-09-19',130948743,100000022,'Kidney','Kidney failing'),		
('10:25:01','2017-02-15',978474737,100000018,'Brain','Everything normal'),		
('18:22:02','2017-03-13',746352829,100000002,'Heart','Surgery needed'),		
('10:15:42','2015-02-17',578389397,100000002,'Heart','Everything normal'),	
('11:25:12','2017-12-17',234234234,100000025,'Heart','Everything normal'),	
('12:54:02','2017-08-27',235474547,100000023,'Kidney','Everything normal'),	
('08:15:52','2017-10-10',325784433,100000012,'Brain','Further exams needed'),	
('18:55:17','2017-07-27',295758499,100000003,'Skin','Cram treatment'),	
('10:32:42','2017-05-01',578590838,100000019,'Heart','Everything normal'),	
('21:15:32','2017-06-07',130948743,100000010,'Examination','Everything normal'),	
('20:51:02','2017-12-18',746352829,100000004,'Kidney','Transplant required'),	
('11:11:11','2017-05-15',578389397,100000017,'Brain','Everything normal');	

