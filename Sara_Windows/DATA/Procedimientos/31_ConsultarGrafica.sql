
-- CALL ConsultarGrafica("1~1~6~0");


DROP PROCEDURE IF EXISTS ConsultarGrafica;
DELIMITER ;;
CREATE PROCEDURE ConsultarGrafica (IN ArrayConsultaGrafica VARCHAR(100))
BEGIN

	DECLARE grafica_Var,idCentro_Var,mes_Var,anio_Var INTEGER DEFAULT 0;
    
      CALL EXECUTE_ARRAY(
			ArrayConsultaGrafica,
            "~",
            "CASE @i
				WHEN 0 THEN SET @grafica_Var = @valor;
                WHEN 1 THEN SET @idCentro_Var = @valor;
				WHEN 2 THEN SET @mes_Var = @valor;
                WHEN 3 THEN SET @anio_Var = @valor;
			END CASE;"
        );
	
    SET grafica_Var 	= @grafica_Var,
		idCentro_Var 	= @idCentro_Var,
        mes_Var 		= @mes_Var,
        anio_Var 		= @anio_Var;
	
    IF(mes_Var = 0) THEN SET mes_Var = DATE_FORMAT(CURRENT_TIME,'%m');END IF;
    IF(anio_Var = 0) THEN SET anio_Var = DATE_FORMAT(CURRENT_TIME,'%Y');END IF;
    
    CASE (grafica_Var)
		WHEN 1 THEN
        BEGIN
        	-- Estadistica Por Formato

			SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%Y') AS "Año" ,DATE_FORMAT(v1.Fecha_Publicacion,'%m') AS Mes,v9.Nom_Tipo_Formato AS Formato,COUNT(*) AS Publicaciones
			FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
			INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
			INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
			INNER JOIN centro v5 ON v4.Id_Centro = v5.Id_Centro
			INNER JOIN ciudad v6 ON v5.Id_Ciudad = v6.Id_Ciudad
			INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
			INNER JOIN formato v8 ON v7.Id_Formato = v8.Id_Formato
			INNER JOIN tipo_formato v9 ON v8.Id_Tipo_Formato = v9.Id_Tipo_Formato
			WHERE v1.Id_Estado IN (6,7) AND v2.Principal = 1 
			AND v5.Id_Centro = idCentro_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%Y') = anio_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%m') = mes_Var
			GROUP BY v9.Nom_Tipo_Formato;
        END;
        WHEN 2 THEN
        BEGIN
			-- Estadistica por Area De acuerdo a los temas que se encuentran en dichas areas

			SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%Y') AS "Año",DATE_FORMAT(v1.Fecha_Publicacion,'%m') AS Mes,v8.Nom_Area AS Area,COUNT(*) AS Publicaciones
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
			INNER JOIN centro v13 ON v12.Id_Centro = v13.Id_Centro
			INNER JOIN ciudad v14 ON v13.Id_Ciudad = v14.Id_Ciudad
			WHERE v1.Id_Estado IN (6,7) AND v10.Principal = 1 
			AND v13.Id_Centro = idCentro_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%Y') = anio_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%m') = mes_Var
			GROUP BY v8.Nom_Area;
        END;
        WHEN 3 THEN
        BEGIN 
			-- Estadistica por Categoria de acuerdo a los temas que se encuentran en dichas categorias

			SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%Y') AS "Año",DATE_FORMAT(v1.Fecha_Publicacion,'%m') AS Mes,v10.Nom_Categoria AS Categoria,COUNT(*) AS Publicaciones
			FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
			INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
			INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
			INNER JOIN centro v5 ON v4.Id_Centro = v5.Id_Centro
			INNER JOIN ciudad v6 ON v5.Id_Ciudad = v6.Id_Ciudad
			INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
			INNER JOIN detalles_tema v8 ON v7.Id_P_Virtual = v8.Id_P_Virtual AND v8.Tipo_Tema = 1
			INNER JOIN detalles_categoria v9 ON v8.Id_Tema = v9.Id_Tema
			INNER JOIN categoria v10 ON v9.Id_Categoria = v10.Id_Categoria
			WHERE v1.Id_Estado IN (6,7) AND v2.Principal = 1 
			AND v5.Id_Centro = idCentro_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%Y') = anio_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%m') = mes_Var
			GROUP BY v10.Nom_Categoria;
        END;
    END CASE;
	
END;;
DELIMITER ;




















