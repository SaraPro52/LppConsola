
USE SARA08;
/*
	Muestra la lista de chequeo y sus items asignados
*/

CREATE VIEW V_Detalles_Lista AS(
	
    SELECT dl.Id_Lista_Chequeo,Nom_Lista_Chequeo, Des_Lista_Chequeo, Fecha_Creacion, Id_Funcionario, dl.Id_Item_Lista, Des_Item_Lista, Tipo_Item,Id_Detalles_Lista
    FROM  ((Lista_Chequeo lc INNER JOIN Detalles_Lista dl ON lc.Id_Lista_Chequeo = dl.Id_Lista_Chequeo)
		   INNER JOIN Item_Lista il ON dl.Id_Item_Lista = il.Id_Item_Lista)
    
);
/*
		Muestra las areas y sus respectivos programas de formacion____SUBIR-OA
*/

CREATE VIEW V_Detalles_Area AS(

	SELECT  Id_Detalles_Area,da.Id_Area, Nom_Area, Lider_Area, da.Id_Programa, Nom_Programa, Nivel_Formacion
    FROM ((Area ar INNER JOIN Detalles_Area da ON ar.Id_Area = da.Id_Area) 
		  INNER JOIN Programa pr ON da.Id_Programa = pr.Id_Programa)
);

/*
		Muestra los programas y sus repectivos temas____SUBIR-OA
*/

CREATE VIEW V_Detalles_Programa AS(
	
    SELECT Id_Detalles_Programa, dp.Id_Programa, Nom_Programa, Nivel_Formacion,dp.Id_Tema, Nom_Tema, Des_Tema
    FROM  ((Programa pr INNER JOIN Detalles_Programa dp ON pr.Id_Programa = dp.Id_Programa)
          INNER JOIN Tema te ON dp.Id_Tema = te.Id_Tema)
);

-- ---------------------------------------------------------------------------------

CREATE VIEW V_Area_Centro AS
(
	SELECT Id_Area_Centro, AC.Id_Centro, Num_Centro, Nom_Centro, Direccion,Ce.Id_Ciudad,Nom_Ciudad, AC.Id_Area,Nom_Area,Lider_Area
	FROM (((Centro Ce INNER JOIN Area_Centro AC ON Ce.Id_Centro = AC.Id_Centro) INNER JOIN 
		 Area Ar ON AC.Id_Area = Ar.Id_Area) INNER JOIN Ciudad Ci ON Ce.Id_Ciudad = Ci.Id_Ciudad)
);

-- VISTA PARA LISTAR LAS AREAS Y EL CENTRO QUE TIENE UNA RELACION
CREATE VIEW V_Area AS 
(
	SELECT Id_Area, Nom_Area,Nom_Centro
	FROM V_Area_Centro
);

CREATE VIEW V_Rol_Funcionario AS
(
	SELECT Id_Rol_Funcionario, RF.Id_Rol, Nom_Rol,Des_Rol,
			RF.Id_Funcionario,Id_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,Correo,Cargo,Ip_Sena,
			Contraseña,Id_Estado,Id_Area_Centro
	FROM ((Rol Ro INNER JOIN Rol_Funcionario RF ON Ro.Id_Rol = RF.Id_Rol) INNER JOIN
		   Funcionario Fu ON RF.Id_Funcionario = Fu.Id_Funcionario)
);      

-- VISTA PARA EL LISTADO DE LOS ESTADOS CON SUS TIPOS DE ESTADO
CREATE VIEW V_Estado AS 
(
	SELECT Id_Estado, Nom_Estado, Es.Id_Tipo_Estado,Nom_Tipo_Estado
	FROM (Estado Es INNER JOIN Tipo_Estado TE ON Es.Id_Tipo_Estado = TE.Id_Tipo_Estado)
);

-- Vista INABILITAR FUNCIONARIO

CREATE VIEW Inabilitar_Funcionario AS 
(
    SELECT Id_Funcionario, CONCAT(Nom_Funcionario," ",Apellidos) AS NombreCompleto,Ip_Sena, Cargo,Nom_Rol,Nom_Estado, Nom_Area, Nom_Centro 
	FROM ((V_Area_Centro Vac INNER JOIN V_Rol_Funcionario Vrf ON Vac.Id_Area_Centro = Vrf.Id_Area_Centro) INNER JOIN
		 V_Estado VE ON Vrf.Id_Estado = VE.Id_Estado)
);


-- Vista PARA LA SELECCION DE LOS TITULOS EN SUBIR OA
CREATE VIEW ListaTituloOA AS 
(
	SELECT Id_P_Virtual, Nom_P_Virtual
	FROM Producto_Virtual
);

