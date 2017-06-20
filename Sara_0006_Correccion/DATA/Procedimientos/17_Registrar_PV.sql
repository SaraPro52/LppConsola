DROP PROCEDURE IF EXISTS Registrar_PV;
DELIMITER ;;
CREATE PROCEDURE Registrar_PV(IN ArrayTodo VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN

DECLARE i,a,co,num,idPro,idTema,tipo INTEGER DEFAULT 0;

DECLARE Nom_P_Virtual_Var,Des_P_Virtual_Var,Palabras_Clave_Var,Id_Formato_Var,
		Url_Version_Var,Url_Img_Var,Inst_Instalacion_Var,Reqst_Instalacion_Var,
        ArrayFuncionario_Var ,ArrayTema_Var VARCHAR(200);
        
DECLARE arrayT VARCHAR(100) DEFAULT "";
DECLARE cant   INTEGER DEFAULT 0;
DECLARE val    VARCHAR(100) DEFAULT "";

SELECT 1;

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
    
SET Nom_P_Virtual_Var 	= @Nom_P_Virtual, 
	Des_P_Virtual_Var 	= @Des_P_Virtual,
	Palabras_Clave_Var 	= @Palabras_Clave,
	Id_Formato_Var 		= @Id_Formato,
	Url_Version_Var 	= @Url_Version,
	Url_Img_Var 		= @Url_Img,
	Inst_Instalacion_Var	= @Inst_Instalacion,
	Reqst_Instalacion_Var 	= @Reqst_Instalacion,
	ArrayFuncionario_Var 	= @ArrayFuncionario,
	ArrayTema_Var 			= @ArrayTema;

    -- CALL SARA_CRUD("SELECT","Producto_Virtual","COUNT(*) INTO @co","Nom_P_Virtual = @Nom_P_Virtual OR Des_P_Virtual = @Des_P_Virtual");
    
    SELECT COUNT(*) -- INTO co
    FROM Producto_Virtual
    WHERE Nom_P_Virtual = Nom_P_Virtual_Var OR Des_P_Virtual = Des_P_Virtual_Var;
    
    IF (co = 0) THEN 
		CALL SARA_CRUD("INSERT","Producto_Virtual",CONCAT("Nom_P_Virtual~",Nom_P_Virtual_Var,"|Des_P_Virtual~",Des_P_Virtual_Var,"|Palabras_Clave~",Palabras_Clave_Var,"|Id_Formato~",Id_Formato_Var,""),"");
		
        -- CALL SARA_CRUD("SELECT","Producto_Virtual","Id_P_Virtual INTO @idPro","Nom_P_Virtual = @Nom_P_Virtual");
        
        SELECT Id_P_Virtual INTO idPro
        FROM Producto_Virtual
        WHERE Nom_P_Virtual = Nom_P_Virtual_Var;
        
        SELECT idPro,Nom_P_Virtual_Var; 
        
		SET i = 0;
		SET num = M_LENGTH(ArrayTema_Var,",");
        
        SELECT num;
        
        
		WHILE(i < num)DO
         -- SET i = i + 1;
         
        SELECT "Entro1_";
        
			SET arrayT = SUBSTRING_INDEX(ArrayTema_Var,",",1);
			SET cant = CHAR_LENGTH(ArrayTema_Var) - CHAR_LENGTH(arrayT);
			SET ArrayTema_Var = RIGHT(ArrayTema_Var,cant -1);
			SET a = 0;
			WHILE(a < 2)DO
            
            SELECT "Entro2_";
				SET val = SUBSTRING_INDEX(arrayT,"-",1);
				SET cant = CHAR_LENGTH(arrayT) - CHAR_LENGTH(val);
				SET arrayT = RIGHT(arrayT,cant -1);
				CASE a
					WHEN 0 THEN SET idTema = val; 
					WHEN 1 THEN SET tipo 	= val;
				END CASE;
				SET a = a + 1;        
			END WHILE;
            
            SELECT idTema,tipo,idPro;
            
			CALL SARA_CRUD("INSERT","Detalles_Tema",CONCAT("Id_Tema~",idTema,"|Id_P_Virtual~",idPro,"|Tipo_Tema~",tipo,""),"");
			SET i = i + 1;
		END WHILE;
		CALL RegistrarVersion(CONCAT("",idPro,"~",Url_Version_Var,"~",Url_Img_Var,"~",Inst_Instalacion_Var,"~",Reqst_Instalacion_Var,"~",ArrayFuncionario_Var,""),nomUrl);
        
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "El nombre del producto o los detalles del mismo ya existen ";
	END IF;
	
END;;
DELIMITER ;
