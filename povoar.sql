-- remove this block before sending
.read criar.sql
.mode columns
.headers on
-- this block ^

PRAGMA foreign_keys = ON;

insert into Nascimento(dataNascimento) values('1958-10-06');
insert into Nascimento(dataNascimento) values('1976-01-11');
insert into Nascimento(dataNascimento) values('1985-06-05');
insert into Nascimento(dataNascimento) values('1986-02-21');
insert into Nascimento(dataNascimento) values('1987-02-05');
insert into Nascimento(dataNascimento) values('1991-03-19');
insert into Nascimento(dataNascimento) values('1994-12-21');
insert into Nascimento(dataNascimento) values('2001-11-21');
insert into Nascimento(dataNascimento) values('2015-04-21');

-- Utentes 
-- Pessoa(nCC, nome, dataNascimento, morada, telefone)
insert into Pessoa values(218594, 'John John', '1986-02-21', 'John Street, 1092, Johnstown', 321654);
insert into Pessoa values(178444, 'Mary May', '1991-03-19', 'May Road, 123, Maryland', 1109291);
insert into Pessoa values(172607, 'Martha Jones', '2015-04-21', 'Unicorn Avenue, 1564, Marthas Vineyard' , 1145290);
insert into Pessoa values(348740, 'Steve May', '2001-11-21', 'May Road, 123, Maryland', 21564852);

insert into Utente(nCC) values(218594);
insert into Utente(nCC) values(178444);
insert into Utente(nCC) values(172607);
insert into Utente(nCC) values(348740);

-- Funcionarios

-- -- Medicos
insert into Pessoa values(188472, 'Jacob Ruiz', '1987-02-05', '1 Infinite Loop, Cupertino', 123123);
insert into Pessoa values(321017, 'Lola Lol', '1986-02-21', '123 Dean Road, San Jose', 456456);
insert into Pessoa values(268430, 'Charles Smith', '1958-10-06', '1337 The Glade, Marina, San Francisco', 789789);

insert into Funcionario(nCC) values(188472);
insert into Funcionario(nCC) values(321017);
insert into Funcionario(nCC) values(268430);

insert into Medico(especialidade) values('Paediatrics');
insert into Medico(especialidade) values('Cardiology');
insert into Medico(especialidade) values('Stomatology');

-- -- Enfermeiros
insert into Pessoa values(180754, 'Bridget Blair', '1994-12-21', '222 Station Road, Pensacola', 987987);
insert into Pessoa values(205691, 'Karen Glover', '1985-06-05', '333 Bell Lane, Springfield', 786786);
insert into Pessoa values(186694, 'Manuel Schneider', '1976-01-11', '321 Connaught Road, Warner Springs', 555555);

insert into Funcionario(nCC) values(180754);
insert into Funcionario(nCC) values(205691);
insert into Funcionario(nCC) values(186694);

insert into Enfermeiro(especialidade, idHospital) select 'Vaccinations', MAX(idHospital) - (select COUNT(*) from Medico) + 1 from Funcionario;
insert into Enfermeiro(especialidade) values('General helping');
insert into Enfermeiro(especialidade) values('Vitals keeping');


-- Database age calculation
update Nascimento 
    set idade = (strftime('%Y', 'now') - strftime('%Y', dataNascimento)) - (strftime('%m-%d', 'now') < strftime('%m-%d', dataNascimento));




-- debug, remove before sending
select * from Nascimento;
select * from Pessoa;
select * from Utente;
select * from Funcionario;
select * from Medico;
select * from Enfermeiro;