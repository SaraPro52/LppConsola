
-- CALL ModificarContraseña("1~1019133595~e10adc3949ba59abbe56e057f20f883e~e10adc3949ba59abbe56e057f20f883e1");


DROP PROCEDURE IF EXISTS ModificarContraseña;
DELIMITER ;;
CREATE PROCEDURE ModificarContraseña (IN ArrayContraseña VARCHAR(100))
BEGIN
	DECLARE idFun_Var INTEGER DEFAULT 0;
	DECLARE numFun_Var DOUBLE DEFAULT 0; 
    DECLARE contrActual_Var VARCHAR(300);
    DECLARE contrNueva_Var VARCHAR(300);
    
    CALL EXECUTE_ARRAY(
		ArrayContraseña,
		"~",
		"CASE @i
			WHEN 0 THEN SET @idFun_Var = @valor;
			WHEN 1 THEN SET @numFun_Var = @valor;
            WHEN 2 THEN SET @contrActual_Var = @valor;
            WHEN 3 THEN SET @contrNueva_Var = @valor;
		END CASE;"
	);
    
    SET idFun_Var = @idFun_Var,
		numFun_Var = @numFun_Var,
        contrActual_Var = @contrActual_Var,
        contrNueva_Var = @contrNueva_Var;
	
    IF( SELECT 1
		FROM Funcionario 
        WHERE Num_Documento = numFun_Var AND Id_Funcionario = idFun_Var AND Contraseña = contrActual_Var
    )THEN
		UPDATE Funcionario 
        SET Contraseña = contrNueva_Var
        WHERE Id_Funcionario = idFun_Var;
    END IF;
    
END;;
DELIMITER ;




DROP PROCEDURE IF EXISTS ModificarPerfil;
DELIMITER ;;
CREATE PROCEDURE ModificarPerfil (IN ArrayPerfil VARCHAR(100))
BEGIN
DECLARE idFun_Var INTEGER DEFAULT 0;
DECLARE nomFun_Var VARCHAR(45) DEFAULT "";
DECLARE apeFun_Var VARCHAR(100) DEFAULT "";
DECLARE idTipoIdent_Var INTEGER DEFAULT 0;
DECLARE numFun_Var DOUBLE DEFAULT 0;
DECLARE ipSena_Var VARCHAR(6);
DECLARE cargo_Var  VARCHAR(45);
DECLARE correo_Var VARCHAR(125);


  CALL EXECUTE_ARRAY(
		ArrayPerfil,
		"~",
		"CASE @i
			WHEN 0 THEN SET @idFun_Var = @valor;
			WHEN 1 THEN SET @nomFun_Var = @valor;
            WHEN 2 THEN SET @apeFun_Var = @valor;
            WHEN 3 THEN SET @idTipoIdent_Var = @valor;
            WHEN 4 THEN SET @numFun_Var = @valor;
            WHEN 5 THEN SET @ipSena_Var = @valor;
            WHEN 6 THEN SET @cargo_Var = @valor;
            WHEN 7 THEN SET @correo_Var = @valor;
		END CASE;"
	);

SET idFun_Var 	= @idFun_Var,
	nomFun_Var 	= @nomFun_Var,
    apeFun_Var 	= @apeFun_Var,
    idTipoIdent_Var = @idTipoIdent_Var,
    numFun_Var 	= @numFun_Var,
    ipSena_Var 	= @ipSena_Var,
    cargo_Var 	= @cargo_Var,
    correo_Var 	= @correo_Var;

UPDATE Funcionario 
SET Id_Tipo_Documento 	= idTipoIdent_Var,
	Num_Documento 		= numFun_Var,
	Nom_Funcionario 	= nomFun_Var,
	Apellidos 			= apeFun_Var,
	Correo 				= correo_Var,
	Cargo 				= cargo_Var,
	Ip_Sena 			= ipSena_Var
WHERE Id_Funcionario = idFun_Var;

END;;
DELIMITER ;
