CREATE DATABASE gestband;
USE gestband;

CREATE TABLE Bandes (
id_banda int PRIMARY KEY AUTO_INCREMENT,
Nom varchar(30) NOT NULL,
Provincia varchar(30),
Escut varchar(200),
Localitat(30),
Director varchar(30) NOT NULL
);

CREATE TABLE Membres (
id_membre int PRIMARY KEY AUTO_INCREMENT,
Nom varchar(30) NOT NULL,
Cognom varchar(30) NOT NULL,
Foto varchar(200),
Email varchar(50) NOT NULL,
Contrasenya varchar(50),
Validat enum('si','no') NOT NULL,
Ranking int,
Instrument varchar(30) NOT NULL 
);

CREATE TABLE Pertany (
id_pertany int PRIMARY KEY AUTO_INCREMENT,
id_banda int,
id_usuari int,
Acceptat enum('Si','No','Pendent'),
Rol enum('Administrador','Membre') DEFAULT NULL,
FOREIGN KEY (id_banda) REFERENCES Bandes (id_banda),
FOREIGN KEY (id_usuari) REFERENCES Membres (id_membre)
);

CREATE TABLE Concerts (
id_concert int PRIMARY KEY AUTO_INCREMENT,
Concert varchar(50) NOT NULL,
Lloc varchar(50) NOT NULL,
Ubicacio varchar(500),
DiaHora varchar(30) NOT NULL,
Partitures varchar(30) NOT NULL,
Passacarrers enum('Si','No') NOT NULL,
Part_Passa varchar(100),
id_banda int,
FOREIGN KEY (id_banda) REFERENCES Bandes (id_banda)
);

CREATE TABLE Assajos (
id_assaj int PRIMARY KEY AUTO_INCREMENT,
Assajs varchar(30) NOT NULL,
Lloc varchar(30) NOT NULL,
Ubicacio varchar(500),
DiaHora varchar(30) NOT NULL,
Partitures varchar(30) NOT NULL,
Durada int,
id_banda int,
FOREIGN KEY (id_banda) REFERENCES Bandes (id_banda)
);

CREATE TABLE Partitures (
id_partitura int PRIMARY KEY AUTO_INCREMENT,
Titol varchar(50) NOT NULL,
Url varchar(500) NOT NULL,
Observacions varchar(1024),
Dificultat enum('1','2','3','4','5','6'),
Tipus enum('Concert','Passacarrers'),
Publica enum('Si','No'),
id_banda int,
FOREIGN KEY (id_banda) REFERENCES Bandes (id_banda)
);

CREATE TABLE Estudiar (
id_estudiar int PRIMARY KEY AUTO_INCREMENT,
id_usuari int,
id_partitura int,
FOREIGN KEY (id_usuari) REFERENCES Membres (id_membre)
FOREIGN KEY (id_partitura) REFERENCES Partitures (id_partitura)
);

CREATE TABLE Videos (
id_video int PRIMARY KEY AUTO_INCREMENT,
Titol varchar(50) NOT NULL,
Url varchar(400) NOT NULL,
Observacions varchar(1024),
id_partitura int,
id_banda int,
FOREIGN KEY (id_banda) REFERENCES Bandes (id_banda),
FOREIGN KEY (id_partitura) REFERENCES Partitures (id_partitura)
 );

CREATE TABLE Events (
id_event int PRIMARY KEY AUTO_INCREMENT,
Titol varchar(50) NOT NULL,
Imatge varchar(100),
Observacions varchar(1024),
id_banda int,
id_usuari int,
FOREIGN KEY (id_banda) REFERENCES Bandes (id_banda),
FOREIGN KEY (id_usuari) REFERENCES Membres (id_membre)
);

CREATE TABLE Ofertes (
id_oferta  PRIMARY KEY AUTO_INCREMENT,
Titol varchar(50) NOT NULL,
id_banda int NOT NULL,
DiaHora varchar(50),
Instrument varchar(50),
Telefon int,
Observacions varchar(1024),
FOREIGN KEY (id_banda) REFERENCES Bandes (id_banda)
);
