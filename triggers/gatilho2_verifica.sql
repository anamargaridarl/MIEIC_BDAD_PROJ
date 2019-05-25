PRAGMA foreign_keys = ON;

INSERT INTO Departamento values(8, 2, 'Urgencia', 2); --Departamento com 2 vagas

SELECT * FROM Departamento WHERE idDepartamento=8;
INSERT INTO ProcessoDepartamento values(1,8);
SELECT * FROM Departamento NATURAL JOIN ProcessoDepartamento WHERE idDepartamento=8;
INSERT INTO ProcessoDepartamento values(2,8);
SELECT * FROM Departamento NATURAL JOIN ProcessoDepartamento WHERE idDepartamento=8;
--Notar que o idProcesso 3 nao e inserido em ProcessoDepartamento por causa do erro gerado pelo trigger
INSERT INTO ProcessoDepartamento values(3,8);
SELECT * FROM Departamento NATURAL JOIN ProcessoDepartamento WHERE idDepartamento=8;

DELETE FROM ProcessoDepartamento WHERE idProcesso=1 AND idDepartamento=8;
SELECT * FROM Departamento NATURAL JOIN ProcessoDepartamento WHERE idDepartamento=8;
DELETE FROM ProcessoDepartamento WHERE idProcesso=2 AND idDepartamento=8;
SELECT * FROM Departamento WHERE idDepartamento=8;

DELETE FROM Departamento WHERE idDepartamento = 8; --Desfaz todas as alterações