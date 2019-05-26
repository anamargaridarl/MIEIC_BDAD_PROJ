PRAGMA foreign_keys = ON;
.mode columns
.headers on
.nullvalue NULL

DELETE from Funcionario where idHospital = 1;
DELETE from Funcionario where idHospital = 1;
DELETE from Funcionario where idHospital = 2;
DELETE from Funcionario where idHospital = 3;
DELETE from Funcionario where idHospital = 5;
SELECT * FROM Funcionario;

select * from EncarregueMed;
insert into EncarregueMed values(1,3,'2019-01-31 11:25:50','2019-01-31 18:25:43');
select * from EncarregueMed;
insert into EncarregueMed values(1,4,'2019-01-31 11:25:50','2019-01-31 18:25:43');
select * from EncarregueMed;
insert into EncarregueEnf values(2,5,'2019-03-10 22:35:00','2019-03-10 23:30:00');
select * from EncarregueEnf;