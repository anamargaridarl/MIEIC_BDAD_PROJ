
CREATE TRIGGER RemoveFunc
INSTEAD OF DELETE ON Funcionario
BEGIN 
    UPDATE Funcionario
    SET activo = 0;
END;


CREATE TRIGGER RestraintRem
BEFORE UPDATE OF activo ON Funcionario
WHEN(activo == 0)
BEGIN
    SELECT raise(rollback, 'Funcionario ja nao se encontra ativo!');
END;