.mode columns
.headers on

insert into Nascimento(dataNascimento) values('1986-02-21');
insert into Nascimento(dataNascimento) values('1991-03-19');
insert into Nascimento(dataNascimento) values('2015-04-21');
insert into Nascimento(dataNascimento) values('2001-11-21');

insert into Pessoa values(1234567, 'John John', '1986-02-21', 'John Street, 1092, Johnstown', 321654);
insert into Pessoa values(0982123, 'Mary May', '1991-03-19', 'May Road, 123, Maryland', 1109291);
insert into Pessoa values(223564, 'Martha Jones', '2015-04-21', 'Unicorn Avenue, 1564, Marthas Vineyard' , 1145290);
insert into Pessoa values(666546877, 'Steve May', '2001-11-21', 'May Road, 123, Maryland', 21564852);

update Nascimento 
    set idade = (strftime('%Y', 'now') - strftime('%Y', dataNascimento)) - (strftime('%m-%d', 'now') < strftime('%m-%d', dataNascimento));

insert into Utente values(223564, 12215445);
insert into Utente values(666546877, 6665645547);

insert into Funcionario values(0982123, 1);
insert into Medico values('Paediatrics', 1);

insert into Funcionario values(1234567, 2);
insert into Enfermeiro values('Triage', 2);

insert into Processo values(1, 'Routine Appointment', '16:15:00', '16:30:00', 6665645547);

insert into EncarregueMed values(1, 1, '16:15:00', '16:30:00');

-- debug
select * from Nascimento;
select * from Pessoa;
select * from Utente;