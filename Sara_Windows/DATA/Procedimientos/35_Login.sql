
-- CALL Login("1019~1019");
-- CALL Login("1019133595~fcea920f7412b5da7be0cf42b8c93759");
DROP PROCEDURE IF EXISTS Login;
DELIMITER ;;
CREATE PROCEDURE Login(IN ArrayLogin VARCHAR(100))
BEGIN
	DECLARE numFun_Var DOUBLE DEFAULT 0;
    DECLARE contrasenia_Var VARCHAR(300) DEFAULT "";
    
    CALL EXECUTE_ARRAY(
		ArrayLogin,
        "~",
        "CASE @i
			WHEN 0 THEN SET @numFun_Var = @valor;
			WHEN 1 THEN SET @contrasenia_Var = @valor; 
        END CASE;"
    );
    
    SET numFun_Var = @numFun_Var,
		contrasenia_Var = @contrasenia_Var;
	
    IF(
		SELECT 1 
        FROM Funcionario 
        WHERE Num_Documento = numFun_Var AND Contraseña = contrasenia_Var
    )THEN
        
        SELECT 1 AS TipoUser,rf.Id_Rol,fu.Id_Funcionario,fu.Nom_Funcionario,ac.Id_Centro
        FROM Funcionario fu 
        INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1
        INNER JOIN Area_Centro ac ON fu.Id_Area_Centro = ac.Id_Area_Centro
        WHERE fu.Num_Documento = numFun_Var AND fu.Contraseña = contrasenia_Var;
        
        ELSE IF(
			SELECT 1 
            FROM Admin WHERE Usuario = numFun_Var AND Clave = contrasenia_Var
        )THEN
			SELECT 2 AS TipoUser,5 AS Id_Rol 
            FROM Admin WHERE Usuario = numFun_Var AND Clave = contrasenia_Var;
        END IF;
    END IF;
END;;
DELIMITER ;
