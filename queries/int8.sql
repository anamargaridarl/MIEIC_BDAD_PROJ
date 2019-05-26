.mode columns
.headers on
.nullvalue NULL

--Numero de ocorrencias e duracao total de cada tratamento entre '2019-01-01' e '2019-04-15'

SELECT descricao, count(*) AS contagem, sum(duracao) AS duracaoTotal
FROM Resulta NATURAL JOIN Tratamento NATURAL JOIN Processo
WHERE strftime('%Y-%m-%d', dataEntrada) > '2019-01-01' AND (strftime('%Y-%m-%d', dataSaida) < '2019-04-15' OR dataSaida IS NULL)
GROUP BY descricao;