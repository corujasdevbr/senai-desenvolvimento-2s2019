USE Gufos;

----------------------------- FUNCOES USUARIO -----------------------------

-- as funções cada vez que forem executadas, eles "reexecutam"

-- Listar usuários sem a senha correspondente
SELECT IdUsuario, Nome, Email, Permissao FROM Usuarios;

-- apenas select, oferecem um retorno, necessariamente, e não utilizam dados que irão alterar os estados de qualquer item
CREATE FUNCTION ListarUsuarios
(
)
RETURNS TABLE
AS
RETURN SELECT IdUsuario, Nome, Email, Permissao FROM Usuarios

-- select de listar usuários sem conhecer sua implementação
SELECT * FROM ListarUsuarios();


----------------------------- FUNCOES NATIVAS -----------------------------

SELECT COUNT(*) FROM Categorias;
SELECT COUNT(*) AS QtdCategorias FROM Categorias;



----------------------------- STORED PROCEDURES -----------------------------


--Criar um SP (Stored Procedure)
CREATE PROCEDURE SelecionarTodasPessoas -- Nome da procedure
AS
SELECT * FROM PESSOAS -- Consulta

EXEC SelecionarTodasPessoas; -- Executar Procedure


--Com declaração de variável
CREATE PROCEDURE BuscarNome
@Nome VARCHAR(250)
AS
SELECT NOME FROM PESSOAS WHERE NOME = @Nome -- Utilizando variável como filtro para a consulta

EXEC BuscarNome 'Jefferson'


--Com Id
CREATE PROCEDURE BuscarPorId @IDRECEBIDO INT
AS
SELECT NOME, CPF FROM PESSOAS WHERE ID = @IDRECEBIDO

EXEC BuscarPorId 2


--Deletar Procedure
DROP PROCEDURE BuscarPorId


--Alterando Stored Procedure
ALTER PROCEDURE BuscarPorId
@IDRECEBIDO INT
AS
BEGIN
SELECT NOME FROM PESSOAS WHERE ID = @IDRECEBIDO
END

EXEC BuscarPorId 2
BuscarPorId 2 
GO
