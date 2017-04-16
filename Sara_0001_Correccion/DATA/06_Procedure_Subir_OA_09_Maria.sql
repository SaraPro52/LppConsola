USE SARA001;

DROP PROCEDURE IF EXISTS Registrar_PV;
DELIMITER ;;
CREATE PROCEDURE Registrar_PV(IN ArrayTodo VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN
	CALL EXECUTE_ARRAY(
		ArrayTodo,
		"~",
		"CASE @i
			WHEN 0 THEN SET @Nom_P_Virtual = @valor;
			WHEN 1 THEN SET @Des_P_Virtual = @valor;
			WHEN 2 THEN SET @Palabras_Clave = @valor;
			WHEN 3 THEN SET @Id_Formato = @valor;
			WHEN 4 THEN SET @Url_Version = @valor;
			WHEN 5 THEN SET @Url_Img = @valor;
			WHEN 6 THEN SET @Inst_Instalacion= @valor;
			WHEN 7 THEN SET @Reqst_Instalacion = @valor;
			WHEN 8 THEN SET @ArrayFuncionario = @valor;
			WHEN 9 THEN SET @ArrayTema = @valor;
		END CASE;"
	);	
    
    SET @co = 0;
	SELECT COUNT(*) INTO @co 
    FROM Producto_Virtual 
    WHERE Nom_P_Virtual = @Nom_P_Virtual OR Des_P_Virtual = @Des_P_Virtual;
    IF (@co = 0) THEN 
		CALL SARA_CRUD("INSERT","Producto_Virtual",CONCAT("Nom_P_Virtual~",@Nom_P_Virtual,"|Des_P_Virtual~",@Des_P_Virtual,"|Palabras_Clave~",@Palabras_Clave,"|Id_Formato~",@Id_Formato,""),"");
		CALL SARA_CRUD("SELECT","Producto_Virtual","Id_P_Virtual INTO @idPro","Nom_P_Virtual = @Nom_P_Virtual");
		SET @i = 0;
		SET @num = M_LENGTH(@ArrayTema,",");
		WHILE(@i < @num)DO
         SET @i = @i + 1;
        
        
			SET @arrayT = SUBSTRING_INDEX(@ArrayTema,",",1);
			SET @cant = CHAR_LENGTH(@ArrayTema) - CHAR_LENGTH(@arrayT);
			SET @ArrayTema = RIGHT(@ArrayTema,@cant -1);
			SET @a = 0;
			WHILE(@a < 2)DO
				SET @val = SUBSTRING_INDEX(@arrayT,"-",1);
				SET @cant = CHAR_LENGTH(@arrayT) - CHAR_LENGTH(@val);
				SET @arrayT = RIGHT(@arrayT,@cant -1);
				CASE @a
					WHEN 0 THEN SET @idTema = @val; 
					WHEN 1 THEN SET @tipo 	= @val;
				END CASE;
				SET @a = @a + 1;        
			END WHILE;
			CALL SARA_CRUD("INSERT","Detalles_Tema",CONCAT("Id_Tema~",@idTema,"|Id_P_Virtual~",@idPro,"|Tipo_Tema~",@tipo,""),"");
			SET @i = @i + 1;
		END WHILE;
		CALL RegistrarVersion(CONCAT("",@idPro,"~",@Url_Version,"~",@Url_Img,"~",@Inst_Instalacion,"~",@Reqst_Instalacion,"~",@ArrayFuncionario,""),nomUrl);
        
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "El nombre del producto o los detalles del mismo ya existen ";
	END IF;
	
END;;
DELIMITER ;


-- PROCEDIMIENTO PARA EL REGISTRO DE LAS VERSIONES, CUANDO UN INSTRUCTOR DESEE HACER UNA ACTUALIZACION DE ALGUN PRODUCTO VIRTUAL QUE 
-- QUE YA ESTE EN PUBLICACION


DROP PROCEDURE IF EXISTS RegistrarVersion;
DELIMITER ;;

CREATE PROCEDURE RegistrarVersion(IN ArrayVersion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN
	CALL EXECUTE_ARRAY(
		ArrayVersion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idPro = @valor;
			WHEN 1 THEN SET @Url_Version = @valor;
			WHEN 2 THEN SET @Url_Img = @valor;
			WHEN 3 THEN SET @Inst_Instalacion = @valor;
			WHEN 4 THEN SET @Reqst_Instalacion = @valor;
			WHEN 5 THEN SET @ArrayFuncionario = @valor;
        END CASE;"
    );
    
    SELECT COUNT(*) INTO @lineas
    FROM Version
    WHERE Id_P_Virtual = @idPro AND Id_Estado = 6;
    
    SET @numVer = 1;
    IF(@lineas > 0)THEN
		SELECT Num_Version INTO @numVer
        FROM Version 
        WHERE Id_P_Virtual = @idPro AND Id_Estado = 6
        ORDER BY Num_Version DESC LIMIT 1;
        SET @numVer = @numVer + 1;
	END IF;
    
    CALL SARA_CRUD("INSERT","Version",CONCAT("Num_Version~",@numVer,"|Url_Version~",@Url_Version,"|Url_Img~",@Url_Img,"|Inst_Instalacion~",@Inst_Instalacion,"|Reqst_Instalacion~",@Reqst_Instalacion ,"|Id_P_Virtual~",@idPro,""),"");
    -- CALL SARA_CRUD("SELECT","Version","Id_Version INTO @idVer","Inst_Instalacion = @Inst_Instalacion AND Reqst_Instalacion = @Reqst_Instalacion");
    
    SELECT Id_Version INTO @idVer
    FROM Version v1 INNER JOIN Producto_Virtual v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
	WHERE Inst_Instalacion = @Inst_Instalacion 
		AND Reqst_Instalacion = @Reqst_Instalacion 
		AND v1.Id_P_Virtual = @idPro 
        AND v1.Id_Estado = 3
        AND v1.Num_Version = @numVer
	ORDER BY Fecha_Envio DESC LIMIT 1;
        
    SET @idPro1 = @idPro * 0.01;
    --  url nombre archivoidPro1
    SET @Url_Version = CONCAT("1",@idPro1,"");
    
    
   SET @a = 0;
   Bucle : WHILE (TRUE) DO
        SET @valor = SUBSTRING_INDEX(@ArrayFuncionario,",",1);
        SET @cantidad = CHAR_LENGTH(@ArrayFuncionario) - CHAR_LENGTH(@valor);
        SET @ArrayFuncionario = RIGHT(@ArrayFuncionario,@cantidad -1);
			
            IF(@a = 0)THEN
				SET @prin = 1;
                SET @funPrin = @valor;
                ELSE SET @prin = 0;
            END IF;
			CALL SARA_CRUD("INSERT","Autor",CONCAT("Id_Version~",@idVer,"|Id_Funcionario~",@valor,"|Principal~",@prin,""),"");
        SET @a = @a +1;
        IF(CHAR_LENGTH(@ArrayFuncionario) = 0) THEN
			LEAVE Bucle;
        END IF;
        
    END WHILE Bucle;
    
    SELECT Id_Centro INTO @idCentro
    FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
    WHERE Id_Funcionario = @funPrin; -- SE PUEDE HACER DESDE SARA_CRUD
    
    SELECT v1.Id_Funcionario,v4.Nom_Rol INTO @idEval,@nomRol-- Anadir nomRol para la notificacion 14/04/2017
    FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
		 INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
         INNER JOIN Rol v4 ON v3.Id_Rol = v4.Id_Rol
    WHERE Id_Centro = @idCentro AND v3.Id_Rol = 2; -- SE PUEDE HACER DESDE SARA_CRUD
    
    CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha evaluar para el ",@nomRol,"~1~",@funPrin,"~",@idEval,"~",@idVer,""));-- Anadir nomRol para la notificacion 14/04/2017
    
    UPDATE Version SET Url_Version = NameUrl(@idVer) WHERE Id_Version = @idVer;-- NUEVO NOMBRE 16/04/2017
    
	SET nomUrl = NameUrl(@idVer);-- RETORNA EL NOMBRE DEL ARCHIVO
    
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS CorreccionVersion;
DELIMITER ;;
CREATE PROCEDURE CorreccionVersion(IN ArrayCorrecion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN

	CALL EXECUTE_ARRAY(
		ArrayCorrecion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idFuncionario = @valor;
			WHEN 1 THEN SET @idVersion = @valor;
		END CASE"
    );
    

	SELECT Id_Funcionario INTO @idFun
    FROM Version v1 INNER JOIN Autor v2 ON v1.Id_Version = v2.Id_Version
    WHERE v1.Id_Version = @idVersion AND Principal = 1;
    
    CALL SARA_CRUD("SELECT","Version","Id_Estado INTO @oldEstado","Id_Version = @idVersion");
    CALL SARA_CRUD("SELECT","Version","Url_Version INTO @oldUrl","Id_Version = @idVersion");
    
    SELECT CONCAT("ID1",@idFuncionario,"---  ID2",@idFun);
    
    IF(@idFuncionario = @idFun)THEN -- Cambio en la validacion ------------------------
		
		SELECT Id_Centro INTO @idCentro
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
		WHERE Id_Funcionario = @idFun;
		
        IF(@oldEstado = 9 OR @oldEstado = 10)THEN-- Cambio de estados 9-3 y 10-4
        
			CASE  @oldEstado
				WHEN 9 THEN SET @rol = 2, @newEstado = 3;-- @newEstado 12/042017
                WHEN 10 THEN SET @rol = 3, @newEstado = 4;-- @newEstado 12/042017
            END CASE;
            
			SELECT v1.Id_Funcionario INTO @idEval
			FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
			 INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
			WHERE Id_Centro = @idCentro AND Id_Rol = @rol;
            
            CALL SARA_CRUD("UPDATE","Version",CONCAT("Id_Estado~",@newEstado,"|Fecha_Envio~",CURRENT_TIMESTAMP,""),CONCAT("Id_Version = ",@idVersion,""));-- @newEstado 12/042017
            CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual Corregido ha evaluar para Equipo~1~",@idFun,"~",@idEval,"~",@idVersion,""));
            
            UPDATE Version SET Url_Version = NameUrl(@idVersion) WHERE Id_Version = @idVersion;-- NUEVO NOMBRE 16/04/2017
            SET nomUrl = NameUrl(@idVersion);-- RETORNA EL NOMBRE DEL ARCHIVO
        END IF;
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Usuario no aceptado o URL no actualizado";
    END IF;
    
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS AprobarPV;
DELIMITER ;;
CREATE PROCEDURE AprobarPV(IN ArrayAprobacion VARCHAR(100),OUT nomUrl VARCHAR(50))
BEGIN

	CALL EXECUTE_ARRAY(
		ArrayAprobacion,
        "~",
        "CASE @i 
			WHEN 0 THEN SET @idCoordinador = @valor;
			WHEN 1 THEN SET @idVersion = @valor;
		END CASE"
    );
    
    CALL SARA_CRUD("UPDATE","Version",CONCAT("Id_Estado~6|Fecha_Publicacion~",CURRENT_TIMESTAMP,""),CONCAT("Id_Version = ",@idVersion,""));
    
    UPDATE Version SET Url_Version = NameUrl(@idVersion) WHERE Id_Version = @idVersion;-- NUEVO NOMBRE 16/04/2017
    SET nomUrl = NameUrl(@idVersion);-- RETORNA EL NOMBRE DEL ARCHIVO
    CALL ALL_AUTOR(@idVersion,@autores);
    CALL RegistarNotificaion(CONCAT("El Producto Virtual Fue publicado INS~3~",@idCoordinador,"~",@autores,"~",@idVersion,""));	
    
    -- CALL SARA_CRUD("SELECT","Version","Id_P_Virtual~@idPro","Id_Version = @idVersion");
    -- CALL SARA_CRUD("SELECT","Version","Num_Version~@numVer","Id_Version = @idVersion");
    -- CALL SARA_CRUD("UPDATE","Version",CONCAT("Num_Version~",@numVer + 1,""),
			-- "Id_P_Virtual = @idPro AND Id_Estado != 6 AND Num_Version = @numVer");
END;;
DELIMITER ;




-- CALL Registrar_OA("Prueba222 Producto12333~Se esta porbando e222l procedimiento12333~Prueba12322233,Producto3223,virtual33223~1~Prueba12322233/Version~Prueba123322233/Imagen~No se instal5a322233~Ningun requisit22222334o~1,2~2-1,2-0");

-- CALL SARA_CRUD("SELECT","Producto_Virtual","","");
-- CALL SARA_CRUD("SELECT","Detalles_Tema","","");
-- CALL SARA_CRUD("SELECT","Version","","");
-- CALL SARA_CRUD("SELECT","Autor","","");
-- CALL SARA_CRUD("SELECT","Categoria","","");