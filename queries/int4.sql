.mode columns
.headers on
.nullvalue NULL

--Media de tempo em processos ja terminados por tipo de processo

SELECT AVG((strftime('%s',dataSaida) - strftime('%s', dataEntrada))/ 3600) AS Averagetimehours
FROM Processo
WHERE (dataSaida IS NOT NULL)