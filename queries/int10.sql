.mode columns
.headers on
.nullvalue NULL

--  Enfermeiros que trabalharam todos os dias da semana de '2019-04-15' a '2019-04-21'
CREATE VIEW diasDaSemana AS
SELECT DISTINCT data
FROM Data
WHERE strftime('%Y-%m-%d',data) >= '2019-04-15' AND strftime('%Y-%m-%d',data) <= '2019-04-21';

CREATE VIEW quemTrabalhouNaSemana AS
SELECT DISTINCT idHospital
FROM Data
WHERE strftime('%Y-%m-%d',data) >= '2019-04-15' AND strftime('%Y-%m-%d',data) <= '2019-04-21';

CREATE VIEW quemFalhouPeloMenosUmDia AS
SELECT idHospital, Data
FROM (diasDaSemana, quemTrabalhouNaSemana) AS Tab1
WHERE NOT EXISTS (SELECT idHospital, data
                        FROM Data AS D1
                        WHERE D1.idHospital=Tab1.idHospital AND D1.data=Tab1.data);

SELECT DISTINCT idHospital, nome, telefone
FROM Pessoa NATURAL JOIN Funcionario NATURAL JOIN Enfermeiro NATURAL JOIN Data
WHERE strftime('%Y-%m-%d',data) >= '2019-04-15' AND strftime('%Y-%m-%d',data) <= '2019-04-21' AND 
        idHospital NOT IN (SELECT idHospital FROM quemFalhouPeloMenosUmDia);

DROP VIEW quemFalhouPeloMenosUmDia;
DROP VIEW diasDaSemana;
DROP VIEW quemTrabalhouNaSemana;