USE ManualPecas
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

SELECT * FROM Pecas;
SELECT * FROM FornecedoresPecas;
SELECT * FROM Fornecedores;
