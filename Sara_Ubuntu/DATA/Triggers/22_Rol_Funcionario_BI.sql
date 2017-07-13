DROP TRIGGER IF EXISTS Rol_Funcionario_BI;
DELIMITER ;;
CREATE TRIGGER Rol_Funcionario_BI BEFORE INSERT ON rol_funcionario FOR EACH ROW
BEGIN
	SET @count = 0;
    SET @idCentro = 0;
    SELECT Id_Centro INTO @idCentro
    FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
    WHERE Id_Funcionario = NEW.Id_Funcionario;
    
    
    IF(NEW.Id_Rol != 1)THEN
		SELECT COUNT(*) INTO @count
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro INNER JOIN
			 Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
		WHERE Id_Centro = @idCentro AND Id_Rol = NEW.Id_Rol AND v3.Vigencia = 1;
    END IF;
    
    IF(@count = 0)THEN
		SET @count = 0;
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Lo siento, ya existe un funcionario con ese rol y centro de formacion";
    END IF;
    
END;;
DELIMITER ;