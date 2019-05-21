.mode columns
.headers on
.nullvalue NULL

--Processo mais longo em cada departamento

SELECT idDepartamento,idProcesso, tipoProcesso, MAX((strftime('%s',dataSaida) - strftime('%s', dataEntrada))/ 60) AS DurationMin
FROM(
SELECT *
FROM Processo natural join ProcessoDepartamento
WHERE (dataSaida IS NOT NULL))
GROUP BY idDepartamento