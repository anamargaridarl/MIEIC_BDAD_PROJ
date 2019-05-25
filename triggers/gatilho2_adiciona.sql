PRAGMA foreign_keys = ON;

-- CREATE TRIGGER CheckVagas
-- AFTER INSERT ON ProcessoDepartamento
-- FOR EACH ROW
-- WHEN 

CREATE TRIGGER DecrementVagas
AFTER INSERT ON ProcessoDepartamento
BEGIN
    UPDATE Departamento
    SET vagas = vagas-1
    WHERE idDepartamento = New.idDepartamento;
END;

CREATE TRIGGER IncrementVagas
AFTER DELETE ON ProcessoDepartamento
BEGIN
    UPDATE Departamento
    SET vagas = vagas+1
    WHERE idDepartamento = Old.idDepartamento;
END;

CREATE TRIGGER RestraintVagas
BEFORE UPDATE OF vagas ON Departamento
WHEN(New.vagas > Old.capacidade OR New.vagas < 0)
BEGIN
    SELECT raise(rollback, 'Valor invalido de vagas!');
END;