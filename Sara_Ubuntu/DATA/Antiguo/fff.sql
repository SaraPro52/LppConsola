-- NOMBRE PV, NUMERO DE LA VERSION , FECHA VIGENCIA, 

SELECT Id_P_Virtual,Nom_P_Virtual, Id_Version,Num_Version, Fecha_Vigencia,Url_Version, Id_Formato
FROM 09_v_Autor
WHERE Id_Estado IN (6,7) AND Id_Funcionario = 1 AND 


SELECT COUNT(*)
		FROM Version v1 INNER JOIN Producto_Virtual  v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
		WHERE v1.Id_P_Virtual = (SELECT Id_P_Virtual FROM Version WHERE Id_Version =  ) 
			AND Id_Estado = 6
			AND Num_Version > (SELECT Num_Version FROM Version WHERE Id_Version = idVer); 
            
            
            

DELIMITER ;;
CREATE PROCEDURE List_Actualizar (IN ) 
	
    CREATE TEMPORARY TABLE pruebaTempo (
		Id_P_Virtual INTEGER,
        Nom_P_Virtual VARCHAR(100),
        Id_Version INTEGER,
        Num_Version INTEGER, 
        Fecha_Vigencia TIMESTAMP,
        Url_Version VARCHAR(500), 
        Id_Formato INTEGER
    );
    
DELIMITER ;
            
            
