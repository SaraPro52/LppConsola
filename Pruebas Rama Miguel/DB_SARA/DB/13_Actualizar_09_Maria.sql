USE SARA;

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
    
    
    -- CALL ConsultaActualizar(1);