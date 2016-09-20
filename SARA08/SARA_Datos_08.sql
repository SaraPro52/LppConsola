USE SARA08;

CALL SARA_CRUD("INSERT","Tema","Nom_Tema~JAVA		|Des_Tema~Es un Lenguaje de Programacion","");
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~PHP		|Des_Tema~Lenguaje de Programacion","");
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~.NET		|Des_Tema~Programacion","");
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~Ambiental	|Des_Tema~Enfocado al cuidado ambiental","");
-- 
CALL SARA_CRUD("INSERT","Programa","Nom_Programa~ADSI				|Nivel_Formacion~Tecnologo","");
CALL SARA_CRUD("INSERT","Programa","Nom_Programa~Programa Ambiental	|Nivel_Formacion~Tecnico","");
-- 
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~1	|Id_Programa~1","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~3	|Id_Programa~1","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~4	|Id_Programa~1","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~4	|Id_Programa~2","");
-- 
CALL SARA_CRUD("INSERT","Area","Nom_Area~Teleinformatica	|Lider_Area~Gustabo","");
CALL SARA_CRUD("INSERT","Area","Nom_Area~Multimedia			|Lider_Area~Carmen","");
--
CALL SARA_CRUD("INSERT","Detalles_Area","Id_Programa~1	|Id_Area~1","");
CALL SARA_CRUD("INSERT","Detalles_Area","Id_Programa~2	|Id_Area~1","");
--
CALL SARA_CRUD("INSERT","Ciudad","Nom_Ciudad~Bogotá","");
CALL SARA_CRUD("INSERT","Ciudad","Nom_Ciudad~Bucaramanga","");
CALL SARA_CRUD("INSERT","Ciudad","Nom_Ciudad~Santander","");
--
CALL SARA_CRUD("INSERT","Centro","Num_Centro~12	|Nom_Centro~Centro de gestion,mercados y logisticas de la tecnologia	|Direccion~Crr 52#	|Id_Ciudad~1","");
CALL SARA_CRUD("INSERT","Centro","Num_Centro~13	|Nom_Centro~Centro de Telas y confeccion								|Direccion~Crr 30	|Id_Ciudad~2","");
--
CALL SARA_CRUD("INSERT","Area_Centro","Id_Area~1	|Id_Centro~1","");
CALL SARA_CRUD("INSERT","Area_Centro","Id_Area~2	|Id_Centro~2","");
--
CALL SARA_CRUD("INSERT","Formato","Nom_Formato~Documento	|Des_Formato~Puede ser cualquier tipo de documento ofice","");
CALL SARA_CRUD("INSERT","Formato","Nom_Formato~Imagen		|Des_Formato~Imagen Elaborada para la explicacion de un tema","");
--
CALL SARA_CRUD("INSERT","Producto_Virtual","Nom_P_Virtual~Fundamentos de Programacion	|Des_P_Virtual~Documento que le dara la bienvenida a los nuevos			|Palabras_Clave~Fundamentos, Programación, Teoria	|Id_Formato~1","");
CALL SARA_CRUD("INSERT","Producto_Virtual","Nom_P_Virtual~Desarrollo de Base de Datos	|Des_P_Virtual~Imagen que Explica el desarrollo de las bases de datos	|Palabras_Clave~base de datos,dml, imagenes			|Id_Formato~2","");
--
CALL SARA_CRUD("INSERT","Detalles_Tema","Id_Tema~1	|Id_P_Virtual~1	|Tipo_Tema~1","");
CALL SARA_CRUD("INSERT","Detalles_Tema","Id_Tema~2	|Id_P_Virtual~1	|Tipo_Tema~0","");
CALL SARA_CRUD("INSERT","Detalles_Tema","Id_Tema~3	|Id_P_Virtual~1	|Tipo_Tema~1","");
CALL SARA_CRUD("INSERT","Detalles_Tema","Id_Tema~4	|Id_P_Virtual~1	|Tipo_Tema~1","");
CALL SARA_CRUD("INSERT","Detalles_Tema","Id_Tema~4	|Id_P_Virtual~2	|Tipo_Tema~0","");
CALL SARA_CRUD("INSERT","Detalles_Tema","Id_Tema~4	|Id_P_Virtual~2	|Tipo_Tema~1","");
CALL SARA_CRUD("INSERT","Detalles_Tema","Id_Tema~2	|Id_P_Virtual~2	|Tipo_Tema~1","");
--
CALL SARA_CRUD("INSERT","Tipo_Estado","Nom_Tipo_Estado~Funcionario","");
CALL SARA_CRUD("INSERT","Tipo_Estado","Nom_Tipo_Estado~Version","");
--
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Activo			|Id_Tipo_Estado~1","");
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Evaluando		|Id_Tipo_Estado~2","");
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Inhabilitado	|Id_Tipo_Estado~1","");
--
CALL SARA_CRUD("INSERT","Rol","Nom_Rol~Instructor							|Des_Rol~Suprincipal participacion es el envio de los oa","");
CALL SARA_CRUD("INSERT","Rol","Nom_Rol~Lider Equipo Pedagogico				|Des_Rol~Evaluara los oa pedagogicamente","");
CALL SARA_CRUD("INSERT","Rol","Nom_Rol~Lider Equipo Tecnico					|Des_Rol~Evaluara los oa tecnicamente","");
CALL SARA_CRUD("INSERT","Rol","Nom_Rol~Coordinador Formacion Profecional	|Des_Rol~Controla la publicacion de las oas","");
--
CALL SARA_CRUD("INSERT","Tipo_Documento","Nom_Tipo_Documento~Cedula de Ciudadania","");
CALL SARA_CRUD("INSERT","Tipo_Documento","Nom_Tipo_Documento~Cedula Extrangera","");
CALL SARA_CRUD("INSERT","Tipo_Documento","Nom_Tipo_Documento~Registro Civil","");
--
CALL SARA_CRUD("INSERT","Funcionario","Id_Tipo_Documento~1	|Num_Documento~1019133595	|Nom_Funcionario~Miguel Alfredo	|Apellidos~Sanchez Cabanzo		|Correo~Macastiblanco88@misena.edu.co	|Cargo~Instructor	|Ip_Sena~159753	|Contraseña~macc	|Id_Area_Centro~1	|Id_Estado~1","");
CALL SARA_CRUD("INSERT","Funcionario","Id_Tipo_Documento~1	|Num_Documento~1039598334	|Nom_Funcionario~Carlos Oracio	|Apellidos~Diaz Buitrago		|Correo~cdiazbu@misena.edu.co			|Cargo~Instructor	|Ip_Sena~555555	|Contraseña~judini	|Id_Area_Centro~1	|Id_Estado~1","");
CALL SARA_CRUD("INSERT","Funcionario","Id_Tipo_Documento~2	|Num_Documento~1729938448	|Nom_Funcionario~Sandra			|Apellidos~Gonzales Ribero		|Correo~sandra@misena.edu.co			|Cargo~Pedagoga		|Ip_Sena~680884	|Contraseña~595959	|Id_Area_Centro~1	|Id_Estado~1","");
CALL SARA_CRUD("INSERT","Funcionario","Id_Tipo_Documento~3	|Num_Documento~1039598338	|Nom_Funcionario~Juan Alejandro	|Apellidos~Rodriguez Mogollon	|Correo~jarm@misena.edu.co				|Cargo~Coordinador	|Ip_Sena~957595	|Contraseña~admin	|Id_Area_Centro~1	|Id_Estado~1","");
CALL SARA_CRUD("INSERT","Funcionario","Id_Tipo_Documento~2	|Num_Documento~1319497750	|Nom_Funcionario~Estevan		|Apellidos~Castro				|Correo~ecastro@misena.edu.co			|Cargo~Tecnico		|Ip_Sena~957597	|Contraseña~otmoe	|Id_Area_Centro~1	|Id_Estado~2","");
--
CALL SARA_CRUD("INSERT","Rol_Funcionario","Id_Rol~4	|Id_Funcionario~1","");
CALL SARA_CRUD("INSERT","Rol_Funcionario","Id_Rol~1	|Id_Funcionario~2","");
CALL SARA_CRUD("INSERT","Rol_Funcionario","Id_Rol~2	|Id_Funcionario~2","");
CALL SARA_CRUD("INSERT","Rol_Funcionario","Id_Rol~3	|Id_Funcionario~3","");
CALL SARA_CRUD("INSERT","Rol_Funcionario","Id_Rol~4	|Id_Funcionario~4","");
CALL SARA_CRUD("INSERT","Rol_Funcionario","Id_Rol~1	|Id_Funcionario~5","");
--
CALL SARA_CRUD("INSERT","Tipo_Version","Nom_Tipo_Version~Evaluacion	|Des_Tipo_Version~Son las posibles versiones que puede tener una oa en proceso de evaluacion","");
CALL SARA_CRUD("INSERT","Tipo_Version","Nom_Tipo_Version~Aprobacion	|Des_Tipo_Version~Son las posibles versiones que puede tener una oa despues de ser aprovada","");
--
CALL SARA_CRUD("INSERT","Version","Fecha_Publicacion~2016-03-10	|Num_Version~1|Fecha_Vigencia~2016-09-10|Url_Version~/carpeta1/carpeta2|Url_Img~/carp1/carp2|Inst_Instalacion~Descargue el archivo y ejecutelo en cualquier editor de texto			|Reqst_Instalacion~Editor de texto, Acceso a internet			|Id_P_Virtual~1|Id_Estado~1|Id_Tipo_Version~2","");
CALL SARA_CRUD("INSERT","Version","Fecha_Publicacion~2016-06-01	|Num_Version~1|Fecha_Vigencia~2016-12-10|Url_Version~/carpeta1/carpeta2|Url_Img~/carp1/carp2|Inst_Instalacion~Descargue el archivo y ejecutelo en cualquier visualizador de imagenes|Reqst_Instalacion~Visualizador de imagenes, Acceso a internet	|Id_P_Virtual~1|Id_Estado~1|Id_Tipo_Version~2","");
CALL SARA_CRUD("INSERT","Version","Num_Version~1	|Url_Version~	|Url_Img~	|Inst_Instalacion~Descargue el archivo y ejecutelo en cualquier editor de texto			|Reqst_Instalacion~Editor de texto, Acceso a internet			|Id_P_Virtual~1	|Id_Estado~2	|Id_Tipo_Version~1","");
CALL SARA_CRUD("INSERT","Version","Num_Version~1	|Url_Version~	|Url_Img~	|Inst_Instalacion~Descargue el archivo y ejecutelo en cualquier visualizador de imagenes|Reqst_Instalacion~Visualizador de imagenes, Acceso a internet	|Id_P_Virtual~2	|Id_Estado~2	|Id_Tipo_Version~1","");
--
CALL SARA_CRUD("INSERT","Rankin","Id_Version~1","");
CALL SARA_CRUD("INSERT","Rankin","Id_Version~2","");
--
CALL SARA_CRUD("INSERT","Autor","Id_Version~1	|Id_Funcionario~1","");
CALL SARA_CRUD("INSERT","Autor","Id_Version~1	|Id_Funcionario~2","");
CALL SARA_CRUD("INSERT","Autor","Id_Version~1	|Id_Funcionario~4","");
CALL SARA_CRUD("INSERT","Autor","Id_Version~2	|Id_Funcionario~2","");
CALL SARA_CRUD("INSERT","Autor","Id_Version~2	|Id_Funcionario~4","");
--
CALL SARA_CRUD("INSERT","Comentario","Comentario~Es un buen aporte a la educacion de los aprendizes interezados en el tema de fundamentos de la programacion|Id_Funcionario~3|Id_Version~1","");
CALL SARA_CRUD("INSERT","Comentario","Comentario~En realidad la imagen es muy sencilla y no expresa el verdadero tema ha tratar|Id_Funcionario~1|Id_Version~2","");
CALL SARA_CRUD("INSERT","Comentario","Comentario~No estoy de acuerdo, en mi parecer le falta mucho ya que no contiene el tema de arrays el cual es muy importante para el aprendizaje de los nuevos aprendices|Id_Funcionario~1|Id_Version~1","");
--
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe tener buena ortografia		|Tipo_Item~1","");
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe contener una introduccion	|Tipo_Item~0","");
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe tener imagenes ilustrativas	|Tipo_Item~1","");
--
CALL SARA_CRUD("INSERT","Lista_Chequeo","Nom_Lista_Chequeo~Lista para las imagenes	|Des_Lista_Chequeo~Esta lista esta enfocada a solo evaluaciones de imagenes		|Id_Funcionario~2","");
CALL SARA_CRUD("INSERT","Lista_Chequeo","Nom_Lista_Chequeo~Lista para las Documentos|Des_Lista_Chequeo~Esta lista esta enfocada a solo evaluaciones de Documentos	|Id_Funcionario~3","");
--
CALL SARA_CRUD("INSERT","Detalles_Lista","Id_Lista_Chequeo~1	|Id_Item_Lista~1","");
CALL SARA_CRUD("INSERT","Detalles_Lista","Id_Lista_Chequeo~1	|Id_Item_Lista~2","");
CALL SARA_CRUD("INSERT","Detalles_Lista","Id_Lista_Chequeo~2	|Id_Item_Lista~2","");
--
CALL SARA_CRUD("INSERT","Categoria","Nom_Categoria~Programacion Category	|Des_Categoria~La categoria para los programadores	|Id_Funcionario~1","");
CALL SARA_CRUD("INSERT","Categoria","Nom_Categoria~Ambiental Category		|Des_Categoria~La categoria para los ambientalistas	|Id_Funcionario~2","");
--
CALL SARA_CRUD("INSERT","Detalles_Categoria","Id_Categoria~1	|Id_Tema~1","");
CALL SARA_CRUD("INSERT","Detalles_Categoria","Id_Categoria~1	|Id_Tema~2","");
CALL SARA_CRUD("INSERT","Detalles_Categoria","Id_Categoria~2	|Id_Tema~4","");
--
CALL SARA_CRUD("INSERT","Evaluacion_General","Observacion~el oa no cumple con los items|Resultado~0|Id_Version~1|Id_Lista_Chequeo~1|Id_Funcionario~2","");
CALL SARA_CRUD("INSERT","Detalles_Evaluacion","Valorizacion~1|Observacion~Si cumple con lo acordado en el item|Id_Detalles_Lista~1|Id_Evaluacion_General~1","");
--
CALL SARA_CRUD("UPDATE","Ciudad","Nom_Ciudad~Armenia","Id_Ciudad = 1");
CALL SARA_CRUD("UPDATE","Ciudad","Nom_Ciudad~VILLAVICENCIO","Id_Ciudad = 2");
-- 
CALL SARA_CRUD("SELECT","Ciudad","*","");
CALL SARA_CRUD("UPDATE","Area_Centro","Id_Centro~1","Id_Area_Centro = 1");

UPDATE Area_Centro SET Id_Centro = 2 WHERE Id_Area_Centro = 1;
-- CALL SARA_CRUD("SELECT","Ciudad","*","");
-- CALL SARA_CRUD("SELECT","V_Detalles_Lista","Id_Lista_Chequeo|Id_Item_Lista|Des_Item_Lista|Tipo_Item","Id_Lista_Chequeo = 1");

-- CALL SARA_CRUD("DELETE","Ciudad","","Id_Ciudad = 3");
