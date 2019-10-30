CREATE DATABASE Books;
USE Books;

CREATE TABLE Editoras(
	EditoraID INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Generos(
	GeneroID INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Livros(
	LivroID INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(255) NOT NULL UNIQUE,
	Autor VARCHAR (255) NOT NULL,
	Genero INT FOREIGN KEY REFERENCES Generos(GeneroID),
	Editora INT FOREIGN KEY REFERENCES Editoras(EditoraID)
);

INSERT INTO Generos VALUES ('A��o'),('Aventura'),('Suspense'),('Terror')
,('Drama'),('Com�dia'),('Bibliografia'),('Auto-ajuda'),('Fic��o');

SELECT * FROM Generos;

INSERT INTO Editoras VALUES ('Intr�nseca'),('Galera'),('Leya'),('Novo Conceito')
,('Planeta'),('Rocco'),('Globo'),('Arqueiro'),('Suma de Letras');

SELECT * FROM Editoras;

INSERT INTO 
	Livros (Nome, Autor, Genero, Editora) 
VALUES
	('Os Her�is do Olimpo, O Her�i Perdido', 'Rick Riordan',9,1)
	,('Percy Jackson e os Olimpianos, O Ladr�o de Raios', 'Rick Riordan',9,1)
	,('Harry Potter E a Pedra Filosofal', 'J. K. Rowling',9,6)
	,('Cujo', 'Stephen King',3,9)
	,('A Guerra dos tronos, As Cr�nicas de Gelo e Fogo', 'George R. R. Martin',9,1)

SELECT * FROM Livros;
