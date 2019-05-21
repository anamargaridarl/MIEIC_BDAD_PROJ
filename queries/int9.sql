.mode columns
.headers on
.nullvalue NULL

-- Quais os médicos disponíveis (i.e. que não se encontram encarregues de nenhum processo) num certo dia e hora?
select * 
from Agenda, 
    (select idHospital, idAgenda 
    from Data 
    where idHospital not in (select idHospital from EncarregueMed) and data = '2019-04-15') as agendas
on Agenda.idAgenda=agendas.idAgenda;