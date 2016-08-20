USE SARA;

DELIMITER ;;

CREATE PROCEDURE RegistrarListaChequeo(
	IN Nom_Lista_Chequeo VARCHAR(100),
    IN Des_Lista_Chequeo VARCHAR(200),
    IN Id_Funcionario    INTEGER,
    IN Array_Items		 VARCHAR(200),
    IN Num_Array		 INTEGER
)
BEGIN
	SET @nomList = Nom_Lista_Chequeo;
    SET @desList = Des_Lista_Chequeo;
    SET @idFun   = Id_Funcionario;
    SET @array   = Array_Items;
    SET @numArray = Num_Array;
    SET @i = 0;
    
    CALL Sara('INSERT',3,'Lista_Chequeo',null,null,'Nom_Lista_Chequeo',@nomList,
												   'Des_Lista_Chequeo',@desList,
												   'Id_Funcionario',@idFun,
                                                    null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
    
    CALL ObtenerId(1,'Lista_Chequeo','Nom_Lista_Chequeo',@nomList,'','','Id_Lista_Chequeo',@id);
    
    
	WHILE(@i < @numArray)
		DO
		
		SET @V = SUBSTRING_INDEX(@array,",",1);

		SET @s = CHAR_LENGTH(@array) - CHAR_LENGTH(@V);

		SET @array = RIGHT(@array,@s -1);
        
		CALL Sara('INSERT',2,'Detalles_Lista',null,null,'Id_Lista_Chequeo',@id,'Id_Item_Lista',@V,
				  null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
		
        SET @i = @i + 1;
	END WHILE;
    
END;;
DELIMITER ;


CALL Sara('INSERT',3,'Lista_Chequeo',null,null,'Nom_Lista_Chequeo','Lista para las imagenes','Des_Lista_Chequeo','Estal lista esta enfocada a solo evaluaciones de imagenes','Id_Funcionario',2,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);



CALL RegistrarListaChequeo('LA PRUEBA','ECHA PARA SER LA MEJOR',2,'1,2,3',3);


