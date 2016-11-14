USE SARA;

-- LISTA_CHEQUEO ----- DETALLES_LISTA ------ ITEM_LISTA ------ 
DROP VIEW IF EXISTS 01_V_Detalles_Lista;
CREATE VIEW 01_V_Detalles_Lista AS(
	
    SELECT dl.Id_Lista_Chequeo,Nom_Lista_Chequeo, Des_Lista_Chequeo, Fecha_Creacion, Id_Funcionario, dl.Id_Item_Lista, Des_Item_Lista, Tipo_Item,Id_Detalles_Lista
    FROM  ((Lista_Chequeo lc INNER JOIN Detalles_Lista dl ON lc.Id_Lista_Chequeo = dl.Id_Lista_Chequeo)
		   INNER JOIN Item_Lista il ON dl.Id_Item_Lista = il.Id_Item_Lista)
    
);

-- CIUDAD-----CENTRO ----- AREA_CENTRO ------- AREA ----
DROP VIEW IF EXISTS 02_V_Area_Centro;
CREATE VIEW 02_V_Area_Centro AS
(
	SELECT Id_Area_Centro, AC.Id_Centro, Num_Centro, Nom_Centro, Direccion,Ce.Id_Ciudad,Nom_Ciudad, AC.Id_Area,Nom_Area,Lider_Area
	FROM (((Centro Ce INNER JOIN Area_Centro AC ON Ce.Id_Centro = AC.Id_Centro) INNER JOIN 
		 Area Ar ON AC.Id_Area = Ar.Id_Area) INNER JOIN Ciudad Ci ON Ce.Id_Ciudad = Ci.Id_Ciudad)
);

-- AREA ----- DETALLES_AREA ------- PROGRAMA
DROP VIEW IF EXISTS 03_V_Detalles_Area;
CREATE VIEW 03_V_Detalles_Area AS(

	SELECT  Id_Detalles_Area,da.Id_Area, Nom_Area, Lider_Area, da.Id_Programa, Nom_Programa, Nivel_Formacion
    FROM ((Area ar INNER JOIN Detalles_Area da ON ar.Id_Area = da.Id_Area) 
		  INNER JOIN Programa pr ON da.Id_Programa = pr.Id_Programa)
);

-- PROGRAMA ------- DETALLES_PROGRAMA ------- TEMA ----
DROP VIEW IF EXISTS 04_V_Detalles_Programa;
CREATE VIEW 04_V_Detalles_Programa AS(
	
    SELECT Id_Detalles_Programa, dp.Id_Programa, Nom_Programa, Nivel_Formacion,dp.Id_Tema, Nom_Tema, Des_Tema
    FROM  ((Programa pr INNER JOIN Detalles_Programa dp ON pr.Id_Programa = dp.Id_Programa)
          INNER JOIN Tema te ON dp.Id_Tema = te.Id_Tema)
);

-- CATEGORIA ------ DETALLES_CATEGORIA ------ TEMA----
DROP VIEW IF EXISTS 05_V_Detalles_Categoria;
CREATE VIEW 05_V_Detalles_Categoria AS
(
	SELECT DISTINCT DC.Id_Categoria, Nom_Categoria,Des_Categoria,Fecha_Creacion,Id_Funcionario,DC.Id_Detalles_Categoria, DC.Id_Tema, Te.Nom_Tema,Te.Des_Tema
	FROM  ((Categoria Ca INNER JOIN Detalles_Categoria DC ON Ca.Id_Categoria = DC.Id_Categoria) INNER JOIN
		   Tema Te ON DC.Id_Tema = Te.Id_Tema) 
);


-- FORMATO ----- PRODUCTO_VIRTUAL ----- DETALLES_TEMA  ---- TEMA ----
DROP VIEW IF EXISTS 06_V_Detalles_Tema;
CREATE VIEW 06_V_Detalles_Tema AS
(
	SELECT 	DT.Id_P_Virtual, Nom_P_Virtual, Des_P_Virtual,Palabras_Clave,
			PV.Id_Formato, Fo.Nom_Formato, Fo.Des_Formato,
            DT.Id_Detalles_Tema,DT.Id_Tema, Te.Nom_Tema, Te.Des_Tema,Tipo_Tema
	FROM (((Formato Fo INNER JOIN Producto_Virtual PV ON Fo.Id_Formato = PV.Id_Formato) INNER JOIN
		 Detalles_Tema DT ON PV.Id_P_Virtual = DT.Id_P_Virtual) INNER JOIN 
		 Tema Te ON DT.Id_Tema = Te.Id_Tema) 
);


--  PROCUCTO_VIRTUAL ----- VERSION ----- TIPO_VERSION -------- ESTADO ------
DROP VIEW IF EXISTS 07_V_Version;
CREATE VIEW 07_V_Version AS (
	
    SELECT v.Id_P_Virtual, Nom_P_Virtual, Des_P_Virtual,Palabras_Clave,Id_Formato,
			v.Id_Version, Fecha_Envio, Fecha_Publicacion, Num_Version, Fecha_Vigencia, Url_Version, Url_Img, Inst_Instalacion, Reqst_Instalacion,
            v.Id_Estado, Nom_Estado, Id_Tipo_Estado
    FROM ((Producto_Virtual pv INNER JOIN Version v ON pv.Id_P_Virtual = v.Id_P_Virtual)
    INNER JOIN Estado e ON e.Id_Estado = v.Id_Estado)
);


-- ROL ---- ROL_FUNCIONARIO --- FUNCIONARIO ---- TIPO_DOCUMENTO
DROP VIEW IF EXISTS 08_V_Funcionario;
CREATE VIEW 08_V_Funcionario AS
(
	SELECT Id_Rol_Funcionario, RF.Id_Rol, Nom_Rol,Des_Rol,
			RF.Id_Funcionario,td.Id_Tipo_Documento, Nom_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,
            Correo,Cargo,Ip_Sena,Contraseña,Id_Estado,Id_Area_Centro
	FROM (((Rol Ro INNER JOIN Rol_Funcionario RF ON Ro.Id_Rol = RF.Id_Rol) INNER JOIN
		   Funcionario Fu ON RF.Id_Funcionario = Fu.Id_Funcionario) INNER JOIN 
           Tipo_Documento td ON td.Id_Tipo_Documento = Fu.Id_Tipo_Documento)
);    

-- AUTOR -------- V_FUNCIONARIO -------- V_VERSION--------
DROP VIEW IF EXISTS 09_V_Autor;
CREATE VIEW 09_V_Autor AS(

	SELECT	au.Id_Autor, Id_P_Virtual, Nom_P_Virtual, Des_P_Virtual,Palabras_Clave,Id_Formato,
			vVer.Id_Version, Fecha_Envio, Fecha_Publicacion, Num_Version, Fecha_Vigencia, Url_Version, Url_Img, Inst_Instalacion, Reqst_Instalacion,
            vVer.Id_Estado, Nom_Estado, Id_Tipo_Estado,
			Id_Rol_Funcionario, Id_Rol, Nom_Rol,Des_Rol,
			vFu.Id_Funcionario,Id_Tipo_Documento, Nom_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,
            Correo,Cargo,Ip_Sena,Contraseña,vFu.Id_Estado AS Id_EstadoFun,Id_Area_Centro
    FROM (Autor au INNER JOIN 08_V_Funcionario vFu ON au.Id_Funcionario = vFu.Id_Funcionario) INNER JOIN 
		 07_V_Version vVer ON au.Id_Version = vVer.Id_Version 
);




-- HABILITAR PRODUCTO VIRTUAL 
DROP VIEW IF EXISTS 10_Habilitar_P;
CREATE VIEW 10_Habilitar_P AS(
	SELECT v2.Id_P_Virtual,Nom_P_Virtual,Num_Version,Fecha_Vigencia
	FROM Producto_Virtual v1 INNER JOIN Version v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual 
	WHERE Id_Estado = 5
)


-- VISTA PARA LISTAR LAS AREAS Y EL CENTRO QUE TIENE UNA RELACION
-- REGISTRAR FUNCIONARIO . SELECT CENTRO Y AREAS DE ESE CENTRO

DROP VIEW IF EXISTS 11_V_Area;
CREATE VIEW 11_V_Area AS (
	SELECT v1.Id_Area, Nom_Area, v1.Id_Centro,Nom_Centro
	FROM Area_Centro v1 INNER JOIN Area v2 ON v1.Id_Area = v2.Id_Area INNER JOIN Centro v3 ON V1.Id_Centro = v3.Id_Centro
);


-- INHABILITAR FUNCIONARIO POR PARTE DE ADMINISTRADOR
DROP VIEW IF EXISTS 12_Inabilitar_Funcionario;
CREATE VIEW 12_Inabilitar_Funcionario AS 
(
    SELECT v1.Id_Funcionario, CONCAT(Nom_Funcionario," ",Apellidos) AS NombreCompleto,Ip_Sena, Cargo,Nom_Rol,Nom_Estado, Nom_Area, Nom_Centro 
	FROM Funcionario v1 INNER JOIN Estado v2 ON v1.Id_Estado = v2.Id_Estado INNER JOIN Rol_Funcionario v3 ON V1.Id_Funcionario = V3.Id_Funcionario
	INNER JOIN Rol v4 ON v3.Id_Rol = v4.Id_Rol INNER JOIN  Area_Centro v5 ON v1.Id_Area_Centro = v5.Id_Area_Centro 
	INNER JOIN Area v6 ON v5.Id_Area = v6.Id_Area INNER JOIN Centro v7 ON v5.Id_Centro = v7.Id_Centro WHERE v1.Id_Estado = 1
);


-- VISTA PARA HACER EL LISTADO DE DE LAS LISTAS DE CHEQUEO DEACUERDO AL ROL DEL FUNCIONARIO 
DROP VIEW IF EXISTS 13_V_Listas_Chequeo;
CREATE VIEW 13_V_Listas_Chequeo AS(
	
	SELECT Id_Lista_Chequeo, Nom_Lista_Chequeo, Des_Lista_Chequeo,Fecha_Creacion,v2.Id_Funcionario,Id_Rol
    FROM Lista_Chequeo v1 INNER JOIN Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario 
    INNER JOIN Rol_Funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
);


-- LISTAR LOS TITULOS DE LOS PRODUCTOS VIRTUALES EN EL CASO DE USO DE SUBIR PRODUCTO VIRTUAL
DROP VIEW IF EXISTS 14_V_Titulos;
CREATE VIEW 14_V_Titulos AS (
	SELECT DISTINCT v1.Id_P_Virtual, Nom_P_Virtual
    FROM Producto_Virtual v1 INNER JOIN Version v2 ON v1.Id_P_Virtual
    WHERE Id_Estado = 6
);

-- LISTAR LOS FUNCIONARIOS QUE TENGAN EL ROL DE INSTRUCTOR
DROP VIEW IF EXISTS 15_V_Subir_Autores;
CREATE VIEW 15_V_Subir_Autores AS(
	
    SELECT v1.Id_Funcionario,Nom_Funcionario,Id_Centro
    FROM  Funcionario v1 INNER JOIN Rol_Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario
		  INNER JOIN Area_Centro v3 ON v1.Id_Area_Centro = v3.Id_Area_Centro
    WHERE Id_Rol = 1
);

-- LISTAR LOS ITEMS QUE TIENE RELACION CON UNA LISTA DE CHEQUEO
DROP VIEW IF EXISTS 16_V_Items_Lista;
CREATE VIEW 16_V_Items_Lista AS(
	
    SELECT v3.Id_Item_Lista,Des_Item_Lista,Tipo_Item,v1.Id_Lista_Chequeo
    FROM Detalles_Lista v1 INNER JOIN Lista_Chequeo v2 ON v1.Id_Lista_Chequeo = v2.Id_Lista_Chequeo
    INNER JOIN Item_Lista v3 ON v1.Id_Item_Lista = v3.Id_Item_Lista
 
);

SELECT Id_Item_Lista,Des_Item_Lista
FROM  Item_Lista
WHERE Id_Item_Lista NOT IN (3) AND Tipo_Item = 0


CREATE VIEW 17_V_ProductosEvaluador AS (
	
    SELECT v1.Id_P_Virtual, Nom_P_Virtual, Id_Version, Num_Version, Fecha_Vigencia,v3.Id_Estado,Nom_Estado
	FROM Producto_Virtual v1 INNER JOIN Version v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual INNER JOIN Estado v3 ON v2.Id_Estado = v3.Id_Estado
);


CREATE VIEW 18_V_Notificaciones AS(
	SELECT v1.Id_Funcionario, Nom_Funcionario, v5.Id_Rol,Nom_Rol, Fecha_Envio, Conte_Notificacion, Ides_Proceso,v3.Id_Funcionario AS Id_FuncionarioEnvio
	FROM Funcionario v1 INNER JOIN Detalles_Notificacion v2 ON v1.Id_Funcionario = v2.Id_Funcionario
	 INNER JOIN Notificacion v3 ON v2.Id_Notificacion = v3.Id_Notificacion INNER JOIN Rol_Funcionario v4 ON v1.Id_Funcionario = v4.Id_Funcionario
     INNER JOIN Rol v5 ON v4.Id_Rol = v5.Id_Rol
);

use sara;
CREATE VIEW 19_v_TemasFormacion AS(

	SELECT Id_Tema, Nom_Tema, Id_Centro
    FROM 02_V_Area_Centro v1 INNER JOIN 03_V_Detalles_Area v2 ON v1.Id_Area = v2.Id_Area
	INNER JOIN 04_V_Detalles_Programa v3 ON v2.Id_Programa = v3.Id_Programa 
    
);


-- REGISTRAR FUNCIONARIO

-- SELECTOR CENTRO