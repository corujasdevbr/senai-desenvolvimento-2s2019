CREATE DATABASE Optus;

USE Optus;

CREATE TABLE Estilos 
(
    IdEstilo    INT IDENTITY PRIMARY KEY
    ,Nome       VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE Artistas 
(
    IdArtista   INT IDENTITY PRIMARY KEY
    ,Nome       VARCHAR(250) NOT NULL UNIQUE
    ,IdEstilo   INT FOREIGN KEY REFERENCES Estilos (IdEstilo)
);

CREATE TABLE Albuns
(
    IdAlbum         INT IDENTITY PRIMARY KEY
    ,Nome           VARCHAR(250) NOT NULL UNIQUE
    ,DataLancamento DATE
    ,Localizacao    VARCHAR(200)
    ,QtdMinutos     BIGINT
    ,Ativo          BIT NOT NULL DEFAULT(1)
    ,IdArtista      INT FOREIGN KEY REFERENCES Artistas (IdArtista)
);

CREATE TABLE Usuarios 
(
    IdUsuario       INT IDENTITY PRIMARY KEY
    ,Nome           VARCHAR(250) NOT NULL
    ,Email          VARCHAR(250) NOT NULL UNIQUE
    ,Senha          VARCHAR(250) NOT NULL
    ,Permissao      VARCHAR(200)
);

INSERT INTO Estilos (Nome) VALUES ('Rock'), ('Pop'), ('Eletrônico');
INSERT INTO Estilos (Nome) VALUES ('Metal');
SELECT * FROM Estilos;

INSERT INTO Artistas (Nome, IdEstilo) VALUES ('Angra', 4), ('Madonna', 2), ('Shaman', 4);
SELECT * FROM Artistas;
SELECT E.*, A.* FROM Estilos E INNER JOIN Artistas A ON E.IdEstilo = A.IdEstilo;

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, Ativo, IdArtista) VALUES ('Holy Land', GETDATE(), 'Brasil', 57, 1, 1);
INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, Ativo, IdArtista) VALUES ('MDNA', GETDATE(), 'EUA', 75, 0, 2);
SELECT * FROM Albuns;
SELECT AL.*, AR.* FROM Albuns AL INNER JOIN Artistas AR ON AL.IdArtista = AR.IdArtista;

INSERT INTO Usuarios (Nome, Email, Senha, Permissao) VALUES ('Administrador', 'admin@email.com', '123456', 'ADMINISTRADOR'), ('Artista', 'artista@email.com', '123456', 'ARTISTA');
SELECT * FROM Usuarios;