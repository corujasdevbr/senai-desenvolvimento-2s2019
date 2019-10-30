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

INSERT INTO Generos VALUES ('Ação'),('Aventura'),('Suspense'),('Terror')
,('Drama'),('Comédia'),('Bibliografia'),('Auto-ajuda'),('Ficção');

SELECT * FROM Generos;

INSERT INTO Editoras VALUES ('Intrínseca'),('Galera'),('Leya'),('Novo Conceito')
,('Planeta'),('Rocco'),('Globo'),('Arqueiro'),('Suma de Letras');

SELECT * FROM Editoras;

INSERT INTO 
	Livros (Nome, Autor, Genero, Editora) 
VALUES
	('Os Heróis do Olimpo, O Herói Perdido', 'Rick Riordan',9,1)
	,('Percy Jackson e os Olimpianos, O Ladrão de Raios', 'Rick Riordan',9,1)
	,('Harry Potter E a Pedra Filosofal', 'J. K. Rowling',9,6)
	,('Cujo', 'Stephen King',3,9)
	,('A Guerra dos tronos, As Crônicas de Gelo e Fogo', 'George R. R. Martin',9,1)

SELECT * FROM Livros;
