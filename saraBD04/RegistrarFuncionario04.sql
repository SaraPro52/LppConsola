USE SARApro;
select *from Funcionario;
DROP PROCEDURE RegistrarFuncionario;
DELIMITER ;;
CREATE PROCEDURE RegistrarFuncionario(
IN Id_Rol			INTEGER,
IN Num_Documento 	DOUBLE,
IN Nom_Funcionario	VARCHAR(45),
IN Apellidos 		VARCHAR(100),
IN Correo 			VARCHAR(125),
IN Cargo			VARCHAR(45),
IN Ip_Sena 			VARCHAR(6),
IN Contraseña		VARCHAR(300),
IN Id_Estado		INTEGER,
IN Id_Area_Centro	INTEGER
)
BEGIN
	
    SET @id_rol =       Id_Rol;
    SET @num_doc = 		Num_Documento;
    SET @nom_fun = 		Nom_Funcionario;
    SET @apell 	= 		Apellidos;
    SET @corr 	= 		Correo;
    SET @carg 	= 		Cargo;
    SET @ip_sen = 		Ip_Sena;
    SET @contra	= 		Contraseña;
    SET @id_estado = 	Id_Estado;
    SET @id_ar_ce = 	Id_Area_Centro;
    
    
	CALL insertar(9,'Funcionario','Num_Documento',	@num_doc,
								  'Nom_Funcionario',@nom_fun,
								  'Apellidos',		@apell,
								  'Correo',			@corr,
								  'Cargo',			@carg,
								  'Ip_Sena',		@ip_sen,
								  'Contraseña',		@contra,
                                  'Id_Estado',      @id_estado,
								  'Id_Area_Centro', @id_ar_ce,
								null,null,null,null);
									
   CALL ObtenerId(1,"Funcionario","Num_Documento",@num_doc,"","","Id_Funcionario",@id); 
   
   CALL insertar(2,'Rol_Funcionario','Id_Rol',@id_rol,'Id_Funcionario',@id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

 
END;;

CALL RegistrarFuncionario(1,444,"emmy","Gonzalez","emmy@hotmail","Aprendiz","E1M","1234",1,1);