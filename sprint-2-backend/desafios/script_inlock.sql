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

INSERT INTO Usuarios VALUES ('administrador@admin.com', 'admin', 'ADMINISTRADOR')
GO

-- selecionar os usuarios
SELECT UsuarioId, Email, Senha, Permissao FROM Usuarios
GO

-- criar a tabela de estudios
CREATE TABLE Estudios (
	EstudioId			INT PRIMARY KEY IDENTITY
	,NomeEstudio		VARCHAR(100) NOT NULL
	,PaisOrigem			VARCHAR(250)
	,DataCriacao		DATETIME NOT NULL DEFAULT(GETDATE())
	,UsuarioId			INT FOREIGN KEY REFERENCES Usuarios (UsuarioId)
)
GO

-- inserir os estudios
INSERT INTO Estudios (NomeEstudio, PaisOrigem, UsuarioId) VALUES ('Blizzard', 'EUA', 1), ('Rockstar Studios', 'EUA', 1),( 'Square Enix', 'EUA', 1)
GO

INSERT INTO Estudios (NomeEstudio, PaisOrigem, UsuarioId, DataCriacao) VALUES ('Est�dio A', 'Brasil', 3, GETDATE()-15),('Est�dio B', 'Brasil', 3, GETDATE()-15),( 'Est�dio C', 'Brasil', 3, GETDATE()-15)
GO

-- selecionar todos os usuarios
SELECT EstudioId, NomeEstudio, PaisOrigem, DataCriacao, UsuarioId FROM Estudios
GO

-- criar a tabela de jogos
CREATE TABLE Jogos (
	JogoId				INT PRIMARY KEY IDENTITY
	,NomeJogo			VARCHAR(50) NOT NULL
	,Descricao			TEXT NOT NULL
	,DataLancamento		DATE NOT NULL
	,Valor				DECIMAL(5,2)
	,EstudioId			INT FOREIGN KEY REFERENCES Estudios(EstudioId)
)
GO

-- inserir os jogos
INSERT INTO Jogos (NomeJogo, Descricao, DataLancamento, Valor, EstudioId) VALUES 
('Diablo 3','� um jogo que cont�m bastante a��o e � viciante, seja voc� um novato ou um f�','2012-05-15', '99.00', 1),
('Red Dead Redemption II','Jogo eletr�nico de a��o-aventura western','2018-10-26', '120.00', 2);

INSERT INTO Jogos (NomeJogo, Descricao, DataLancamento, Valor, EstudioId) VALUES 
('Jogo A','Descricao A','2020-01-10', '100.00', 1)
GO

-- selecionar os jogos
SELECT JogoId, NomeJogo, Descricao, DataLancamento, Valor, EstudioId FROM Jogos
GO

-- Listar todos os usu�rios;
SELECT UsuarioId, Email, Senha, Permissao FROM Usuarios
GO

-- Listar todos os est�dios;
SELECT EstudioId, NomeEstudio, UsuarioId FROM Estudios
GO

-- Listar todos os jogos;
SELECT JogoId, NomeJogo, Descricao, DataLancamento, Valor, EstudioId FROM Jogos
GO

-- Listar todos os jogos e seus respectivos est�dios;
SELECT J.JogoId, J.NomeJogo, J.Descricao, J.DataLancamento, J.Valor, J.EstudioId, E.EstudioId, E.NomeEstudio, E.DataCriacao
	FROM Jogos J
	INNER JOIN Estudios E
	ON J.EstudioId = E.EstudioId
GO

-- Buscar e trazer na lista todos os est�dios, mesmo que eles n�o contenham nenhum jogo de refer�ncia;
SELECT J.JogoId, J.NomeJogo, J.Descricao, J.DataLancamento, J.Valor, J.EstudioId, E.EstudioId, E.NomeEstudio, E.DataCriacao
	FROM Jogos J
	RIGHT JOIN Estudios E
	ON J.EstudioId = E.EstudioId
GO

SELECT J.JogoId, J.NomeJogo, J.Descricao, J.DataLancamento, J.Valor, J.EstudioId, E.EstudioId, E.NomeEstudio, E.DataCriacao
	FROM Estudios E
	LEFT JOIN Jogos J
	ON J.EstudioId = E.EstudioId
GO

-- Buscar um usu�rio por email e senha;
SELECT U.* FROM Usuarios U
WHERE U.Email = 'admin@admin.com' AND U.Senha = 'admin'
GO

-- Buscar um jogo por JogoId;
SELECT JogoId, NomeJogo, Descricao, DataLancamento, Valor, EstudioId FROM Jogos WHERE JogoId = 1
GO

-- Buscar um est�dio por EstudioId;
SELECT EstudioId, NomeEstudio, UsuarioId FROM Estudios WHERE EstudioId = 1
GO
