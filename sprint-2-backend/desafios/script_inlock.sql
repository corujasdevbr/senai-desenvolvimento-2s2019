CREATE DATABASE InLock
GO

USE InLock
GO

-- criar tabela de usuario
CREATE TABLE Usuarios (
	UsuarioId		INT PRIMARY KEY IDENTITY
	,Email			VARCHAR(100) NOT NULL UNIQUE
	,Senha			VARCHAR(100) NOT NULL
	,Permissao		VARCHAR(50) NOT NULL
)
GO

-- inserir os usuarios conforme problema
INSERT INTO Usuarios VALUES ('admin@admin.com', 'admin', 'ADMINISTRADOR'), ('cliente@cliente.com', 'cliente', 'CLIENTE')
GO

-- selecionar os usuarios
SELECT UsuarioId, Email, Senha, Permissao FROM Usuarios
GO

-- criar a tabela de estudios
CREATE TABLE Estudios (
	EstudioId			INT PRIMARY KEY IDENTITY
	,NomeEstudio		VARCHAR(100) NOT NULL
	,DataCriacao		DATETIME NOT NULL DEFAULT(GETDATE())
	,UsuarioId			INT FOREIGN KEY REFERENCES Usuarios (UsuarioId)
)
GO

-- inserir os estudios
INSERT INTO Estudios (NomeEstudio, UsuarioId) VALUES ('Blizzard', 1), ('Rockstar Studios', 1),( 'Square Enix', 1)
GO

-- selecionar todos os usuarios
SELECT EstudioId, NomeEstudio, UsuarioId FROM Estudios
GO

CREATE TABLE Jogos (
	JogoId				INT PRIMARY KEY IDENTITY
	,NomeJogo			VARCHAR(50) NOT NULL
	,Descricao			TEXT NOT NULL
	,DataLancamento		DATE NOT NULL
	,Valor				DECIMAL(5,2)
	,EstudioId			INT FOREIGN KEY REFERENCES Estudios(EstudioId)
)
GO

INSERT INTO Jogos (NomeJogo, Descricao, DataLancamento, Valor, EstudioId) VALUES 
('Diablo 3','É um jogo que contém bastante ação e é viciante, seja você um novato ou um fã','2012-05-15', '99.00', 1),
('Red Dead Redemption II','Jogo eletrônico de ação-aventura western','2018-10-26', '120.00', 2);
