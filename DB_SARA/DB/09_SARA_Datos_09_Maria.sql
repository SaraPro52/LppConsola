USE SARA;

CALL SARA_CRUD("INSERT","Ciudad","Nom_Ciudad~Bogotá ","");
CALL SARA_CRUD("INSERT","Ciudad","Nom_Ciudad~Bucaramanga ","");
--
CALL SARA_CRUD("INSERT","Centro","Num_Centro~1	|Nom_Centro~Centro de Gestion de Mercados, Logistica y Tecnologias de la Información|Direccion~Crr 52#	|Id_Ciudad~1","");
CALL SARA_CRUD("INSERT","Centro","Num_Centro~2	|Nom_Centro~Centro de Formacion 2|Direccion~Crr 30	|Id_Ciudad~2","");
--
CALL SARA_CRUD("INSERT","Area","Nom_Area~TeleInformatica	|Lider_Area~Gustabo","");
CALL SARA_CRUD("INSERT","Area","Nom_Area~Mercadeo			|Lider_Area~Carmen","");
--
CALL SARA_CRUD("INSERT","Area_Centro","Id_Area~1	|Id_Centro~1","");
CALL SARA_CRUD("INSERT","Area_Centro","Id_Area~2	|Id_Centro~2","");
--
CALL SARA_CRUD("INSERT","Programa","Nom_Programa~Analisis y Desarrollo de Sistemas de Informacion |Nivel_Formacion~Tecnólogo","");
CALL SARA_CRUD("INSERT","Programa","Nom_Programa~Mantenimiento |Nivel_Formacion~Tecnólogo","");
CALL SARA_CRUD("INSERT","Programa","Nom_Programa~Negocios Internacionales|Nivel_Formacion~Tecnologo","");
-- 
CALL SARA_CRUD("INSERT","Detalles_Area","Id_Programa~1	|Id_Area~1","");
CALL SARA_CRUD("INSERT","Detalles_Area","Id_Programa~2	|Id_Area~1","");
CALL SARA_CRUD("INSERT","Detalles_Area","Id_Programa~3	|Id_Area~2","");
--
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~Fundamentos de Programación		|Des_Tema~Descripcion Tema 1","");
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~Programacion Orientada ha Objetos	|Des_Tema~Descripcion Tema 2","");
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~Negociacion		|Des_Tema~Descripcion Tema 3","");
CALL SARA_CRUD("INSERT","Tema","Nom_Tema~Ingles 	|Des_Tema~Descripcion Tema 4","");
-- 
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~1	|Id_Programa~1","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~2	|Id_Programa~1","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~4	|Id_Programa~1","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~3	|Id_Programa~2","");
CALL SARA_CRUD("INSERT","Detalles_Programa","Id_Tema~4	|Id_Programa~2","");

-- 

--
CALL SARA_CRUD("INSERT","Formato","Nom_Formato~Imagen	|Des_Formato~Descripcion Formato 1","");
CALL SARA_CRUD("INSERT","Formato","Nom_Formato~Video	|Des_Formato~Descripcion Formato 2","");
CALL SARA_CRUD("INSERT","Formato","Nom_Formato~Texto	|Des_Formato~Descripcion Formato 3","");
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
CALL SARA_CRUD("INSERT","Tipo_Documento","Nom_Tipo_Documento~Cedula Extrangera","");
CALL SARA_CRUD("INSERT","Tipo_Documento","Nom_Tipo_Documento~Registro Civil","");
--
--
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe tener imagenes ilustrativas	|Tipo_Item~1","");
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe tener buena ortografia		|Tipo_Item~1","");
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe ser coherente con la introducción|Tipo_Item~0","");
CALL SARA_CRUD("INSERT","Item_Lista","Des_Item_Lista~El documento debe contener una introduccion	|Tipo_Item~0","");

-- 
CALL SARA_CRUD("INSERT","Tipo_Notificacion","Nom_Tipo_Notif~Evaluativa			|Des_Tipo_Notif~Solo podran recibirlas los equipos evaluadores","");
CALL SARA_CRUD("INSERT","Tipo_Notificacion","Nom_Tipo_Notif~Retroalimentativa	|Des_Tipo_Notif~Solo podran recibirlas los intructores","");
CALL SARA_CRUD("INSERT","Tipo_Notificacion","Nom_Tipo_Notif~Publicativa			|Des_Tipo_Notif~Lo recibiran tanto los instructores como el coordinador","");

select * from Funcionario;
CALL RegistrarFuncionario("1~1~1019133595~Funcionario-1~Inst1~Funcionario1@outlook.es~INS~123451~cont1~1~1");
CALL RegistrarFuncionario("2~1~2019133595~Funcionario-2~EvalT1~Funcionario2@outlook.es~EP~123452~cont2~1~1");
CALL RegistrarFuncionario("3~1~3019133595~Funcionario-3~EvalP1~Funcionario3@outlook.es~ET~123453~cont3~1~1");
CALL RegistrarFuncionario("4~1~4019133595~Funcionario-4~Coor1~Funcionario4@outlook.es~CO~123454~cont4~1~1");

CALL RegistrarFuncionario("1~1~5019133595~Funcionario-5~Inst2~Funcionario5@outlook.es~INS~123455~cont5~1~1");