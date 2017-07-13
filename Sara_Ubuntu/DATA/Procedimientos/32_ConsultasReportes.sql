-- CALL ConsultarReporte("5~0~0~0");

DROP PROCEDURE IF EXISTS ConsultarReporte;
DELIMITER ;;
CREATE PROCEDURE ConsultarReporte (IN ArrayConsultaReporte VARCHAR(100))
BEGIN
DECLARE contenido VARCHAR(1200) DEFAULT "";
DECLARE where_Var VARCHAR(200) DEFAULT "";
DECLARE contenido2 VARCHAR(500) DEFAULT "";
DECLARE reporte_Var,idCentro_Var,mes_Var,anio_Var INTEGER DEFAULT 0;
    
      CALL EXECUTE_ARRAY(
			ArrayConsultaReporte,
            "~",
            "CASE @i
				WHEN 0 THEN SET @reporte_Var1 = @valor;
                WHEN 1 THEN SET @idCentro_Var1 = @valor;
				WHEN 2 THEN SET @mes_Var1 = @valor;
                WHEN 3 THEN SET @anio_Var1 = @valor;
			END CASE;"
        );
	
    SET reporte_Var 	= @reporte_Var1,
		idCentro_Var 	= @idCentro_Var1,
        mes_Var 		= @mes_Var1,
        anio_Var 		= @anio_Var1;


CASE (reporte_Var)
WHEN 1 THEN
	BEGIN
		-- Cantidad de Publicaciones de PV por Área
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v14.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,CONCAT(v8.Nom_Area) AS Area,COUNT(*) AS Publicaciones
		FROM version v1 
		INNER JOIN producto_virtual v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
		INNER JOIN detalles_tema v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual AND v3.Tipo_Tema = 0
		INNER JOIN tema v4 ON v4.Id_Tema = v3.Id_Tema
		INNER JOIN detalles_programa v5 ON v4.Id_Tema = v5.Id_Tema
		INNER JOIN programa v6 ON v5.Id_Programa = v6.Id_Programa
		INNER JOIN detalles_area v7 ON  v6.Id_Programa = v7.Id_Programa
		INNER JOIN area v8 ON v7.Id_Area = v8.Id_Area
		INNER JOIN area_centro v9 ON v8.Id_Area = v9.Id_Area
		INNER JOIN autor v10 ON v1.Id_Version = v10.Id_Version
		INNER JOIN funcionario v11 ON v10.Id_Funcionario = v11.Id_Funcionario
		INNER JOIN area_centro v12 ON v11.Id_Area_Centro = v12.Id_Area_Centro
		INNER JOIN centro ce ON v12.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v14 ON ce.Id_Ciudad = v14.Id_Ciudad
		WHERE v1.Id_Estado IN (6,7) AND v10.Principal = 1 ";
        
        SET contenido2 = " GROUP BY v14.Nom_Ciudad, ce.Nom_Centro, v8.Nom_Area";
	END;
WHEN 2 THEN
	BEGIN
		-- Cantidad de Publicaciones de PV por Tipo Objeto
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,CONCAT(v9.Nom_Tipo_Formato) AS Formato,CONCAT(v8.Nom_Formato) AS Extencion,COUNT(*) AS Publicaciones
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
		INNER JOIN formato v8 ON v7.Id_Formato = v8.Id_Formato
		INNER JOIN tipo_formato v9 ON v8.Id_Tipo_Formato = v9.Id_Tipo_Formato
		WHERE v1.Id_Estado IN (6,7) AND v2.Principal = 1 ";
        
        SET contenido2 = "
		GROUP BY v6.Nom_Ciudad,ce.Nom_Centro,v8.Nom_Formato,v9.Nom_Tipo_Formato";
	END;
WHEN 3 THEN 
	BEGIN
		-- Cantidad de Publicaciones de PV por Categoria
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro, CONCAT(v10.Nom_Categoria) AS Categoria,COUNT(*) AS Publicaciones
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
		INNER JOIN detalles_tema v8 ON v7.Id_P_Virtual = v8.Id_P_Virtual AND v8.Tipo_Tema = 1
		INNER JOIN detalles_categoria v9 ON v8.Id_Tema = v9.Id_Tema
		INNER JOIN categoria v10 ON v9.Id_Categoria = v10.Id_Categoria
		WHERE v1.Id_Estado IN (6,7) AND v2.Principal = 1 ";
        
        SET contenido2 = "
		GROUP BY v6.Nom_Ciudad,ce.Nom_Centro,v10.Nom_Categoria";
    END;
WHEN 4 THEN 
	BEGIN
		-- Cantidad de Publicaciones Visitadas
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,
        CONCAT(v7.Nom_P_Virtual) AS ""Producto Virtual"", CONCAT(v8.Cant_Visitas) AS Visitas
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
		INNER JOIN rankin v8 ON v1.Id_Version = v8.Id_Version 
        WHERE 1 = 1";
        
        SET contenido2 = "
		GROUP BY v6.Nom_Ciudad,ce.Nom_Centro,v7.Nom_P_Virtual, v8.Cant_Visitas";
    END;
WHEN 5 THEN 
	BEGIN
		-- Cantidad de Publicaciones Descargadas
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,CONCAT(v7.Nom_P_Virtual) AS ""Producto Virtual"",CONCAT(v1.Num_Version) AS Version,CONCAT(v8.Cant_Descargas) AS Descargas
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
		INNER JOIN rankin v8 ON v1.Id_Version = v8.Id_Version
        WHERE 1 = 1";
        
        SET contenido2 = "
		GROUP BY v6.Nom_Ciudad,ce.Nom_Centro,v7.Nom_P_Virtual, v8.Cant_Descargas";
    END;
WHEN 6 THEN 
	BEGIN
		-- Cantidad de Publicaciones de PV publicados e inhabilitados
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,COUNT(*) AS Publicados,
		(
			SELECT COUNT(*)
			FROM version v11 INNER JOIN autor v22 ON v11.Id_Version = v22.Id_Version
			INNER JOIN funcionario v33 ON v22.Id_Funcionario = v33.Id_Funcionario
			INNER JOIN area_centro v44 ON v33.Id_Area_Centro = v44.Id_Area_Centro
			INNER JOIN centro v55 ON v44.Id_Centro = v55.Id_Centro
			INNER JOIN ciudad v66 ON v55.Id_Ciudad = v66.Id_Ciudad
			WHERE v11.Id_Estado = 7 AND DATE_FORMAT( v11.Fecha_Vigencia ,'%M %Y') = Mes 
			AND v44.Id_Area_Centro = v4.Id_Area_Centro
			
		) AS Inhabilitados
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario AND v2.Principal = 1
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		WHERE v1.Id_Estado = 6 ";
        
        SET contenido2 = "
		GROUP BY DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y'),v6.Nom_Ciudad,ce.Nom_Centro";
    END;
WHEN 7 THEN 
	BEGIN
		-- Cantidad de Pv Creados o actualizaciones por cada Funcionario
		SET contenido = "
        SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,CONCAT(v7.Nom_Area) AS Area,CONCAT(v3.Nom_Funcionario,"" "",v3.Apellidos) AS Funcionario,COUNT(*) AS Publicaciones
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario 
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN area   v7 ON v4.Id_Area = v7.Id_Area
		WHERE v1.Id_Estado IN (6,7) ";
        
        SET contenido2 = "
		GROUP BY DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y'),v6.Nom_Ciudad,ce.Nom_Centro,v7.Nom_Area,v3.Nom_Funcionario";
    END;
END CASE;

IF (idCentro_Var <> 0) THEN
	SET where_Var = CONCAT(where_Var , " AND ce.Id_Centro = " , idCentro_Var);
END IF;
IF (mes_Var <> 0) THEN
	SET where_Var = CONCAT(where_Var , " AND DATE_FORMAT(v1.Fecha_Publicacion,'%m') = " , mes_Var);
END IF;
IF (anio_Var <> 0) THEN
	SET where_Var = CONCAT(where_Var ," AND DATE_FORMAT(v1.Fecha_Publicacion,'%Y') = " , anio_Var);
END IF;

 CALL MACC(CONCAT(contenido,where_Var,contenido2));
    -- SELECT (CONCAT(contenido,whereCentro,idCentro,contenido2));
     -- SELECT (CONCAT(contenido,where_Var,contenido2));
END;;
DELIMITER ;
