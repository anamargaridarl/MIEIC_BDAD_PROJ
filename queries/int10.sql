.mode columns
.headers on
.nullvalue NULL

--  Enfermeiros que trabalharam todos os dias de uma semana
SELECT idHospital, count(data)
FROM Funcionario NATURAL JOIN Data NATURAL JOIN Agenda
GROUP BY idHospital;