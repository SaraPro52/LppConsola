-- ASIGNAR_ROL
-- 

/*

Crea la columna de vigencia

ALTER TABLE Rol_Funcionario
ADD COLUMN Vigencia INTEGER NOT NULL DEFAULT 1

CALL ConsultarNotificaciones("5~2~3");

CALL Asignar_Rol("0~0~0~0");
CALL Asignar_Rol("2~1~0~0");
CALL Asignar_Rol("1~1~5~2");
CALL Asignar_Rol("1~4~25~2");

*/

DROP PROCEDURE IF EXISTS Asignar_Rol;

DELIMITER ;;
CREATE PROCEDURE Asignar_Rol(IN arrayAsignarRol VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1); 
DECLARE idCentro_Var		 INTEGER DEFAULT 0;
DECLARE idFuncionario_Var	 INTEGER DEFAULT 0;
DECLARE idRol_Var	 		 INTEGER DEFAULT 0;
DECLARE idFunOld_Var  		 INTEGER DEFAULT 0;
DECLARE idEstado_Var		 INTEGER DEFAULT 0;


SET	@contador			= 0;
SET @idsDetaNoti         = ""; 
SET @opcion = 0,
	@idCentro_Var = 0,
    @idFuncionario_Var = "0",
    @idRol_Var		  = 0;

CALL EXECUTE_ARRAY(
		arrayAsignarRol,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idCentro_Var = @valor;
            WHEN 2 THEN SET @idFuncionario_Var = @valor;
            WHEN 3 THEN SET @idRol_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idCentro_Var = @idCentro_Var,
    idFuncionario_Var = @idFuncionario_Var,
    idRol_Var = @idRol_Var;
    
    
    
    

CASE opcion
WHEN 1 THEN
BEGIN -- MODIFICAR O INSERTAR VIGENCIA ROL

	IF(idRol_Var = 2 OR idRol_Var = 3)THEN
        
		CASE idRol_Var
			WHEN 2 THEN SET idEstado_Var = 3;
			WHEN 3 THEN SET idEstado_Var = 4;
		END CASE;
		
		SELECT fu.Id_Funcionario INTO idFunOld_Var
		FROM Funcionario fu 
		INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1 
		INNER JOIN Rol ro ON rf.Id_Rol = ro.Id_Rol AND rf.Id_Rol = idRol_Var
		INNER JOIN Area_Centro ac ON fu.Id_Area_Centro  = ac.Id_Area_Centro
		WHERE Id_Centro = idCentro_Var AND Id_Estado = 1;
		
		IF(idFunOld_Var <> 0 AND idFunOld_Var <> idFuncionario_Var)THEN
        
			SELECT  @idsDetaNoti := CONCAT(@idsDetaNoti,",",Id_Detalles_Notificacion), @contador := @contador + 1
			FROM 43_V_ConsultaTodoNotificacion v1 
			INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
			INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
			WHERE v1.TipoIdes = 1 AND IdFuncionarioRecibe = idFunOld_Var AND v2.Id_Estado = idEstado_Var AND v1.EstadoNotificacion = 0;  
			
			SET @idsDetaNoti = SUBSTRING_INDEX(@idsDetaNoti,",",@contador * -1); 
			
			CALL MACC(CONCAT("
			UPDATE Detalles_Notificacion
			SET Id_Funcionario = ",idFuncionario_Var,"
			WHERE Id_Detalles_Notificacion IN (",@idsDetaNoti,")
			"));
			#VALIDAR CUANDO NO SE ENCUENTRE NINGUN REGISTRO EN LAS NOTIFICACIONES
			UPDATE Rol_Funcionario
			SET Vigencia = 0
			WHERE Id_Funcionario = idFunOld_Var;
            
            UPDATE Rol_Funcionario
			SET Vigencia = 1
			WHERE Id_Funcionario = idFunOld_Var AND Id_Rol = 1;
			
		END IF;
	
		
	END IF;


	UPDATE Rol_Funcionario
	SET Vigencia = 0
	WHERE Id_Funcionario = idFuncionario_Var;

	IF( SELECT 1 FROM Rol_Funcionario WHERE Id_Funcionario = idFuncionario_Var AND Id_Rol = idRol_Var)THEN

		UPDATE Rol_Funcionario
		SET Vigencia = 1
		WHERE Id_Funcionario = idFuncionario_Var AND Id_Rol = idRol_Var;

	ELSE
	BEGIN
		INSERT INTO Rol_Funcionario 
		VALUES (null,idRol_Var,idFuncionario_Var,1);
	END;

	END IF;
    
    SELECT fu.Id_Funcionario,CONCAT(fu.Nom_Funcionario," ", fu.Apellidos) AS Funcionario,ro.Id_Rol,ro.Nom_Rol AS Rol
    FROM Funcionario fu 
    INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1 
    INNER JOIN Rol ro ON rf.Id_Rol = ro.Id_Rol AND rf.Id_Rol = 1
    INNER JOIN Area_Centro ac ON fu.Id_Area_Centro  = ac.Id_Area_Centro
	WHERE Id_Centro = idCentro_Var AND Id_Estado = 1;
END;
WHEN 2 THEN 
BEGIN -- CONSULTA INICIAL DE LA VISTA ASIGNAR ROLES
	
    SELECT fu.Id_Funcionario,CONCAT(fu.Nom_Funcionario," ", fu.Apellidos) AS Funcionario,ro.Id_Rol,ro.Nom_Rol AS Rol
    FROM Funcionario fu 
    INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1 
    INNER JOIN Rol ro ON rf.Id_Rol = ro.Id_Rol AND rf.Id_Rol = 1
    INNER JOIN Area_Centro ac ON fu.Id_Area_Centro  = ac.Id_Area_Centro
	WHERE Id_Centro = idCentro_Var AND Id_Estado = 1;
	
END;
ELSE SELECT Id_Rol,Nom_Rol FROM Rol WHERE Id_Rol NOT IN (1,4); -- Trae todos los roles menos el coordinador
END CASE; 
END;;
DELIMITER ;


            
            

            
            
            