.mode columns
.headers on
.nullvalue NULL

-- Quais os médicos disponíveis (i.e. que não se encontram encarregues de nenhum processo) no dia '2019-04-15' a partir das '16:00'?

select Pessoa.*
from Pessoa, Funcionario, Agenda, 
    (select idHospital, idAgenda 
    from Data 
    where idHospital not in (select idHospital from EncarregueMed) and data='2019-04-15') as agendas
on Agenda.idAgenda=agendas.idAgenda and Funcionario.idHospital=agendas.idHospital and Pessoa.nCC=Funcionario.nCC
where horaSaida > '16:00';