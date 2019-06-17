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