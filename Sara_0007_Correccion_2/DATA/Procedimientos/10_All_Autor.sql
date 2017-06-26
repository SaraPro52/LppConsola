DROP PROCEDURE IF EXISTS ALL_AUTOR;
DELIMITER ;;
CREATE PROCEDURE ALL_AUTOR(IN idVersion INTEGER, OUT salida VARCHAR(50))
BEGIN
	SELECT COUNT(*) INTO @cont
    FROM Version v1 INNER JOIN Autor v2 ON v1.Id_Version = v2.Id_Version
    WHERE v1.Id_Version = idVersion;
    
    SET @idVersion = idVersion;
    SET @c = 0;
    SET @idis = "0";
    WHILE(@c < @cont)DO
			CALL MACC(CONCAT("SELECT v2.Id_Funcionario INTO @idFun
			FROM Version v1 INNER JOIN Autor v2 ON v1.Id_Version = v2.Id_Version INNER JOIN Funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
			WHERE v2.Id_Version = ",@idVersion," AND v2.Id_Funcionario NOT IN (",@idis,")
			ORDER BY v2.Id_Funcionario ASC LIMIT 1"));
            
            IF(@c = 0)THEN
				SET @idis = @idFun;
                ELSE SET @idis = CONCAT(@idis,",",@idFun);
            END IF;
            SET @c = @c + 1;
    END WHILE;
	SET salida = @idis;
END;;
DELIMITER ;;

