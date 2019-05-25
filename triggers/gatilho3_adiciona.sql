PRAGMA foreign_keys = ON;

create trigger check_capacity
before update of capacidade on Departamento
when ((New.capacidade < Old.capacidade) and (Old.capacidade - Old.vagas > New.capacidade))
begin
    select raise(rollback, 'Nao ha vagas suficientes!');
end;