USE RoteiroPsales;

-- inserção

INSERT INTO Cursos (Nome) VALUES ('Técnico Dev');
INSERT INTO Cursos (Nome) VALUES ('Técnico Redes');

SELECT * FROM Cursos;

INSERT INTO Disciplinas VALUES ('HTML', 1);
INSERT INTO Disciplinas VALUES ('CSS', 1), ('Design', 1), ('Conceito de Redes', 2);

SELECT * FROM Disciplinas;

INSERT INTO Alunos VALUES ('Tadeu'), ('Kevin');

SELECT * FROM Alunos;

INSERT INTO CursosAlunos VALUES (1, 1), (2, 1);

SELECT * FROM CursosAlunos;

-- atualização
UPDATE Cursos SET Nome = 'Técnico em Desenvolvimento de Sistemas'
WHERE IdCurso = 1;

-- deleção
DELETE FROM Disciplinas WHERE IdMateria = 3;