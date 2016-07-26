USE SARApro;

DROP PROCEDURE ObtenerId;
DELIMITER ;;
CREATE PROCEDURE ObtenerId(
 
IN val   INTEGER,
IN tabla VARCHAR(50),
IN colum1 VARCHAR(100),
IN colum_val1 VARCHAR(400),
IN colum2 VARCHAR(100),
IN colum_val2 VARCHAR(400),
IN colum_id VARCHAR(100), 
OUT id INTEGER)
BEGIN
	
    CASE val
    WHEN 1 THEN SET @val = CONCAT("SELECT DISTINCT ",colum_id," INTO @id FROM ",tabla," WHERE  ",colum1," = '",colum_val1,"' ");
    WHEN 2 THEN SET @val = CONCAT("SELECT DISTINCT ",colum_id," INTO @id FROM ",tabla," WHERE  ",colum1," = '",colum_val1,"' AND ",colum2," = '",colum_val2,"'");
    END CASE;
    
    PREPARE pre FROM @val;
    EXECUTE pre;
    SET id = @id;
    
END;;

CALL ObtenerId(1,"Tema","Nom_Tema","JAVA","","","Id_Tema",@id);

SELECT @id ;




DROP PROCEDURE RegistrarCoordinador;
DELIMITER ;;
CREATE PROCEDURE RegistrarCoordinador(
	
IN Num_Documento 	DOUBLE,
IN Nom_Funcionario	VARCHAR(45),
IN Apellidos 		VARCHAR(100),
IN Correo 			VARCHAR(125),
IN Cargo			VARCHAR(45),
IN Ip_Sena 			VARCHAR(6),
IN Contraseña		VARCHAR(255),
IN Id_Area_Centro	INTEGER

)
BEGIN
	
    
    SET @num_doc = 	Num_Documento;
    SET @nom_fun = 	Nom_Funcionario;
    SET @apell 	= 	Apellidos;
    SET @corr 	= 	Correo;
    SET @carg 	= 	Cargo;
    SET @ip_sen = 	Ip_Sena;
    SET @contra	= 	Contraseña;
    SET @Id_ArCe = 	Id_Area_Centro;
    
    
	CALL insertar(8,'Funcionario','Num_Documento',	@num_doc,
								  'Nom_Funcionario',@nom_fun,
								  'Apellidos',		@apell,
								  'Correo',			@corr,
								  'Cargo',			@carg,
								  'Ip_Sena',		@ip_sen,
								  'Contraseña',		@contra,
								  'Id_Area_Centro', @Id_ArCe,
								null,null,null,null,null,null,null,null);
                                
   CALL ObtenerId(1,"Funcionario","Num_Documento",@num_doc,"","","Id_Funcionario",@id); 
   
   SELECT @id;
   CALL insertar(2,'Rol_Funcionario','Id_Rol','4','Id_Funcionario',@id,
   null,null,null,null,null,null,null,null,null,null,null,null,null,
   null,null,null,null,null,null,null);

 
 
END;;
