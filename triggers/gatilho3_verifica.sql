PRAGMA foreign_keys = ON;

insert into Departamento values(0, 10, 'Cirurgia', 3);

select * from Departamento;
update Departamento set capacidade=5 where idDepartamento=0;
select * from Departamento;
update Departamento set capacidade=7 where idDepartamento=0;
select * from Departamento;
