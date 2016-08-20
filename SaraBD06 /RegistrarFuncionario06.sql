USE SARA;

DROP PROCEDURE RegistrarFuncionario;
DELIMITER ;;
CREATE PROCEDURE RegistrarFuncionario(

IN Id_Rol				INTEGER,
IN Id_Tipo_Documento 	INTEGER,
IN Num_Documento 		DOUBLE,
IN Nom_Funcionario		VARCHAR(45),
IN Apellidos 			VARCHAR(100),
IN Correo 				VARCHAR(125),
IN Cargo				VARCHAR(45),
IN Ip_Sena 				VARCHAR(6),
IN Contraseña			VARCHAR(300),
IN Id_Estado			INTEGER,
IN Id_Area_Centro		INTEGER
)
BEGIN
	
    SET @id_rol =       Id_Rol;
    SET @id_tipo =      Id_Tipo_Documento;
    SET @num_doc = 		Num_Documento;
    SET @nom_fun = 		Nom_Funcionario;
    SET @apell 	= 		Apellidos;
    SET @corr 	= 		Correo;
    SET @carg 	= 		Cargo;
    SET @ip_sen = 		Ip_Sena;
    SET @contra	= 		Contraseña;
    SET @id_estado = 	Id_Estado;
    SET @id_ar_ce = 	Id_Area_Centro;
    
    
	CALL Sara('INSERT',10,'Funcionario',null,null,
								  'Id_Tipo_Documento',	@id_tipo,
								  'Num_Documento',		@num_doc,
								  'Nom_Funcionario',	@nom_fun,
								  'Apellidos',			@apell,
								  'Correo',				@corr,
								  'Cargo',				@carg,
								  'Ip_Sena',			@ip_sen,
								  'Contraseña',			@contra,
                                  'Id_Estado',      	@id_estado,
								  'Id_Area_Centro', 	@id_ar_ce,
									null,null);
									
   CALL ObtenerId(1,"Funcionario","Num_Documento",@num_doc,"","","Id_Funcionario",@id); 
   
   CALL Sara('INSERT',2,'Rol_Funcionario',null,null,'Id_Rol',@id_rol,'Id_Funcionario',@id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

END;;
DELIMITER ;

CALL RegistrarFuncionario(1,1,44,"emmy","Gonzalez","emmy@hotmail","Aprendiz","E1","1234",1,1);