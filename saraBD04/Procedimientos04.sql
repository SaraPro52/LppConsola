USE SARApro;

DROP PROCEDURE seleccionar;
DROP PROCEDURE insertar;
DROP PROCEDURE actualizar;
DROP PROCEDURE eliminar;
DROP PROCEDURE ObtenerId;

DELIMITER ;;
CREATE PROCEDURE seleccionar(IN num INTEGER ,IN tabla VARCHAR(100),IN colum_id VARCHAR(100),IN val_id INTEGER)
BEGIN

	CASE num 
    WHEN 1 THEN SET @t = CONCAT("SELECT * FROM ",tabla);
	WHEN 2 THEN SET @t = CONCAT("SELECT * FROM ",tabla," WHERE ",colum_id," = ",val_id);
    END CASE;
    
	PREPARE sl FROM @t;
    
    EXECUTE sl;
END;;


DELIMITER ;;
CREATE PROCEDURE insertar(
	IN num_Colums INTEGER,
	IN tabla VARCHAR(50),
	IN nom_Colum1 VARCHAR(100),	IN cont_colum1 VARCHAR(400),
	IN nom_Colum2 VARCHAR(100),	IN cont_colum2 VARCHAR(400),
    IN nom_Colum3 VARCHAR(100),	IN cont_colum3 VARCHAR(400),
    IN nom_Colum4 VARCHAR(100),	IN cont_colum4 VARCHAR(400),
    IN nom_Colum5 VARCHAR(100),	IN cont_colum5 VARCHAR(400),
    IN nom_Colum6 VARCHAR(100),	IN cont_colum6 VARCHAR(400),
    IN nom_Colum7 VARCHAR(100),	IN cont_colum7 VARCHAR(400),
    IN nom_Colum8 VARCHAR(100),	IN cont_colum8 VARCHAR(400),
    IN nom_Colum9 VARCHAR(100),	IN cont_colum9 VARCHAR(400),
    IN nom_Colum10 VARCHAR(100),IN cont_colum10 VARCHAR(400),
    IN nom_Colum11 VARCHAR(100),IN cont_colum11 VARCHAR(400))
    
    
BEGIN 
	
    CASE num_Colums
		WHEN 1 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,") 				
										VALUES('",cont_colum1,"')");
        
        WHEN 2 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,") 	
										VALUES('",cont_colum1,"','",cont_colum2,"')");
                                        
        WHEN 3 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,") 							
										VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"')");
        
        WHEN 4 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,") 	
										VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"')");
        
        WHEN 5 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,") 
										VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"')");
                                        
		WHEN 6 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,") 
										VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"')");
                                        
		WHEN 7 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,") 
										VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"')");
                                        
		WHEN 8 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,",",nom_Colum8,") 
										VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"','",cont_colum8,"')");
                                        
		WHEN 9 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,",",nom_Colum8,",",nom_Colum9,") 
										VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"','",cont_colum8,"','",cont_colum9,"')");
                                                                        
		WHEN 10 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,",",nom_Colum8,",",nom_Colum9,",",nom_Colum10,") 
										VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"','",cont_colum8,"','",cont_colum9,"','",cont_colum10,"')");
                                                                        
		WHEN 11 THEN SET @ins = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,",",nom_Colum8,",",nom_Colum9,",",nom_Colum10,",",nom_Colum11,") 
										VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"','",cont_colum8,"','",cont_colum9,"','",cont_colum10,"','",cont_colum11,"')");
                                                                        
		
    END CASE;
 
    PREPARE insertar FROM @ins;
    
    EXECUTE insertar;
END;;


DELIMITER ;;
CREATE PROCEDURE actualizar(
	IN num_Colums INTEGER,
	IN tabla VARCHAR(50),
	IN nom_ColumId VARCHAR(100),IN id_colum INTEGER,
	IN nom_Colum1 VARCHAR(100),	IN cont_colum1 VARCHAR(400),
	IN nom_Colum2 VARCHAR(100),	IN cont_colum2 VARCHAR(400),
    IN nom_Colum3 VARCHAR(100),	IN cont_colum3 VARCHAR(400),
    IN nom_Colum4 VARCHAR(100),	IN cont_colum4 VARCHAR(400),
    IN nom_Colum5 VARCHAR(100),	IN cont_colum5 VARCHAR(400),
    IN nom_Colum6 VARCHAR(100),	IN cont_colum6 VARCHAR(400),
    IN nom_Colum7 VARCHAR(100),	IN cont_colum7 VARCHAR(400),
    IN nom_Colum8 VARCHAR(100),	IN cont_colum8 VARCHAR(400),
    IN nom_Colum9 VARCHAR(100),	IN cont_colum9 VARCHAR(400),
    IN nom_Colum10 VARCHAR(100),IN cont_colum10 VARCHAR(400),
    IN nom_Colum11 VARCHAR(100),IN cont_colum11 VARCHAR(400))
    
    
BEGIN 
	
    CASE num_Colums
		WHEN 1 THEN SET @act = CONCAT("UPDATE ",tabla," SET ",nom_Colum1," = '",cont_colum1,"' WHERE ",nom_ColumId," = '",id_colum,"'");
        
        WHEN 2 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET 	",nom_Colum1," = '",cont_colum1,"',
											",nom_Colum2," = '",cont_colum2,"' 
									WHERE 	",nom_ColumId," = ",id_colum,"");
                                        
        WHEN 3 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET ",nom_Colum1," = '",cont_colum1,"',
										  ",nom_Colum2," = '",cont_colum2,"',
										  ",nom_Colum3," = '",cont_colum3,"'
									WHERE ",nom_ColumId," = ",id_colum,"");
                                    
        WHEN 4 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET ",nom_Colum1," = '",cont_colum1,"',
										  ",nom_Colum2," = '",cont_colum2,"',
										  ",nom_Colum3," = '",cont_colum3,"',
                                          ",nom_Colum4," = '",cont_colum4,"'
									WHERE ",nom_ColumId," = ",id_colum,"");
                                    
        WHEN 5 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET ",nom_Colum1," = '",cont_colum1,"',
										  ",nom_Colum2," = '",cont_colum2,"',
										  ",nom_Colum3," = '",cont_colum3,"',
                                          ",nom_Colum4," = '",cont_colum4,"',
                                          ",nom_Colum5," = '",cont_colum5,"'
									WHERE ",nom_ColumId," = ",id_colum,"");  
                                    
		WHEN 6 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET ",nom_Colum1," = '",cont_colum1,"',
										  ",nom_Colum2," = '",cont_colum2,"',
										  ",nom_Colum3," = '",cont_colum3,"',
                                          ",nom_Colum4," = '",cont_colum4,"',
                                          ",nom_Colum5," = '",cont_colum5,"',
                                          ",nom_Colum6," = '",cont_colum6,"'
									WHERE ",nom_ColumId," = ",id_colum,""); 
                                    
		WHEN 7 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET ",nom_Colum1," = '",cont_colum1,"',
										  ",nom_Colum2," = '",cont_colum2,"',
										  ",nom_Colum3," = '",cont_colum3,"',
                                          ",nom_Colum4," = '",cont_colum4,"',
                                          ",nom_Colum5," = '",cont_colum5,"',
                                          ",nom_Colum6," = '",cont_colum6,"',
                                          ",nom_Colum7," = '",cont_colum7,"'
									WHERE ",nom_ColumId," = ",id_colum,"");
                                    
		WHEN 8 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET ",nom_Colum1," = '",cont_colum1,"',
										  ",nom_Colum2," = '",cont_colum2,"',
										  ",nom_Colum3," = '",cont_colum3,"',
                                          ",nom_Colum4," = '",cont_colum4,"',
                                          ",nom_Colum5," = '",cont_colum5,"',
                                          ",nom_Colum6," = '",cont_colum6,"',
                                          ",nom_Colum7," = '",cont_colum7,"',
                                          ",nom_Colum8," = '",cont_colum8,"'
									WHERE ",nom_ColumId," = ",id_colum,"");
                                    
		WHEN 9 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET ",nom_Colum1," = '",cont_colum1,"',
										  ",nom_Colum2," = '",cont_colum2,"',
										  ",nom_Colum3," = '",cont_colum3,"',
                                          ",nom_Colum4," = '",cont_colum4,"',
                                          ",nom_Colum5," = '",cont_colum5,"',
                                          ",nom_Colum6," = '",cont_colum6,"',
                                          ",nom_Colum7," = '",cont_colum7,"',
                                          ",nom_Colum8," = '",cont_colum8,"',
                                          ",nom_Colum9," = '",cont_colum9,"'
									WHERE ",nom_ColumId," = ",id_colum,"");      
                                    
		WHEN 10 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET ",nom_Colum1," = '",cont_colum1,"',
										  ",nom_Colum2," = '",cont_colum2,"',
										  ",nom_Colum3," = '",cont_colum3,"',
                                          ",nom_Colum4," = '",cont_colum4,"',
                                          ",nom_Colum5," = '",cont_colum5,"',
                                          ",nom_Colum6," = '",cont_colum6,"',
                                          ",nom_Colum7," = '",cont_colum7,"',
                                          ",nom_Colum8," = '",cont_colum8,"',
                                          ",nom_Colum9," = '",cont_colum9,"',
                                          ",nom_Colum10," = '",cont_colum10,"'
									WHERE ",nom_ColumId," = ",id_colum,""); 
                                    
		WHEN 11 THEN SET @act = CONCAT("UPDATE ",tabla,
									" SET ",nom_Colum1," = '",cont_colum1,"',
										  ",nom_Colum2," = '",cont_colum2,"',
										  ",nom_Colum3," = '",cont_colum3,"',
                                          ",nom_Colum4," = '",cont_colum4,"',
                                          ",nom_Colum5," = '",cont_colum5,"',
                                          ",nom_Colum6," = '",cont_colum6,"',
                                          ",nom_Colum7," = '",cont_colum7,"',
                                          ",nom_Colum8," = '",cont_colum8,"',
                                          ",nom_Colum9," = '",cont_colum9,"',
                                          ",nom_Colum10," = '",cont_colum10,"',
                                          ",nom_Colum11," = '",cont_colum11,"'
									WHERE ",nom_ColumId," = ",id_colum,"");  
                                    
  
    END CASE;
 
    PREPARE actualizar FROM @act;
    
    EXECUTE actualizar;
END;;


DELIMITER ;;
CREATE PROCEDURE eliminar(IN tabla VARCHAR(50),IN nom_ColumId VARCHAR(100),IN id_colum INTEGER)
BEGIN
	
    SET @eli = CONCAT("DELETE FROM ",tabla," WHERE ",nom_ColumId," = ",id_colum,"");
    
    PREPARE eliminar FROM @eli;
    
    EXECUTE eliminar;
END;;


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

call seleccionar(1,"Ciudad","","");
