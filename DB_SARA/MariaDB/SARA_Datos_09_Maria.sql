USE SARA;

CALL SARA_CRUD("INSERT","Ciudad","Nom_Ciudad~Ciudad 1","");
CALL SARA_CRUD("INSERT","Ciudad","Nom_Ciudad~Ciudad 2","");
--
CALL SARA_CRUD("INSERT","Centro","Num_Centro~1	|Nom_Centro~Centro de Formacion 1|Direccion~Crr 52#	|Id_Ciudad~1","");
CALL SARA_CRUD("INSERT","Centro","Num_Centro~2	|Nom_Centro~Centro de Formacion 2|Direccion~Crr 30	|Id_Ciudad~2","");
--
CALL SARA_CRUD("INSERT","Area","Nom_Area~Area 1	|Lider_Area~Lider Area 1","");
CALL SARA_CRUD("INSERT","Area","Nom_Area~Area 2	|Lider_Area~Lider Area 2","");
--
CALL SARA_CRUD("INSERT","Area_Centro","Id_Area~1	|Id_Centro~1","");
CALL SARA_CRUD("INSERT","Area_Centro","Id_Area~2	|Id_Centro~2","");
--
CALL SARA_CRUD("INSERT","Programa","Nom_Programa~Programa de Formacion 1 |Nivel_Formacion~Nivel 1","");
CALL SARA_CRUD("INSERT","Programa","Nom_Programa~Programa de Formacion 2 |Nivel_Formacion~Nivel 2","");
-- 
CALL SARA_CRUD("INSERT","Detalles_Area","Id_Programa~1	|Id_Area~1","");
CALL SARA_CRUD("INSERT","Detalles_Area","Id_Programa~2	|Id_Area~2","");
--
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~Tema 1		|Des_Tema~Descripcion Tema 1","");
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~Tema 2		|Des_Tema~Descripcion Tema 2","");
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~Tema 3		|Des_Tema~Descripcion Tema 3","");
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~Tema 4 	|Des_Tema~Descripcion Tema 4","");
-- 
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~1	|Id_Programa~1","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~2	|Id_Programa~1","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~3	|Id_Programa~2","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~4	|Id_Programa~2","");
-- 

--
CALL SARA_CRUD("INSERT","Formato","Nom_Formato~Formato 1	|Des_Formato~Descripcion Formato 1","");
CALL SARA_CRUD("INSERT","Formato","Nom_Formato~Formato 2	|Des_Formato~Descripcion Formato 2","");
--

--
CALL SARA_CRUD("INSERT","Tipo_Estado","Nom_Tipo_Estado~Funcionario","");
CALL SARA_CRUD("INSERT","Tipo_Estado","Nom_Tipo_Estado~Version","");
--
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Activo			|Id_Tipo_Estado~1","");
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Inactivo		|Id_Tipo_Estado~1","");
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Evaluando Equipo Tecnico			|Id_Tipo_Estado~2","");
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Evaluando Equipo Pedagogico		|Id_Tipo_Estado~2","");
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Pendiente							|Id_Tipo_Estado~2","");
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Habilitado							|Id_Tipo_Estado~2","");
CALL SARA_CRUD("INSERT","Estado","Nom_Estado~Inhabilitado						|Id_Tipo_Estado~2","");
--
CALL SARA_CRUD("INSERT","Rol","Nom_Rol~Instructor							|Des_Rol~Suprincipal participacion es el envio de los oa","");
CALL SARA_CRUD("INSERT","Rol","Nom_Rol~Lider Equipo Tecnico					|Des_Rol~Evaluara los oa tecnicamente","");
CALL SARA_CRUD("INSERT","Rol","Nom_Rol~Lider Equipo Pedagogico				|Des_Rol~Evaluara los oa pedagogicamente",""); 
CALL SARA_CRUD("INSERT","Rol","Nom_Rol~Coordinador Formacion Profecional	|Des_Rol~Controla la publicacion de las oas","");
--
CALL SARA_CRUD("INSERT","Tipo_Documento","Nom_Tipo_Documento~Cedula de Ciudadania","");
CALL SARA_CRUD("INSERT","Tipo_Documento","Nom_Tipo_Documento~Cedula Estrangera","");
CALL SARA_CRUD("INSERT","Tipo_Documento","Nom_Tipo_Documento~Registro Civil","");
--
--
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe tener buena ortografia		|Tipo_Item~1","");
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe contener una introduccion	|Tipo_Item~0","");
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe tener imagenes ilustrativas	|Tipo_Item~1","");
-- 

CALL SARA_CRUD("INSERT","Tipo_Notificacion","Nom_Tipo_Notif~Evaluativa|Des_Tipo_Notif~Solo podran recibirlas los equipos evaluadores","");
CALL SARA_CRUD("INSERT","Tipo_Notificacion","Nom_Tipo_Notif~Retroalimentativa|Des_Tipo_Notif~Solo podran recibirlas los intructores","");
CALL SARA_CRUD("INSERT","Tipo_Notificacion","Nom_Tipo_Notif~Publicativa|Des_Tipo_Notif~Lo recibiran tanto los instructores como el coordinador","");

