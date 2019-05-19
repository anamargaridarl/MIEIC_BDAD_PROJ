.mode columns
.headers on
.nullvalue NULL

--Media de tempo em processos ja terminados

SELECT AVG((strftime('%s',dataSaida) - strftime('%s', dataEntrada))/ 3600) AS Averagetimehours
FROM Processo
WHERE (dataSaida IS NOT NULL)