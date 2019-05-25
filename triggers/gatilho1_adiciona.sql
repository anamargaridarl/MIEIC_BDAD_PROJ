PRAGMA foreign_keys = ON;

CREATE TRIGGER RemoveFunc
BEFORE DELETE ON Funcionario
BEGIN 
    UPDATE Funcionario 
    SET activo = 0
    WHERE  idHospital = old.idHospital;
    SELECT raise(ignore);
END;


CREATE TRIGGER RestraintRem
BEFORE UPDATE OF activo ON Funcionario
WHEN(old.activo == 0)
BEGIN
    SELECT raise(rollback, 'Funcionario ja nao se encontra ativo!');
END;