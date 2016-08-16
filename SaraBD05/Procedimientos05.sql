USE SARA;

DROP PROCEDURE Sara;
DELIMITER ;;
CREATE PROCEDURE Sara(

	IN sentencia VARCHAR(50),
    IN num_Colums INTEGER,		IN tabla VARCHAR(50),
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

	CASE sentencia
		WHEN "INSERT" 
        THEN 
			CASE num_Colums
				WHEN 1 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,") 				
												VALUES('",cont_colum1,"')");
				
				WHEN 2 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,") 	
												VALUES('",cont_colum1,"','",cont_colum2,"')");
												
				WHEN 3 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,") 							
												VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"')");
				
				WHEN 4 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,") 	
												VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"')");
				
				WHEN 5 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,") 
												VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"')");
												
				WHEN 6 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,") 
												VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"')");
												
				WHEN 7 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,") 
												VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"')");
												
				WHEN 8 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,",",nom_Colum8,") 
												VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"','",cont_colum8,"')");
												
				WHEN 9 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,",",nom_Colum8,",",nom_Colum9,") 
												VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"','",cont_colum8,"','",cont_colum9,"')");
																				
				WHEN 10 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,",",nom_Colum8,",",nom_Colum9,",",nom_Colum10,") 
												VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"','",cont_colum8,"','",cont_colum9,"','",cont_colum10,"')");
																				
				WHEN 11 THEN SET @sara = CONCAT("INSERT INTO ",tabla,"(",nom_Colum1,",",nom_Colum2,",",nom_Colum3,",",nom_Colum4,",",nom_Colum5,",",nom_Colum6,",",nom_Colum7,",",nom_Colum8,",",nom_Colum9,",",nom_Colum10,",",nom_Colum11,") 
												VALUES('",cont_colum1,"','",cont_colum2,"','",cont_colum3,"','",cont_colum4,"','",cont_colum5,"','",cont_colum6,"','",cont_colum7,"','",cont_colum8,"','",cont_colum9,"','",cont_colum10,"','",cont_colum11,"')");
							
			END CASE;
        
        WHEN "UPDATE"
        THEN 
			CASE num_Colums
				WHEN 1 THEN SET @sara = CONCAT("UPDATE ",tabla," SET ",nom_Colum1," = '",cont_colum1,"' WHERE ",nom_ColumId," = '",id_colum,"'");
				
				WHEN 2 THEN SET @sara = CONCAT("UPDATE ",tabla,
											" SET 	",nom_Colum1," = '",cont_colum1,"',
													",nom_Colum2," = '",cont_colum2,"' 
											WHERE 	",nom_ColumId," = ",id_colum,"");
												
				WHEN 3 THEN SET @sara = CONCAT("UPDATE ",tabla,
											" SET ",nom_Colum1," = '",cont_colum1,"',
												  ",nom_Colum2," = '",cont_colum2,"',
												  ",nom_Colum3," = '",cont_colum3,"'
											WHERE ",nom_ColumId," = ",id_colum,"");
											
				WHEN 4 THEN SET @sara = CONCAT("UPDATE ",tabla,
											" SET ",nom_Colum1," = '",cont_colum1,"',
												  ",nom_Colum2," = '",cont_colum2,"',
												  ",nom_Colum3," = '",cont_colum3,"',
												  ",nom_Colum4," = '",cont_colum4,"'
											WHERE ",nom_ColumId," = ",id_colum,"");
											
				WHEN 5 THEN SET @sara = CONCAT("UPDATE ",tabla,
											" SET ",nom_Colum1," = '",cont_colum1,"',
												  ",nom_Colum2," = '",cont_colum2,"',
												  ",nom_Colum3," = '",cont_colum3,"',
												  ",nom_Colum4," = '",cont_colum4,"',
												  ",nom_Colum5," = '",cont_colum5,"'
											WHERE ",nom_ColumId," = ",id_colum,"");  
											
				WHEN 6 THEN SET @sara = CONCAT("UPDATE ",tabla,
											" SET ",nom_Colum1," = '",cont_colum1,"',
												  ",nom_Colum2," = '",cont_colum2,"',
												  ",nom_Colum3," = '",cont_colum3,"',
												  ",nom_Colum4," = '",cont_colum4,"',
												  ",nom_Colum5," = '",cont_colum5,"',
												  ",nom_Colum6," = '",cont_colum6,"'
											WHERE ",nom_ColumId," = ",id_colum,""); 
											
				WHEN 7 THEN SET @sara = CONCAT("UPDATE ",tabla,
											" SET ",nom_Colum1," = '",cont_colum1,"',
												  ",nom_Colum2," = '",cont_colum2,"',
												  ",nom_Colum3," = '",cont_colum3,"',
												  ",nom_Colum4," = '",cont_colum4,"',
												  ",nom_Colum5," = '",cont_colum5,"',
												  ",nom_Colum6," = '",cont_colum6,"',
												  ",nom_Colum7," = '",cont_colum7,"'
											WHERE ",nom_ColumId," = ",id_colum,"");
											
				WHEN 8 THEN SET @sara = CONCAT("UPDATE ",tabla,
											" SET ",nom_Colum1," = '",cont_colum1,"',
												  ",nom_Colum2," = '",cont_colum2,"',
												  ",nom_Colum3," = '",cont_colum3,"',
												  ",nom_Colum4," = '",cont_colum4,"',
												  ",nom_Colum5," = '",cont_colum5,"',
												  ",nom_Colum6," = '",cont_colum6,"',
												  ",nom_Colum7," = '",cont_colum7,"',
												  ",nom_Colum8," = '",cont_colum8,"'
											WHERE ",nom_ColumId," = ",id_colum,"");
											
				WHEN 9 THEN SET @sara = CONCAT("UPDATE ",tabla,
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
											
				WHEN 10 THEN SET @sara = CONCAT("UPDATE ",tabla,
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
											
				WHEN 11 THEN SET @sara = CONCAT("UPDATE ",tabla,
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
            
        WHEN "DELETE" 
        THEN
			SET @sara = CONCAT("DELETE FROM ",tabla," WHERE ",nom_ColumId," = ",id_colum,"");
        
        
        WHEN "SELECT"
        THEN
			CASE num_Colums 
				WHEN 1 THEN SET @sara = CONCAT("SELECT * FROM ",tabla);
				WHEN 2 THEN SET @sara = CONCAT("SELECT * FROM ",tabla," WHERE ",nom_ColumId," = ",id_colum);
			END CASE;
				
			
    END CASE;
    
    PREPARE sara FROM @sara;
    EXECUTE sara;

END;;

DELIMITER ;

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

DELIMITER ;

