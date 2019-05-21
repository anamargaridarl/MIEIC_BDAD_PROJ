.mode columns
.headers on
.nullvalue NULL

SELECT *
FROM GrauIntolerancia natural join Utente natural join Alergia natural join  (select nome, nCC
                                                                                 from Pessoa)



