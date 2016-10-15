USE SARA;

DROP TRIGGER IF EXISTS Version_AU_Trigger;
DELIMITER ;;
CREATE TRIGGER  Version_AU_Trigger AFTER UPDATE ON Version FOR EACH ROW
BEGIN
	IF(OLD.Id_Estado = 4 AND NEW.Id_Estado = 5) OR (OLD.Id_Estado = 5 AND NEW.Id_Estado = 6)THEN
		SELECT COUNT(*) INTO @lineas 
		FROM Version v INNER JOIN Evaluacion_General eg ON v.Id_Version = eg.Id_Version 
		WHERE Id_P_Virtual = OLD.Id_P_Virtual AND Id_Estado = OLD.Id_Estado AND Resultado = 1;
					

		IF (OLD.Id_Estado = 5 AND NEW.Id_Estado = 6 AND @lineas = 1) THEN
			INSERT INTO Rankin(Id_Version) VALUES(OLD.Id_Version);
			ELSEIF(OLD.Id_Estado = 4 AND NEW.Id_Estado = 5 AND @lineas = 1) THEN SET @lineas = 0;
			ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "No se pudo realizar la actualizacion"; 
		END IF;
    END IF;
    
END;;
DELIMITER ;



DROP TRIGGER IF EXISTS EvaluacionGeneral_AI_Trigger;
DELIMITER ;;
CREATE TRIGGER EvaluacionGeneral_AI_Trigger AFTER INSERT ON Evaluacion_General FOR EACH ROW
BEGIN
	SET @estado = 0;
    
    SELECT Id_Estado INTO @estado FROM Version WHERE Id_Version = NEW.Id_Version;
    
    IF(NEW.Resultado = 1)THEN
		CASE @estado
			WHEN 3 THEN SET @etd = 4;
            WHEN 4 THEN SET @etd = 5;
        END CASE;
        UPDATE Version SET Id_Estado = @etd WHERE Id_Version = NEW.Id_Version;
    END IF;
END;;
DELIMITER ;

CALL SARA_CRUD("INSERT","Version","Num_Version~1	|Url_Version~Prueba6/Version6	|Url_Img~Prueba6/Imagen6	|Inst_Instalacion~No se instala6 |Reqst_Instalacion~Ningun requisito 6|Id_P_Virtual~3","");

CALL SARA_CRUD("UPDATE","Version","Id_Estado~6","Id_Version = 3 ");

CALL RegistrarEvaluacion("Observacion de prueba~1~10~3~6~2017-09-09~1¤si cumple con el item¤1|1¤si cumple con el item¤2");
    
CALL SARA_CRUD("SELECT","Producto_Virtual","","");
CALL SARA_CRUD("SELECT","Detalles_Tema","","");
CALL SARA_CRUD("SELECT","Version","","");
CALL SARA_CRUD("SELECT","Rankin","","");
CALL SARA_CRUD("SELECT","Categoria","","");


DROP TRIGGER IF EXISTS EvaluacionGeneral_BI_Trigger;
DELIMITER ;;
CREATE TRIGGER EvaluacionGeneral_BI_Trigger BEFORE INSERT ON Evaluacion_General FOR EACH ROW
BEGIN 
	SET @estado = 0;
    SELECT Id_Estado INTO @estado FROM Version WHERE Id_Version = NEW.Id_Version;
    IF(@estado = 3 OR @estado = 4)THEN
		SET @estado = 0;
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "La version no se encuentra en el estado requerido para derrollar la evaluacion";
    END IF;
END;;

DELIMITER ;



CALL SARA_CRUD("INSERT","Evaluacion_General","Observacion~cualquiera|Resultado~0|Id_Version~9|Id_Lista_Chequeo~3|Id_Funcionario~2","");

SELECT Id_Estado FROM Version WHERE Id_Version = 10;


DROP TRIGGER IF EXISTS Version_BI_Trigger;
DELIMITER ;;
CREATE TRIGGER Version_BI_Trigger BEFORE INSERT ON Version FOR EACH ROW
BEGIN 
	SET @lineas = 0;
    SET @numVersion = 0;
    SELECT COUNT(*) INTO @lineas FROM Version WHERE Id_P_Virtual = NEW.Id_P_Virtual;
    
    IF(@lineas > 0)THEN
			SELECT Fecha_Vigencia INTO @fecha 
            FROM Version 
            WHERE Id_P_Virtual = NEW.Id_P_Virtual 
            ORDER BY Num_Version DESC LIMIT 1;
    
			IF(@fecha >= CURRENT_TIMESTAMP)THEN
				
				SELECT COUNT(*) INTO @lineas 
				FROM Version v INNER JOIN Evaluacion_General eg ON v.Id_Version = eg.Id_Version 
				WHERE Id_P_Virtual = NEW.Id_P_Virtual AND Id_Estado = 4 AND Resultado = 1;
				
				IF(@lineas = 1) THEN
					SET NEW.Id_Estado = 4;
				END IF;
				
				SELECT COUNT(*) INTO @lineas 
				FROM Version v INNER JOIN Evaluacion_General eg ON v.Id_Version = eg.Id_Version 
				WHERE Id_P_Virtual = NEW.Id_P_Virtual AND Id_Estado = 5 AND Resultado = 1;
				
				IF(@lineas = 1) THEN
					SET NEW.Id_Estado = 5;
				END IF;
				
				SELECT COUNT(*) INTO @lineas 
				FROM Version 
				WHERE Id_P_Virtual = NEW.Id_P_Virtual AND Id_Estado = NEW.Id_Estado; 
				
				IF((@lineas > 0 AND @lineas < 3 AND NEW.Id_Estado = 3) OR (@lineas > 0 AND @lineas < 4 AND NEW.Id_Estado = 4)) THEN
				
					SELECT Num_Version INTO @numVersion 
					FROM Version 
					WHERE Id_P_Virtual = NEW.Id_P_Virtual AND  Id_Estado = NEW.Id_Estado 
					ORDER BY Num_Version DESC LIMIT 1; 
					
					SET NEW.Num_Version = @numVersion + 1;
					
					ELSEIF (@lineas = 3 AND NEW.Id_Estado = 3 ) OR (@lineas = 4 AND NEW.Id_Estado = 4) OR (NEW.Id_Estado = 5) THEN
						SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "El INSERT no se puede ejecutar por que se exedio el limite deregistros";
				END IF;
				ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "La version sobre paso la fecha limite de la nueva entrega";
			END IF;
    END IF;
    
END;;
DELIMITER ;

CALL SARA_CRUD("INSERT","Version","Num_Version~1	|Url_Version~Prueba61/Version612	|Url_Img~Prueba61/Imagen612	|Inst_Instalacion~No se instala612 |Reqst_Instalacion~Ningun requisito 612|Id_P_Virtual~2","");

CALL SARA_CRUD("UPDATE","Version","Fecha_Vigencia~2016-10-12","Id_Version = 4");



CALL RegistrarEvaluacion("Observacion de prueba~0~4~3~6~2016-10-12~1¤si cumple con el item¤1|1¤si cumple con el item¤2");

CALL SARA_CRUD("SELECT","Evaluacion_General","","");
CALL SARA_CRUD("SELECT","Detalles_Evaluacion","","");
    
CALL SARA_CRUD("SELECT","Producto_Virtual","","");
CALL SARA_CRUD("SELECT","Detalles_Tema","","");
CALL SARA_CRUD("SELECT","Version","","");
CALL SARA_CRUD("SELECT","Autor","","");
CALL SARA_CRUD("SELECT","Categoria","","");