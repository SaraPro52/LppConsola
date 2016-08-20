USE SARA;
/*27*/
CALL Sara('INSERT',2,'Tema',null,null,'Nom_Tema','JAVA','Des_Tema','Es un lenguaje de programacion',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Programa',null,null,'Nom_Programa','ADSI','Nivel_Formacion','Tecnologo',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Detalles_Programa',null,null,'Id_Tema','1','Id_Programa','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Area',null,null,'Nom_Area','Teleinformatica','Lider_Area','Gustabo',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Detalles_Area',null,null,'Id_Programa','1','Id_Area','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',1,'Ciudad',null,null,'Nom_Ciudad','Bogotá',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',1,'Ciudad','Id_Ciudad',0,'Nom_Ciudad','Bucaraman',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',4,'Centro',null,null,'Num_Centro','12','Nom_Centro','Cntro de gestion, logistica y mescados','Direccion','Crr 52#','Id_Ciudad','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Area_Centro',null,null,'Id_Area','1','Id_Centro','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',2,'Formato',null,null,'Nom_Formato','Documento','Des_Formato','Puede ser cualquier tipo de documento ofice',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Formato',null,null,'Nom_Formato','Imagen','Des_Formato','Imagen Elaborada para la explicacion de un tema',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',4,'Producto_Virtual',null,null,'Nom_P_Virtual','Fundamentos de Programación','Des_P_Virtual','Documento que le dara la bienvenida a los nuevos','Palabras_Clave','Fundamentos, Programación, Teoria','Id_Formato','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',4,'Producto_Virtual',null,null,'Nom_P_Virtual','Desarrollo de Base de Datos','Des_P_Virtual','Imagen que Explica el desarrollo de las bases de datos','Palabras_Clave','base de datos,dml, imagenes','Id_Formato','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',2,'Detalles_Tema',null,null,'Id_Tema',1,'Id_P_Virtual',1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Detalles_Tema',null,null,'Id_Tema',1,'Id_P_Virtual',1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',1,'Tipo_Estado',null,null,'Nom_Tipo_Estado','Funcionario',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',1,'Tipo_Estado',null,null,'Nom_Tipo_Estado','Version',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',2,'Estado',null,null,'Nom_Estado','Act','Id_Tipo_Estado','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Estado',null,null,'Nom_Estado','Espera','Id_Tipo_Estado','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Estado',null,null,'Nom_Estado','Inhabilitado','Id_Tipo_Estado','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',2,'Rol',null,null,'Nom_Rol','Instructor','Des_Rol','Suprincipal participacion es el envio de los oa',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Rol',null,null,'Nom_Rol','Lider Equipo Tecnico','Des_Rol','Evaluara los oa tecnicamente',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Rol',null,null,'Nom_Rol','Lider Equipo Pedagogico','Des_Rol','Evaluara los oa pedagogicamente',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Rol',null,null,'Nom_Rol','Coordinador Formacion Profecinal','Des_Rol','Controla la publicacion de las oas',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',1,'Tipo_Documento',null,null,'Nom_Tipo_Documento','Cedula de Ciudadania',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',1,'Tipo_Documento',null,null,'Nom_Tipo_Documento','Cedula Extrangera',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',1,'Tipo_Documento',null,null,'Nom_Tipo_Documento','Registro Civil',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',10,'Funcionario',null,null,'Id_Tipo_Documento','1','Num_Documento','1019133595','Nom_Funcionario','Miguel Alfredo','Apellidos','Sanchez Cabanzo','Correo','Macastiblanco88@misena.edu.co','Cargo','Instructor','Ip_Sena','159753','Contraseña','macc','Id_Area_Centro','1','Id_Estado','1',null,null);
CALL Sara('INSERT',10,'Funcionario',null,null,'Id_Tipo_Documento','1','Num_Documento','1039598334','Nom_Funcionario','Carlos Oracio','Apellidos','Diaz Buitrago','Correo','cdiazbu@misena.edu.co','Cargo','Instructor','Ip_Sena','555555','Contraseña','judini','Id_Area_Centro','1','Id_Estado','1',null,null);
CALL Sara('INSERT',10,'Funcionario',null,null,'Id_Tipo_Documento','2','Num_Documento','1729938448','Nom_Funcionario','Sandra ','Apellidos','Gonzales Ribero','Correo','sandra@misena.edu.co','Cargo','Pedagoga','Ip_Sena','680884','Contraseña','595959','Id_Area_Centro','1','Id_Estado','1',null,null);
CALL Sara('INSERT',10,'Funcionario',null,null,'Id_Tipo_Documento','3','Num_Documento','1039598334','Nom_Funcionario','Juan Alejandro','Apellidos','Rodriguez Mogollon','Correo','jarm@misena.edu.co','Cargo','Coordinador','Ip_Sena','957595','Contraseña','admin','Id_Area_Centro','1','Id_Estado','1',null,null);
CALL Sara('INSERT',10,'Funcionario',null,null,'Id_Tipo_Documento','2','Num_Documento','1319497750','Nom_Funcionario','Estevan ','Apellidos','Castro','Correo','ecastro@misena.edu.co','Cargo','Tecnico','Ip_Sena','957597','Contraseña','otmoe','Id_Area_Centro','1','Id_Estado','1',null,null);

CALL Sara('INSERT',2,'Rol_Funcionario',null,null,'Id_Rol','1','Id_Funcionario','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Rol_Funcionario',null,null,'Id_Rol','1','Id_Funcionario','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Rol_Funcionario',null,null,'Id_Rol','2','Id_Funcionario','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Rol_Funcionario',null,null,'Id_Rol','3','Id_Funcionario','3',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Rol_Funcionario',null,null,'Id_Rol','4','Id_Funcionario','4',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Rol_Funcionario',null,null,'Id_Rol','1','Id_Funcionario','5',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);


CALL Sara('INSERT',2,'Tipo_Version',null,null,'Nom_Tipo_Version','Evaluacion','Des_Version','Son las posibles versiones que puede tener una oa en proceso de evaluacion',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Tipo_Version',null,null,'Nom_Tipo_Version','Aprobacion','Des_Version','Son las posibles versiones que puede tener una oa despues de ser aprovada',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);


CALL Sara('INSERT',10,'Version',null,null,'Fecha_Publicacion','2016-03-10','Num_Version','1','Fecha_Vigencia','2016-09-10','Url_Version','/carpeta1/carpeta2','Url_Img','/carp1/carp2','Inst_Instalacion','Descargue el archivo y ejecutelo en cualquier editor de texto','Reqst_Instalacion','Editor de texto, Acceso a internet','Id_P_Virtual','1','Id_Estado','1','Id_Tipo_Version','2',null,null);
CALL Sara('INSERT',10,'Version',null,null,'Fecha_Publicacion','2016-06-01','Num_Version','1','Fecha_Vigencia','2016-12-10','Url_Version','/carpeta1/carpeta2','Url_Img','/carp1/carp2','Inst_Instalacion','Descargue el archivo y ejecutelo en cualquier visualizador de imagenes','Reqst_Instalacion','Visualizador de imagenes, Acceso a internet','Id_P_Virtual','2','Id_Estado','1','Id_Tipo_Version','2',null,null);
CALL Sara('INSERT',8,'Version',null,null,'Num_Version','1','Url_Version','','Url_Img','','Inst_Instalacion','Descargue el archivo y ejecutelo en cualquier editor de texto','Reqst_Instalacion','Editor de texto, Acceso a internet','Id_P_Virtual','1','Id_Estado','2','Id_Tipo_Version','1',null,null,null,null,null,null);
CALL Sara('INSERT',8,'Version',null,null,'Num_Version','1','Url_Version','','Url_Img','','Inst_Instalacion','Descargue el archivo y ejecutelo en cualquier visualizador de imagenes','Reqst_Instalacion','Visualizador de imagenes, Acceso a internet','Id_P_Virtual','2','Id_Estado','2','Id_Tipo_Version','1',null,null,null,null,null,null);

CALL Sara('INSERT',9,'Rankin',null,null,'Num_Visitas','0','Num_Descargas','0','Cant_5','0','Cant_4','0','Cant_3','0','Cant_2','0','Cant_1','0','Numero_Votos','0','Id_Version','1',null,null,null,null);
CALL Sara('INSERT',9,'Rankin',null,null,'Num_Visitas','0','Num_Descargas','0','Cant_5','0','Cant_4','0','Cant_3','0','Cant_2','0','Cant_1','0','Numero_Votos','0','Id_Version','2',null,null,null,null);

CALL Sara('INSERT',2,'Autor',null,null,'Id_Version','1','Id_Funcionario','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Autor',null,null,'Id_Version','1','Id_Funcionario','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Autor',null,null,'Id_Version','1','Id_Funcionario','4',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Autor',null,null,'Id_Version','2','Id_Funcionario','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Autor',null,null,'Id_Version','2','Id_Funcionario','4',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',3,'Comentario',null,null,'Comentario','Es un buen aporte a la educacion de los aprendizes interezados en el tema de fundamentos de la programacion','Id_Funcionario','3','Id_Version','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',3,'Comentario',null,null,'Comentario','En realidad la imagen es muy sencilla y no expresa el verdadero tema ha tratar','Id_Funcionario','1','Id_Version','2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',3,'Comentario',null,null,'Comentario','No estoy de acuerdo, en mi parecer le falta mucho ya que no contiene el tema de arrays el cual es muy importante para el aprendizaje de los nuevos aprendices','Id_Funcionario','1','Id_Version','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',2,'Item_Lista',null,null,'Des_Item_Lista','El documento debe tener buena ortografia','Tipo_Item',1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Item_Lista',null,null,'Des_Item_Lista','El documento debe contener una introduccion','Tipo_Item',0,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Item_Lista',null,null,'Des_Item_Lista','El documento','Tipo_Item',true,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',3,'Lista_Chequeo',null,null,'Nom_Lista_Chequeo','Lista para las imagenes','Des_Lista_Chequeo','Estal lista esta enfocada a solo evaluaciones de imagenes','Id_Funcionario',2,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',3,'Lista_Chequeo',null,null,'Nom_Lista_Chequeo','Lista para las Documentos','Des_Lista_Chequeo','Estal lista esta enfocada a solo evaluaciones de Documentos','Id_Funcionario',3,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',2,'Detalles_Lista',null,null,'Id_Lista_Chequeo',1,'Id_Item_Lista',1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Detalles_Lista',null,null,'Id_Lista_Chequeo',1,'Id_Item_Lista',2,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',2,'Detalles_Lista',null,null,'Id_Lista_Chequeo',2,'Id_Item_Lista',2,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('UPDATE',1,'Ciudad','Id_Ciudad','1','Nom_Ciudad','Armenia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('UPDATE',1,'Ciudad','Id_Ciudad','2','Nom_Ciudad','VILLAVICENCIO',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('INSERT',5,'Evaluacion_General',null,null,'Observacion','el oa no cumple con los items','Resultado',false,'Id_Version',1,'Id_Lista_Chequeo',1,'Id_Funcionario',2,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('INSERT',4,'Detalles_Evaluacion',null,null,'Valorizacion','1','Observacion','Si cumple con lo acordado en el item','Id_Detalles_Lista',1,'Id_Evaluacion_General',1,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
CALL Sara('SELECT',1,'Funcionario',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('SELECT',1,'Lista_Chequeo',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
	
/*CALL RegistrarCoordinador(4,'Miguel Angel','Castiblanco Cabanzo',' miguel_acc@outlook.es','Aprendiz','135791','1019133595',1,1);

CALL Sara('DELETE',null,'Ciudad','Id_Ciudad','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

CALL Sara('SELECT',1,'Tema',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
*/