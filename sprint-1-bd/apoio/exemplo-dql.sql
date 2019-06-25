USE RoteiroPsales;

SELECT C.*, D.* FROM Disciplinas D INNER JOIN Cursos C ON D.IdCurso = C.IdCurso;