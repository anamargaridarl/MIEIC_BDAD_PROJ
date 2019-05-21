.mode columns
.headers on
.nullvalue NULL

--Capacidade total de todos os departamentos

SELECT SUM(capacidade)
FROM Departamento
