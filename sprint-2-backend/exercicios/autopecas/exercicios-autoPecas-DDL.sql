CREATE DATABASE AutoPecas;

USE AutoPecas;

CREATE TABLE Fornecedores(
	IdFornecedores INT PRIMARY KEY IDENTITY
	, CNPJ VARCHAR(18) NOT NULL UNIQUE
	, RazaoSocial VARCHAR(255)NOT NULL UNIQUE
	, NomeFantasia VARCHAR(255)NOT NULL UNIQUE
	, Email VARCHAR(255) NOT NULL UNIQUE
	, Telefone VARCHAR(25)
	, Endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Pecas(
	IdPeca INT PRIMARY KEY IDENTITY
	, CodigoPeca VARCHAR(255) NOT NULL UNIQUE
	, Descricao TEXT
	, Peso FLOAT(2) NOT NULL
	, PrecoCusto FLOAT(2) NOT NULL
	, PrecoVenda FLOAT(2) NOT NULL
	, IdFornecedor INT FOREIGN KEY REFERENCES Fornecedores(IdFornecedores) NOT NULL
);

CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY
	, Email VARCHAR(255) NOT NULL UNIQUE
	, Senha VARCHAR(50) NOT NULL
	, Permiss�o VARCHAR(20) NOT NULL
);