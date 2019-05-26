PRAGMA foreign_keys = ON;

insert into Nascimento(dataNascimento) values('1958-10-06');
insert into Nascimento(dataNascimento) values('1976-01-11');
insert into Nascimento(dataNascimento) values('1985-06-05');
insert into Nascimento(dataNascimento) values('1986-02-21');
insert into Nascimento(dataNascimento) values('1987-02-05');
insert into Nascimento(dataNascimento) values('1987-11-26');
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

insert into Utente values(218594, 120369);
insert into Utente values(178444, 250168);
insert into Utente values(172607, 100137);
insert into Utente values(348740, 200852);

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
insert into Medico(especialidade) values('Medicina Nuclear');

-- -- Enfermeiros
insert into Pessoa values(180754, 'Bridget Blair', '1994-12-21', '222 Station Road, Pensacola', 987987);
insert into Pessoa values(205691, 'Karen Glover', '1985-06-05', '333 Bell Lane, Springfield', 786786);
insert into Pessoa values(186694, 'Manuel Schneider', '1976-01-11', '321 Connaught Road, Warner Springs', 555555);
insert into Pessoa values(192718, 'Kara Portland', '1987-11-26', '102 W 200 N, Aurora City, Utah', 625478);

insert into Funcionario(nCC) values(180754);
insert into Funcionario(nCC) values(205691);
insert into Funcionario(nCC) values(186694);
insert into Funcionario(nCC) values(192718);

insert into Enfermeiro values('Vacinacao', 5);
insert into Enfermeiro(especialidade) values('Triagem');
insert into Enfermeiro(especialidade) values('Verificar valores vitais');
insert into Enfermeiro(idHospital) values(8);

-- Database age calculation
update Nascimento 
    set idade = (strftime('%Y', 'now') - strftime('%Y', dataNascimento)) - (strftime('%m-%d', 'now') < strftime('%m-%d', dataNascimento));


-- Alergias
insert into Alergia values('Penicilina','Alergia a substancia');
insert into Alergia values('Polen','Sinusite');
insert into Alergia values('Sol','Dermatite alergica');

insert into GrauIntolerancia values(120369,'Penicilina',5);
insert into GrauIntolerancia values(200852,'Polen',2);
insert into GrauIntolerancia values(120369,'Sol',1);

-- Agenda
insert into Agenda(horaEntrada,horaSaida) values('10:00','18:00');
insert into Agenda(horaEntrada,horaSaida) values('08:00','15:00');
insert into Agenda(horaEntrada,horaSaida) values('20:00','03:00');
insert into Agenda(horaEntrada,horaSaida) values('08:30','16:00');
insert into Agenda(horaEntrada,horaSaida) values('16:00','20:00');
insert into Agenda(horaEntrada,horaSaida) values('18:00','23:00');
insert into Agenda(horaEntrada,horaSaida) values('09:00','17:00');
insert into Agenda(horaEntrada,horaSaida) values('12:00','19:00');
insert into Agenda(horaEntrada,horaSaida) values('00:00','07:00');
insert into Agenda(horaEntrada,horaSaida) values('05:30','12:30');


-- Data
insert into Data values(1,'2019-04-14',1);
insert into Data values(1,'2019-04-15',1);
insert into Data values(1,'2019-04-16',2);
insert into Data values(1,'2019-04-17',4);
insert into Data values(1,'2019-04-18',6);
insert into Data values(1,'2019-04-19',3);
insert into Data values(1,'2019-04-20',5);
insert into Data values(1,'2019-04-21',8);

insert into Data values(2,'2019-04-15',4);
insert into Data values(2,'2019-04-16',4);
insert into Data values(2,'2019-04-17',4);
insert into Data values(2,'2019-04-18',4);
insert into Data values(2,'2019-04-19',4);
insert into Data values(2,'2019-04-22',8);

insert into Data values(3,'2019-04-15',5);
insert into Data values(3,'2019-04-16',8);
insert into Data values(3,'2019-04-17',9);
insert into Data values(3,'2019-04-18',1);
insert into Data values(3,'2019-04-20',2);

insert into Data values(4,'2019-04-14',2);
insert into Data values(4,'2019-04-15',2);
insert into Data values(4,'2019-04-16',2);
insert into Data values(4,'2019-04-17',2);
insert into Data values(4,'2019-04-18',2);
insert into Data values(4,'2019-04-19',2);
insert into Data values(4,'2019-04-20',2);
insert into Data values(4,'2019-04-22',2);

insert into Data values(5,'2019-04-15',5);
insert into Data values(5,'2019-04-16',6);
insert into Data values(5,'2019-04-17',6);
insert into Data values(5,'2019-04-18',5);
insert into Data values(5,'2019-04-19',3);
insert into Data values(5,'2019-04-21',3);

insert into Data values(6,'2019-04-14',3);
insert into Data values(6,'2019-04-15',4);
insert into Data values(6,'2019-04-16',4);
insert into Data values(6,'2019-04-17',4);
insert into Data values(6,'2019-04-18',4);
insert into Data values(6,'2019-04-19',4);
insert into Data values(6,'2019-04-20',4);
insert into Data values(6,'2019-04-21',4);

--Medicamento
insert into Farmaco values ('Paracetamol', 'Analgesico');
insert into Farmaco values ('Amoxicilina', 'Antibiotico');
insert into Farmaco values ('Ibuprofeno', 'Anti-inflamatorio');
insert into Farmaco values ('Espironolactona', 'Diuretico');
insert into Farmaco values ('Saccharomyces boulardii', 'Microbiota Intestinal');

insert into Medicamento values(1,'Ben-U-Ron','Bene', 'Paracetamol');
insert into Medicamento values(2,'Augmentin Duo','GlaxoSmithKline', 'Amoxicilina');
insert into Medicamento values(3,'Brufen','Abbot', 'Ibuprofeno');
insert into Medicamento values(4,'Espironolactona','Alter', 'Espironolactona');
insert into Medicamento values(5,'UL-250','MERCK', 'Saccharomyces boulardii');
insert into Medicamento values(6,'Paracetamol','Generis','Paracetamol');
insert into Medicamento values(7,'Ib-U-Ron','Bene','Ibuprofeno');

-- Departamentos
insert into Departamento values(1, 150, "Medicina Geral", 150);
insert into Departamento values(2, 50, "Pediatria", 50);
insert into Departamento values(3, 40, "Cardiologia", 40);
insert into Departamento values(4, 20, "Medicina Nuclear", 20);
insert into Departamento values(5, 20, "Estomatologia", 20);
insert into Departamento values(6, 60, 'Cirurgia', 60);
insert into Departamento values(7, 200, 'Urgencia', 200);

-- Trabalha
insert into Trabalha values(2,1);
insert into Trabalha values(3,2);
insert into Trabalha values(5,3);
insert into Trabalha values(5,4);
insert into Trabalha values(1,5);
insert into Trabalha values(4,6);
insert into Trabalha values(2,7);

-- Processo
insert into Processo values(1,'Operacao Cirurgica','2019-01-30 10:30:27','2019-01-31 11:25:43',200852);
insert into Processo(tipoProcesso, dataEntrada, nSaude) values('Internamento','2019-03-10 08:12:00',120369);
insert into Processo(tipoProcesso, dataEntrada, dataSaida, nSaude) values('Consulta','2019-04-10 10:30:14','2019-04-10 11:04:00',250168);
insert into Processo(tipoProcesso, dataEntrada, dataSaida, nSaude) values('Consulta','2019-04-18 10:30:14','2019-04-20 11:04:00',250168);
insert into Processo(tipoProcesso, dataEntrada, dataSaida, nSaude) values('Urgencia','2019-04-12 09:30:00','2019-04-13 12:15:00',250168);
insert into Processo(tipoProcesso, dataEntrada, dataSaida, nSaude) values('Vacinacao','2019-04-14 07:35:28','2019-04-14 07:57:00',100137); --Pediatria
insert into Processo(tipoProcesso, dataEntrada, nSaude) values('Urgencia','2019-04-14 07:35:28',200852);

--ProcessoDepartamento
insert into ProcessoDepartamento values(1,6);
insert into ProcessoDepartamento values(2,3);
insert into ProcessoDepartamento values(3,4);
insert into ProcessoDepartamento values(4,7);
insert into ProcessoDepartamento values(5,2);
insert into ProcessoDepartamento values(6,7);

--EncarregueMed
insert into EncarregueMed values(1,1,'2019-01-30 10:30:27','2019-01-30 16:50:12');
insert into EncarregueMed values(1,2,'2019-01-31 08:30:00','2019-01-31 11:25:43');
insert into EncarregueMed values(2,2,'2019-03-10 08:12:75','2019-03-10 14:30:00');
insert into EncarregueMed(idProcesso,idHospital,dataEntrada) values(2,3,'2019-03-10 14:30:00');
insert into EncarregueMed values(3,4,'2019-04-10 10:30:14','2019-04-10 11:04:53');
insert into EncarregueMed values(4,2,'2019-04-12 09:30:00','2019-04-12 14:15:00');
insert into EncarregueMed values(4,4,'2019-04-13 08:00:00','2019-04-13 12:15:00');
insert into EncarregueMed values(5,1,'2019-04-14 07:35:28','2019-04-14 07:57:44');
insert into EncarregueMed(idProcesso,idHospital,dataEntrada) values(6,1,'2019-04-14 07:35:28');

--EncarregueEnf
insert into EncarregueEnf values(1,6,'2019-01-30 10:30:27','2019-01-30 16:50:12');
insert into EncarregueEnf values(1,7,'2019-01-30 16:50:12','2019-01-30 24:00:00');
insert into EncarregueEnf values(1,5,'2019-01-31 00:00:00','2019-01-31 11:25:43');
insert into EncarregueEnf values(2,6,'2019-03-10 08:12:75','2019-03-10 14:30:00');
insert into EncarregueEnf values(2,7,'2019-03-10 14:30:00','2019-03-10 22:30:00');
insert into EncarregueEnf values(3,7,'2019-04-10 10:30:14','2019-04-10 11:04:53');
insert into EncarregueEnf values(4,6,'2019-04-12 09:30:00','2019-04-12 17:15:00');
insert into EncarregueEnf values(4,7,'2019-04-12 17:15:00','2019-04-12 24:00:00');
insert into EncarregueEnf values(5,5,'2019-04-14 07:35:28','2019-04-14 07:57:44');
insert into EncarregueEnf(idProcesso,idHospital,dataEntrada) values(6,7,'2019-04-14 07:35:28');

--Tratamento
insert into Tratamento values(1,'Fisioterapia',10);
insert into Tratamento values(2,'Raio-X',1);
insert into Tratamento values(3,'Ecografia',1);
insert into Tratamento values(4,'Aromoterapia',5);

--Resulta
insert into Resulta values(2,2);
insert into Resulta values(2,1);
insert into Resulta values(3,2);
insert into Resulta values(4,3);
insert into Resulta values(1,4);

--Prescricao
insert into Prescricao values(2,1,'1000mg','1 comprimido 2 vezes p/dia apos refeiçao');
insert into Prescricao values(1,1,'1000mg','1 comprimido 3 vezes p/dia em caso de dores');
insert into Prescricao values(5,3,'250mg','Tomar 30 minutos antes de uma refeiçao');
insert into Prescricao values(4,4,'50mg','2 comprimidos em jejum');
insert into Prescricao values(4,2,'50mg','2 comprimidos a seguir ao almoço');
insert into Prescricao values(5,2,'350mg','5 comprimidos a seguir ao jantar');
