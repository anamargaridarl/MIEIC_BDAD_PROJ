.mode columns
.headers on
.nullvalue NULL

--Quais as alergias de cada utente?

SELECT nome, nSaude, nCC, descricao, substancia, nivel
FROM GrauIntolerancia natural join Utente natural join Alergia natural join  (select nome, nCC
                                                                                 from Pessoa);