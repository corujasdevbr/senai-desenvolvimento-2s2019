USE Gufos;

----------------------------- FUNCOES USUARIO -----------------------------

-- as fun��es cada vez que forem executadas, eles "reexecutam"

-- Listar usu�rios sem a senha correspondente
SELECT IdUsuario, Nome, Email, Permissao FROM Usuarios;

-- apenas select, oferecem um retorno, necessariamente, e n�o utilizam dados que ir�o alterar os estados de qualquer item
CREATE FUNCTION ListarUsuarios
(
)
RETURNS TABLE
AS
RETURN SELECT IdUsuario, Nome, Email, Permissao FROM Usuarios

-- select de listar usu�rios sem conhecer sua implementa��o
SELECT * FROM ListarUsuarios();


----------------------------- FUNCOES NATIVAS -----------------------------

SELECT COUNT(*) FROM Categorias;
SELECT COUNT(*) AS QtdCategorias FROM Categorias;

SELECT LEN(NOME) AS QtdCaracteres, Nome
FROM Categorias  
WHERE IdCategoria = 1;

------------------------------------------------------- SUBSTITUI O VALOR DA CADEIA DE CARACTERES ESPECIFICADO POR OUTRO VALOR
SELECT REPLACE('O SENAI � Roxo','Roxo','Vermelho');

------------------------------------------------------REMOVE OS CARACTERES DE ESPA�O OU OUTROS CARACTERES ESPECIFICADOS DO INICIO OU FINAL
SELECT TRIM('    Livro Vol. 1    ') AS Resultado;


----------------------------- STORED PROCEDURES -----------------------------


--Criar um SP (Stored Procedure)
CREATE PROCEDURE SelecionarTodasPessoas -- Nome da procedure
AS
SELECT * FROM PESSOAS -- Consulta

EXEC SelecionarTodasPessoas; -- Executar Procedure


--Com declara��o de vari�vel
CREATE PROCEDURE BuscarNome
@Nome VARCHAR(250)
AS
SELECT NOME FROM PESSOAS WHERE NOME = @Nome -- Utilizando vari�vel como filtro para a consulta

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
