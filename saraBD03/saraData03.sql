USE SARApro;

CALL insertar(2,'Tema','Nom_Tema','JAVA','Des_Tema','Es un lenguaje de programacion',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Programa','Nom_Programa','ADSI','Nivel_Formacion','Tecnologo',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Detalles_Programa','Id_Tema','1','Id_Programa','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Area','Nom_Area','Teleinformatica','Lider_Area','Gustabo',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Detalles_Area','Id_Programa','1','Id_Area','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(1,'Ciudad','Nom_Ciudad','Bogotá',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(4,'Centro','Id_Centro','1','Nom_Centro','Centro de gestion, logistica y mescados','Direccion','Crr 52#','Id_Ciudad','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Area_Centro','Id_Area','1','Id_Centro','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL insertar(2,'Formato','Nom_Formato','Documento','Des_Formato','Puede ser cualquier tipo de documento ofice',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Formato','Nom_Formato','Imagen','Des_Formato','Imagen Elaborada para la explicacion de un tema',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL insertar(4,'Producto_Virtual','Nom_P_Virtual','Fundamentos de Programación','Des_P_Virtual','Documento que le dara la bienvenida a los nuevos','Palabras_Clave','Fundamentos, Programación, Teoria','Id_Formato','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(4,'Producto_Virtual','Nom_P_Virtual','Desarrollo de Base de Datos','Des_P_Virtual','Imagen que Explica el desarrollo de las bases de datos','Palabras_Clave','base de datos,dml, imagenes','Id_Formato','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL insertar(1,'Estado','Nom_Estado','Activo',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(1,'Estado','Nom_Estado','Espera',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(1,'Estado','Nom_Estado','Inhabilitado',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL insertar(2,'Rol','Nom_Rol','Instructor','Des_Rol','Suprincipal participacion es el envio de los oa',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Rol','Nom_Rol','Lider Equipo Tecnico','Des_Rol','Evaluara los oa tecnicamente',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Rol','Nom_Rol','Lider Equipo Pedagogico','Des_Rol','Evaluara los oa pedagogicamente',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Rol','Nom_Rol','Coordinador Formacion Profecinal','Des_Rol','Controla la publicacion de las oas',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);


CALL insertar(9,'Funcionario','Num_Documento','1019133595','Nom_Funcionario','Miguel Alfredo','Apellidos','Sanchez Cabanzo','Correo','Macastiblanco88@misena.edu.co','Cargo','Instructor','Ip_Sena','159753','Contraseña','macc','Id_Area_Centro','1','Id_Estado','1',null,null,null,null);
CALL insertar(9,'Funcionario','Num_Documento','1039598334','Nom_Funcionario','Carlos Oracio','Apellidos','Diaz Buitrago','Correo','cdiazbu@misena.edu.co','Cargo','Instructor','Ip_Sena','555555','Contraseña','judini','Id_Area_Centro','1','Id_Estado','1',null,null,null,null);
CALL insertar(9,'Funcionario','Num_Documento','1729938448','Nom_Funcionario','Sandra ','Apellidos','Gonzales Ribero','Correo','sandra@misena.edu.co','Cargo','Pedagoga','Ip_Sena','680884','Contraseña','595959','Id_Area_Centro','1','Id_Estado','1',null,null,null,null);
CALL insertar(9,'Funcionario','Num_Documento','1039598334','Nom_Funcionario','Juan Alejandro','Apellidos','Rodriguez Mogollon','Correo','jarm@misena.edu.co','Cargo','Coordinador','Ip_Sena','957595','Contraseña','admin','Id_Area_Centro','1','Id_Estado','1',null,null,null,null);
CALL insertar(9,'Funcionario','Num_Documento','1319497750','Nom_Funcionario','Estevan ','Apellidos','Castro','Correo','ecastro@misena.edu.co','Cargo','Tecnico','Ip_Sena','957597','Contraseña','otmoe','Id_Area_Centro','1','Id_Estado','1',null,null,null,null);

CALL insertar(2,'Rol_Funcionario','Id_Rol','1','Id_Funcionario','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Rol_Funcionario','Id_Rol','1','Id_Funcionario','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Rol_Funcionario','Id_Rol','2','Id_Funcionario','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Rol_Funcionario','Id_Rol','3','Id_Funcionario','3',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Rol_Funcionario','Id_Rol','4','Id_Funcionario','4',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Rol_Funcionario','Id_Rol','1','Id_Funcionario','5',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);


CALL insertar(2,'Tipo_Version','Nom_Tipo_Version','Evaluacion','Des_Version','Son las posibles versiones que puede tener una oa en proceso de evaluacion',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Tipo_Version','Nom_Tipo_Version','Aprobacion','Des_Version','Son las posibles versiones que puede tener una oa despues de ser aprovada',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);


CALL insertar(11,'Version','Fecha_Envio','01-03-2016','Fecha_Publicacion','10-03-2016','Num_Version','1','Fecha_Vigencia','10-09-2016','Url_Version','/carpeta1/carpeta2','Url_Img','/carp1/carp2','Inst_Instalacion','Descargue el archivo y ejecutelo en cualquier editor de texto','Reqst_Instalacion','Editor de texto, Acceso a internet','Id_P_Virtual','1','Id_Estado','1','Id_Tipo_Version','2');
CALL insertar(11,'Version','Fecha_Envio','25-05-2016','Fecha_Publicacion','01-06-2016','Num_Version','1','Fecha_Vigencia','10-12-2016','Url_Version','/carpeta1/carpeta2','Url_Img','/carp1/carp2','Inst_Instalacion','Descargue el archivo y ejecutelo en cualquier visualizador de imagenes','Reqst_Instalacion','Visualizador de imagenes, Acceso a internet','Id_P_Virtual','2','Id_Estado','1','Id_Tipo_Version','2');
CALL insertar(11,'Version','Fecha_Envio','15-07-2016','Fecha_Publicacion','','Num_Version','1','Fecha_Vigencia','','Url_Version','','Url_Img','','Inst_Instalacion','Descargue el archivo y ejecutelo en cualquier editor de texto','Reqst_Instalacion','Editor de texto, Acceso a internet','Id_P_Virtual','1','Id_Estado','2','Id_Tipo_Version','1');
CALL insertar(11,'Version','Fecha_Envio','12-07-2016','Fecha_Publicacion','','Num_Version','1','Fecha_Vigencia','','Url_Version','','Url_Img','','Inst_Instalacion','Descargue el archivo y ejecutelo en cualquier visualizador de imagenes','Reqst_Instalacion','Visualizador de imagenes, Acceso a internet','Id_P_Virtual','2','Id_Estado','2','Id_Tipo_Version','1');

CALL insertar(9,'Rankin','Num_Visitas','0','Num_Descargas','0','Cant_5','0','Cant_4','0','Cant_3','0','Cant_2','0','Cant_1','0','Numero_Votos','0','Id_Version','1',null,null,null,null);
CALL insertar(9,'Rankin','Num_Visitas','0','Num_Descargas','0','Cant_5','0','Cant_4','0','Cant_3','0','Cant_2','0','Cant_1','0','Numero_Votos','0','Id_Version','2',null,null,null,null);

CALL insertar(2,'Autor','Id_Version','1','Id_Funcionario','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Autor','Id_Version','1','Id_Funcionario','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Autor','Id_Version','1','Id_Funcionario','4',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Autor','Id_Version','2','Id_Funcionario','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(2,'Autor','Id_Version','2','Id_Funcionario','4',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL insertar(3,'Comentario','Comentario','Es un buen aporte a la educacion de los aprendizes interezados en el tema de fundamentos de la programacion','Id_Funcionario','3','Id_Version','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(3,'Comentario','Comentario','En realidad la imagen es muy sencilla y no expresa el verdadero tema ha tratar','Id_Funcionario','1','Id_Version','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL insertar(3,'Comentario','Comentario','No estoy de acuerdo, en mi parecer le falta mucho ya que no contiene el tema de arrays el cual es muy importante para el aprendizaje de los nuevos aprendices','Id_Funcionario','1','Id_Version','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);


CALL actualizar(2,'Ciudad','Id_Ciudad','1','Nom_Ciudad','armenia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL actualizar(1,'Ciudad','Id_Ciudad','1','Nom_Ciudad','VILLAVICENCIO',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
/*CALL RegistrarCoordinador(4,'Miguel Angel','Castiblanco Cabanzo',' miguel_acc@outlook.es','Aprendiz','135791','1019133595',1,1);

CALL eliminar('Ciudad','Id_Ciudad','3');

CALL seleccionar('Funcionario');*/