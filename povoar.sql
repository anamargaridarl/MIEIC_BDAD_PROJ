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
insert into Nascimento(dataNascimento) values('1990-12-24');
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
insert into Pessoa values(706332, 'Pamela Jones', '1990-12-24', '2412 Christmas Lane, North Pole, San Jose', 989989);


insert into Funcionario(nCC) values(188472);
insert into Funcionario(nCC) values(321017);
insert into Funcionario(nCC) values(268430);
insert into Funcionario(nCC) values(706332);

insert into Medico(especialidade) values('Pediatria');
insert into Medico(especialidade) values('Cardiologia');
insert into Medico(especialidade) values('Estomatologia');
insert into Medico(especialidade) values('Estomatologia');

-- -- Enfermeiros
insert into Pessoa values(180754, 'Bridget Blair', '1994-12-21', '222 Station Road, Pensacola', 987987);
insert into Pessoa values(205691, 'Karen Glover', '1985-06-05', '333 Bell Lane, Springfield', 786786);
insert into Pessoa values(186694, 'Manuel Schneider', '1976-01-11', '321 Connaught Road, Warner Springs', 555555);

insert into Funcionario(nCC) values(180754);
insert into Funcionario(nCC) values(205691);
insert into Funcionario(nCC) values(186694);

insert into Enfermeiro values('Vacinacao', 5);
insert into Enfermeiro(especialidade) values('Triagem');
insert into Enfermeiro(especialidade) values('Verificar valores vitais');

-- Database age calculation
update Nascimento 
    set idade = (strftime('%Y', 'now') - strftime('%Y', dataNascimento)) - (strftime('%m-%d', 'now') < strftime('%m-%d', dataNascimento));


-- Alergias
insert into Alergia values('Penicilina','Alergia a substancia');
insert into Alergia values('Polen','Sinusite');
insert into Alergia values('Sol','Dermatite alergica');

insert into GrauIntolerancia values(1,'Penicilina',5);
insert into GrauIntolerancia values(2,'Polen',2);
insert into GrauIntolerancia values(3,'Sol',1);

-- Agenda
insert into Agenda(horaEntrada,horaSaida) values('10:00','18:00');
insert into Agenda(horaEntrada,horaSaida) values('08:00','15:00');
insert into Agenda(horaEntrada,horaSaida) values('20:00','00:00'); -- o check falha porque 00:00 vem antes de 20:00
insert into Agenda(horaEntrada,horaSaida) values('08:30','16:00');
insert into Agenda(horaEntrada,horaSaida) values('16:00','20:00');
insert into Agenda(horaEntrada,horaSaida) values('18:00','23:00');
insert into Agenda(horaEntrada,horaSaida) values('09:00','17:00');
insert into Agenda(horaEntrada,horaSaida) values('12:00','19:00');
insert into Agenda(horaEntrada) values('22:00');
insert into Agenda(horaEntrada) values('23:00');


-- Data

insert into Data values(1,'2019-04-15',1);
insert into Data values(1,'2019-04-16',2);
insert into Data values(1,'2019-04-17',4);
insert into Data values(1,'2019-04-18',3);
insert into Data values(1,'2019-04-20',5);
insert into Data values(1,'2019-04-21',8);

insert into Data values(2,'2019-04-15',4);
insert into Data values(2,'2019-04-16',4);
insert into Data values(2,'2019-04-17',4);
insert into Data values(2,'2019-04-18',4);
insert into Data values(2,'2019-04-19',4);

insert into Data values(3,'2019-04-15',5);
insert into Data values(3,'2019-04-16',8);
insert into Data values(3,'2019-04-17',9);
insert into Data values(3,'2019-04-18',1);
insert into Data values(3,'2019-04-20',2);

insert into Data values(4,'2019-04-15',2);
insert into Data values(4,'2019-04-16',2);
insert into Data values(4,'2019-04-17',2);
insert into Data values(4,'2019-04-18',2);
insert into Data values(4,'2019-04-19',2);
insert into Data values(4,'2019-04-20',2);

insert into Data values(5,'2019-04-15',5);
insert into Data values(5,'2019-04-16',6);
insert into Data values(5,'2019-04-17',6);
insert into Data values(5,'2019-04-18',5);
insert into Data values(5,'2019-04-19',3);
insert into Data values(5,'2019-04-21',3);

insert into Data values(6,'2019-04-15',4);
insert into Data values(6,'2019-04-16',4);
insert into Data values(6,'2019-04-17',4);
insert into Data values(6,'2019-04-18',4);
insert into Data values(6,'2019-04-19',4);
insert into Data values(6,'2019-04-20',4);

--Medicamento
insert into Farmaco values ('Paracetamol', 'Analgesico');
insert into Farmaco values ('Amoxicilina', 'Antibiotico');
insert into Farmaco values ('Ibuprofeno', 'Anti-inflamatorio');
insert into Farmaco values ('Espironolactona', 'Diuretico');
insert into Farmaco values ('Saccharomyces boulardii', 'Microbiota Intestinal');

insert into Medicamento values(1,'Ben-U-Ron','bene', 'Paracetamol');
insert into Medicamento values(2,'Augmentin Duo','GlaxoSmithKline', 'Amoxicilina');
insert into Medicamento values(3,'Brufen','Abbot', 'Ibuprofeno');
insert into Medicamento values(4,'Espironolactona','Alter', 'Espironolactona');
insert into Medicamento values(5,'UL-250','MERCK', 'Saccharomyces boulardii');


-- Departamentos
insert into Departamento values(1, 150, "Medicina Geral");
insert into Departamento values(2, 50, "Pediatria");
insert into Departamento values(3, 40, "Cardiologia");
insert into Departamento values(4, 20, "Medicina Nuclear");
insert into Departamento values(5, 20, "Estomatologia");

-- Trabalha
insert into Trabalha values(2,1);
insert into Trabalha values(3,2);
insert into Trabalha values(5,3);
insert into Trabalha values(5,4);
insert into Trabalha values(1,5);
insert into Trabalha values(4,6);
insert into Trabalha values(2,7);


-- debug, remove before sending
select * from Nascimento;
select * from Pessoa;
select * from Utente;
select * from Funcionario;
select * from Medico;
select * from Enfermeiro;
select * from Alergia;
select * from GrauIntolerancia;
select * from Data;
select * from Agenda;
select * from Medicamento;
select * from Farmaco;
select * from Departamento;
select * from Trabalha;



