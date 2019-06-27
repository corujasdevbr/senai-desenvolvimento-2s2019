CREATE DATABASE RoteiroSstop;

USE RoteiroSstop;

CREATE TABLE Estilos
(
    IdEstilo    INT PRIMARY KEY IDENTITY
    ,Nome       VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Artistas
(
    IdArtista     INT PRIMARY KEY IDENTITY
    ,Nome		  VARCHAR(200) UNIQUE
    ,IdEstilo     INT FOREIGN KEY REFERENCES Estilos (IdEstilo)
);

SELECT * FROM Estilos;

INSERT INTO Estilos VALUES ('Folk');
INSERT INTO Artistas VALUES ('Stu Larsen', 4);

SELECT * FROM ARTISTAS;