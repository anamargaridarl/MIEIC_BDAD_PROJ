.mode columns
.headers on
.nullvalue NULL

--Capacidade total do hospital

SELECT SUM(capacidade)
FROM Departamento
