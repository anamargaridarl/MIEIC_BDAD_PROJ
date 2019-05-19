.mode columns
.headers on
.nullvalue NULL

--Processo mais longo em cada departamento

SELECT MAX((strftime('%s',dataSaida) - strftime('%s', dataEntrada))/ 3600) AS MAXI, idDepartamento
FROM(
SELECT dataEntrada,dataSaida, idProcesso, idDepartamento
FROM Processo natural join ProcessoDepartamento
WHERE (dataSaida IS NOT NULL))
GROUP BY idDepartamento