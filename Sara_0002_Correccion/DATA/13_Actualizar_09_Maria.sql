USE SARA001;

DROP PROCEDURE IF EXISTS name;
DELIMITER ;;
CREATE PROCEDURE name()
BEGIN
  -- Contenido
END;;
DELIMITER ;


	DROP PROCEDURE IF EXISTS ConsultaActualizar;
	DELIMITER ;;
    CREATE PROCEDURE ConsultaActualizar(IN idFuncionario INTEGER)
    BEGIN
		SET SQL_SAFE_UPDATES = 0; -- PERMITE ACTUALIZAR UNA TABLA QUE NO TIENE UN CAMPO KEY

        DROP TEMPORARY TABLE IF EXISTS Prueba;
        CREATE TEMPORARY TABLE Prueba (
			Id_P_Virtual INTEGER ,
            Nom_P_Virtual VARCHAR (100),
            Id_Version INTEGER DEFAULT null,
            Num_Version INTEGER DEFAULT null,
            Fecha_Vigencia TIMESTAMP DEFAULT "00-00-00",
            Url_Version VARCHAR(500) DEFAULT null,
            Nom_Formato VARCHAR(50), 
            Id_Funcionario INTEGER
        );
        
        INSERT INTO Prueba 
        SELECT Id_P_Virtual, Nom_P_Virtual,null AS Id_Version,null AS Num_Version,"00-00-00" AS Fecha_Vigencia,null AS Url_Version,Nom_Formato, Id_Funcionario
		FROM 09_v_Autor v1 INNER JOIN Formato v2 ON v1.Id_Formato = v2.Id_Formato
		WHERE Id_Estado IN (6,7) AND Id_Funcionario = idFuncionario;
        
        CALL ALL_PV_ACTUALIZAR (idFuncionario,@idProductos);
		-- SELECT @idProductos;
        CALL EXECUTE_ARRAY(
			@idProductos,
            ",",
            "UPDATE  Prueba 
			 SET Id_Version =  	   (SELECT Id_Version FROM Version WHERE Id_P_Virtual = @valor ORDER BY Num_Version DESC LIMIT 1),
				 Num_Version = 	   (SELECT Num_Version FROM Version WHERE Id_P_Virtual = @valor ORDER BY Num_Version DESC LIMIT 1),
                 Fecha_Vigencia =  (SELECT Fecha_Vigencia FROM Version WHERE Id_P_Virtual = @valor ORDER BY Num_Version DESC LIMIT 1),
                 Url_Version =     (SELECT Url_Version FROM Version WHERE Id_P_Virtual = @valor ORDER BY Num_Version DESC LIMIT 1)
			WHERE Id_P_Virtual = @valor;"
        );
        
		SELECT * FROM Prueba;
        
        DROP TEMPORARY TABLE IF EXISTS Prueba;
    END;;
    DELIMITER ;
    
    DROP PROCEDURE IF EXISTS ALL_PV_ACTUALIZAR;	
	DELIMITER ;;
	CREATE PROCEDURE ALL_PV_ACTUALIZAR(IN idFuncionario INTEGER, OUT salida VARCHAR(50))
	BEGIN
        SELECT COUNT(*) INTO @cont
		FROM 09_v_Autor v1 INNER JOIN Formato v2 ON v1.Id_Formato = v2.Id_Formato
		WHERE Id_Estado IN (6,7) AND Id_Funcionario = idFuncionario;
		
		SET @idFuncionario = idFuncionario;
		SET @c = 0;
		SET @idis = "0";
		WHILE(@c < @cont)DO
				
                CALL MACC(CONCAT("SELECT Id_P_Virtual INTO @idPV
				FROM 09_v_Autor v1 INNER JOIN Formato v2 ON v1.Id_Formato = v2.Id_Formato
				WHERE Id_Estado IN (6,7) AND Id_Funcionario = ",@idFuncionario," AND Id_P_Virtual NOT IN (",@idis,")
                ORDER BY Id_P_Virtual ASC LIMIT 1"));
				
				IF(@c = 0)THEN
					SET @idis = @idPV;
					ELSE SET @idis = CONCAT(@idis,",",@idPV);
				END IF;
				SET @c = @c + 1;
		END WHILE;
		SET salida = @idis;
	END;;
	DELIMITER ;
  
  
  DROP PROCEDURE IF EXISTS ConsultaVistaActualizar;
  DELIMITER ;;
  CREATE PROCEDURE ConsultaVistaActualizar(IN ArrayVistaActualizar VARCHAR (50))
  BEGIN
    CALL EXECUTE_ARRAY(
			ArrayVistaActualizar,
            "~",
            "CASE @i
				WHEN 0 THEN SET @idPv = @valor;
				WHEN 1 THEN SET @idVersion = @valor;
				WHEN 2 THEN SET @val = @valor;
			END CASE;"
        );
     CASE (@val)
        WHEN 1 THEN 
          SELECT v1.* ,v2.Nom_Formato
          FROM Producto_Virtual v1 INNER JOIN Formato v2 ON v1.Id_Formato = v2.Id_Formato
          WHERE Id_P_Virtual = @idPv;
        WHEN 2 THEN
          SELECT * FROM 22_v_autor_simple WHERE Id_Version = @idVersion;
        WHEN 3 THEN
          SELECT  Id_Tema, Nom_Tema
          FROM 06_v_detalles_tema 
          WHERE Id_P_Virtual = @idPv AND Tipo_Tema = 0;
        WHEN 4 THEN
          SELECT  Id_Tema, Nom_Tema
          FROM 06_v_detalles_tema 
          WHERE Id_P_Virtual = @idPv AND Tipo_Tema = 1;
     END CASE;
  END;;
  DELIMITER ;
    
 -- CALL ConsultaVistaActualizar("1~1~1");
 
 DROP PROCEDURE IF EXISTS RegistarActualizacion;
DELIMITER ;;
CREATE PROCEDURE RegistarActualizacion(IN ArrayActualizacion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN
  CALL EXECUTE_ARRAY(
		ArrayActualizacion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idPro = @valor;
			WHEN 1 THEN SET @Url_Version = @valor;
			WHEN 2 THEN SET @Url_Img = @valor;
			WHEN 3 THEN SET @Inst_Instalacion = @valor;
			WHEN 4 THEN SET @Reqst_Instalacion = @valor;
			WHEN 5 THEN SET @ArrayFuncionario = @valor;
      WHEN 6 THEN SET @ArrayTemas = @valor;
        END CASE;"
    );
    
    SET @i = 0;
		SET @num = M_LENGTH(@ArrayTemas,",");
    WHILE(@i < @num)DO
         SET @i = @i + 1;
			SET @arrayT = SUBSTRING_INDEX(@ArrayTemas,",",1);
			SET @cant = CHAR_LENGTH(@ArrayTemas) - CHAR_LENGTH(@arrayT);
			SET @ArrayTemas = RIGHT(@ArrayTemas,@cant -1);
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
    
END;;
DELIMITER ;
 
 
DROP FUNCTION IF EXISTS NameUrl;
DELIMITER ;;
CREATE FUNCTION NameUrl(idVer INTEGER) RETURNS VARCHAR(50)
BEGIN
  SET @idVer = idVer;
  SELECT Id_Estado, Id_P_Virtual INTO @idEstado,@idPro
  FROM Version WHERE Id_Version = @idVer;
  
  IF(@idEstado IN (6,7))THEN
    SET @tipoVer = 2;
    ELSEIF (@idEstado IN (3,4,5,9,10))THEN SET @tipoVer = 1;
  END IF;
  
  CASE (@tipoVer)
    WHEN 1 THEN 
        SELECT COUNT(*) INTO @numVer
        FROM 18_v_notificaciones 
        WHERE Id_Tipo_Notificacion = 1 AND Ides_Proceso = @idVer;
    WHEN 2 THEN
        SELECT Num_Version INTO @numVer 
        FROM  Version
        WHERE Id_Version = @idVer;
  END CASE;
  
  SELECT v2.Nom_Formato INTO @formato 
  FROM producto_virtual v1 INNER JOIN formato v2 ON v2.Id_Formato = v1.Id_Formato
  WHERE v1.Id_P_Virtual = @idPro;
  
  SET @idPro = LPAD(@idPro,3,"0");
  SET @numVer = LPAD(@numVer,2,"0");
  SET @idVer = LPAD(@idVer,3,"0");
  
  SET @nomUrl = CONCAT(@tipoVer,"-",@idPro,"-",@numVer,"-",@idVer,".",@formato);
  
  RETURN @nomUrl;
END;;
DELIMITER ;


    -- CALL ConsultaActualizar(1);