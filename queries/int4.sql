.mode columns
.headers on
.nullvalue NULL

--Duracao media dos processos finalizados

SELECT AVG((strftime('%s',dataSaida) - strftime('%s', dataEntrada))/ 3600) AS Averagetimehours
FROM Processo
WHERE (dataSaida IS NOT NULL)