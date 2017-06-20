DROP FUNCTION IF EXISTS NameUrl;
DELIMITER ;;
CREATE FUNCTION NameUrl(idVer INTEGER) RETURNS varchar(50) CHARSET latin1
BEGIN
  SET @idVer = idVer;
  SELECT Id_Estado, Id_P_Virtual INTO @idEstado,@idPro
  FROM Version WHERE Id_Version = @idVer;
  
  IF(@idEstado IN (6,7))THEN
    SET @tipoVer = 2;
    ELSEIF (@idEstado IN (3,4,5,9,10))THEN SET @tipoVer = 1;
  END IF;
  
  CASE (@tipoVer)
    WHEN 1 THEN 
        SELECT COUNT(*) INTO @numVer
        FROM 18_v_notificaciones 
        WHERE Id_Tipo_Notificacion = 1 AND Ides_Proceso = @idVer;
    WHEN 2 THEN
        SELECT Num_Version INTO @numVer 
        FROM  Version
        WHERE Id_Version = @idVer;
  END CASE;
  
  SELECT v2.Nom_Formato INTO @formato 
  FROM producto_virtual v1 INNER JOIN formato v2 ON v2.Id_Formato = v1.Id_Formato
  WHERE v1.Id_P_Virtual = @idPro;
  
  SET @idPro = LPAD(@idPro,3,"0");
  SET @numVer = LPAD(@numVer/0.1,2,"0");-- Num Version 
  SET @idVer = LPAD(@idVer,3,"0");
  
  SET @nomUrl = CONCAT(@tipoVer,"-",@idPro,"-",@numVer,"-",@idVer,".",@formato);
  
  RETURN @nomUrl;
END;;
DELIMITER ;
