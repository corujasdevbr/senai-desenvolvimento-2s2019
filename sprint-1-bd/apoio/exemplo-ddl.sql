CREATE DATABASE RoteiroPsales;

USE RoteiroPsales;

CREATE TABLE Cursos
(
    IdCurso     INT PRIMARY KEY IDENTITY
    ,Nome       VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Disciplinas
(
    IdMateria       INT PRIMARY KEY IDENTITY
    ,Nome           VARCHAR(200)
    ,IdCurso        INT FOREIGN KEY REFERENCES Cursos (IdCurso)
);

CREATE TABLE Alunos
(
    IdAluno         INT PRIMARY KEY IDENTITY
    ,Nome           VARCHAR(200) NOT NULL
);

CREATE TABLE CursosAlunos
(
    IdCurso     INT FOREIGN KEY REFERENCES Cursos (IdCurso)
    ,IdAluno    INT FOREIGN KEY REFERENCES Alunos (IdAluno)
);