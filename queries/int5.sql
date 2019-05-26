.mode columns
.headers on
.nullvalue NULL

--Numero de processos por funcionario, por ordem decrescente

SELECT idHospital, nome, numProc
FROM (SELECT idHospital, count(idProcesso) AS numProc
    FROM Medico LEFT JOIN EncarregueMed USING(idHospital)
    GROUP BY idHospital

    UNION

    SELECT idHospital, count(idProcesso) AS numProc
    FROM Enfermeiro LEFT JOIN EncarregueEnf USING(idHospital)
    GROUP BY idHospital) NATURAL JOIN Funcionario NATURAL JOIN Pessoa
ORDER BY numProc DESC;