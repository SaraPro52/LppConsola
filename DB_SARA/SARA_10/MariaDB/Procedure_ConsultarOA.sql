USE SARA;

DELIMITER ;;
CREATE PROCEDURE Consultar()
BEGIN
	
END;;
DELIMITER ;

SELECT DISTINCT Id_Categoria, Nom_Categoria, Id_Tema, Nom_Tema FROM V_Categoria;

CALL SARA_CRUD("SELECT","Detalles_Tema","","");


SELECT au.Id_P_Virtual FROM Formacion_Profesional fp INNER JOIN V_Autor au ON fp.Id_P_Virtual = au.Id_P_Virtual;

CREATE VIEW Formacion_Profesional AS(

	SELECT Id_Area_Centro, Id_Centro, Num_Centro, Nom_Centro, Direccion,Id_Ciudad,Nom_Ciudad, Id_Detalles_Area ,v1.Id_Area,v1.Nom_Area,v1.Lider_Area,
			 Id_Detalles_Programa,v2.Id_Programa, v2.Nom_Programa, v2.Nivel_Formacion,
			 Id_Detalles_Tema,v3.Id_Tema,v3.Nom_Tema, v3.Des_Tema, Tipo_Tema,
             v4.Id_P_Virtual, v4.Nom_P_Virtual, v4.Des_P_Virtual,v4.Palabras_Clave,
			 v4.Id_Formato, Nom_Formato,Des_Formato
	FROM V_Area_Centro v1 INNER JOIN V_Detalles_Area v2 ON v1.Id_Area = v2.Id_Area INNER JOIN 
		 V_Detalles_Programa v3 ON v3.Id_Programa = v2.Id_Programa INNER JOIN V_Detalles_Tema v4 ON v4.Id_Tema = v3.Id_Tema WHERE Tipo_Tema = 1
);

alter  VIEW V_Categoria AS(

	SELECT Id_Categoria, Nom_Categoria,Des_Categoria,Fecha_Creacion,v1.Id_Funcionario as Id_FuncionarioCate,Id_Detalles_Categoria,
    Id_Detalles_Tema,v1.Id_Tema, v1.Nom_Tema,v1.Des_Tema,Tipo_Tema,
    v2.Id_P_Virtual, v2.Nom_P_Virtual, v2.Des_P_Virtual,v2.Palabras_Clave,
	v2.Id_Formato, Nom_Formato, Des_Formato,
    Id_Autor,Id_Version, Fecha_Envio, Fecha_Publicacion, Num_Version, Fecha_Vigencia, Url_Version, Url_Img, Inst_Instalacion, Reqst_Instalacion,
	Id_Estado, Nom_Estado, Id_Tipo_Estado,
    Id_Tipo_Version, Nom_Tipo_Version, Des_Tipo_Version,
	Id_Rol_Funcionario, Id_Rol, Nom_Rol,Des_Rol,
	v3.Id_Funcionario,Id_Tipo_Documento, Nom_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,
    Correo,Cargo,Ip_Sena,Contraseña,Id_EstadoFun,Id_Area_Centro
    FROM V_Detalles_Categoria v1 INNER JOIN V_Detalles_Tema v2 ON v2.Id_Tema = v1.Id_Tema 
    INNER JOIN V_Autor v3 ON v3.Id_P_Virtual = v2.Id_P_Virtual 
);


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