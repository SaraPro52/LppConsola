DROP PROCEDURE IF EXISTS RegistrarFuncionario;
DELIMITER ;;
CREATE PROCEDURE RegistrarFuncionario(IN ArrayReg VARCHAR(800))
BEGIN
	CALL EXECUTE_ARRAY(
		ArrayReg,
        "~",
        "CASE @i
			WHEN 0 THEN SET @Id_Rol = @valor;
			WHEN 1 THEN SET @Id_Tipo_Documento = @valor; 
			WHEN 2 THEN SET @Num_Documento = @valor;
			WHEN 3 THEN SET @Nom_Funcionario = @valor;
			WHEN 4 THEN SET @Apellidos = @valor;
			WHEN 5 THEN SET @Correo = @valor;
			WHEN 6 THEN SET @Cargo = @valor;
			WHEN 7 THEN SET @Ip_Sena = @valor;
			WHEN 8 THEN SET @Toquen = @valor;
			WHEN 9 THEN SET @Id_Centro = @valor;
			WHEN 10 THEN SET @Id_Area = @valor;
        END CASE;"
    );
    
    SET @count = 0;
    IF(@Id_Rol != 1)THEN
		SELECT COUNT(*) INTO @count
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro INNER JOIN
			 Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
		WHERE Id_Centro = @Id_Centro AND Id_Rol = @Id_Rol;
    END IF;
    
    IF(@count = 0 )THEN
		CALL SARA_CRUD("SELECT","Area_Centro","Id_Area_Centro INTO @idAC","Id_Centro = @Id_Centro AND Id_Area = @Id_Area");
		CALL SARA_CRUD("INSERT","Funcionario",CONCAT("Id_Tipo_Documento~",@Id_Tipo_Documento,"|Num_Documento~",@Num_Documento,"|Nom_Funcionario~",@Nom_Funcionario,"|Apellidos~",@Apellidos,"|Correo~",@Correo,"|Cargo~",@Cargo,"|Ip_Sena~",@Ip_Sena,"|Id_Area_Centro~",@idAC,""),"");
		CALL SARA_CRUD("SELECT","Funcionario","Id_Funcionario INTO @idFun","Num_Documento = @Num_Documento"); 
		CALL SARA_CRUD("INSERT","Rol_Funcionario",CONCAT("Id_Rol~",@Id_Rol,"|Id_Funcionario~",@idFun,""),"");
		CALL SARA_CRUD("INSERT","Toquen",CONCAT("Numero_Toquen~",@Toquen,"|Funcionario~",@idFun,"|FechaVigencia~",DATE_ADD(CURDATE(), INTERVAL 7 DAY)," 18:00:00"),"");
	ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Lo siento, ya existe un funcionario con ese rol y centro de formacion";
    END IF;
    
END;;
DELIMITER ;
