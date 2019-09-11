CREATE DATABASE ManualPecas;
--CREATE DATABASE M_ManualPecas;
--CREATE DATABASE T_ManualPecas;

USE ManualPecas

CREATE TABLE Fornecedores(
	FornecedorId INT PRIMARY KEY IDENTITY NOT NULL,
	Senha VARCHAR(100) NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	CNPJ CHAR(18) UNIQUE NOT NULL
);

CREATE TABLE Pecas(
	PecaId INT PRIMARY KEY IDENTITY NOT NULL,
	Codigo VARCHAR(255) UNIQUE NOT NULL,
	Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE FornecedoresPecas(
	FornecedorId INT FOREIGN KEY REFERENCES Fornecedores(FornecedorId),
	PecaId INT FOREIGN KEY REFERENCES Pecas(PecaId),
	Preco FLOAT(2) NOT NULL
);

INSERT INTO Fornecedores (Nome, CNPJ, Senha)
VALUES ('Fornecedor A', '12.345.678/0001-90', '123456');
INSERT INTO Fornecedores (Nome, CNPJ,Senha)
VALUES ('Fornecedor B', '09.876.543/0001-21', '123456');

INSERT INTO Pecas (Codigo, Descricao) 
VALUES ('123','Peça A');
INSERT INTO Pecas (Codigo, Descricao) 
VALUES ('321','Peça B');

INSERT INTO FornecedoresPecas (FornecedorId, PecaId, Preco) VALUES (2,1, 21);
INSERT INTO FornecedoresPecas (FornecedorId, PecaId, Preco) VALUES (2,2, 25);
INSERT INTO FornecedoresPecas (FornecedorId, PecaId, Preco) VALUES (3,1, 20);
INSERT INTO FornecedoresPecas (FornecedorId, PecaId, Preco) VALUES (3,2, 20);


CREATE PROCEDURE prListaMaisBarato @PecaId INT AS
	SELECT 
		F.*, P.*, FP.Preco
		FROM Fornecedores F
		JOIN FornecedoresPecas FP
		ON F.FornecedorId = FP.FornecedorId
		JOIN Pecas P
		ON FP.PecaId = P.PecaId
		AND P.PecaId = @PecaId AND FP.Preco = (
			select MIN (preco) 
			from FornecedoresPecas FP
			where FP.PecaId = @PecaId
		);

EXEC prListaMaisBarato 2

CREATE PROCEDURE prAdicionaERetornaPeca @Codigo VARCHAR(255), @Descricao VARCHAR(255), @FornecedorId INT, @Preco FLOAT(2) AS
	INSERT INTO 
		Pecas (Codigo, Descricao) 
	VALUES 
		(@Codigo, @Descricao);

	DECLARE @PecaId INT;
	SELECT @PecaId = P.PecaId 
		FROM Pecas P 
		WHERE P.Codigo = @Codigo;

	INSERT INTO 
		FornecedoresPecas (FornecedorId, PecaId, Preco) 
	VALUES (@FornecedorId, @PecaId, @Preco);

EXEC prAdicionaERetornaPeca '1', 'Peça D',10, 20.0




SELECT * FROM Fornecedores
SELECT * FROM FornecedoresPecas
SELECT * FROM Pecas

SELECT 
	F.FornecedorId, F.CNPJ, F.Nome,
	P.PecaId, P.Codigo, P.Descricao
FROM Fornecedores F
JOIN FornecedoresPecas FP
ON F.FornecedorId = FP.FornecedorId
JOIN Pecas P 
ON FP.PecaId = P.PecaId