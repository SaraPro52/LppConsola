-- LA VALORACION DE LOS VOTOS TIENE QUE SER EN FLOAT

DROP PROCEDURE IF EXISTS RegistrarRankin;
DELIMITER ;;
CREATE PROCEDURE RegistrarRankin(IN arrayRegistrarRankin VARCHAR(50))
-- IN numeroCaso INTEGER(1),IN idVer_Prod INTEGER,IN idFuncionario INTEGER, IN numVoto INTEGER
BEGIN
  DECLARE idProd        INTEGER DEFAULT 0;
  DECLARE idRankin      INTEGER DEFAULT 0;
  DECLARE numeroCaso    INTEGER(1)DEFAULT 0;
  DECLARE idVer_Prod    INTEGER DEFAULT 0;
  DECLARE idFuncionario INTEGER DEFAULT 0;
  DECLARE numVoto       INTEGER(1) DEFAULT 0;
  
  SET @numeroCaso = NULL,@idVer_Prod = NULL,@idFuncionario = NULL,@numVoto = NULL;
  
  CALL EXECUTE_ARRAY(
		arrayRegistrarRankin,"~",
        "CASE @i 
			WHEN 0 THEN SET @numeroCaso	 	      = @valor;
			WHEN 1 THEN SET @idVer_Prod 	  	  = @valor;
			WHEN 2 THEN SET @idFuncionario 	  	= @valor;
			WHEN 3 THEN SET @numVoto 	  	      = @valor;
		END CASE;");
   
  SET numeroCaso = @numeroCaso,
  idVer_Prod = @idVer_Prod,
  idFuncionario = @idFuncionario,
  numVoto = @numVoto;

  SELECT Id_Rankin INTO idRankin FROM rankin WHERE Id_Version = idVer_Prod;
  
  CASE numeroCaso
  
     WHEN 1 THEN 
     -- Aumenta una unidad a la cantidad de visitas que tiene un pv y este
     -- numero es compartido por todas las versiones
     BEGIN
        
        SELECT Id_P_Virtual INTO idProd 
        FROM version WHERE Id_Version = idVer_Prod;
        
        UPDATE rankin v1 INNER JOIN Version v2 ON v1.Id_Version = v2.Id_Version
        SET Cant_Visitas = Cant_Visitas + 1 
        WHERE Id_P_Virtual = idProd;
        
     END; 
     WHEN 2 THEN
     -- Aumenta una unidad a la cantidad de Descargas que tiene la version
     BEGIN
        UPDATE rankin
        SET Cant_Descargas = Cant_Descargas + 1 
        WHERE Id_Rankin = idRankin;
     END;
     WHEN 3 THEN 
     -- Inserta o actualiza el voto que tiene un determinado usuario con respecto a una determinada version
     BEGIN
        IF (
          SELECT TRUE FROM Voto
          WHERE Id_Rankin = idRankin AND Id_Funcionario = idFuncionario
        ) THEN
        
          UPDATE Voto SET Num_Voto = numVoto 
          WHERE Id_Funcionario = idFuncionario AND Id_Rankin = idRankin; 
          
          ELSE BEGIN
            INSERT INTO Voto VALUES ( NULL, numVoto,idFuncionario, idRankin );
            UPDATE Rankin SET Cant_Votos = Cant_Votos + 1 WHERE Id_Rankin = idRankin;
          END;
        END IF;
        
     END;
  END CASE;
END;;
DELIMITER ;

/*
CALL RegistrarRankin("1~12~0~0");
CALL RegistrarRankin("2~12~0~0");
CALL RegistrarRankin("3~12~5~5");

SELECT * FROM rankin;
SELECT * FROM Voto;
*/


DROP PROCEDURE IF EXISTS ActualizarPuestoRankin;
DELIMITER ;;
CREATE PROCEDURE ActualizarPuestoRankin()
BEGIN
  SET SQL_SAFE_UPDATES = 0;
  DROP TEMPORARY TABLE IF EXISTS ActualizarPuesto1;
  CREATE TEMPORARY TABLE ActualizarPuesto1 (
    IdRankin1  INTEGER NOT NULL,
    Puesto1    INTEGER NOT NULL
  );
  
  SET @contPuesto = 0;
  INSERT INTO ActualizarPuesto1 (
    SELECT Id_Rankin, @contPuesto := @contPuesto + 1 
    FROM  VistaPuesto
    ORDER BY Val_Puesto DESC
  );
  
  UPDATE Rankin v1 
  INNER JOIN ActualizarPuesto1 v2 ON v1.Id_Rankin = v2.IdRankin1 
  SET v1.Puesto = v2.Puesto1;
  
END;;
DELIMITER ;

-- CALL ActualizarPuestoRankin();

DROP VIEW IF EXISTS vistapuesto;
CREATE VIEW VistaPuesto AS (
    SELECT v1.Id_Rankin, 
    LPAD((SUM(Num_Voto) / v1.Cant_Votos) * 0.7 + v1.Cant_Descargas * 0.2 + v1.Cant_Visitas * 0.1,3,"0") AS Val_Puesto, v1.Puesto
    FROM rankin v1 INNER JOIN voto v2 ON v1.Id_Rankin = v2.Id_Rankin
    GROUP BY v1.Id_Rankin
);


SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS Event_ActualizarPuesto;
DELIMITER ;;
CREATE EVENT Event_ActualizarPuesto 
ON SCHEDULE EVERY 5 MINUTE STARTS '2017/05/24 18:00:00' ENABLE
COMMENT "ActualizarPuesto"
DO
BEGIN 
	CALL ActualizarPuestoRankin();
END;;
DELIMITER ;

-- select * from information_schema.EVENTS
