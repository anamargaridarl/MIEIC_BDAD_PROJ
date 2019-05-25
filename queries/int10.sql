.mode columns
.headers on
.nullvalue NULL

--  Enfermeiros que trabalharam todos os dias de uma semana

-- SELECT DISTINCT data
-- FROM Data D2
-- WHERE strftime('%Y-%m-%d',data) >= '2019-04-15' AND strftime('%Y-%m-%d',data) <= '2019-04-21';

-- SELECT *
-- FROM Funcionario
-- WHERE idHospital NOT IN (
                        SELECT *
                        FROM Data D1
                        WHERE NOT EXISTS (SELECT DISTINCT data
                                        FROM (SELECT DISTINCT data
                                                FROM Data
                                                WHERE strftime('%Y-%m-%d',data) >= '2019-04-15' AND strftime('%Y-%m-%d',data) <= '2019-04-21') AS D2
                                        WHERE D1.data<>D2.data);