USE SARA;

-- LISTA_CHEQUEO ----- DETALLES_LISTA ------ ITEM_LISTA ------ 
CREATE VIEW V_Detalles_Lista AS(
	
    SELECT dl.Id_Lista_Chequeo,Nom_Lista_Chequeo, Des_Lista_Chequeo, Fecha_Creacion, Id_Funcionario, dl.Id_Item_Lista, Des_Item_Lista, Tipo_Item,Id_Detalles_Lista
    FROM  ((Lista_Chequeo lc INNER JOIN Detalles_Lista dl ON lc.Id_Lista_Chequeo = dl.Id_Lista_Chequeo)
		   INNER JOIN Item_Lista il ON dl.Id_Item_Lista = il.Id_Item_Lista)
    
);

-- CIUDAD-----CENTRO ----- AREA_CENTRO ------- AREA ----
CREATE VIEW V_Area_Centro AS
(
	SELECT Id_Area_Centro, AC.Id_Centro, Num_Centro, Nom_Centro, Direccion,Ce.Id_Ciudad,Nom_Ciudad, AC.Id_Area,Nom_Area,Lider_Area
	FROM (((Centro Ce INNER JOIN Area_Centro AC ON Ce.Id_Centro = AC.Id_Centro) INNER JOIN 
		 Area Ar ON AC.Id_Area = Ar.Id_Area) INNER JOIN Ciudad Ci ON Ce.Id_Ciudad = Ci.Id_Ciudad)
);

-- AREA ----- DETALLES_AREA ------- PROGRAMA
CREATE VIEW V_Detalles_Area AS(

	SELECT  Id_Detalles_Area,da.Id_Area, Nom_Area, Lider_Area, da.Id_Programa, Nom_Programa, Nivel_Formacion
    FROM ((Area ar INNER JOIN Detalles_Area da ON ar.Id_Area = da.Id_Area) 
		  INNER JOIN Programa pr ON da.Id_Programa = pr.Id_Programa)
);

-- PROGRAMA ------- DETALLES_PROGRAMA ------- TEMA ----
CREATE VIEW V_Detalles_Programa AS(
	
    SELECT Id_Detalles_Programa, dp.Id_Programa, Nom_Programa, Nivel_Formacion,dp.Id_Tema, Nom_Tema, Des_Tema
    FROM  ((Programa pr INNER JOIN Detalles_Programa dp ON pr.Id_Programa = dp.Id_Programa)
          INNER JOIN Tema te ON dp.Id_Tema = te.Id_Tema)
);

-- CATEGORIA ------ DETALLES_CATEGORIA ------ TEMA----
ALTER VIEW V_Detalles_Categoria AS
(
	SELECT DISTINCT DC.Id_Categoria, Nom_Categoria,Des_Categoria,Fecha_Creacion,Id_Funcionario,DC.Id_Detalles_Categoria, DC.Id_Tema, Te.Nom_Tema,Te.Des_Tema
	FROM  ((Categoria Ca INNER JOIN Detalles_Categoria DC ON Ca.Id_Categoria = DC.Id_Categoria) INNER JOIN
		   Tema Te ON DC.Id_Tema = Te.Id_Tema) 
);


-- FORMATO ----- PRODUCTO_VIRTUAL ----- DETALLES_TEMA  ---- TEMA ----
CREATE VIEW V_Detalles_Tema AS
(
	SELECT 	DT.Id_P_Virtual, Nom_P_Virtual, Des_P_Virtual,Palabras_Clave,
			PV.Id_Formato, Fo.Nom_Formato, Fo.Des_Formato,
            DT.Id_Detalles_Tema,DT.Id_Tema, Te.Nom_Tema, Te.Des_Tema,Tipo_Tema
	FROM (((Formato Fo INNER JOIN Producto_Virtual PV ON Fo.Id_Formato = PV.Id_Formato) INNER JOIN
		 Detalles_Tema DT ON PV.Id_P_Virtual = DT.Id_P_Virtual) INNER JOIN 
		 Tema Te ON DT.Id_Tema = Te.Id_Tema) 
);


--  PROCUCTO_VIRTUAL ----- VERSION ----- TIPO_VERSION -------- ESTADO ------
CREATE VIEW V_Version AS (
	
    SELECT v.Id_P_Virtual, Nom_P_Virtual, Des_P_Virtual,Palabras_Clave,Id_Formato,
			v.Id_Version, Fecha_Envio, Fecha_Publicacion, Num_Version, Fecha_Vigencia, Url_Version, Url_Img, Inst_Instalacion, Reqst_Instalacion,
            v.Id_Estado, Nom_Estado, Id_Tipo_Estado,
            v.Id_Tipo_Version, Nom_Tipo_Version, Des_Tipo_Version
    FROM (((Producto_Virtual pv INNER JOIN Version v ON pv.Id_P_Virtual = v.Id_P_Virtual) INNER JOIN
		  Tipo_Version tv ON v.Id_Tipo_Version = tv.Id_Tipo_Version) INNER JOIN Estado e ON e.Id_Estado = v.Id_Estado)
);


-- ROL ---- ROL_FUNCIONARIO --- FUNCIONARIO ---- TIPO_DOCUMENTO
CREATE VIEW V_Funcionario AS
(
	SELECT Id_Rol_Funcionario, RF.Id_Rol, Nom_Rol,Des_Rol,
			RF.Id_Funcionario,td.Id_Tipo_Documento, Nom_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,
            Correo,Cargo,Ip_Sena,Contraseña,Id_Estado,Id_Area_Centro
	FROM (((Rol Ro INNER JOIN Rol_Funcionario RF ON Ro.Id_Rol = RF.Id_Rol) INNER JOIN
		   Funcionario Fu ON RF.Id_Funcionario = Fu.Id_Funcionario) INNER JOIN 
           Tipo_Documento td ON td.Id_Tipo_Documento = Fu.Id_Tipo_Documento)
);    

-- AUTOR -------- V_FUNCIONARIO -------- V_VERSION--------
CREATE VIEW V_Autor AS(

	SELECT	au.Id_Autor, Id_P_Virtual, Nom_P_Virtual, Des_P_Virtual,Palabras_Clave,Id_Formato,
			vVer.Id_Version, Fecha_Envio, Fecha_Publicacion, Num_Version, Fecha_Vigencia, Url_Version, Url_Img, Inst_Instalacion, Reqst_Instalacion,
            vVer.Id_Estado, Nom_Estado, Id_Tipo_Estado,
            Id_Tipo_Version, Nom_Tipo_Version, Des_Tipo_Version,
			Id_Rol_Funcionario, Id_Rol, Nom_Rol,Des_Rol,
			vFu.Id_Funcionario,Id_Tipo_Documento, Nom_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,
            Correo,Cargo,Ip_Sena,Contraseña,vFu.Id_Estado AS Id_EstadoFun,Id_Area_Centro
    FROM (Autor au INNER JOIN V_Funcionario vFu ON au.Id_Funcionario = vFu.Id_Funcionario) INNER JOIN 
		 V_Version vVer ON au.Id_Version = vVer.Id_Version 
);




-- HABILITAR PRODUCTO VIRTUAL 
ALTER VIEW Habilitar_P AS(
	SELECT v2.Id_P_Virtual,Nom_P_Virtual,Num_Version,Fecha_Vigencia
	FROM Producto_Virtual v1 INNER JOIN Version v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual 
	WHERE Id_Estado = 5
)


-- VISTA PARA LISTAR LAS AREAS Y EL CENTRO QUE TIENE UNA RELACION
-- REGISTRAR FUNCIONARIO . SELECT CENTRO Y AREAS DE ESE CENTRO
CREATE VIEW V_Area AS (
	SELECT Id_Area, Nom_Area,Id_Centro,Nom_Centro
	FROM V_Area_Centro
);


-- REGISTRAR FUNCIONARIO

-- SELECTOR CENTRO