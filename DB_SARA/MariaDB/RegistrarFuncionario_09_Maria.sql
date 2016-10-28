USE SARA;

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
			WHEN 8 THEN SET @Contrasenia = @valor;
			WHEN 9 THEN SET @Id_Centro = @valor;
			WHEN 10 THEN SET @Id_Area = @valor;
        END CASE;"
    );
    CALL SARA_CRUD("SELECT","Area_Centro","Id_Area_Centro INTO @idAC","Id_Centro = @Id_Centro AND Id_Area = @Id_Area");
	CALL SARA_CRUD("INSERT","Funcionario",CONCAT("Id_Tipo_Documento~",@Id_Tipo_Documento,"|Num_Documento~",@Num_Documento,"|Nom_Funcionario~",@Nom_Funcionario,"|Apellidos~",@Apellidos,"|Correo~",@Correo,"|Cargo~",@Cargo,"|Ip_Sena~",@Ip_Sena,"|Contraseña~",@Contrasenia,"|Id_Area_Centro~",@idAC,""),"");
    CALL SARA_CRUD("SELECT","Funcionario","Id_Funcionario INTO @idFun","Num_Documento = @Num_Documento"); 
    CALL SARA_CRUD("INSERT","Rol_Funcionario",CONCAT("Id_Rol~",@Id_Rol,"|Id_Funcionario~",@idFun,""),"");

END;;
DELIMITER ;

CALL RegistrarFuncionario("2~2~12223333~Nombre Prueba~Probando~prueba@probando~Probador~123456~1212234~2~2");

CALL SARA_CRUD("SELECT","Funcionario","","");
CALL SARA_CRUD("SELECT","Rol_Funcionario","","");
CALL SARA_CRUD("DELETE","Rol_Funcionario","","Id_Funcionario = ?");
CALL SARA_CRUD("DELETE","Funcionario","","Id_Funcionario = ?");