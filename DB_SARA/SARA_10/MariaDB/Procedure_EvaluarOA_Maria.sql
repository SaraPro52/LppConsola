USE SARA;


DROP PROCEDURE IF EXISTS RegistrarEvaluacion;
DELIMITER ;;	
CREATE PROCEDURE RegistrarEvaluacion(IN ArrayEvaluacion VARCHAR(500))
BEGIN
    CALL EXECUTE_ARRAY(
		ArrayEvaluacion,"~",
        "CASE @i 
			WHEN 0 THEN SET @observacionG 	= @valor;
			WHEN 1 THEN SET @resultado 	  	= @valor;
			WHEN 2 THEN SET @idVersion 	  	= @valor;
			WHEN 3 THEN SET @idLista 	  	= @valor;
			WHEN 4 THEN SET @idFuncionario 	= @valor;
            WHEN 5 THEN SET @fechaVigencia  = @valor;
			WHEN 6 THEN SET @ArrayEvaItems 	= @valor;
		END CASE;");
        
	CALL SARA_CRUD("INSERT","Evaluacion_General",CONCAT("Observacion~",@observacionG,"|Resultado~",@resultado,"|Id_Version~",@idVersion,"|Id_Lista_Chequeo~",@idLista,"|Id_Funcionario~",@idFuncionario,""),"");
    CALL SARA_CRUD("SELECT","Evaluacion_General","Id_Evaluacion_General INTO @idEvaluacion","Id_Evaluacion_General > 0 ORDER BY Id_Evaluacion_General DESC LIMIT 1");
    
    CALL SARA_CRUD("UPDATE","Version",CONCAT("Fecha_Vigencia~",@fechaVigencia,""),CONCAT("Id_Version = ",@idVersion,""));
    SET @i = 0;
	SET @num = M_LENGTH(@ArrayEvaItems,"|");
	WHILE(@i < @num)DO
		SET @arrayE = SUBSTRING_INDEX(@ArrayEvaItems,"|",1);
        SET @cant = CHAR_LENGTH(@ArrayEvaItems) - CHAR_LENGTH(@arrayE);
        SET @ArrayEvaItems = RIGHT(@ArrayEvaItems,@cant -1);  
        SET @a = 0;
        WHILE(@a < 3 )DO
			SET @val = SUBSTRING_INDEX(@arrayE,"¤",1);
			SET @cant = CHAR_LENGTH(@arrayE) - CHAR_LENGTH(@val);
			SET @arrayE = RIGHT(@arrayE,@cant -1);
				SELECT @val;
                CASE @a
					WHEN 0 THEN SET @valorizacion = @val;
                    WHEN 1 THEN SET @observacionItem = @val;
                    WHEN 2 THEN SET @idDetallesLista = @val;
                END CASE;
            SET @a = @a + 1;        
        END WHILE;
        CALL SARA_CRUD("INSERT","Detalles_Evaluacion",CONCAT("Valorizacion~",@valorizacion,"|Observacion~",@observacionItem,"|Id_Detalles_Lista~",@idDetallesLista,"|Id_Evaluacion_General~",@idEvaluacion,""),"");
		SET @i = @i + 1;
    END WHILE;
        
END;;
DELIMITER ;

CALL RegistrarEvaluacion("Observacion de prueba~1~7~3~6~2017-08-01~1¤si cumple con el item¤1|1¤si cumple con el item¤2");


CALL SARA_CRUD("SELECT","Lista_Chequeo","","");

-- CALL SARA_CRUD("DELETE","Detalles_Evaluacion","","Id_Detalles_Evaluacion >= 5");
-- CALL SARA_CRUD("DELETE","Evaluacion_General","","Id_Evaluacion_General >= 2 ");

CALL SARA_CRUD("SELECT","Detalles_Lista","","");
CALL SARA_CRUD("SELECT","Evaluacion_General","","");
CALL SARA_CRUD("SELECT","Detalles_Evaluacion","","");
