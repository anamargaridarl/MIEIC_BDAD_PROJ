
CREATE TRIGGER RemoveFunc
INSTEAD OF DELETE ON Funcionario
BEGIN 
    UPDATE Funcionario
    SET activo = 0;
END;

