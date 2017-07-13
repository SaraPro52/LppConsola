
create database saradb;
use saradb;
create table tipo_estado(
    id_tipo_estado integer not null auto_increment,
    nom_tipo_estado varchar(50) not null,
    constraint pk_tipo_estado primary key (id_tipo_estado),
    constraint un_tipo_estado unique (nom_tipo_estado)
);

create table estado(
    id_estado integer not null auto_increment,
    nom_estado varchar(50) not null,
    id_tipo_estado integer not null,
    constraint pk_estado primary key (id_estado),
    constraint un_estado unique	(nom_estado),
    constraint fk_tipo_estado foreign key (id_tipo_estado) references tipo_estado(id_tipo_estado)
);

create table tipo_formato(
	id_tipo_formato integer not null auto_increment,
    nom_tipo_formato varchar(60) not null,
    urlimgtipoformato varchar(100), -- cambion con las imagenes
    constraint pk_tipoformato primary key (id_tipo_formato),
    constraint un_tipoformato unique(nom_tipo_formato)
);

create table formato(	
    id_formato integer not null auto_increment,
    nom_formato varchar(50) not null,
    des_formato varchar(100) not null,
    id_tipo_formato integer not null,
    constraint pk_formato primary key (id_formato),
    constraint un_formtato_01 unique(nom_formato),
    constraint fk_tipoformato foreign key (id_tipo_formato) references tipo_formato(id_tipo_formato)
);

create table producto_virtual(	
    id_p_virtual   integer not null auto_increment,
    nom_p_virtual  varchar(100) not null,
    des_p_virtual varchar(200) not null,
    palabras_clave varchar(100) not null,
    id_formato 	    integer not null,
    constraint pk_p_virtual 	primary key (id_p_virtual),
    constraint un_p_virtual_01 	unique 		(nom_p_virtual),
    constraint un_p_virtual_02	unique		(des_p_virtual),
    constraint fk_formato   	foreign key (id_formato)    references formato(id_formato)

);

create table version (

	id_version           integer not null auto_increment,
    fecha_envio          timestamp default current_timestamp,
    fecha_publicacion 	 timestamp default "2016-01-01",
    num_version 		 float default 1,-- cambio numero version
	fecha_vigencia 		 timestamp default "2016-01-01",
    url_version			 varchar (500),
    url_img				 varchar (500),				
    inst_instalacion	 varchar (800),
    reqst_instalacion    varchar (500),
    id_p_virtual		 integer not null,
	id_estado			 integer not null default 3,
	
	constraint pk_version      primary key (id_version),
    constraint fk_p_virtual_01 foreign key (id_p_virtual)    references producto_virtual(id_p_virtual),
    constraint fk_estado_01    foreign key (id_estado)       references estado(id_estado)
);	

create table rankin(

	id_rankin         integer not null auto_increment,
    puesto			    integer not null default 0,
    cant_visitas    integer not null default 0,
    cant_descargas	integer not null default 0,
    cant_votos      integer not null default 0,
    id_version		  integer not null,
    
    constraint pk_rankin 	  primary key (id_rankin),
    constraint fk_version 	foreign key (id_version) references version (id_version),
    constraint un_rankin	  unique		(id_version)
    
);


create table tema(

	id_tema    integer not null auto_increment,
    nom_tema   varchar(45) not null,
    des_tema   varchar(100) not null,
    
    constraint pk_tema 		primary key (id_tema),
    constraint un_tema_01 	unique	   	(nom_tema),
	constraint un_tema_02 	unique	   	(des_tema)
    
);


create table detalles_tema(

	id_detalles_tema integer not null auto_increment,
    id_tema          integer not null,
    id_p_virtual     integer not null,
    tipo_tema		 boolean not null ,  -- determina si tiene una relacion con categoria o con programa
    
    constraint pk_detalles_tema    primary key (id_detalles_tema),
    constraint un_detalles_tema	   unique	   (id_tema,id_p_virtual,tipo_tema),
    constraint fk_tema_01          foreign key (id_tema)      references tema(id_tema),
    constraint fk_p_virtual_02     foreign key (id_p_virtual) references producto_virtual(id_p_virtual)
    
);


create table programa(
	
    id_programa     integer not null auto_increment,
	nom_programa    varchar(100) not null,
    nivel_formacion varchar(45) not null,
    
    constraint pk_programa primary key 	(id_programa),
	constraint un_programa unique	    (nom_programa)
		
);

create table detalles_programa(

	id_detalles_programa integer not null auto_increment,
    id_tema              integer not null,
    id_programa          integer not null,
    
    constraint pk_detalles_programa primary key (id_detalles_programa),
    constraint un_detalles_programa unique		(id_tema,id_programa),
    constraint fk_tema_02           foreign key (id_tema)     references tema(id_tema),
    constraint fk_programa_01       foreign key (id_programa) references programa(id_programa)
    
);

create table area (

	id_area       integer not null auto_increment,
    nom_area      varchar(100) not null,
    lider_area    varchar(70) not null,
    
    constraint pk_area primary key (id_area),
    constraint un_area unique 	   (nom_area)
    
);

create table detalles_area(

	id_detalles_area integer not null auto_increment,
    id_area          integer not null,
    id_programa      integer not null,
    
    constraint pk_detalles_area primary key (id_detalles_area),
    constraint un_detalles_area	unique		(id_area,id_programa),
    constraint fk_area_01		foreign key (id_area)	  references area (id_area),
    constraint fk_programa_02   foreign key (id_programa) references programa(id_programa)

);

create table ciudad(
	
    id_ciudad    integer not null auto_increment,
    nom_ciudad   varchar(75) not null,
    
    constraint pk_ciudad    primary key (id_ciudad),
    constraint un_ciudad    unique (nom_ciudad) 
    
);

create table centro(
	
	id_centro    integer not null auto_increment,
    num_centro   varchar(50) not null,
    nom_centro   varchar(100) not null,
    direccion    varchar(100) not null,
    id_ciudad 	 integer not null,
    
    constraint pk_centro 	primary key 	(id_centro),
    constraint un_centro_01 unique	     	(num_centro),
    constraint un_centro_02 unique	     	(nom_centro),
    constraint un_centro_03	unique		 	(direccion),
    constraint fk_ciudad 	foreign key 	(id_ciudad) references ciudad(id_ciudad)
    
);

create table area_centro(

	id_area_centro integer not null auto_increment,
    id_area        integer not null,
    id_centro	   integer not null,
	
	constraint pk_area_centro primary key (id_area_centro),
    constraint un_area_centro unique	  (id_area,id_centro),
    constraint fk_area_02     foreign key (id_area)   references area (id_area),
    constraint fk_centro	  foreign key (id_centro) references centro(id_centro)	
     
);

create table tipo_documento(

	id_tipo_documento integer not null auto_increment,
    nom_tipo_documento varchar (100) not null,--
    
    constraint pk_tipo_documento primary key (id_tipo_documento),
    constraint un_tipo_documento unique (nom_tipo_documento)
);

create table funcionario(

	id_funcionario  	integer not null auto_increment,
    id_tipo_documento	integer not null,
    num_documento   	double not null,
	nom_funcionario 	varchar(45) not null,
    apellidos       	varchar(100) not null,
    correo				varchar(125) not null,
    cargo 				varchar(45) not null,
    ip_sena				varchar(6) not null,
    contraseña      	varchar(300),
    id_estado 	    	integer not null default 2,
    id_area_centro 		integer not null,
    
    constraint pk_funcionario 			primary key (id_funcionario),
    constraint un_funcionario_01 		unique 	  	(num_documento),
    constraint un_funcionario_02 		unique 	  	(correo),
    constraint un_funcionario_03		unique		(ip_sena),
    constraint fk_tipo_documento 		foreign key (id_tipo_documento) 	references tipo_documento(id_tipo_documento),
    constraint fk_estado_02	  			foreign key (id_estado) 	   		references estado(id_estado), 	
    constraint fk_area_centro 			foreign key (id_area_centro) 		references area_centro(id_area_centro)
    
);	

create table tipo_notificacion(
	
    id_tipo_notificacion integer not null auto_increment,
    nom_tipo_notif		 varchar(70) not null,
    des_tipo_notif	     varchar(150) not null,
    
    constraint pk_tipo_notificacion 	primary key (id_tipo_notificacion),
    constraint un_tipo_notificacion_01 	unique 		(nom_tipo_notif),
    constraint un_tipo_notificacion_02 	unique		(des_tipo_notif)
);

create table notificacion(
	
    id_notificacion 		integer not null auto_increment,
    fecha_envio				timestamp default current_timestamp,
    conte_notificacion 		varchar(600) not null,
    ides_proceso			integer not null,
    id_tipo_notificacion	integer not null,
    id_funcionario 			integer not null,
    estado 					boolean not null default 0,
    
    constraint pk_notificacion 		primary key (id_notificacion),
    constraint fk_tipo_notificacion foreign key (id_tipo_notificacion) references tipo_notificacion(id_tipo_notificacion),
    constraint fk_funcionario_06	foreign key (id_funcionario)	   references funcionario(id_funcionario)
);


create table detalles_notificacion(
	
    id_detalles_notificacion integer not null auto_increment,
    id_notificacion integer not null,
    id_funcionario  integer not null,
    
    constraint pk_detalles_notificacion primary key (id_detalles_notificacion),
    constraint un_detalles_notificacion unique 		(id_notificacion,id_funcionario),
    constraint fk_notificacion		    foreign key (id_notificacion) references notificacion(id_notificacion),
    constraint fk_funcionario_07		foreign key (id_funcionario)  references funcionario(id_funcionario)
    
);

create table rol(

	id_rol  integer not null auto_increment,
    nom_rol varchar(45) not null,
    des_rol varchar(100) not null,
    
    constraint pk_rol 		primary key (id_rol),
    constraint un_rol_01 	unique      (nom_rol),
    constraint un_rol_02	unique		(des_rol)
);


create table rol_funcionario(

	id_rol_funcionario integer not null auto_increment,
    id_rol             integer not null,
    id_funcionario     integer not null,
    vigencia		   integer(1) not null,
    
    constraint pk_rol_funcionario primary key (id_rol_funcionario),
    constraint un_rol_funcionario unique	  (id_rol,id_funcionario),
    constraint fk_rol_01		  foreign key (id_rol)         references rol(id_rol),
	constraint fk_funcionario_01  foreign key (id_funcionario) references funcionario (id_funcionario)
    
);


create table autor (

	id_autor       integer not null auto_increment,
    id_version     integer not null,
    id_funcionario integer not null,
    principal      boolean not null,
    
    constraint pk_autor          primary key (id_autor),
    constraint un_autor		     unique 	 (id_version,id_funcionario),
    constraint fk_version_01     foreign key (id_version)     references version (id_version),
    constraint fk_funcionario_02 foreign key (id_funcionario) references funcionario(id_funcionario)
    
);

create table comentario(

	id_comentario   integer not null auto_increment,
	comentario      varchar(500) not null,
	id_funcionario  integer not null,
    id_version      integer not null,
    
    constraint pk_comentario     primary key (id_comentario),
    constraint un_comentario     unique		 (comentario),
    constraint fk_funcionario_03 foreign key (id_funcionario) references funcionario(id_funcionario),
    constraint fk_version_02     foreign key (id_version)     references version (id_version)
    
);

create table lista_chequeo (

	id_lista_chequeo  integer not null auto_increment,
    nom_lista_chequeo varchar(100) not null,
    des_lista_chequeo varchar(200) not null,
	fecha_creacion    timestamp default current_timestamp, 
    id_funcionario    integer not null,
    
    constraint pk_lista_chequeo  primary key (id_lista_chequeo),
    constraint un_lista_chequeo_01  unique	     (nom_lista_chequeo),
    constraint un_lista_chequeo_02	unique		 (des_lista_chequeo),
    constraint fk_funcionario_04 foreign key (id_funcionario) references funcionario(id_funcionario)
    
);

create table item_lista(

	id_item_lista 	integer not null auto_increment,
    des_item_lista 	varchar(300) not null,
    tipo_item		boolean not null, 
    
    constraint pk_item_lista primary key (id_item_lista),
    constraint un_item_lista unique      (des_item_lista)
);

create table detalles_lista (

	id_detalles_lista integer not null auto_increment,
    id_lista_chequeo  integer not null,
    id_item_lista     integer not null,
    
    constraint pk_detalles_lista 	primary key (id_detalles_lista),
    constraint un_detalles_lista	unique		(id_lista_chequeo,id_item_lista),
    constraint fk_lista_chequeo_01 	foreign key (id_lista_chequeo) references lista_chequeo(id_lista_chequeo),
    constraint fk_item_lista    	foreign key (id_item_lista)	   references item_lista(id_item_lista)	
    
);
create table evaluacion_general(

	id_evaluacion_general integer not null auto_increment,
    fecha_evaluacion      timestamp default current_timestamp,
    observacion			  varchar(250) not null,
    resultado 			  boolean not null,
    id_version            integer not null,
    id_lista_chequeo      integer not null,
    id_funcionario		  integer not null,

	constraint pk_evaluacion_general primary key (id_evaluacion_general),
	constraint fk_version_03         foreign key (id_version) 		references version (id_version),
    constraint fk_lista_chequeo_02   foreign key (id_lista_chequeo) references lista_chequeo(id_lista_chequeo),
    constraint fk_funcionario_05     foreign key (id_funcionario) 	references funcionario(id_funcionario)
);



create table detalles_evaluacion(

	id_detalles_evaluacion integer not null auto_increment,
    valorizacion           boolean not null,
    observacion 		   varchar(200) not null,	
    id_detalles_lista	   integer not null,
    id_evaluacion_general  integer not null,
    
    constraint pk_detalles_evaluacion primary key (id_detalles_evaluacion),
    constraint fk_detalles_lista      foreign key (id_detalles_lista) 		references detalles_lista (id_detalles_lista),
    constraint fk_evaluacion_general  foreign key (id_evaluacion_general) 	references evaluacion_general(id_evaluacion_general)
);

create table categoria(
	
    id_categoria integer not null auto_increment,
    nom_categoria	varchar(45) not null,
    des_categoria	varchar(100) not null,
    fecha_creacion	timestamp default current_timestamp,
    id_funcionario	integer not null,
    
    constraint pk_categoria primary key (id_categoria),
    constraint un_categoria_01	unique(nom_categoria),
    constraint un_categoria_02	unique(des_categoria),
    constraint fk_funcionario_08	foreign key (id_funcionario) references funcionario (id_funcionario) 
);

create table detalles_categoria(
	
    id_detalles_categoria integer not null auto_increment,
    id_categoria	 	  integer not null,
    id_tema				  integer not null,
    
    constraint pk_detalles_categoria primary key (id_detalles_categoria),
    constraint un_detalles_categoria unique		 (id_categoria,id_tema),
    constraint fk_categoria		     foreign key (id_categoria) references categoria (id_categoria),
    constraint fk_tema_03		     foreign key (id_tema)		references tema		 (id_tema)
);


 create table voto (
  
  id_voto         integer not null auto_increment,
  num_voto        integer(1) not null,
  id_funcionario  integer not null,
  id_rankin       integer not null,
  
  constraint pk_voto              primary key (id_voto),
  constraint un_voto              unique (num_voto,id_funcionario,id_rankin),
  constraint fk_funcionario_voto  foreign key (id_funcionario) references funcionario (id_funcionario),
  constraint fk_rankin            foreign key (id_rankin) references rankin (id_rankin)
 );


create table admin(
	usuario integer not null,
    clave   varchar(200) not null,
    constraint un_admin unique(usuario,clave)
);

create table toquen(
	numero_toquen varchar(20) not null,
	funcionario   integer not null,
    fechavigencia timestamp not null,
    
    constraint pk_toquen primary key (numero_toquen),
    constraint un_toquen unique (funcionario)
);

-- call sara_crud("insert ","admin","usuario~1019|clave~sena","");
-- call sara_crud("select","admin","","");

-- tipo estado----------------------------------------------------------

create table tipo_estado_log(
    id_tipo_estado_log 	integer not null auto_increment,
    fecha_log            timestamp default current_timestamp,
    tipo_log             char(1) not null,
    id_tipo_estado      integer not null,
    nom_tipo_estado     varchar(50) not null,
    
    constraint pk_tipo_estado_log primary key (id_tipo_estado_log)
);

drop trigger if exists tipoestado_insert ;
delimiter ;;
create trigger tipoestado_insert after insert on tipo_estado for each row
begin
  insert into tipo_estado_log (tipo_log,id_tipo_estado,nom_tipo_estado) 
  values ('i',new.id_tipo_estado,new.nom_tipo_estado);
end;;
delimiter ;

drop trigger if exists tipoestado_update;
delimiter ;;
create trigger tipoestado_update after update  on tipo_estado for each row
begin
  insert into tipo_estado_log (tipo_log,id_tipo_estado,nom_tipo_estado) 
  values ('u',new.id_tipo_estado,new.nom_tipo_estado);
end;;
delimiter ;

-- estado -------------------------------------------------------------

create table estado_log(
	
    id_estado_log     integer not null auto_increment,
    fecha_log          timestamp default current_timestamp,
    tipo_log           char(1) not null,
    id_estado         integer not null,
    nom_estado 	      varchar(50) not null,
    id_tipo_estado 	  integer not null,
    
    constraint pk_estado_log      primary key 	(id_estado_log)
);

drop trigger if exists estado_insert ;
delimiter ;;
create trigger estado_insert after insert on estado for each row
begin
  insert into estado_log (tipo_log,id_estado,nom_estado,id_tipo_estado) 
  values ('i',new.id_estado,new.nom_estado,new.id_tipo_estado);
end;;
delimiter ;

drop trigger if exists estado_update;
delimiter ;;
create trigger estado_update after update  on estado for each row
begin
  insert into estado_log (tipo_log,id_estado,nom_estado,id_tipo_estado) 
  values ('u',new.id_estado,new.nom_estado,new.id_tipo_estado);
end;;
delimiter ;


-- tipo_formato--------------------------------------------------------
create table tipo_formato_log(
	  id_tipo_formato_log   integer not null auto_increment,
    fecha_log              timestamp default current_timestamp,
    tipo_log               char(1) not null,
    id_tipo_formato       integer not null,
    nom_tipo_formato      varchar(60) not null,
	
    constraint pk_tipoformato_log primary key (id_tipo_formato_log)
);

drop trigger if exists tipo_formato_insert ;
delimiter ;;
create trigger tipo_formato_insert after insert on tipo_formato for each row
begin
  insert into tipo_formato_log (tipo_log,id_tipo_formato,nom_tipo_formato) 
  values ('i',new.id_tipo_formato,new.nom_tipo_formato);
end;;
delimiter ;

drop trigger if exists tipo_formato_update;
delimiter ;;
create trigger tipo_formato_update after update  on tipo_formato for each row
begin
  insert into tipo_formato_log (tipo_log,id_tipo_formato,nom_tipo_formato) 
  values ('u',new.id_tipo_formato,new.nom_tipo_formato);
end;;
delimiter ;

-- formato ---------------------------------------------------------------

create table formato_log(
	
    id_formato_log    integer not null auto_increment,
    fecha_log          timestamp default current_timestamp,
    tipo_log           char(1) not null,
    id_formato        integer not null,
    nom_formato       varchar(50) not null,
    des_formato       varchar(100) not null,
    id_tipo_formato   integer not null,
    
    constraint pk_formato_log		primary key (id_formato_log)
);

drop trigger if exists formato_insert ;
delimiter ;;
create trigger formato_insert after insert on formato for each row
begin
  insert into formato_log (tipo_log,id_formato,nom_formato,des_formato,id_tipo_formato) 
  values ('i',new.id_formato,new.nom_formato,new.des_formato,new.id_tipo_formato);
end;;
delimiter ;

drop trigger if exists formato_update;
delimiter ;;
create trigger formato_update after update  on formato for each row
begin
  insert into formato_log (tipo_log,id_formato,nom_formato,des_formato,id_tipo_formato) 
  values ('u',new.id_formato,new.nom_formato,new.des_formato,new.id_tipo_formato);
end;;
delimiter ;

-- producto virtual -----------------------------------------------------------------
create table producto_virtual_log(
	
    id_p_virtual_log  integer not null auto_increment,
    fecha_log         timestamp default current_timestamp,
    tipo_log          char(1) not null,
    id_p_virtual      integer not null,
    nom_p_virtual     varchar(100) not null,
    des_p_virtual	    varchar(200) not null,
    palabras_clave	  varchar(100) not null,
    id_formato 	      integer not null,
    
    constraint pk_p_virtual_log 	primary key (id_p_virtual_log)

);

drop trigger if exists producto_virtual_insert ;
delimiter ;;
create trigger producto_virtual_insert after insert on producto_virtual for each row
begin
  insert into producto_virtual_log (tipo_log,id_p_virtual,nom_p_virtual,des_p_virtual,palabras_clave,id_formato) 
  values ('i',new.id_p_virtual,new.nom_p_virtual,new.des_p_virtual,new.palabras_clave,new.id_formato);
end;;
delimiter ;

drop trigger if exists producto_virtual_update;
delimiter ;;
create trigger producto_virtual_update after update  on producto_virtual for each row
begin
  insert into producto_virtual_log (tipo_log,id_p_virtual,nom_p_virtual,des_p_virtual,palabras_clave,id_formato) 
  values ('u',new.id_p_virtual,new.nom_p_virtual,new.des_p_virtual,new.palabras_clave,new.id_formato);
end;;
delimiter ;


-- version -----------------------------------------------------------------

create table version_log (
    id_version_log      integer not null auto_increment,
    fecha_log           timestamp default current_timestamp,
    tipo_log            char(1) not null,
	  id_version          integer not null,
    fecha_envio         timestamp not null,
    fecha_publicacion   timestamp not null,
    num_version 		    float not null,
	  fecha_vigencia 		  timestamp not null,
    url_version			    varchar (500),
    url_img				      varchar (500),				
    inst_instalacion	  varchar (800),
    reqst_instalacion   varchar (500),
    id_p_virtual		    integer not null,
	  id_estado			      integer not null,
	
	constraint pk_version_log      primary key (id_version_log)
);	

drop trigger if exists version_insert ;
delimiter ;;
create trigger version_insert after insert on version for each row
begin
  insert into version_log (tipo_log,id_version,fecha_envio,fecha_publicacion,num_version,fecha_vigencia,url_version,url_img,inst_instalacion,reqst_instalacion,id_p_virtual,id_estado) 
  values ('i',new.id_version,new.fecha_envio,new.fecha_publicacion,new.num_version,new.fecha_vigencia,new.url_version,new.url_img,new.inst_instalacion,new.reqst_instalacion,new.id_p_virtual,new.id_estado);

end;;
delimiter ;

drop trigger if exists version_update;
delimiter ;;
create trigger version_update after update  on version for each row
begin
  insert into version_log (tipo_log,id_version,fecha_envio,fecha_publicacion,num_version,fecha_vigencia,url_version,url_img,inst_instalacion,reqst_instalacion,id_p_virtual,id_estado) 
  values ('u',new.id_version,new.fecha_envio,new.fecha_publicacion,new.num_version,new.fecha_vigencia,new.url_version,new.url_img,new.inst_instalacion,new.reqst_instalacion,new.id_p_virtual,new.id_estado);
end;;
delimiter ;

-- rankin -----------------------------------------------------------------

create table rankin_log(

	  id_rankin_log   integer not null auto_increment,
    fecha_log       timestamp default current_timestamp,
    tipo_log        char(1) not null,
    id_rankin       integer not null,
    puesto			    integer not null,
    cant_visitas    integer not null,
    cant_descargas	integer not null,
    cant_votos      integer not null,
    id_version		  integer not null,
    
    constraint pk_rankin_log 	  primary key (id_rankin_log)
);

drop trigger if exists rankin_insert ;
delimiter ;;
create trigger rankin_insert after insert on rankin for each row
begin
  insert into rankin_log (tipo_log,id_rankin,puesto,cant_visitas,cant_descargas,cant_votos,id_version) 
  values ('i',new.id_rankin,new.puesto,new.cant_visitas,new.cant_descargas,new.cant_votos,new.id_version);

end;;
delimiter ;

drop trigger if exists rankin_update;
delimiter ;;
create trigger rankin_update after update  on rankin for each row
begin
  insert into rankin_log (tipo_log,id_rankin,puesto,cant_visitas,cant_descargas,cant_votos,id_version) 
  values ('u',new.id_rankin,new.puesto,new.cant_visitas,new.cant_descargas,new.cant_votos,new.id_version);
end;;
delimiter ;

-- voto -----------------------------------------------------------------

 create table voto_log (
  
  id_voto_log     integer not null auto_increment,
  fecha_log       timestamp default current_timestamp,
  tipo_log        char(1) not null,
  id_voto         integer not null,
  num_voto        integer(1) not null,
  id_funcionario  integer not null,
  id_rankin       integer not null,
  
  constraint pk_voto_log     primary key (id_voto_log)
 );
 
 drop trigger if exists voto_insert ;
delimiter ;;
create trigger voto_insert after insert on voto for each row
begin
  insert into voto_log (tipo_log,id_voto,num_voto,id_funcionario,id_rankin) 
  values ('i',new.id_voto,new.num_voto,new.id_funcionario,new.id_rankin);

end;;
delimiter ;

drop trigger if exists voto_update;
delimiter ;;
create trigger voto_update after update  on voto for each row
begin
  insert into voto_log (tipo_log,id_voto,num_voto,id_funcionario,id_rankin) 
  values ('u',new.id_voto,new.num_voto,new.id_funcionario,new.id_rankin);
end;;
delimiter ;


-- tema -----------------------------------------------------------------

create table tema_log(

	id_tema_log   integer not null auto_increment,
  fecha_log     timestamp default current_timestamp,
  tipo_log      char(1) not null,
  id_tema       integer not null,
  nom_tema      varchar(45) not null,
  des_tema      varchar(100) not null,
    
  constraint pk_tema_log 		primary key (id_tema_log)
    
);

drop trigger if exists tema_insert ;
delimiter ;;
create trigger tema_insert after insert on tema for each row
begin
  insert into tema_log (tipo_log,id_tema,nom_tema,des_tema) 
  values ('i',new.id_tema,new.nom_tema,new.des_tema);

end;;
delimiter ;

drop trigger if exists tema_update;
delimiter ;;
create trigger tema_update after update  on tema for each row
begin
  insert into tema_log (tipo_log,id_tema,nom_tema,des_tema) 
  values ('u',new.id_tema,new.nom_tema,new.des_tema);
end;;
delimiter ;



-- detalles_tema -----------------------------------------------------------------

create table detalles_tema_log(

	  id_detalles_tema_log  integer not null auto_increment,
    fecha_log             timestamp default current_timestamp,
    tipo_log              char(1) not null,
    id_detalles_tema      integer not null,
    id_tema               integer not null,
    id_p_virtual          integer not null,
    tipo_tema		          boolean not null ,  -- determina si tiene una relacion con categoria(0) o con programa(1) 
    
    constraint pk_detalles_tema_log    primary key (id_detalles_tema_log)
    
);

drop trigger if exists detalles_tema_insert ;
delimiter ;;
create trigger detalles_tema_insert after insert on detalles_tema for each row
begin
  insert into detalles_tema_log (tipo_log,id_detalles_tema,id_tema,id_p_virtual,tipo_tema) 
  values ('i',new.id_detalles_tema,new.id_tema,new.id_p_virtual,new.tipo_tema);

end;;
delimiter ;

drop trigger if exists detalles_tema_update;
delimiter ;;
create trigger detalles_tema_update after update  on detalles_tema for each row
begin
  insert into detalles_tema_log (tipo_log,id_detalles_tema,id_tema,id_p_virtual,tipo_tema) 
  values ('u',new.id_detalles_tema,new.id_tema,new.id_p_virtual,new.tipo_tema);
end;;
delimiter ;


-- programa -----------------------------------------------------------------

create table programa_log(
	
    id_programa_log     integer not null auto_increment,
    fecha_log           timestamp default current_timestamp,
    tipo_log            char(1) not null,
    id_programa         integer not null,
	  nom_programa        varchar(100) not null,
    nivel_formacion     varchar(45) not null,
    
    constraint pk_programa_log primary key 	(id_programa_log)
);


drop trigger if exists programa_insert ;
delimiter ;;
create trigger programa_insert after insert on programa for each row
begin
  insert into programa_log (tipo_log,id_programa,nom_programa,nivel_formacion) 
  values ('i',new.id_programa,new.nom_programa,new.nivel_formacion);

end;;
delimiter ;

drop trigger if exists programa_update;
delimiter ;;
create trigger programa_update after update  on programa for each row
begin
  insert into programa_log (tipo_log,id_programa,nom_programa,nivel_formacion) 
  values ('u',new.id_programa,new.nom_programa,new.nivel_formacion);
end;;
delimiter ;


-- detalles_programa -----------------------------------------------------------------

create table detalles_programa_log(

	  id_detalles_programa_log    integer not null auto_increment,
    fecha_log                   timestamp default current_timestamp,
    tipo_log                    char(1) not null,
    id_detalles_programa        integer not null,
    id_tema                     integer not null,
    id_programa                 integer not null,
    
    constraint pk_detalles_programa_log primary key (id_detalles_programa_log)
);

drop trigger if exists detalles_programa_insert ;
delimiter ;;
create trigger detalles_programa_insert after insert on detalles_programa for each row
begin
  insert into detalles_programa_log (tipo_log,id_detalles_programa,id_tema,id_programa) 
  values ('i',new.id_detalles_programa,new.id_tema,new.id_programa);

end;;
delimiter ;

drop trigger if exists detalles_programa_update;
delimiter ;;
create trigger detalles_programa_update after update  on detalles_programa for each row
begin
  insert into detalles_programa_log (tipo_log,id_detalles_programa,id_tema,id_programa) 
  values ('u',new.id_detalles_programa,new.id_tema,new.id_programa);
end;;
delimiter ;



-- area -----------------------------------------------------------------

create table area_log (

	  id_area_log   integer not null auto_increment,
    fecha_log     timestamp default current_timestamp,
    tipo_log      char(1) not null,
    id_area       integer not null,
    nom_area      varchar(100) not null,
    lider_area    varchar(70) not null,
    
    constraint pk_area_log primary key (id_area_log)
);

drop trigger if exists area_insert ;
delimiter ;;
create trigger area_insert after insert on area for each row
begin
  insert into area_log (tipo_log,id_area,nom_area,lider_area) 
  values ('i',new.id_area,new.nom_area,new.lider_area);

end;;
delimiter ;

drop trigger if exists area_update;
delimiter ;;
create trigger area_update after update  on area for each row
begin
  insert into area_log (tipo_log,id_area,nom_area,lider_area) 
  values ('u',new.id_area,new.nom_area,new.lider_area); 
end;;
delimiter ;



-- detalles_area -----------------------------------------------------------------

create table detalles_area_log(

	  id_detalles_area_log  integer not null auto_increment,
    fecha_log             timestamp default current_timestamp,
    tipo_log              char(1) not null,
    id_detalles_area      integer not null,
    id_area               integer not null,
    id_programa           integer not null,
    
    constraint pk_detalles_area_log primary key (id_detalles_area_log)
);

drop trigger if exists detalles_area_insert ;
delimiter ;;
create trigger detalles_area_insert after insert on detalles_area for each row
begin
  insert into detalles_area_log (tipo_log,id_detalles_area,id_area,id_programa) 
  values ('i',new.id_detalles_area,new.id_area,new.id_programa);

end;;
delimiter ;

drop trigger if exists detalles_area_update;
delimiter ;;
create trigger detalles_area_update after update  on detalles_area for each row
begin
  insert into detalles_area_log (tipo_log,id_detalles_area,id_area,id_programa) 
  values ('u',new.id_detalles_area,new.id_area,new.id_programa);
end;;
delimiter ;




-- ciudad -----------------------------------------------------------------
create table ciudad_log(
	
    id_ciudad_log   integer not null auto_increment,
    fecha_log       timestamp default current_timestamp,
    tipo_log        char(1) not null,
    id_ciudad       integer not null,
    nom_ciudad      varchar(75) not null,
    
    constraint pk_ciudad_log    primary key (id_ciudad_log)
);

drop trigger if exists ciudad_insert ;
delimiter ;;
create trigger ciudad_insert after insert on ciudad for each row
begin
  insert into ciudad_log (tipo_log,id_ciudad,nom_ciudad) 
  values ('i',new.id_ciudad,new.nom_ciudad);

end;;
delimiter ;

drop trigger if exists ciudad_update;
delimiter ;;
create trigger ciudad_update after update  on ciudad for each row
begin
  insert into ciudad_log (tipo_log,id_ciudad,nom_ciudad) 
  values ('u',new.id_ciudad,new.nom_ciudad);
end;;
delimiter ;



-- centro -----------------------------------------------------------------

create table centro_log(
	
	  id_centro_log   integer not null auto_increment,
    fecha_log       timestamp default current_timestamp,
    tipo_log        char(1) not null,
    id_centro       integer not null,
    num_centro      varchar(50) not null,
    nom_centro      varchar(100) not null,
    direccion       varchar(100) not null,
    id_ciudad 	    integer not null,
    
    constraint pk_centro_log 	primary key 	(id_centro_log)
);

drop trigger if exists centro_insert ;
delimiter ;;
create trigger centro_insert after insert on centro for each row
begin
  insert into centro_log (tipo_log,id_centro,num_centro,nom_centro,direccion,id_ciudad) 
  values ('i',new.id_centro,new.num_centro,new.nom_centro,new.direccion,new.id_ciudad);

end;;
delimiter ;

drop trigger if exists centro_update;
delimiter ;;
create trigger centro_update after update  on centro for each row
begin
  insert into centro_log (tipo_log,id_centro,num_centro,nom_centro,direccion,id_ciudad) 
  values ('u',new.id_centro,new.num_centro,new.nom_centro,new.direccion,new.id_ciudad);
end;;
delimiter ;


-- area_centro -----------------------------------------------------------------

create table area_centro_log(

	  id_area_centro_log  integer not null auto_increment,
    fecha_log           timestamp default current_timestamp,
    tipo_log            char(1) not null,
    id_area_centro      integer not null,
    id_area             integer not null,
    id_centro	          integer not null,
	
	constraint pk_area_centro_log primary key (id_area_centro_log)	
);

drop trigger if exists area_centro_insert ;
delimiter ;;
create trigger area_centro_insert after insert on area_centro for each row
begin
  insert into area_centro_log (tipo_log,id_area_centro,id_area,id_centro) 
  values ('i',new.id_area_centro,new.id_area,new.id_centro);

end;;
delimiter ;

drop trigger if exists area_centro_update;
delimiter ;;
create trigger area_centro_update after update  on area_centro for each row
begin
  insert into area_centro_log (tipo_log,id_area_centro,id_area,id_centro) 
  values ('u',new.id_area_centro,new.id_area,new.id_centro);
end;;
delimiter ;



-- tipo_documento -----------------------------------------------------------------

create table tipo_documento_log(

	  id_tipo_documento_log   integer not null auto_increment,
    fecha_log               timestamp default current_timestamp,
    tipo_log                char(1) not null,
    id_tipo_documento       integer not null,
    nom_tipo_documento      varchar (100) not null,
    
    constraint pk_tipo_documento_log primary key (id_tipo_documento_log)
);

drop trigger if exists tipo_documento_insert ;
delimiter ;;
create trigger tipo_documento_insert after insert on tipo_documento for each row
begin
  insert into tipo_documento_log (tipo_log,id_tipo_documento,nom_tipo_documento) 
  values ('i',new.id_tipo_documento,new.nom_tipo_documento);

end;;
delimiter ;

drop trigger if exists tipo_documento_update;
delimiter ;;
create trigger tipo_documento_update after update  on tipo_documento for each row
begin
  insert into tipo_documento_log (tipo_log,id_tipo_documento,nom_tipo_documento) 
  values ('u',new.id_tipo_documento,new.nom_tipo_documento);
end;;
delimiter ;


-- funcionario -----------------------------------------------------------------

create table funcionario_log(

	  id_funcionario_log  	integer not null auto_increment,
    fecha_log             timestamp default current_timestamp,
    tipo_log              char(1) not null,
    id_funcionario  	    integer not null,
    id_tipo_documento	    integer not null,
    num_documento   	    double not null,
	  nom_funcionario 	    varchar(45) not null,
    apellidos       	    varchar(100) not null,
    correo				        varchar(125) not null,
    cargo 				        varchar(45) not null,
    ip_sena				        varchar(6) not null,
    contraseña      	    varchar(300),
    id_estado 	    	    integer not null,
    id_area_centro 		    integer not null,
    
    constraint pk_funcionario_log 			primary key (id_funcionario_log)
    
);


drop trigger if exists funcionario_insert ;
delimiter ;;
create trigger funcionario_insert after insert on funcionario for each row
begin
  insert into funcionario_log (tipo_log,id_funcionario,id_tipo_documento,num_documento,nom_funcionario,apellidos,correo,cargo,ip_sena,contraseña,id_estado,id_area_centro) 
  values ('i',new.id_funcionario,new.id_tipo_documento,new.num_documento,new.nom_funcionario,new.apellidos,new.correo,new.cargo,new.ip_sena,new.contraseña,new.id_estado,new.id_area_centro);

end;;
delimiter ;

drop trigger if exists funcionario_update;
delimiter ;;
create trigger funcionario_update after update  on funcionario for each row
begin
  insert into funcionario_log (tipo_log,id_funcionario,id_tipo_documento,num_documento,nom_funcionario,apellidos,correo,cargo,ip_sena,contraseña,id_estado,id_area_centro) 
  values ('u',new.id_funcionario,new.id_tipo_documento,new.num_documento,new.nom_funcionario,new.apellidos,new.correo,new.cargo,new.ip_sena,new.contraseña,new.id_estado,new.id_area_centro);

end;;
delimiter ;



-- tipo_notificacion -----------------------------------------------------------------

create table tipo_notificacion_log(
	
    id_tipo_notificacion_log  integer not null auto_increment,
    fecha_log                 timestamp default current_timestamp,
    tipo_log                  char(1) not null,
    id_tipo_notificacion      integer not null,
    nom_tipo_notif		        varchar(70) not null,
    des_tipo_notif	          varchar(150) not null,
    
    constraint pk_tipo_notificacion_log 	primary key (id_tipo_notificacion_log)
);


drop trigger if exists tipo_notificacion_insert ;
delimiter ;;
create trigger tipo_notificacion_insert after insert on tipo_notificacion for each row
begin
  insert into tipo_notificacion_log (tipo_log,id_tipo_notificacion,nom_tipo_notif,des_tipo_notif) 
  values ('i',new.id_tipo_notificacion,new.nom_tipo_notif,new.des_tipo_notif);

end;;
delimiter ;

drop trigger if exists tipo_notificacion_update;
delimiter ;;
create trigger tipo_notificacion_update after update  on tipo_notificacion for each row
begin
  insert into tipo_notificacion_log (tipo_log,id_tipo_notificacion,nom_tipo_notif,des_tipo_notif) 
  values ('u',new.id_tipo_notificacion,new.nom_tipo_notif,new.des_tipo_notif);
end;;
delimiter ;



-- notificacion -----------------------------------------------------------------

create table notificacion_log(
	
    id_notificacion_log 		integer not null auto_increment,
    fecha_log               timestamp default current_timestamp,
    tipo_log                char(1) not null,
    id_notificacion 		    integer not null,
    fecha_envio				      timestamp not null,
    conte_notificacion 		  varchar(600) not null,
    ides_proceso			      integer not null,
    id_tipo_notificacion	  integer not null,
    id_funcionario 			    integer not null,
    estado 					        boolean not null,-- 0 no se ha visualizado, 1 ya se visualizo 
    
    constraint pk_notificacion_log 		primary key (id_notificacion_log)
);

drop trigger if exists notificacion_insert ;
delimiter ;;
create trigger notificacion_insert after insert on notificacion for each row
begin
  insert into notificacion_log (tipo_log,id_notificacion,fecha_envio,conte_notificacion,ides_proceso,id_tipo_notificacion,id_funcionario,estado) 
  values ('i',new.id_notificacion,new.fecha_envio,new.conte_notificacion,new.ides_proceso,new.id_tipo_notificacion,new.id_funcionario,new.estado);

end;;
delimiter ;

drop trigger if exists notificacion_update;
delimiter ;;
create trigger notificacion_update after update  on notificacion for each row
begin
  insert into notificacion_log (tipo_log,id_notificacion,fecha_envio,conte_notificacion,ides_proceso,id_tipo_notificacion,id_funcionario,estado) 
  values ('u',new.id_notificacion,new.fecha_envio,new.conte_notificacion,new.ides_proceso,new.id_tipo_notificacion,new.id_funcionario,new.estado);
end;;
delimiter ;



-- detalles_notificacion -----------------------------------------------------------------

create table detalles_notificacion_log(
	
    id_detalles_notificacion_log  integer not null auto_increment,
    fecha_log                     timestamp default current_timestamp,
    tipo_log                      char(1) not null,
    id_detalles_notificacion      integer not null,
    id_notificacion               integer not null,
    id_funcionario                integer not null,
    
    constraint pk_detalles_notificacion_log primary key (id_detalles_notificacion_log)
);


drop trigger if exists detalles_notificacion_insert ;
delimiter ;;
create trigger detalles_notificacion_insert after insert on detalles_notificacion for each row
begin
  insert into detalles_notificacion_log (tipo_log,id_detalles_notificacion,id_notificacion,id_funcionario) 
  values ('i',new.id_detalles_notificacion,new.id_notificacion,new.id_funcionario);

end;;
delimiter ;

drop trigger if exists detalles_notificacion_update;
delimiter ;;
create trigger detalles_notificacion_update after update  on detalles_notificacion for each row
begin
  insert into detalles_notificacion_log (tipo_log,id_detalles_notificacion,id_notificacion,id_funcionario) 
  values ('u',new.id_detalles_notificacion,new.id_notificacion,new.id_funcionario);
end;;
delimiter ;


-- rol -----------------------------------------------------------------

create table rol_log(

	  id_rol_log  integer not null auto_increment,
    fecha_log   timestamp default current_timestamp,
    tipo_log    char(1) not null,
    id_rol      integer not null,
    nom_rol     varchar(45) not null,
    des_rol     varchar(100) not null,
    
    constraint pk_rol_log 		primary key (id_rol_log)
);

drop trigger if exists rol_insert ;
delimiter ;;
create trigger rol_insert after insert on rol for each row
begin
  insert into rol_log (tipo_log,id_rol,nom_rol,des_rol) 
  values ('i',new.id_rol,new.nom_rol,new.des_rol);

end;;
delimiter ;

drop trigger if exists rol_update;
delimiter ;;
create trigger rol_update after update  on rol for each row
begin
  insert into rol_log (tipo_log,id_rol,nom_rol,des_rol) 
  values ('u',new.id_rol,new.nom_rol,new.des_rol);
end;;
delimiter ;




-- rorol_funcionario -----------------------------------------------------------------

create table rol_funcionario_log(

	id_rol_funcionario_log  integer not null auto_increment,
    fecha_log               timestamp default current_timestamp,
    tipo_log                char(1) not null,
    id_rol_funcionario      integer not null,
    id_rol                  integer not null,
    id_funcionario          integer not null,
	vigencia				integer(1) not null,
    
    constraint pk_rol_funcionario_log primary key (id_rol_funcionario_log)
    
);

drop trigger if exists rol_funcionario_insert ;
delimiter ;;
create trigger rol_funcionario_insert after insert on rol_funcionario for each row
begin
  insert into rol_funcionario_log (tipo_log,id_rol_funcionario,id_rol,id_funcionario,vigencia) 
  values ('i',new.id_rol_funcionario,new.id_rol,new.id_funcionario,new.vigencia);

end;;
delimiter ;

drop trigger if exists rol_funcionario_update;
delimiter ;;
create trigger rol_funcionario_update after update  on rol_funcionario for each row
begin
  insert into rol_funcionario_log (tipo_log,id_rol_funcionario,id_rol,id_funcionario,vigencia)
  values ('u',new.id_rol_funcionario,new.id_rol,new.id_funcionario,new.vigencia);
end;;
delimiter ;



-- autor -----------------------------------------------------------------

create table autor_log(

	  id_autor_log   integer not null auto_increment,
    fecha_log      timestamp default current_timestamp,
    tipo_log       char(1) not null,
    id_autor       integer not null,
    id_version     integer not null,
    id_funcionario integer not null,
    principal      boolean not null,
    
    constraint pk_autor_log      primary key (id_autor_log)
);

drop trigger if exists autor_insert ;
delimiter ;;
create trigger autor_insert after insert on autor for each row
begin
  insert into autor_log (tipo_log,id_autor,id_version,id_funcionario,principal) 
  values ('i',new.id_autor,new.id_version,new.id_funcionario,new.principal);

end;;
delimiter ;

drop trigger if exists autor_update;
delimiter ;;
create trigger autor_update after update  on autor for each row
begin
  insert into autor_log (tipo_log,id_autor,id_version,id_funcionario,principal) 
  values ('u',new.id_autor,new.id_version,new.id_funcionario,new.principal);
end;;
delimiter ;


-- comentario -----------------------------------------------------------------


create table comentario_log(

	id_comentario_log   integer not null auto_increment,
  fecha_log           timestamp default current_timestamp,
  tipo_log            char(1) not null,
  id_comentario       integer not null,
	comentario          varchar(500) not null,
	id_funcionario      integer not null,
  id_version          integer not null,
    
  constraint pk_comentario_log     primary key (id_comentario_log)
    
);

drop trigger if exists comentario_insert ;
delimiter ;;
create trigger comentario_insert after insert on comentario for each row
begin
  insert into comentario_log (tipo_log,id_comentario,comentario,id_funcionario,id_version) 
  values ('i',new.id_comentario,new.comentario,new.id_funcionario,new.id_version);

end;;
delimiter ;

drop trigger if exists comentario_update;
delimiter ;;
create trigger comentario_update after update  on comentario for each row
begin
  insert into comentario_log (tipo_log,id_comentario,comentario,id_funcionario,id_version) 
  values ('u',new.id_comentario,new.comentario,new.id_funcionario,new.id_version);
end;;
delimiter ;


-- lista_chequeo -----------------------------------------------------------------

create table lista_chequeo_log (

	  id_lista_chequeo_log  integer not null auto_increment,
    fecha_log             timestamp default current_timestamp,
    tipo_log              char(1) not null,
    id_lista_chequeo      integer not null,
    nom_lista_chequeo     varchar(100) not null,
    des_lista_chequeo     varchar(200) not null,
	  fecha_creacion        timestamp not null,    
    id_funcionario        integer not null,
    
    constraint pk_lista_chequeo_log  primary key (id_lista_chequeo_log)
);


drop trigger if exists lista_chequeo_insert ;
delimiter ;;
create trigger lista_chequeo_insert after insert on lista_chequeo for each row
begin
  insert into lista_chequeo_log (tipo_log,id_lista_chequeo,nom_lista_chequeo,des_lista_chequeo,fecha_creacion,id_funcionario) 
  values ('i',new.id_lista_chequeo,new.nom_lista_chequeo,new.des_lista_chequeo,new.fecha_creacion,new.id_funcionario);

end;;
delimiter ;

drop trigger if exists lista_chequeo_update;
delimiter ;;
create trigger lista_chequeo_update after update  on lista_chequeo for each row
begin
  insert into lista_chequeo_log (tipo_log,id_lista_chequeo,nom_lista_chequeo,des_lista_chequeo,fecha_creacion,id_funcionario) 
  values ('u',new.id_lista_chequeo,new.nom_lista_chequeo,new.des_lista_chequeo,new.fecha_creacion,new.id_funcionario);
end;;
delimiter ;



-- item_lista -----------------------------------------------------------------

create table item_lista_log(

	  id_item_lista_log 	integer not null auto_increment,
    fecha_log           timestamp default current_timestamp,
    tipo_log            char(1) not null,
    id_item_lista 	    integer not null,
    des_item_lista 	    varchar(300) not null,
    tipo_item		        boolean not null, 
    
    constraint pk_item_lista_log primary key (id_item_lista_log)
);


drop trigger if exists item_lista_insert ;
delimiter ;;
create trigger item_lista_insert after insert on item_lista for each row
begin
  insert into item_lista_log (tipo_log,id_item_lista,des_item_lista,tipo_item) 
  values ('i',new.id_item_lista,new.des_item_lista,new.tipo_item);

end;;
delimiter ;

drop trigger if exists item_lista_update;
delimiter ;;
create trigger item_lista_update after update  on item_lista for each row
begin
  insert into item_lista_log (tipo_log,id_item_lista,des_item_lista,tipo_item) 
  values ('u',new.id_item_lista,new.des_item_lista,new.tipo_item);
end;;
delimiter ;


-- detalles_lista -----------------------------------------------------------------

create table detalles_lista_log (

	  id_detalles_lista_log   integer not null auto_increment,
    fecha_log               timestamp default current_timestamp,
    tipo_log                char(1) not null,
    id_detalles_lista       integer not null,
    id_lista_chequeo        integer not null,
    id_item_lista           integer not null,
    
    constraint pk_detalles_lista_log 	primary key (id_detalles_lista_log)
);

drop trigger if exists detalles_lista_insert;
delimiter ;;
create trigger detalles_lista_insert after insert on detalles_lista for each row
begin
  insert into detalles_lista_log (tipo_log,id_detalles_lista,id_lista_chequeo,id_item_lista) 
  values ('i',new.id_detalles_lista,new.id_lista_chequeo,new.id_item_lista);
end;;
delimiter ;

drop trigger if exists detalles_lista_update;
delimiter ;;
create trigger detalles_lista_update after update  on detalles_lista for each row
begin
  insert into detalles_lista_log (tipo_log,id_detalles_lista,id_lista_chequeo,id_item_lista) 
  values ('u',new.id_detalles_lista,new.id_lista_chequeo,new.id_item_lista);
end;;
delimiter ;


-- evaluacion_general -----------------------------------------------------------------

create table evaluacion_general_log(

	  id_evaluacion_general_log integer not null auto_increment,
    fecha_log                 timestamp default current_timestamp,
    tipo_log                  char(1) not null,
    id_evaluacion_general     integer not null,
    fecha_evaluacion          timestamp not null,
    observacion			          varchar(250) not null,
    resultado 			          boolean not null,
    id_version                integer not null,
    id_lista_chequeo          integer not null,
    id_funcionario		        integer not null, 

	  constraint pk_evaluacion_general_log primary key (id_evaluacion_general_log)
);

drop trigger if exists evaluacion_general_insert ;
delimiter ;;
create trigger evaluacion_general_insert after insert on evaluacion_general for each row
begin
  insert into evaluacion_general_log (tipo_log,id_evaluacion_general,fecha_evaluacion,observacion,resultado,id_version,id_lista_chequeo,id_funcionario) 
  values ('i',new.id_evaluacion_general,new.fecha_evaluacion,new.observacion,new.resultado,new.id_version,new.id_lista_chequeo,new.id_funcionario);
end;;
delimiter ;

drop trigger if exists evaluacion_general_update;
delimiter ;;
create trigger evaluacion_general_update after update  on evaluacion_general for each row
begin
  insert into evaluacion_general_log (tipo_log,id_evaluacion_general,fecha_evaluacion,observacion,resultado,id_version,id_lista_chequeo,id_funcionario) 
  values ('u',new.id_evaluacion_general,new.fecha_evaluacion,new.observacion,new.resultado,new.id_version,new.id_lista_chequeo,new.id_funcionario);
end;;
delimiter ;


-- detalles_evaluacion -----------------------------------------------------------------

create table detalles_evaluacion_log(
    
    id_detalles_evaluacion_log    integer not null auto_increment,
    fecha_log                     timestamp default current_timestamp,
    tipo_log                      char(1) not null,
	  id_detalles_evaluacion        integer not null,
    valorizacion                  boolean not null,
    observacion 		              varchar(200) not null,	
    id_detalles_lista	            integer not null,
    id_evaluacion_general         integer not null,
    
    constraint pk_detalles_evaluacion_log primary key (id_detalles_evaluacion_log)
);

drop trigger if exists detalles_evaluacion_insert;
delimiter ;;
create trigger detalles_evaluacion_insert after insert on detalles_evaluacion for each row
begin
  insert into detalles_evaluacion_log (tipo_log,id_detalles_evaluacion,valorizacion,observacion,id_detalles_lista,id_evaluacion_general) 
  values ('i',new.id_detalles_evaluacion,new.valorizacion,new.observacion,new.id_detalles_lista,new.id_evaluacion_general);
end;;
delimiter ;

drop trigger if exists detalles_evaluacion_update;
delimiter ;;
create trigger detalles_evaluacion_update after update  on detalles_evaluacion for each row
begin
  insert into detalles_evaluacion_log (tipo_log,id_detalles_evaluacion,valorizacion,observacion,id_detalles_lista,id_evaluacion_general) 
  values ('u',new.id_detalles_evaluacion,new.valorizacion,new.observacion,new.id_detalles_lista,new.id_evaluacion_general);
end;;
delimiter ;



-- categoria -----------------------------------------------------------------

create table categoria_log(
	
    id_categoria_log 	    integer      not null auto_increment,
    fecha_log             timestamp    default current_timestamp,
    tipo_log              char(1)      not null,
    id_categoria 	        integer      not null,
    nom_categoria	        varchar(45)  not null,
    des_categoria	        varchar(100) not null,
    fecha_creacion	      timestamp    not null,
    id_funcionario	      integer      not null,
    
    constraint pk_categoria_log primary key (id_categoria_log)
);


drop trigger if exists categoria_insert;
delimiter ;;
create trigger categoria_insert after insert on categoria for each row
begin
  insert into categoria_log (tipo_log,id_categoria,nom_categoria,des_categoria,fecha_creacion,id_funcionario) 
  values ('i',new.id_categoria,new.nom_categoria,new.des_categoria,new.fecha_creacion,new.id_funcionario);
end;;
delimiter ;

drop trigger if exists categoria_update;
delimiter ;;
create trigger categoria_update after update  on categoria for each row
begin
  insert into categoria_log (tipo_log,id_categoria,nom_categoria,des_categoria,fecha_creacion,id_funcionario) 
  values ('u',new.id_categoria,new.nom_categoria,new.des_categoria,new.fecha_creacion,new.id_funcionario);
end;;
delimiter ;



-- detalles_categoria -----------------------------------------------------------------

create table detalles_categoria_log(

    id_detalles_categoria_log 	  integer not null auto_increment,
    fecha_log                     timestamp  default current_timestamp,
    tipo_log                      char(1) not null,
    id_detalles_categoria         integer not null,
    id_categoria	 	              integer not null,
    id_tema				                integer not null,
    
    constraint pk_detalles_categoria_log primary key (id_detalles_categoria_log)
);

drop trigger if exists detalles_categoria_insert;
delimiter ;;
create trigger detalles_categoria_insert after insert on detalles_categoria for each row
begin
  insert into detalles_categoria_log (tipo_log,id_detalles_categoria,id_categoria,id_tema) 
  values ('i',new.id_detalles_categoria,new.id_categoria,new.id_tema);
end;;
delimiter ;

drop trigger if exists detalles_categoria_update;
delimiter ;;
create trigger detalles_categoria_update after update  on detalles_categoria for each row
begin
  insert into detalles_categoria_log (tipo_log,id_detalles_categoria,id_categoria,id_tema) 
  values ('u',new.id_detalles_categoria,new.id_categoria,new.id_tema);
end;;
delimiter ;


-- lista_chequeo ----- detalles_lista ------ item_lista ------ 
drop view if exists 01_v_detalles_lista;
create view 01_v_detalles_lista as(
	
    select dl.id_lista_chequeo,nom_lista_chequeo, des_lista_chequeo, fecha_creacion, id_funcionario, dl.id_item_lista, des_item_lista, tipo_item,id_detalles_lista
    from  ((lista_chequeo lc inner join detalles_lista dl on lc.id_lista_chequeo = dl.id_lista_chequeo)
		   inner join item_lista il on dl.id_item_lista = il.id_item_lista)
    
);
--  brayan porfa hasta que nose alla bargado ese commit (la ventana con el de las actualizaciones del ubunto)
-- no utilice el internet porfa ... es que es sobre el proyecto y necesito que cargue eso

-- ciudad-----centro ----- area_centro ------- area ----
drop view if exists 02_v_area_centro;
create view 02_v_area_centro as
(
	select id_area_centro, ac.id_centro, num_centro, nom_centro, direccion,ce.id_ciudad,nom_ciudad, ac.id_area,nom_area,lider_area
	from (((centro ce inner join area_centro ac on ce.id_centro = ac.id_centro) inner join 
		 area ar on ac.id_area = ar.id_area) inner join ciudad ci on ce.id_ciudad = ci.id_ciudad)
);

-- area ----- detalles_area ------- programa
drop view if exists 03_v_detalles_area;
create view 03_v_detalles_area as(

	select  id_detalles_area,da.id_area, nom_area, lider_area, da.id_programa, nom_programa, nivel_formacion
    from ((area ar inner join detalles_area da on ar.id_area = da.id_area) 
		  inner join programa pr on da.id_programa = pr.id_programa)
);

-- programa ------- detalles_programa ------- tema ---- 0
drop view if exists 04_v_detalles_programa;
create view 04_v_detalles_programa as(
	
    select id_detalles_programa, dp.id_programa, nom_programa, nivel_formacion,dp.id_tema, nom_tema, des_tema
    from  ((programa pr inner join detalles_programa dp on pr.id_programa = dp.id_programa)
          inner join tema te on dp.id_tema = te.id_tema)
);

-- categoria ------ detalles_categoria ------ tema---- 1
drop view if exists 05_v_detalles_categoria;
create view 05_v_detalles_categoria as
(
	select distinct dc.id_categoria, nom_categoria,des_categoria,fecha_creacion,id_funcionario,dc.id_detalles_categoria, dc.id_tema, te.nom_tema,te.des_tema
	from  ((categoria ca inner join detalles_categoria dc on ca.id_categoria = dc.id_categoria) inner join
		   tema te on dc.id_tema = te.id_tema) 
);


-- formato ----- producto_virtual ----- detalles_tema  ---- tema ----
drop view if exists 06_v_detalles_tema;
create view 06_v_detalles_tema as
(
	select 	dt.id_p_virtual, nom_p_virtual, des_p_virtual,palabras_clave,
			pv.id_formato, fo.nom_formato, fo.des_formato,
            dt.id_detalles_tema,dt.id_tema, te.nom_tema, te.des_tema,tipo_tema
	from (((formato fo inner join producto_virtual pv on fo.id_formato = pv.id_formato) inner join
		 detalles_tema dt on pv.id_p_virtual = dt.id_p_virtual) inner join 
		 tema te on dt.id_tema = te.id_tema) 
);


--  procucto_virtual ----- version ----- tipo_version -------- estado ------
drop view if exists 07_v_version;
create view 07_v_version as (
	
    select v.id_p_virtual, nom_p_virtual, des_p_virtual,palabras_clave,id_formato,
			v.id_version, fecha_envio, fecha_publicacion, num_version, fecha_vigencia, url_version, url_img, inst_instalacion, reqst_instalacion,
            v.id_estado, nom_estado, id_tipo_estado
    from ((producto_virtual pv inner join version v on pv.id_p_virtual = v.id_p_virtual)
    inner join estado e on e.id_estado = v.id_estado)
);


-- rol ---- rol_funcionario --- funcionario ---- tipo_documento
drop view if exists 08_v_funcionario;
create view 08_v_funcionario as
(
	select  id_rol_funcionario, rf.id_rol, nom_rol,des_rol,
			rf.id_funcionario,td.id_tipo_documento, nom_tipo_documento,num_documento,nom_funcionario,apellidos,
            correo,cargo,ip_sena,contraseña,id_estado,fu.id_area_centro,id_centro
	from (((rol ro inner join rol_funcionario rf on ro.id_rol = rf.id_rol) inner join
		   funcionario fu on rf.id_funcionario = fu.id_funcionario and rf.vigencia = 1) inner join 
           tipo_documento td on td.id_tipo_documento = fu.id_tipo_documento)inner join 
           area_centro ac on fu.id_area_centro = ac.id_area_centro
);    



-- autor -------- v_funcionario -------- v_version--------
drop view if exists 09_v_autor;
create view 09_v_autor as(

	select	au.id_autor, id_p_virtual, nom_p_virtual, des_p_virtual,palabras_clave,id_formato,
			vver.id_version, fecha_envio, fecha_publicacion, num_version, fecha_vigencia, url_version, url_img, inst_instalacion, reqst_instalacion,
            vver.id_estado, nom_estado, id_tipo_estado,
			id_rol_funcionario, id_rol, nom_rol,des_rol,
			vfu.id_funcionario,id_tipo_documento, nom_tipo_documento,num_documento,nom_funcionario,apellidos,
            correo,cargo,ip_sena,contraseña,vfu.id_estado as id_estadofun,id_area_centro
    from (autor au inner join 08_v_funcionario vfu on au.id_funcionario = vfu.id_funcionario) inner join 
		 07_v_version vver on au.id_version = vver.id_version 
);




-- habilitar producto virtual 
drop view if exists 10_habilitar_p;
create view 10_habilitar_p as(
	select distinct v2.id_version,nom_p_virtual,num_version,fecha_vigencia, id_centro
	from producto_virtual v1 inner join version v2 on v1.id_p_virtual = v2.id_p_virtual
    inner join autor v3 on v2.id_version = v3.id_version inner join funcionario v4 on v3.id_funcionario = v4.id_funcionario
	inner join area_centro v5 on v4.id_area_centro = v5.id_area_centro
	where v2.id_estado = 5
);


-- vista para listar las areas y el centro que tiene una relacion
-- registrar funcionario . select centro y areas de ese centro

drop view if exists 11_v_area;
create view 11_v_area as (
	select v1.id_area, nom_area, v1.id_centro,nom_centro
	from area_centro v1 inner join area v2 on v1.id_area = v2.id_area inner join centro v3 on v1.id_centro = v3.id_centro
);

-- inhabilitar funcionario por parte de administrador
drop view if exists 12_inabilitar_funcionario;
create view 12_inabilitar_funcionario as 
(
    select v1.id_funcionario, concat(nom_funcionario," ",apellidos) as nombrecompleto,ip_sena, cargo,nom_rol,nom_estado, nom_area, nom_centro 
	from funcionario v1 inner join estado v2 on v1.id_estado = v2.id_estado inner join rol_funcionario v3 on v1.id_funcionario = v3.id_funcionario and v3.vigencia = 1
	inner join rol v4 on v3.id_rol = v4.id_rol inner join  area_centro v5 on v1.id_area_centro = v5.id_area_centro 
	inner join area v6 on v5.id_area = v6.id_area inner join centro v7 on v5.id_centro = v7.id_centro where v1.id_estado = 1
);


-- vista para hacer el listado de de las listas de chequeo deacuerdo al rol del funcionario 
drop view if exists 13_v_listas_chequeo;
create view 13_v_listas_chequeo as(
	
	select id_lista_chequeo, nom_lista_chequeo, des_lista_chequeo,fecha_creacion,v2.id_funcionario,id_rol
    from lista_chequeo v1 inner join funcionario v2 on v1.id_funcionario = v2.id_funcionario 
    inner join rol_funcionario v3 on v2.id_funcionario = v3.id_funcionario -- and v3.vigencia = 1
    
);


-- listar los titulos de los productos virtuales en el caso de uso de subir producto virtual
drop view if exists 14_v_titulos;
create view 14_v_titulos as (
	select distinct v1.id_p_virtual, nom_p_virtual
    from producto_virtual v1 inner join version v2 on v1.id_p_virtual = v2.id_p_virtual
    where id_estado = 6
);


-- listar los funcionarios que tengan el rol de instructor
drop view if exists 15_v_subir_autores;
create view 15_v_subir_autores as(
	
    select v1.id_funcionario,nom_funcionario,id_centro
    from  funcionario v1 inner join rol_funcionario v2 on v1.id_funcionario = v2.id_funcionario and v2.vigencia = 1
		  inner join area_centro v3 on v1.id_area_centro = v3.id_area_centro
    where id_rol = 1
);

-- listar los items que tiene relacion con una lista de chequeo
drop view if exists 16_v_items_lista;
create view 16_v_items_lista as(
	
    select v3.id_item_lista,des_item_lista,tipo_item,v1.id_lista_chequeo,id_detalles_lista
    from detalles_lista v1 inner join lista_chequeo v2 on v1.id_lista_chequeo = v2.id_lista_chequeo
    inner join item_lista v3 on v1.id_item_lista = v3.id_item_lista
 
);

drop view if exists 17_v_productosevaluador;
create view 17_v_productosevaluador as (
	
    select v1.id_p_virtual, nom_p_virtual, id_version, num_version, fecha_vigencia,v3.id_estado,nom_estado
	from producto_virtual v1 inner join version v2 on v1.id_p_virtual = v2.id_p_virtual inner join estado v3 on v2.id_estado = v3.id_estado
);

drop view if exists 18_v_notificaciones;
create view 18_v_notificaciones as(
	select v1.id_funcionario, nom_funcionario, v5.id_rol,nom_rol,v3.id_notificacion,fecha_envio, conte_notificacion, ides_proceso,v3.id_funcionario as id_funcionarioenvio,estado,id_centro,id_tipo_notificacion
	from funcionario v1 inner join detalles_notificacion v2 on v1.id_funcionario = v2.id_funcionario
	 inner join notificacion v3 on v2.id_notificacion = v3.id_notificacion 
     inner join rol_funcionario v4 on v1.id_funcionario = v4.id_funcionario and v4.vigencia = 1
     inner join rol v5 on v4.id_rol = v5.id_rol 
     inner join area_centro v6 on v1.id_area_centro = v6.id_area_centro 
	order by v1.id_funcionario
);

drop view if exists 19_v_temasformacion;
create view 19_v_temasformacion as(

	select id_tema, nom_tema, id_centro
    from 02_v_area_centro v1 inner join 03_v_detalles_area v2 on v1.id_area = v2.id_area
	inner join 04_v_detalles_programa v3 on v2.id_programa = v3.id_programa 
    
);

drop view if exists 20_v_login;
create view 20_v_login as(
select id_rol, id_funcionario, nom_funcionario,v2.id_centro,num_documento, contraseña
from  08_v_funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro
);

drop view if exists 21_v_asignarrol;

create view 21_v_asignarrol as(
select v1.id_funcionario, concat(nom_funcionario," ",apellidos) as nombrecompleto, cargo,v2.id_centro, nom_centro,v2.id_area,nom_area,v3.id_ciudad,nom_ciudad
from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro
	 inner join centro v3 on v2.id_centro = v3.id_centro inner join area v4 on v2.id_area = v4.id_area
     inner join ciudad v5 on v3.id_ciudad = v5.id_ciudad inner join estado v7 on v1.id_estado = v7.id_estado
where v1.id_estado = 2
);

drop view if exists 22_v_autor_simple;
create view 22_v_autor_simple as(
	select distinct v1.id_funcionario ,concat(nom_funcionario," ",apellidos) as nombrecompleto, id_version
    from funcionario v1 inner join autor v2 on v1.id_funcionario = v2.id_funcionario
);


-- ---------
drop view if exists 23_v_consultar;
create view 23_v_consultar as(
	select  id_p_virtual, nom_p_virtual,des_p_virtual,palabras_clave,fecha_publicacion,fecha_vigencia,inst_instalacion,reqst_instalacion,url_version,id_version,num_version
    from 07_v_version
    where id_estado = 6
);

drop view if exists 24_v_toquen;
create view 24_v_toquen as(
	select * 
    from toquen
    where fechavigencia > current_timestamp
);

drop view if exists 25_v_evaluarproductosv;
create view 25_v_evaluarproductosv as (
	select 
    id_funcionario, -- -
    nom_funcionario, 
    v1.id_rol,-- -
    nom_rol,
    id_notificacion, --
    v1.fecha_envio, --
    conte_notificacion, --
    ides_proceso,--
    id_funcionarioenvio,
    estado, -- -
    id_centro, -- - 
    id_tipo_notificacion,
    v2.url_version,--
    concat(nom_p_virtual," ",num_version) as producto--
    from 18_v_notificaciones v1 inner join version v2 on v1.ides_proceso = v2.id_version 
    inner join producto_virtual v3 on v2.id_p_virtual = v3.id_p_virtual
    where id_rol not in (1)
);


drop view if exists 26_v_comentarios;
create view 26_v_comentarios as (
	select id_comentario, comentario,v1.id_funcionario, concat(nom_funcionario," ",apellidos) as nombre_completo,id_version
    from comentario v1 inner join funcionario v2 on v1.id_funcionario = v2.id_funcionario
);

drop view if exists 27_v_autores;
create view 27_v_autores as (
	select distinct  v1.id_funcionario, concat(nom_funcionario ," " ,apellidos) as nombrecompleto
    from 08_v_funcionario v1 inner join autor v2 on v1.id_funcionario = v2.id_funcionario
);

drop view if exists 28_v_consultacategoria;
create view 28_v_consultacategoria as (
	select distinct v3.id_p_virtual, v3.nom_p_virtual,v3.des_p_virtual,id_formato,fecha_publicacion,v4.id_funcionario,id_categoria,v4.id_version
	from 05_v_detalles_categoria v1 inner join 06_v_detalles_tema v2 on v1.id_tema = v2.id_tema 
	inner join 23_v_consultar v3 on v2.id_p_virtual = v3.id_p_virtual
	inner join 22_v_autor_simple v4 on v3.id_version = v4.id_version
	where tipo_tema = 1 and v3.num_version = 
		(	select num_version 
			from producto_virtual v11 inner join version v22 on v11.id_p_virtual = v22.id_p_virtual 
            where v11.id_p_virtual = v3.id_p_virtual 
            and v22.id_estado in (6,7)
            order by num_version desc limit 1)

);


drop view if exists 29_v_consultaprograma;
create view 29_v_consultaprograma as (
	select distinct v3.id_p_virtual, v3.nom_p_virtual,v3.des_p_virtual,id_formato,fecha_publicacion,id_funcionario,id_programa,v4.id_version
	from 04_v_detalles_programa v1 inner join 06_v_detalles_tema v2 on v1.id_tema = v2.id_tema 
	inner join 23_v_consultar v3 on v2.id_p_virtual = v3.id_p_virtual
	inner join 22_v_autor_simple v4 on v3.id_version = v4.id_version
	where tipo_tema = 0 and v3.num_version = 
		(	select num_version 
			from producto_virtual v11 inner join version v22 on v11.id_p_virtual = v22.id_p_virtual 
            where v11.id_p_virtual = v3.id_p_virtual 
            and v22.id_estado in (6,7)
            order by num_version desc limit 1)
);

drop view if exists 30_v_consultanormal;
create view 30_v_consultanormal as (
	select id_p_virtual,nom_p_virtual,des_p_virtual,palabras_clave,fecha_publicacion,id_version
	from 23_v_consultar v1
	where num_version = 
			(	select num_version 
				from producto_virtual v11 inner join version v22 on v11.id_p_virtual = v22.id_p_virtual 
				where v11.id_p_virtual = v1.id_p_virtual  and v22.id_estado in (6,7)
        order by num_version desc limit 1)

);

-- traer la cantidad de productos virtuales que se encuentran con cada tipo de formato

drop view if exists 31_v_estadisticatipo1;
create view 31_v_estadisticatipo1 as (

	select distinct v1.id_formato, nom_formato,v2.id_p_virtual,nom_p_virtual,fecha_publicacion, id_centro
	from  formato v1 inner join producto_virtual v2 on v1.id_formato = v2.id_formato
		  inner join version v3 on v2.id_p_virtual = v3.id_p_virtual 
          inner join autor v4 on v3.id_version = v4.id_version
          inner join 08_v_funcionario v5 on v4.id_funcionario = v5.id_funcionario
	where v3.id_estado = 6
);

drop view if exists 32_v_estadisticatipo2;
create view 32_v_estadisticatipo2 as (

	select id_formato, nom_formato, count(*) as cantidad,id_centro
	from  31_v_estadisticatipo1
	group by id_formato, nom_formato, id_centro
);



-- call sara_crud("select","31_v_estadisticatipo1","id_formato|nom_formato|count(*) as cantidad|id_centro"," fecha_publicacion between '2016-11-24' and '2016-11-25' group by id_formato, nom_formato, id_centro");


-- traer la cantidad de productos virtuales que se encuentren con cada area deacuerdo al centro de formacion

drop view if exists 33_v_estadisticaarea1;
create view 33_v_estadisticaarea1 as (

	select distinct v7.id_area, v7.nom_area,v1.id_p_virtual,v1.nom_p_virtual,fecha_publicacion,id_centro
	from producto_virtual v1 inner join detalles_tema v2 on v1.id_p_virtual = v2.id_p_virtual
		 inner join tema v3 on v2.id_tema = v3.id_tema 
		 inner join detalles_programa v4 on v3.id_tema = v4.id_tema
		 inner join programa v5 on v4.id_programa = v5.id_programa
		 inner join detalles_area v6 on v5.id_programa = v6.id_programa
		 inner join area v7 on v6.id_area = v7.id_area
		 inner join area_centro v8 on v7.id_area = v8.id_area
		 inner join version v9 on v1.id_p_virtual = v9.id_p_virtual
	where id_estado = 6 and tipo_tema = 0

);



drop view if exists 34_v_estadisticaarea2;
create view 34_v_estadisticaarea2 as (

	select id_area, nom_area,count(*) as cantidad, id_centro
	from 33_v_estadisticaarea1
	group by id_area, nom_area
);


-- traer la cantidad de productos virtuales que se encuentren con cada categoria de acuerdo al centro de formacion

drop view if exists 35_v_estadisticacategoria1;
create view 35_v_estadisticacategoria1 as (

	select distinct v5.id_categoria, nom_categoria, v1.id_p_virtual,fecha_publicacion,id_centro
	from producto_virtual v1 inner join detalles_tema v2 on v1.id_p_virtual = v2.id_p_virtual
			 inner join tema v3 on v2.id_tema = v3.id_tema 
			 inner join detalles_categoria v4 on v3.id_tema = v4.id_tema
			 inner join categoria v5 on v4.id_categoria = v5.id_categoria
			 inner join version v6 on v1.id_p_virtual = v6.id_p_virtual 
			 inner join autor v7 on v6.id_version = v7.id_version
			 inner join 08_v_funcionario v8 on v7.id_funcionario = v8.id_funcionario
	where v6.id_estado in  (6,7)
);

drop view if exists 36_v_estadisticacategoria2;
create view 36_v_estadisticacategoria2 as (
	select id_categoria, nom_categoria, count(*) as canti, id_centro
	from 35_v_estadisticacategoria1
	group by id_categoria, nom_categoria,id_centro
);

drop view if exists 37_v_evaluaciongeneral;
create view 37_v_evaluaciongeneral as (
	
    select v1.id_evaluacion_general,v1.id_lista_chequeo, v5.nom_lista_chequeo, v2.valorizacion, v2.observacion, v3.id_item_lista, v4.des_item_lista,v1.observacion as observacion_general,v1.resultado, v1.fecha_evaluacion
    from evaluacion_general v1 inner join detalles_evaluacion v2 on v1.id_evaluacion_general = v2.id_evaluacion_general
	     inner join detalles_lista v3 on v2.id_detalles_lista = v3.id_detalles_lista
         inner join item_lista v4 on v3.id_item_lista = v4.id_item_lista
         inner join lista_chequeo v5 on v1.id_lista_chequeo = v5.id_lista_chequeo
);

drop view if exists 38_v_notificaciones_ar;-- aprobado - reprobado
create view 38_v_notificaciones_ar as (
    select 	id_funcionario,
			nom_funcionario,
			id_rol,
			nom_rol,
			id_notificacion,
			v1.fecha_envio,
			conte_notificacion,
			ides_proceso,
			v3.nom_p_virtual,
			v2.num_version,
			id_funcionarioenvio,
			estado,
			id_centro,
			id_tipo_notificacion
	from 18_v_notificaciones v1 
		inner join version v2 on v1.ides_proceso = v2.id_version
		inner join producto_virtual v3 on v3.id_p_virtual = v2.id_p_virtual
	where id_tipo_notificacion in (2,3)
);


drop view if exists 39_v_listacategoria;
create view 39_v_listacategoria as (
	select id_categoria,nom_categoria, fecha_creacion, id_centro
    from categoria v1 inner join 08_v_funcionario v2 on v1.id_funcionario = v2.id_funcionario
);

-- //-------cambiado idversion
drop view if exists 40_v_evaluaversion;
create view 40_v_evaluaversion as (
	select id_evaluacion_general,v1.nom_p_virtual,v1.num_version,v1.id_version,url_version
	from 07_v_version v1 inner join evaluacion_general v2 on v1.id_version = v2.id_version
);

-- call sara_crud("select","41_v_consultatodo","","");

drop view if exists 41_v_consultatodo;
create view 41_v_consultatodo as (
	select distinct 
    v3.id_p_virtual, 
    v3.nom_p_virtual,
    v3.des_p_virtual,
    v5.id_formato,
    v6.id_tipo_formato,
    v6.nom_tipo_formato,
    fecha_publicacion,
    v4.id_version,
    v4.id_funcionario,
    nombrecompleto,
    v1.id_programa,
    v1_1.id_categoria,
    tipo_tema
	from 04_v_detalles_programa v1 inner join 06_v_detalles_tema v2 on v1.id_tema = v2.id_tema 
	inner join 05_v_detalles_categoria v1_1 on v1_1.id_tema = v2.id_tema
	inner join 23_v_consultar v3 on v2.id_p_virtual = v3.id_p_virtual
	inner join 22_v_autor_simple v4 on v3.id_version = v4.id_version
    inner join formato v5 on v2.id_formato = v5.id_formato
    inner join tipo_formato v6 on v5.id_tipo_formato = v6.id_tipo_formato
	where   v3.num_version = 
		(	select num_version 
			from producto_virtual v11 inner join version v22 on v11.id_p_virtual = v22.id_p_virtual 
            where v11.id_p_virtual = v3.id_p_virtual 
            and v22.id_estado in (6,7)
            order by num_version desc limit 1)
); 

drop view if exists 42_v_productosactualizar;
create view 42_v_productosactualizar as (
	
    select distinct v1.id_p_virtual, nom_p_virtual, id_funcionario
		from producto_virtual v1 inner join version v2 on v1.id_p_virtual = v2.id_p_virtual
        inner join autor v3 on v2.id_version = v3.id_version
		where id_estado in (6,7)
);

drop view if exists 43_v_consultatodonotificacion;
create view 43_v_consultatodonotificacion as (
select
v1.id_notificacion,
fecha_envio,
conte_notificacion,
ides_proceso,
case 
  when v1.id_tipo_notificacion in (1,3) then 1 -- si es version
  else 2 -- si es evaluacion
end
 as tipoides,
id_tipo_notificacion,
v1.id_funcionario 	as idfuncionarioenvia,
v3.nom_funcionario 	as nomfuncionarioenvia,
v3.id_area_centro 	as idareacentroenvia,
v5.id_centro 		as idcentroenvia,
v7.id_rol as idrolenvia,
estado as estadonotificacion,
id_detalles_notificacion,
v2.id_funcionario as idfuncionariorecibe,
v4.nom_funcionario  as idnomfuncionariorecibe,
v4.id_area_centro as idareacentrorecibe,
v6.id_centro as idcentrorecibe,
v8.id_rol as idrolrecibe
from notificacion v1
inner join detalles_notificacion v2 on v1.id_notificacion = v2.id_notificacion
inner join funcionario v3 on v1.id_funcionario = v3.id_funcionario
inner join funcionario v4 on v2.id_funcionario = v4.id_funcionario
inner join area_centro v5 on v3.id_area_centro = v5.id_area_centro
inner join area_centro v6 on v4.id_area_centro = v6.id_area_centro
inner join rol_funcionario v7 on v3.id_funcionario = v7.id_funcionario and v7.vigencia = 1
inner join rol_funcionario v8 on v3.id_funcionario = v8.id_funcionario and v8.vigencia = 1
);


drop view if exists 45_consultapuestos; 
create view 45_consultapuestos as (
	select v1.puesto,v3.nom_p_virtual as producto,v2.num_version as version, v7.nom_centro as centro
    from rankin v1 inner join version v2 on v1.id_version = v2.id_version
    inner join producto_virtual v3 on v2.id_p_virtual = v3.id_p_virtual
    inner join autor v4 on v2.id_version = v4.id_version 
    inner join funcionario v5 on v4.id_funcionario = v5.id_funcionario
    inner join area_centro v6 on v5.id_area_centro = v6.id_area_centro
    inner join centro v7 on v6.id_centro = v7.id_centro
    where v4.principal = 1
    order by v1.puesto
);


drop procedure if exists sara_crud;
delimiter ;;
create procedure sara_crud(in sentencia varchar(40),in tabla varchar(70),in array_datos1 varchar(500), in array_datos2 varchar(500))
begin
declare i integer default 0;declare a integer default 0;declare num integer default 0;
declare arraycolum varchar(500);declare val varchar(500);declare cant integer;
declare columnas varchar(500) default "";declare conjunto varchar(500) default "";declare valores  varchar(500) default "";

	set sentencia = m_remove(sentencia);
    set tabla = m_remove(tabla);
    set array_datos2 = m_remove(array_datos2);
    
    if(array_datos2 != " " or array_datos2 != null)then
		set array_datos2 = concat("where ", array_datos2);
    end if;
    
	set i = 0;
	set num = m_length(array_datos1,"|");
	while(i < num)do
        set array_datos1 = m_remove(array_datos1);
		set arraycolum = substring_index(array_datos1,"|",1);
        set cant = char_length(array_datos1) - char_length(arraycolum);
        set array_datos1 = right(array_datos1,cant -1);
        
        set a = 0;
        while(a < 2)do
			set arraycolum = m_remove(arraycolum);
			set val = substring_index(arraycolum,"~",1);
			set cant = char_length(arraycolum) - char_length(val);
			set arraycolum = right(arraycolum,cant -1);
            set val = m_remove(val);
            case a
				when 0 then 
					begin
						if(val != "")then
							if(i = 0 and (sentencia = "insert" or sentencia = "select"))then
								set columnas = val; 
                                elseif(i > 0 and (sentencia = "insert" or sentencia = "select"))then
									set columnas = concat(columnas ,",", val);
							end if;
                            if(i = (num-1) and sentencia = "insert")then 
								set columnas = rpad(columnas,char_length(columnas)+1,")");
								set columnas = lpad(columnas,char_length(columnas)+1,"(");
							end if;
                            elseif(sentencia = "select")then set columnas = "*";
								else set columnas = "";
                        end if;
                        
                        if(i = 0 and sentencia = "update")then
                            set conjunto = concat(val," = ");
                            elseif(i > 0 and sentencia = "update")then
                            set conjunto = concat(conjunto,",",val," = ");
                        end if;
                    end;
                when 1 then 
					begin
						if(i = 0 and sentencia = "insert")then
							set valores = concat("'",val,"'"); 
							elseif(i > 0 and sentencia = "insert")then
							set valores = concat(valores ,",'", val,"'");
                        end if;
                        if(sentencia = "update")then
                            set conjunto = concat(conjunto," '",val,"'");
                        end if;
                    end;
            end case;
            set a = a + 1; 
        end while;    
		set i = i + 1;
    end while;
    
	case sentencia
		when "insert" then set @exec = 	(concat("insert into ",tabla," ",columnas," values(",valores,")"));
        when "update" then set @exec =	(concat("update ",tabla," set ",conjunto," ",array_datos2,""));
        when "select" then set @exec =	(concat("select distinct ",columnas," from ",tabla," ",array_datos2,""));
        when "delete" then set @exec =	(concat("delete from ",tabla," ",array_datos2,""));
    end case;
    
    prepare exec from @exec;
    execute exec;
    deallocate prepare exec;
end;;

delimiter ;


drop procedure if exists infodb;
delimiter ;;
create procedure infodb(in arrayinfodb varchar(200))
begin
	
    
    call execute_array(
		arrayinfodb,"~",
        "case @i 
			when 0 then set @valdb    	 	= @valor;
			when 1 then set @valint 	  	= @valor;
			when 2 then set @valtabla 	  	= @valor;
		end case;");
        
    set @cont = -1;
	case (@valint) 
		when 1 then 
                    set @cont1 = -1;
					select distinct it.table_name as tablas,1 as tipot, @cont := @cont + 1 as posicion
					from  information_schema.tables it
					where it.table_schema = @valdb and table_type = "base table"
					group by  it.table_name,table_type 
                    union 
                    select distinct it.table_name as tablas,2 as tipot, @cont1 := @cont1 + 1 as posicion
					from  information_schema.tables it
					where it.table_schema = @valdb and table_type = "view"
					group by  it.table_name,table_type 
                    order by tablas, tipot;
		when 2 then 
					select column_name as columnas, @cont := @cont + 1 as posicioncolum
                    from information_schema.columns ic
                    where ic.table_schema = @valdb and table_name = @valtabla;
		when 3 then 
					select distinct it.table_name as tablas
					from  information_schema.tables it
					where it.table_schema = @valdb and table_type = "base table" and it.table_name not like '%_log';
    end case;
 
end;;
delimiter ;

-- call infodb("sara006~3~0");

drop function if exists m_remove;
delimiter ;;
create function m_remove(cadena varchar(500)) returns varchar(500) charset latin1
begin
	return replace(replace(trim(cadena),"\n",""),"\t","");
end;;
delimiter ;

drop function if exists m_length;
delimiter ;;
create function m_length(array varchar(1000), separador char(1)) returns int(11)
begin 
	declare	contador integer default 1;
    declare valor varchar(500);
    declare cantidad integer;
    bucle : while (true) do
		
        set valor = substring_index(array,separador,1);
        set cantidad = char_length(array) - char_length(valor);
        set array = right(array,cantidad -1);
        
        if(char_length(array) = 0) then
			leave bucle;
        end if;
        
        set contador = contador + 1; 
    end while bucle;
    return contador;
    
end;;
delimiter ;


drop procedure if exists execute_array;
delimiter ;;
create procedure execute_array(in array varchar(500),in separador char(1),in contenido varchar(1000))
begin
	
	set @i = 0;set @valor = "";set @cant = 0;
    bucle : while(true)do
		set @valor = substring_index(array,separador,1);
        set @cant = char_length(array) - char_length(@valor);
        set array = right(array,@cant-1);
        call macc(contenido);
        
        if(char_length(array) = 0) then
			leave bucle;
        end if;
        set @i = @i + 1;
    end while bucle;
    set @i = 0;set @valor = "";set @cant = 0;
end;;

delimiter ;

drop procedure if exists macc;
delimiter ;;
create procedure macc(in concatenacion varchar(2000))
begin
	set @var = concatenacion;
    prepare var from @var;
    execute var;
    deallocate prepare var;
end;;
delimiter ;


drop procedure if exists registrarevaluacion;
delimiter ;;
create procedure registrarevaluacion(in arrayevaluacion varchar(500))
begin

    call execute_array(
		arrayevaluacion,"~",
        "case @i 
			when 0 then set @observaciong 	= @valor;
			when 1 then set @resultado 	  	= @valor;
			when 2 then set @idversion 	  	= @valor;
			when 3 then set @idlista 	  	= @valor;
			when 4 then set @idfuncionario 	= @valor;
            when 5 then set @fechavigencia  = @valor;
			when 6 then set @arrayevaitems 	= @valor;
		end case;");
        
	select "1";
	select  count(*) into @contrepro
    from evaluacion_general
    where id_version = @idversion and resultado = 0 and id_funcionario = @idfuncionario; 
    
    select id_estado into @idestado
    from version 
    where id_version = @idversion;
    
    
    if(@contrepro < 3 and @idestado in (3,4))then
    select "2";
		call sara_crud("insert","evaluacion_general",concat("observacion~",@observaciong,"|resultado~",@resultado,"|id_version~",@idversion,"|id_lista_chequeo~",@idlista,"|id_funcionario~",@idfuncionario,""),"");
		call sara_crud("select","evaluacion_general","id_evaluacion_general into @idevaluacion","id_evaluacion_general > 0 order by id_evaluacion_general desc limit 1");
    
    begin-- validacion de estado y actualizacion del mismo
    	
        set @idprod = 0;
        
        select id_p_virtual into @idprod from version where id_version = @idversion;
        
        if(@resultado = 1)then
    		case @idestado
    			when 3 then update version set id_estado = 4 where id_version = @idversion;
                when 4 then 
                begin 
    				
                    set @val = 0;
    				select count(*) into @val
    				from version 
    				where id_p_virtual = @idprod and id_estado = 5;
    				
    				if (@val > 0) then
                    
    					update version set id_estado = 11,num_version = round(num_version) where id_version = @idversion;
                        
                        else update version set id_estado = 5,num_version = round(num_version) where id_version = @idversion;
    				
    				end if;
                end;
                
            end case;
            
        end if;
    end;
    
    
    -- ------------------------------------ validacion solucion fecha-----------------------------------------------------------------------

 
		-- call sara_crud("select","08_v_funcionario","id_rol into @rol",
		-- concat("id_funcionario = ",@idfuncionario," and id_rol in (2,3)"));
        
        select id_rol into @rol
        from funcionario fu inner join rol_funcionario rf on fu.id_funcionario = rf.id_funcionario and rf.vigencia = 1
        where fu.id_funcionario = @idfuncionario and id_rol in (2,3);
    
	if(@rol = 2 and @resultado = 1)then
    
		if(@fechavigencia = "null")then 
			set @fechavigencia = concat(date_add(curdate(), interval 1 month)," 18:00:00");	
		end if;	
    
		 call sara_crud("update","version",concat("fecha_publicacion~",@fechavigencia,""),concat("id_version = ",@idversion,""));
         
         else if (@rol = 3 and @resultado = 1)then
    
			call sara_crud("select","version","fecha_publicacion into @fechavigencia",concat("id_version = ",@idversion,""));
            
            call sara_crud("update","version",concat("fecha_vigencia~",@fechavigencia,""),concat("id_version = ",@idversion,""));
            
            else if((@rol = 2 or  @rol = 3) and @resultado = 0) then
                
				if(@fechavigencia = "null")then 
					set @fechavigencia = concat(date_add(curdate(), interval 3 day)," 18:00:00");	
				end if;	
				call sara_crud("update","version",concat("fecha_vigencia~",@fechavigencia,""),concat("id_version = ",@idversion,""));
            
			end if;
         end if;
         
    end if;
    
    -- -------------------------------------------------------------------------------
	
    select "3";
    set @i = 0;
	set @num = m_length(@arrayevaitems,"|");
	while(@i < @num)do
		set @arraye = substring_index(@arrayevaitems,"|",1);
        set @cant = char_length(@arrayevaitems) - char_length(@arraye);
        set @arrayevaitems = right(@arrayevaitems,@cant -1);  
        set @a = 0;
        
        while(@a < 3 )do
			set @val = substring_index(@arraye,"¤",1);
			set @cant = char_length(@arraye) - char_length(@val);
			set @arraye = right(@arraye,@cant -1);
				
                case @a
					when 0 then set @valorizacion = @val;
                    when 1 then set @observacionitem = @val;
                    when 2 then set @iddetalleslista = @val;
                end case;
            set @a = @a + 1;        
        end while;
        select @valorizacion,@observacionitem,@iddetalleslista,@idevaluacion;
        call sara_crud("insert","detalles_evaluacion",concat("valorizacion~",@valorizacion,"|observacion~",@observacionitem,"|id_detalles_lista~",@iddetalleslista,"|id_evaluacion_general~",@idevaluacion,""),"");

        set @i = @i + 1;
    end while;
    
    -- si fue aceptado por parte del e tecnico
    call sara_crud("select","version","id_estado into @estado1","id_version = @idversion");
    call sara_crud("select","version","url_version into @urlver","id_version = @idversion");
    
    select id_centro into @idcentro
    from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro
    where id_funcionario = @idfuncionario;
    
    select  count(*) into @contrepro
    from evaluacion_general
    where id_version = @idversion and resultado = 0 and id_funcionario = @idfuncionario;
    
    select v3.nom_rol into @nomrol
    from funcionario v1 
	inner join rol_funcionario v2 on v1.id_funcionario = v2.id_funcionario and v2.vigencia = 1
	inner join rol v3 on v2.id_rol = v3.id_rol
	where v2.id_funcionario = @idfuncionario;
    
    select "entro0",@resultado,@estado1;
    if(@resultado = 1 and @estado1 = 4)then
		
        select v1.id_funcionario into @ideval
		from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro 
		inner join rol_funcionario v3 on v1.id_funcionario = v3.id_funcionario and v3.vigencia = 1
		where id_centro = @idcentro and id_rol = 3;
        
		call registarnotificaion(concat("nuevo producto virtual ha evaluar para ep~1~",@idfuncionario,"~",@ideval,"~",@idversion,""));
        
        -- call registarnotificaion(concat("el producto virtual ",@idversion," ",@estado1,"a pasado a la siguiente face de evaluacion",@i+@a,"~3~",@idfuncionario,"~",@idfun2,""));
        
        else if(@resultado = 1 and @estado1 = 5 or @estado1 = 11) then
			
            select v1.id_funcionario  into @idcoor
			from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro 
			inner join rol_funcionario v3 on v1.id_funcionario = v3.id_funcionario and v3.vigencia = 1
			where id_centro = @idcentro and id_rol = 4;
            
			call registarnotificaion(concat("nuevo producto virtual ha aprobar co~3~",@idfuncionario,"~",@idcoor,"~",@idversion,""));	
            
            
            -- codigooo largo para el numero version ---------------------------------------------------------
            
            -- cambiar numero version aprobada
				
            -- cambiar el numero de version de las otras versiones que estan en evaluacion
				
                set @lineas = 0;
                select id_p_virtual into @idpro1 from version 
				where id_version = @idversion;
                
				select count(*) into @lineas
				from version
				where id_p_virtual = @idpro1 and id_estado in (3,4,9,10); 
                
                if(@lineas > 0) then
					call updatenumeroversion(@idpro1,@idversion,@idcoor);
                end if;
				
                
            -- ------------------------------------------------------------------------------------------

				else if(@resultado = 0 and (@estado1 = 3 or @estado1 = 4) and @contrepro < 3)then
                
					call all_autor(@idversion,@autores);
					
                    case (@estado1)-- 13/04/2017
						when 3 then set @newestado = 9;
                        when 4 then set @newestado = 10;
                    end case;-- 
                    -- -------------- 12/04/2017
                    update version set id_estado = @newestado -- corregir
					where id_version  = @idversion;
                    -- -----------------
                    
					call registarnotificaion(concat("el producto virtual fue reprovado por el ",@nomrol,"~2~",@idfuncionario,"~",@autores,"~",@idevaluacion,""));	
                    
                    -- --------------------------------------tres intentos errados------------------------------------------------- cambio
                    else if(@contrepro = 3) then
                    
						call all_autor(@idversion,@autores);
                        
						select @autores as autores_1; -- verificacion del datos de autores por si lo pasa bien
                        
                        call registarnotificaion(concat("el producto virtual fue reprovado ins~2~",@idfuncionario,"~",@autores,"~",@idevaluacion,""));	
                    
						call registarnotificaion(concat("el producto virtual, fue reprobado 3 veses por el ",@nomrol,", dejando esta version cancelada~3~",@idfuncionario,"~",@autores,"~",@idversion,""));
                        
						update version set id_estado = 8 -- cancelado
                        where id_version  = @idversion;
                        
                    end if;
					-- ------------------------------------------------------------------------------------- cambio
				end if;
		end if;
    end if;
    else signal sqlstate "45000" set message_text = "la version se encuentra anulada";
    end if;
        
end;;
delimiter ;;

drop procedure if exists updatenumeroversion;
delimiter ;;
create procedure updatenumeroversion(in idpro integer, in idveraprobada integer,in idcoordinador integer)
begin
	declare u,c,cont integer;
    declare numid integer;
    declare idis varchar(100);
    declare valor varchar(100);
    declare cant  integer;
    declare autoresversion varchar(200);
    declare numver1 float(2);
	declare numold1 float(2);
    
	set sql_safe_updates = 0;
    drop temporary table if exists tmpversion;
    
    create temporary table tmpversion(
		idversion integer ,
        numversion float,
        numold float);
	
	set @o = 0;
    
	call macc(concat("
    insert into tmpversion
     select id_version, round(num_version + 1.0) + (@o := @o +1)*0.1 ,num_version
     from version
     where id_p_virtual = ",idpro," and id_estado in (3,4,9,10)
     order by fecha_envio asc;"));
     
     select * from tmpversion;
     
     update version v1
     set v1.num_version = (select v2.numversion from tmpversion v2 where v2.idversion = v1.id_version)
     where v1.id_p_virtual = idpro and v1.id_estado in (3,4,9,10);
        
	set cont = 0;
    select count(*) into cont
    from tmpversion;
    
    set c = 0;
    set idis = "0";
    while(c < cont)do
			call macc(concat("select idversion into @idver 
            from tmpversion where idversion not in (",idis,") order by idversion asc limit 1"));
            
            if(c = 0)then
				set idis = @idver;
                else set idis = concat(idis,",",@idver);
            end if;
            set c = c + 1;
    end while;
    
    select idis;
    
   
    
    set u = 0;
		set numid = m_length(idis,",");
		while(u < numid)do
			set valor = substring_index(idis,",",1);
			set cant = char_length(idis) - char_length(valor);
			set idis = right(idis,cant -1);
            
            call all_autor(valor,autoresversion);
            
            select numversion,numold into numver1,numold1 from tmpversion where idversion = valor;
            
            select @numver1,numold1 ,idcoordinador,autoresversion,valor,numid,u;
            
            call registarnotificaion(concat("el numero de la version a sido modificado de ",numold1," a ",numver1,"~3~",idcoordinador,"~",autoresversion,"~",valor,""));	
            
			set u = u + 1;
		end while;
	 select "---",numver1,numold1 ,idcoordinador,autoresversion,valor,numid,u;
     drop temporary table if exists tmpversion;
end;;
delimiter ;

drop procedure if exists all_autor;
delimiter ;;
create procedure all_autor(in idversion integer, out salida varchar(50))
begin
	select count(*) into @cont
    from version v1 inner join autor v2 on v1.id_version = v2.id_version
    where v1.id_version = idversion;
    
    set @idversion = idversion;
    set @c = 0;
    set @idis = "0";
    while(@c < @cont)do
			call macc(concat("select v2.id_funcionario into @idfun
			from version v1 inner join autor v2 on v1.id_version = v2.id_version inner join funcionario v3 on v2.id_funcionario = v3.id_funcionario
			where v2.id_version = ",@idversion," and v2.id_funcionario not in (",@idis,")
			order by v2.id_funcionario asc limit 1"));
            
            if(@c = 0)then
				set @idis = @idfun;
                else set @idis = concat(@idis,",",@idfun);
            end if;
            set @c = @c + 1;
    end while;
	set salida = @idis;
end;;
delimiter ;;

drop procedure if exists registrarcategoria;
delimiter ;;
create procedure registrarcategoria(in arraycategoria varchar(500))
begin
	call execute_array(
    arraycategoria,
    "~",
    "case @i 
		when 0 then set @nomcategoria  = @valor; 
        when 1 then set @descategoria  = @valor;
        when 2 then set @idfuncionario = @valor;
        when 3 then set @arraytemas 	= @valor;
    end case;"
    );
    
    call sara_crud("insert","categoria",concat("nom_categoria~",@nomcategoria,"|des_categoria~",@descategoria,"|id_funcionario~",@idfuncionario,""),"");
    call sara_crud("select","categoria","id_categoria into @idcate","nom_categoria = @nomcategoria and des_categoria = @descategoria");
    
     set @i = 0;
    set @num = m_length(@arraytemas,",");
    while(@i < @num)do
		set @valor = substring_index(@arraytemas,",",1);
        set @cant = char_length(@arraytemas) - char_length(@valor);
        set @arraytemas = right(@arraytemas,@cant -1);
			call sara_crud("insert","detalles_categoria",concat("id_categoria~",@idcate,"|id_tema~",@valor,""),"");
        set @i = @i + 1;
    end while;
end;;
delimiter ;;


drop procedure if exists registrarlista;
delimiter ;;
create procedure registrarlista(in arraylista varchar(500))
begin

	call execute_array(
		arraylista,
        "~",
        "case @i
			when 0 then set @nom_lista_chequeo = @valor;
			when 1 then set @des_lista_chequeo = @valor;
			when 2 then set @id_funcionario = @valor;
			when 3 then set @array_items = @valor;
        end case;"
    );
    call sara_crud("insert","lista_chequeo",concat("nom_lista_chequeo~",@nom_lista_chequeo,"|des_lista_chequeo~",@des_lista_chequeo,"|id_funcionario~",@id_funcionario,""),"");

	call sara_crud("select","lista_chequeo","id_lista_chequeo into @idlist","nom_lista_chequeo  = @nom_lista_chequeo");

    set @i = 0;
    set @num = m_length(@array_items,",");
    while(@i < @num)do
		set @valor = substring_index(@array_items,",",1);
        set @cant = char_length(@array_items) - char_length(@valor);
        set @array_items = right(@array_items,@cant -1);
		call sara_crud("insert","detalles_lista",concat("id_lista_chequeo~",@idlist,"|id_item_lista~",@valor,""),"");
        set @i = @i + 1;
    end while;
    
end;;
delimiter ;;

drop procedure if exists registraritem_tema;
delimiter ;;
create procedure registraritem_tema(in arrayitems_temas varchar(400))
begin
	call execute_array(
		arrayitems_temas,
        ",",
        "case @i
			when 0 then set @eleccion = @valor;
			when 1 then set @arrayeleccion = @valor;
        end case;"
    );
    if(@eleccion = 1)then
		call execute_array(
			@arrayeleccion,
			"~",
			"case @i
				when 0 then set @desitemlista = @valor;
				when 1 then set @tipoitem = @valor;
			end case;"
		);
        insert into item_lista values(null,@desitemlista,@tipoitem);
        select id_item_lista into @iditem from item_lista where des_item_lista = @desitemlista and tipo_item = @tipoitem;
        select id_item_lista, des_item_lista from item_lista where id_item_lista = @iditem;
        
        else if(@eleccion = 2)then
			call execute_array(
			@arrayeleccion,
			"~",
			"case @i
				when 0 then set @nomtema = @valor;
				when 1 then set @destema = @valor;
			end case;"
		);
        insert into tema values (null,@nomtema,@destema);
        select id_tema into @idtema from tema where nom_tema = @nomtema and des_tema = @destema;
        select id_tema, nom_tema from tema where id_tema = @idtema;
        end if;
    end if;
end;;
delimiter ;

drop procedure if exists modificarlista;
delimiter ;;
create procedure modificarlista(in arraymodificar varchar(400))
begin
	call execute_array(
		arraymodificar,
        "~",
        "case @i
			when 0 then set @id_lista_chequeo = @valor;
			when 1 then set @nom_lista_chequeo = @valor;
			when 2 then set @des_lista_chequeo = @valor;
			when 3 then set @array_items = @valor;
        end case;"
    );
    
    update lista_chequeo 
    set nom_lista_chequeo = @nom_lista_chequeo, des_lista_chequeo = @des_lista_chequeo
    where id_lista_chequeo = @id_lista_chequeo;
    
    if (@array_items)then
		set @i = 0;
		set @num = m_length(@array_items,",");
		while(@i < @num)do
			set @valor = substring_index(@array_items,",",1);
			set @cant = char_length(@array_items) - char_length(@valor);
			set @array_items = right(@array_items,@cant -1);
			call sara_crud("insert","detalles_lista",concat("id_lista_chequeo~",@id_lista_chequeo,"|id_item_lista~",@valor,""),"");
			set @i = @i + 1;
		end while;
    end if;
end;;
delimiter ;


drop procedure if exists registrar_pv;
delimiter ;;
create procedure registrar_pv(in arraytodo varchar(2000),out nomurl varchar(50))
begin

declare i,a,co,num,idpro,idtema,tipo integer default 0;

declare nom_p_virtual_var,des_p_virtual_var,palabras_clave_var,id_formato_var,
		url_version_var,url_img_var,inst_instalacion_var,reqst_instalacion_var,
        arrayfuncionario_var ,arraytema_var varchar(200);
        
declare arrayt varchar(100) default "";
declare cant   integer default 0;
declare val    varchar(100) default "";

select 1;

	call execute_array(
		arraytodo,
		"~",
		"case @i
			when 0 then set @nom_p_virtual = @valor;
			when 1 then set @des_p_virtual = @valor;
			when 2 then set @palabras_clave = @valor;
			when 3 then set @id_formato = @valor;
			when 4 then set @url_version = @valor;
			when 5 then set @url_img = @valor;
			when 6 then set @inst_instalacion= @valor;
			when 7 then set @reqst_instalacion = @valor;
			when 8 then set @arrayfuncionario = @valor;
			when 9 then set @arraytema = @valor;
		end case;"
	);	
    
set nom_p_virtual_var 	= @nom_p_virtual, 
	des_p_virtual_var 	= @des_p_virtual,
	palabras_clave_var 	= @palabras_clave,
	id_formato_var 		= @id_formato,
	url_version_var 	= @url_version,
	url_img_var 		= @url_img,
	inst_instalacion_var	= @inst_instalacion,
	reqst_instalacion_var 	= @reqst_instalacion,
	arrayfuncionario_var 	= @arrayfuncionario,
	arraytema_var 			= @arraytema;

    -- call sara_crud("select","producto_virtual","count(*) into @co","nom_p_virtual = @nom_p_virtual or des_p_virtual = @des_p_virtual");
    
    select count(*) -- into co
    from producto_virtual
    where nom_p_virtual = nom_p_virtual_var or des_p_virtual = des_p_virtual_var;
    
    if (co = 0) then 
		call sara_crud("insert","producto_virtual",concat("nom_p_virtual~",nom_p_virtual_var,"|des_p_virtual~",des_p_virtual_var,"|palabras_clave~",palabras_clave_var,"|id_formato~",id_formato_var,""),"");
		
        -- call sara_crud("select","producto_virtual","id_p_virtual into @idpro","nom_p_virtual = @nom_p_virtual");
        
        select id_p_virtual into idpro
        from producto_virtual
        where nom_p_virtual = nom_p_virtual_var;
        
        select idpro,nom_p_virtual_var; 
        
		set i = 0;
		set num = m_length(arraytema_var,",");
        
        select num;
        
        
		while(i < num)do
         -- set i = i + 1;
         
        select "entro1_";
        
			set arrayt = substring_index(arraytema_var,",",1);
			set cant = char_length(arraytema_var) - char_length(arrayt);
			set arraytema_var = right(arraytema_var,cant -1);
			set a = 0;
			while(a < 2)do
            
            select "entro2_";
				set val = substring_index(arrayt,"-",1);
				set cant = char_length(arrayt) - char_length(val);
				set arrayt = right(arrayt,cant -1);
				case a
					when 0 then set idtema = val; 
					when 1 then set tipo 	= val;
				end case;
				set a = a + 1;        
			end while;
            
            select idtema,tipo,idpro;
            
			call sara_crud("insert","detalles_tema",concat("id_tema~",idtema,"|id_p_virtual~",idpro,"|tipo_tema~",tipo,""),"");
			set i = i + 1;
		end while;
		call registrarversion(concat("",idpro,"~",url_version_var,"~",url_img_var,"~",inst_instalacion_var,"~",reqst_instalacion_var,"~",arrayfuncionario_var,""),nomurl);
        
        else signal sqlstate "45000" set message_text = "el nombre del producto o los detalles del mismo ya existen ";
	end if;
	
end;;
delimiter ;

drop procedure if exists registrarversion;
delimiter ;;
create procedure registrarversion(in arrayversion varchar(2000),out nomurl varchar(50))
begin

declare numver float default 1;

set @idver = null;


	call execute_array(
		arrayversion,
        "~",
        "case @i
			when 0 then set @idpro = @valor;
			when 1 then set @url_version = @valor;
			when 2 then set @url_img = @valor;
			when 3 then set @inst_instalacion = @valor;
			when 4 then set @reqst_instalacion = @valor;
			when 5 then set @arrayfuncionario = @valor;
        end case;"
    );
    
    select count(*) into @lineas
    from version
    where id_p_virtual = @idpro and id_estado in (6,7);-- 7
    
    
    if(@lineas > 0 )then-- actualizacion
    
		-- -------- num version
        select "entra";
        select count(*) into @lineassub
        from version
        where id_p_virtual = @idpro and id_estado in (3,4,9,10);
        
        
		set @numver = (select max(num_version) 
		from version 
		where id_p_virtual = @idpro and id_estado in (5,6,7,11));-- 7
		
        if (@lineassub >= 0 and @lineassub < 5) then 
			call macc(concat("set @numver = @numver + 1.",(@lineassub + 1),""));
            
			else signal sqlstate "45000" set message_text = "imposible actualizar esta version";
            
        end if;
        set numver = @numver;
	
        -- ------------------
        
	end if;
    
		call sara_crud("insert","version",concat("num_version~",numver,"|url_version~",@url_version,"|url_img~",@url_img,"|inst_instalacion~",@inst_instalacion,"|reqst_instalacion~",@reqst_instalacion ,"|id_p_virtual~",@idpro,""),"");
		-- call sara_crud("select","version","id_version into @idver","inst_instalacion = @inst_instalacion and reqst_instalacion = @reqst_instalacion");
		
        
        select @inst_instalacion,@reqst_instalacion,@idpro,numver;
        
        
		select id_version into @idver
		from version v1 inner join producto_virtual v2 on v1.id_p_virtual = v2.id_p_virtual
		where inst_instalacion = @inst_instalacion 
			and reqst_instalacion = @reqst_instalacion 
			and v1.id_p_virtual = @idpro 
			and v1.id_estado = 3
			and v1.num_version = numver
		order by fecha_envio desc limit 1;
        
			
	   set @a = 0;
	   bucle : while (true) do
			set @valor = substring_index(@arrayfuncionario,",",1);
			set @cantidad = char_length(@arrayfuncionario) - char_length(@valor);
			set @arrayfuncionario = right(@arrayfuncionario,@cantidad -1);
				
				if(@a = 0)then
					set @prin = 1;
					set @funprin = @valor;
					else set @prin = 0;
				end if;
                select @idver,@valor;
				call sara_crud("insert","autor",concat("id_version~",@idver,"|id_funcionario~",@valor,"|principal~",@prin,""),"");
			set @a = @a +1;
			if(char_length(@arrayfuncionario) = 0) then
				leave bucle;
			end if;
			
		end while bucle;
		
		select id_centro into @idcentro
		from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro
		where id_funcionario = @funprin; -- se puede hacer desde sara_crud
		
		select v1.id_funcionario,v4.nom_rol into @ideval,@nomrol-- anadir nomrol para la notificacion 14/04/2017
		from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro 
			 inner join rol_funcionario v3 on v1.id_funcionario = v3.id_funcionario and v3.vigencia = 1
			 inner join rol v4 on v3.id_rol = v4.id_rol
		where id_centro = @idcentro and v3.id_rol = 2; -- se puede hacer desde sara_crud
		
		call registarnotificaion(concat("nuevo producto virtual ha evaluar para el ",@nomrol,"~1~",@funprin,"~",@ideval,"~",@idver,""));-- anadir nomrol para la notificacion 14/04/2017
		
		update version set url_version = nameurl(@idver) where id_version = @idver;-- nuevo nombre 16/04/2017
		
		set nomurl = nameurl(@idver);-- retorna el nombre del archivo
        
end;;
delimiter ;

drop procedure if exists correccionversion;
delimiter ;;
create procedure correccionversion(in arraycorrecion varchar(2000),out nomurl varchar(50))
begin

	call execute_array(
		arraycorrecion,
        "~",
        "case @i
			when 0 then set @idfuncionario = @valor;
			when 1 then set @idversion = @valor;
		end case"
    );
    

	select id_funcionario into @idfun
    from version v1 inner join autor v2 on v1.id_version = v2.id_version
    where v1.id_version = @idversion and principal = 1;
    
    call sara_crud("select","version","id_estado into @oldestado","id_version = @idversion");
    call sara_crud("select","version","url_version into @oldurl","id_version = @idversion");
    
    select concat("id1",@idfuncionario,"---  id2",@idfun);
    
    if(@idfuncionario = @idfun)then -- cambio en la validacion ------------------------
		
		select id_centro into @idcentro
		from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro
		where id_funcionario = @idfun;
		
        if(@oldestado = 9 or @oldestado = 10)then-- cambio de estados 9-3 y 10-4
        
			case  @oldestado
				when 9 then set @rol = 2, @newestado = 3;-- @newestado 12/042017
                when 10 then set @rol = 3, @newestado = 4;-- @newestado 12/042017
            end case;
            
			select v1.id_funcionario into @ideval
			from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro 
			 inner join rol_funcionario v3 on v1.id_funcionario = v3.id_funcionario and v3.vigencia = 1
			where id_centro = @idcentro and id_rol = @rol;
            
            call sara_crud("update","version",concat("id_estado~",@newestado,"|fecha_envio~",current_timestamp,""),concat("id_version = ",@idversion,""));-- @newestado 12/042017
            call registarnotificaion(concat("nuevo producto virtual corregido ha evaluar para equipo~1~",@idfun,"~",@ideval,"~",@idversion,""));
            
            update version set url_version = nameurl(@idversion) where id_version = @idversion;-- nuevo nombre 16/04/2017
            set nomurl = nameurl(@idversion);-- retorna el nombre del archivo
        end if;
        else signal sqlstate "45000" set message_text = "usuario no aceptado o url no actualizado";
    end if;
    
end;;
delimiter ;


drop procedure if exists aprobarpv;
delimiter ;;
create procedure aprobarpv(in arrayaprobacion varchar(100),out nomurl varchar(50))
begin
	declare idprod integer;
    
	call execute_array(
		arrayaprobacion,
        "~",
        "case @i 
			when 0 then set @idcoordinador = @valor;
			when 1 then set @idversion = @valor;
		end case"
    );
    
    call sara_crud("update","version",concat("id_estado~6|fecha_publicacion~",current_timestamp,""),concat("id_version = ",@idversion,""));
    
    -- ------------------- num version
    
    set @idverproxi = 0;
    
    select id_p_virtual into idprod 
    from version where id_version = @idversion;
    
	select id_version into @idverproxi
    from version 
    where id_estado = 11 and id_p_virtual = idprod
    order by num_version asc limit 1;
    
    if(@idverproxi != 0) then
		update version 
		set id_estado = 5
		where id_version = @idverproxi;
    end if;
    
    -- -------------------
    
    update version set url_version = nameurl(@idversion) where id_version = @idversion;-- nuevo nombre 16/04/2017
    set nomurl = nameurl(@idversion);-- retorna el nombre del archivo
    call all_autor(@idversion,@autores);
    call registarnotificaion(concat("el producto virtual fue publicado ins~3~",@idcoordinador,"~",@autores,"~",@idversion,""));	
    
    -- ----------------------------------------
    --  rankin
    insert into rankin (id_version)values (@idversion);
    
    -- call sara_crud("select","version","id_p_virtual~@idpro","id_version = @idversion");
    -- call sara_crud("select","version","num_version~@numver","id_version = @idversion");
    -- call sara_crud("update","version",concat("num_version~",@numver + 1,""),
			-- "id_p_virtual = @idpro and id_estado != 6 and num_version = @numver");
end;;
delimiter ;


drop procedure if exists registrarfuncionario;
delimiter ;;
create procedure registrarfuncionario(in arrayreg varchar(800))
begin
	call execute_array(
		arrayreg,
        "~",
        "case @i
			when 0 then set @id_rol = @valor;
			when 1 then set @id_tipo_documento = @valor; 
			when 2 then set @num_documento = @valor;
			when 3 then set @nom_funcionario = @valor;
			when 4 then set @apellidos = @valor;
			when 5 then set @correo = @valor;
			when 6 then set @cargo = @valor;
			when 7 then set @ip_sena = @valor;
			when 8 then set @toquen = @valor;
			when 9 then set @id_centro = @valor;
			when 10 then set @id_area = @valor;
        end case;"
    );
    
    set @count = 0;
    if(@id_rol != 1)then
		select count(*) into @count
		from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro inner join
			 rol_funcionario v3 on v1.id_funcionario = v3.id_funcionario and v3.vigencia = 1
		where id_centro = @id_centro and id_rol = @id_rol;
    end if;
    select @count;
    if(@count = 0 )then
		call sara_crud("select","area_centro","id_area_centro into @idac","id_centro = @id_centro and id_area = @id_area");
		call sara_crud("insert","funcionario",concat("id_tipo_documento~",@id_tipo_documento,"|num_documento~",@num_documento,"|nom_funcionario~",@nom_funcionario,"|apellidos~",@apellidos,"|correo~",@correo,"|cargo~",@cargo,"|ip_sena~",@ip_sena,"|id_area_centro~",@idac,""),"");
		call sara_crud("select","funcionario","id_funcionario into @idfun","num_documento = @num_documento"); 
        
		call sara_crud("insert","rol_funcionario",concat("id_rol~",@id_rol,"|id_funcionario~",@idfun,"|vigencia~1"),"");
		call sara_crud("insert","toquen",concat("numero_toquen~",@toquen,"|funcionario~",@idfun,"|fechavigencia~",date_add(curdate(), interval 7 day)," 18:00:00"),"");
	else signal sqlstate "45000" set message_text = "lo siento, ya existe un funcionario con ese rol y centro de formacion";
    end if;
    
end;;
delimiter ;

drop trigger if exists rol_funcionario_bi;
delimiter ;;
create trigger rol_funcionario_bi before insert on rol_funcionario for each row
begin
	set @count = 0;
    set @idcentro = 0;
    select id_centro into @idcentro
    from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro
    where id_funcionario = new.id_funcionario;
    
    
    if(new.id_rol != 1)then
		select count(*) into @count
		from funcionario v1 inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro inner join
			 rol_funcionario v3 on v1.id_funcionario = v3.id_funcionario
		where id_centro = @idcentro and id_rol = new.id_rol and v3.vigencia = 1;
    end if;
    
    if(@count = 0)then
		set @count = 0;
        else signal sqlstate "45000" set message_text = "lo siento, ya existe un funcionario con ese rol y centro de formacion";
    end if;
    
end;;
delimiter ;

drop procedure if exists registarnotificaion;
delimiter ;;
create procedure registarnotificaion(in arraydatos varchar(1000))
begin
		call execute_array(
			arraydatos,
            "~",
            "case @i
				when 0 then set @contenido = @valor;
				when 1 then set @idtipo = @valor;
				when 2 then set @idfun = @valor;
				when 3 then set @arrayfun = @valor;
                when 4 then set @ides = @valor;
			end case;"
        );
    
    
    set @numrt = 0;
    

        call macc(concat( 
		" select count(*) into @numrt
		 from 18_v_notificaciones v1 
		 inner join version v2 on v1.ides_proceso = v2.id_version
		 inner join funcionario v3 on v1.id_funcionarioenvio = v3.id_funcionario
		 inner join rol_funcionario v4 on v3.id_funcionario = v4.id_funcionario and v4.vigencia = 1
		 inner join rol v5 on v4.id_rol = v5.id_rol
		 where conte_notificacion = """,@contenido,"""
			and id_tipo_notificacion = 3
			and v4.id_rol = 4 
			and ides_proceso = ",@ides,"
			and v2.id_estado in (6,7)
			and v1.id_funcionarioenvio = ",@idfun,"
			and v1.id_funcionario in (",@arrayfun,");"));
       
    select @numrt,@contenido,@ides,@idfun,@arrayfun;
    
    if(@numrt = 0)then
		select "entro 1";
		call sara_crud("insert","notificacion",concat("conte_notificacion~",@contenido,"|id_tipo_notificacion~",@idtipo,"|id_funcionario~",@idfun,"|ides_proceso~",@ides,""),"");
		call sara_crud("select","notificacion","id_notificacion into @idnoti","conte_notificacion = @contenido and id_tipo_notificacion = @idtipo and id_funcionario = @idfun and ides_proceso = @ides order by id_notificacion desc limit 1");
       
        set @i = 0;
		set @num = m_length(@arrayfun,",");
		while(@i < @num)do
			set @valor = substring_index(@arrayfun,",",1);
			set @cant = char_length(@arrayfun) - char_length(@valor);
			set @arrayfun = right(@arrayfun,@cant -1);
            
                select  @idnoti,@valor,@num;
				call sara_crud("insert","detalles_notificacion",concat("id_notificacion~",@idnoti,"|id_funcionario~",@valor,""),"");
			set @i = @i + 1;
		end while;
		else signal sqlstate "45000" set message_text = "ya se encuentra un registro con dichos datos";
    end if;
end;;
	
delimiter ;


-- call consultarnotificaciones ("4~4~1");

drop procedure if exists consultarnotificaciones;
delimiter ;;
create procedure consultarnotificaciones(in arrayconsunoti varchar(70))
begin
  -- tener todas las consultas de notificaciones en este procedimiento
  
  call execute_array(
			arrayconsunoti,
            "~",
            "case @i
				when 0 then set @idfuncionario = @valor;
                when 1 then set @idrol = @valor;
				when 2 then set @tipoconsulta = @valor;
			end case;"
        );
        
  case (@tipoconsulta)
    when 1 then -- consulta instructor-funcionario/principal 
      begin
        select id_notificacion,conte_notificacion,v1.fecha_envio,ides_proceso,
		nom_p_virtual,num_version,url_version
		from 43_v_consultatodonotificacion v1 inner join version v2 on v1.ides_proceso = v2.id_version and estadonotificacion = 0
		inner join producto_virtual v3 on v2.id_p_virtual = v3.id_p_virtual
        inner join rol_funcionario rf on v1.idfuncionariorecibe = rf.id_funcionario and rf.id_rol = @idrol and rf.vigencia = 1
		where v1.tipoides = 1 and idfuncionariorecibe = @idfuncionario
		union 
		select id_notificacion,conte_notificacion,v1.fecha_envio,ides_proceso,
		nom_p_virtual,num_version,url_version
		from 43_v_consultatodonotificacion v1 
		inner join evaluacion_general v2 on v1.ides_proceso = v2.id_evaluacion_general and estadonotificacion = 0
		inner join version v3 on v2.id_version = v3.id_version
		inner join producto_virtual v4 on v3.id_p_virtual = v4.id_p_virtual
        inner join rol_funcionario rf on v1.idfuncionariorecibe = rf.id_funcionario and rf.id_rol = @idrol and rf.vigencia = 1
		where v1.tipoides = 2 and idfuncionariorecibe = @idfuncionario
		order by fecha_envio desc;
      end;
    when 2 then -- consulta correccion
      begin
		select id_notificacion,conte_notificacion,v1.fecha_envio,ides_proceso,
		nom_p_virtual,v3.id_version,num_version,url_version
		from 43_v_consultatodonotificacion v1 
		inner join evaluacion_general v2 on v1.ides_proceso = v2.id_evaluacion_general
		inner join version v3 on v2.id_version = v3.id_version
		inner join producto_virtual v4 on v3.id_p_virtual = v4.id_p_virtual
        inner join autor v5 on v1.idfuncionariorecibe = v5.id_funcionario
		where v1.tipoides = 2 and idfuncionariorecibe = @idfuncionario and v3.id_estado in (9,10) and v1.estadonotificacion = 0
        and v5.principal = 1 and v3.id_version = v5.id_version;
		
      end;
    when 3 then -- consulta notificaciones de evaluacion 
      begin
        set @idestado = 0;
		case @idrol
			when 2 then set @idestado = 3;
            when 3 then set @idestado = 4;
        end case;
        
        select id_notificacion,conte_notificacion,v1.fecha_envio,ides_proceso,
		nom_p_virtual,num_version,url_version
		from 43_v_consultatodonotificacion v1 
		inner join version v2 on v1.ides_proceso = v2.id_version
		inner join producto_virtual v3 on v2.id_p_virtual = v3.id_p_virtual
		where v1.tipoides = 1 and idfuncionariorecibe = @idfuncionario and v2.id_estado = @idestado and v1.estadonotificacion = 0;  
      end;
	when 4 then -- consulta habilitar producto virtual
	  begin
        select id_notificacion,conte_notificacion,v1.fecha_envio,ides_proceso,
		nom_p_virtual,num_version,url_version
		from 43_v_consultatodonotificacion v1 
		inner join version v2 on v1.ides_proceso = v2.id_version
		inner join producto_virtual v3 on v2.id_p_virtual = v3.id_p_virtual
		where v1.tipoides = 1 and idfuncionariorecibe = @idfuncionario and v1.estadonotificacion = 0 and v2.id_estado = 5;
	  end;
	when 5 then -- consulta actualizar producto virtual
      begin
		select v1.id_p_virtual,v1.nom_p_virtual,v3.id_version,v3.num_version,v3.fecha_vigencia,v3.url_version,v2.nom_formato,v4.id_funcionario
		from producto_virtual v1 inner join formato v2 on v1.id_formato = v2.id_formato
		inner join version v3 on v1.id_p_virtual = v3.id_p_virtual
		inner join autor v4 on v3.id_version = v4.id_version
		where v4.id_funcionario = @idfuncionario and v3.id_estado in (6,7) and v3.id_version = (
		  select v33.id_version from version v33 where v33.id_p_virtual = v1.id_p_virtual and v33.id_estado in (6,7)
		  order by v33.num_version desc limit 1);
      end;
  end case;

end;;
delimiter ;

set global event_scheduler = on;

drop event if exists event_notificaciones;
delimiter ;;
create event event_notificaciones 
on schedule every 1 day starts '2017/03/09 18:00:00' enable
comment "notificaciones"
do
begin 
	call time_limit ();
end;;

delimiter ;

drop procedure if exists time_limit;
delimiter ;;
create procedure time_limit()
begin

	declare done integer default false;
    declare idver integer;
    declare fechav timestamp;
    declare idest integer;
    declare cur cursor for 
    select id_version, date_format(fecha_vigencia,'%y-%m-%d'),id_estado
    from version where id_estado in (6,7);
    
    declare continue handler for not found set done = true;
    
    select id_version, date_format(fecha_vigencia,'%y-%m-%d') 
    from version where id_estado in (6,7);-- select
    
    set @fechaa  = date_format(current_timestamp,'%y-%m-%d');
    open cur;
    read_loop:loop
    
		fetch cur into idver,fechav,idest;
        
        if done then leave read_loop; end if;-- posible salida
        
        -- valida que el pv no tenga una nueva version
        select count(*) into @validarnuevov
		from version v1 inner join producto_virtual  v2 on v1.id_p_virtual = v2.id_p_virtual
		where v1.id_p_virtual = (select id_p_virtual from version where id_version = idver) 
			and id_estado in (6,7)-- num version 
			and num_version > (select num_version from version where id_version = idver); 
        
		
        select v1.id_funcionario into @idfunc
        from funcionario v1 inner join rol_funcionario v2 on v1.id_funcionario = v2.id_funcionario and v2.vigencia = 1
			inner join area_centro v3 on v1.id_area_centro = v3.id_area_centro
		where id_centro = 
        (
			select id_centro 
			from funcionario v1 
				inner join area_centro v2 on v1.id_area_centro = v2.id_area_centro
				inner join autor v3 on v1.id_funcionario = v3.id_funcionario
			where v3.id_version = idver and principal = 1
        ) and id_rol = 4;
        
        select idver;-- 
        
        call all_autor(idver,@autores);
        
        select @autores as au;
        
        if(fechav = @fechaa and idest = 6)then
			select "time 1";-- 
            
			update version
            set id_estado = 7
            where id_version = idver;
            
            call registarnotificaion(concat("la version fue inhabilitada por ser obsoleta~3~",@idfunc,"~",@autores,"~",idver,""));	
            
            else if(fechav = date_add(@fechaa, interval 7 day ) and idest = 6 and @validarnuevov = 0)then
            
				select "time 2";-- 
                
				call registarnotificaion(concat("la version debe ser actualizada antes de 7 dias~3~",@idfunc,"~",@autores,"~",idver,""));
                
                else if( @fechaa = date_add(fechav, interval 7 day) and idest = 7 and @validarnuevov = 0)then
					
                    select "time 3";--
                    
					select @idfunc,@autores,idver;-- 
                    
					call registarnotificaion(concat("la version debe ser actualizada yaque fue inhabilitada hace 7 dias~3~",@idfunc,"~",@autores,"~",idver,""));
                    
                end if;
            end if;
        end if;
		
    end loop;
    close cur;
    
end;;
delimiter ;

drop procedure if exists consultavistaactualizar;
delimiter ;;
create procedure consultavistaactualizar(in arrayvistaactualizar varchar (50))
begin
    call execute_array(
			arrayvistaactualizar,
            "~",
            "case @i
				when 0 then set @idpv = @valor;
				when 1 then set @idversion = @valor;
				when 2 then set @val = @valor;
			end case;"
        );
     case (@val)
        when 1 then 
          select v1.* ,v2.nom_formato
          from producto_virtual v1 inner join formato v2 on v1.id_formato = v2.id_formato
          where id_p_virtual = @idpv;
        when 2 then
          select * from 22_v_autor_simple where id_version = @idversion;
        when 3 then
          select  id_tema, nom_tema
          from 06_v_detalles_tema 
          where id_p_virtual = @idpv and tipo_tema = 0;
        when 4 then
          select  id_tema, nom_tema
          from 06_v_detalles_tema 
          where id_p_virtual = @idpv and tipo_tema = 1;
     end case;
end;;
delimiter ;

drop procedure if exists registaractualizacion;
delimiter ;;
create procedure registaractualizacion(in arrayactualizacion varchar(2000),out nomurl varchar(50))
begin
  call execute_array(
		arrayactualizacion,
        "~",
        "case @i
			when 0 then set @idpro = @valor;
			when 1 then set @url_version = @valor;
			when 2 then set @url_img = @valor;
			when 3 then set @inst_instalacion = @valor;
			when 4 then set @reqst_instalacion = @valor;
			when 5 then set @arrayfuncionario = @valor;
			when 6 then set @arraytemas = @valor;
        end case;"
    );
    select "1";
    
    if(@arraytemas != "null")then-- 20/04/2017
		set @i = 0;
		set @num = m_length(@arraytemas,",");
		while(@i < @num)do
			 set @i = @i + 1;
				set @arrayt = substring_index(@arraytemas,",",1);
				set @cant = char_length(@arraytemas) - char_length(@arrayt);
				set @arraytemas = right(@arraytemas,@cant -1);
				set @a = 0;
				while(@a < 2)do
					set @val = substring_index(@arrayt,"-",1);
					set @cant = char_length(@arrayt) - char_length(@val);
					set @arrayt = right(@arrayt,@cant -1);
					case @a
						when 0 then set @idtema = @val; 
						when 1 then set @tipo 	= @val;
					end case;
					set @a = @a + 1;        
				end while;
				call sara_crud("insert","detalles_tema",concat("id_tema~",@idtema,"|id_p_virtual~",@idpro,"|tipo_tema~",@tipo,""),"");
				set @i = @i + 1;
			end while;
    end if;
    
    
    call registrarversion(concat("",@idpro,"~",@url_version,"~",@url_img,"~",@inst_instalacion,"~",@reqst_instalacion,"~",@arrayfuncionario,""),nomurl);
    
end;;
delimiter ;

drop function if exists nameurl;
delimiter ;;
create function nameurl(idver integer) returns varchar(50) charset latin1
begin
  set @idver = idver;
  select id_estado, id_p_virtual into @idestado,@idpro
  from version where id_version = @idver;
  
  if(@idestado in (6,7))then
    set @tipover = 2;
    elseif (@idestado in (3,4,5,9,10))then set @tipover = 1;
  end if;
  
  case (@tipover)
    when 1 then 
        select count(*) into @numver
        from 18_v_notificaciones 
        where id_tipo_notificacion = 1 and ides_proceso = @idver;
    when 2 then
        select num_version into @numver 
        from  version
        where id_version = @idver;
  end case;
  
  select v2.nom_formato into @formato 
  from producto_virtual v1 inner join formato v2 on v2.id_formato = v1.id_formato
  where v1.id_p_virtual = @idpro;
  
  set @idpro = lpad(@idpro,3,"0");
  set @numver = lpad(@numver/0.1,2,"0");-- num version 
  set @idver = lpad(@idver,3,"0");
  
  set @nomurl = concat(@tipover,"-",@idpro,"-",@numver,"-",@idver,".",@formato);
  
  return @nomurl;
end;;
delimiter ;

-- la valoracion de los votos tiene que ser en float

drop procedure if exists registrarrankin;
delimiter ;;
create procedure registrarrankin(in arrayregistrarrankin varchar(50))
-- in numerocaso integer(1),in idver_prod integer,in idfuncionario integer, in numvoto integer
begin
  declare idprod        integer default 0;
  declare idrankin      integer default 0;
  declare numerocaso    integer(1)default 0;
  declare idver_prod    integer default 0;
  declare idfuncionario integer default 0;
  declare numvoto       integer(1) default 0;
  
  set @numerocaso = null,@idver_prod = null,@idfuncionario = null,@numvoto = null;
  
  call execute_array(
		arrayregistrarrankin,"~",
        "case @i 
			when 0 then set @numerocaso	 	      = @valor;
			when 1 then set @idver_prod 	  	  = @valor;
			when 2 then set @idfuncionario 	  	= @valor;
			when 3 then set @numvoto 	  	      = @valor;
		end case;");
   
  set numerocaso = @numerocaso,
  idver_prod = @idver_prod,
  idfuncionario = @idfuncionario,
  numvoto = @numvoto;

  select id_rankin into idrankin from rankin where id_version = idver_prod;
  
  case numerocaso
  
     when 1 then 
     -- aumenta una unidad a la cantidad de visitas que tiene un pv y este
     -- numero es compartido por todas las versiones
     begin
        
        select id_p_virtual into idprod 
        from version where id_version = idver_prod;
        
        update rankin v1 inner join version v2 on v1.id_version = v2.id_version
        set cant_visitas = cant_visitas + 1 
        where id_p_virtual = idprod;
        
     end; 
     when 2 then
     -- aumenta una unidad a la cantidad de descargas que tiene la version
     begin
        update rankin
        set cant_descargas = cant_descargas + 1 
        where id_rankin = idrankin;
     end;
     when 3 then 
     -- inserta o actualiza el voto que tiene un determinado usuario con respecto a una determinada version
     begin
        if (
          select true from voto
          where id_rankin = idrankin and id_funcionario = idfuncionario
        ) then
        
          update voto set num_voto = numvoto 
          where id_funcionario = idfuncionario and id_rankin = idrankin; 
          
          else begin
            insert into voto values ( null, numvoto,idfuncionario, idrankin );
            update rankin set cant_votos = cant_votos + 1 where id_rankin = idrankin;
          end;
        end if;
        
     end;
  end case;
end;;
delimiter ;

/*
call registrarrankin("1~12~0~0");
call registrarrankin("2~12~0~0");
call registrarrankin("3~12~5~5");

select * from rankin;
select * from voto;
*/


drop procedure if exists actualizarpuestorankin;
delimiter ;;
create procedure actualizarpuestorankin()
begin
  set sql_safe_updates = 0;
  drop temporary table if exists actualizarpuesto1;
  create temporary table actualizarpuesto1 (
    idrankin1  integer not null,
    puesto1    integer not null
  );
  
  set @contpuesto = 0;
  insert into actualizarpuesto1 (
    select id_rankin, @contpuesto := @contpuesto + 1 
    from  vistapuesto
    order by val_puesto desc
  );
  
  update rankin v1 
  inner join actualizarpuesto1 v2 on v1.id_rankin = v2.idrankin1 
  set v1.puesto = v2.puesto1;
  
end;;
delimiter ;

-- call actualizarpuestorankin();

drop view if exists vistapuesto;
create view vistapuesto as (
    select v1.id_rankin, 
    lpad((sum(num_voto) / v1.cant_votos) * 0.7 + v1.cant_descargas * 0.2 + v1.cant_visitas * 0.1,3,"0") as val_puesto, v1.puesto
    from rankin v1 inner join voto v2 on v1.id_rankin = v2.id_rankin
    group by v1.id_rankin
);


set global event_scheduler = on;

drop event if exists event_actualizarpuesto;
delimiter ;;
create event event_actualizarpuesto 
on schedule every 5 minute starts '2017/05/24 18:00:00' enable
comment "actualizarpuesto"
do
begin 
	call actualizarpuestorankin();
end;;
delimiter ;

-- select * from information_schema.events



-- call consultargrafica("1~1~6~0");


drop procedure if exists consultargrafica;
delimiter ;;
create procedure consultargrafica (in arrayconsultagrafica varchar(100))
begin

	declare grafica_var,idcentro_var,mes_var,anio_var integer default 0;
    
      call execute_array(
			arrayconsultagrafica,
            "~",
            "case @i
				when 0 then set @grafica_var = @valor;
                when 1 then set @idcentro_var = @valor;
				when 2 then set @mes_var = @valor;
                when 3 then set @anio_var = @valor;
			end case;"
        );
	
    set grafica_var 	= @grafica_var,
		idcentro_var 	= @idcentro_var,
        mes_var 		= @mes_var,
        anio_var 		= @anio_var;
	
    if(mes_var = 0) then set mes_var = date_format(current_time,'%m');end if;
    if(anio_var = 0) then set anio_var = date_format(current_time,'%y');end if;
    
    case (grafica_var)
		when 1 then
        begin
        	-- estadistica por formato

			select date_format(v1.fecha_publicacion,'%y') as "año" ,date_format(v1.fecha_publicacion,'%m') as mes,v9.nom_tipo_formato as formato,count(*) as publicaciones
			from version v1 inner join autor v2 on v1.id_version = v2.id_version
			inner join funcionario v3 on v2.id_funcionario = v3.id_funcionario
			inner join area_centro v4 on v3.id_area_centro = v4.id_area_centro
			inner join centro v5 on v4.id_centro = v5.id_centro
			inner join ciudad v6 on v5.id_ciudad = v6.id_ciudad
			inner join producto_virtual v7 on v1.id_p_virtual = v7.id_p_virtual
			inner join formato v8 on v7.id_formato = v8.id_formato
			inner join tipo_formato v9 on v8.id_tipo_formato = v9.id_tipo_formato
			where v1.id_estado in (6,7) and v2.principal = 1 
			and v5.id_centro = idcentro_var and date_format(v1.fecha_publicacion,'%y') = anio_var and date_format(v1.fecha_publicacion,'%m') = mes_var
			group by v9.nom_tipo_formato;
        end;
        when 2 then
        begin
			-- estadistica por area de acuerdo a los temas que se encuentran en dichas areas

			select date_format(v1.fecha_publicacion,'%y') as "año",date_format(v1.fecha_publicacion,'%m') as mes,v8.nom_area as area,count(*) as publicaciones
			from version v1 
			inner join producto_virtual v2 on v1.id_p_virtual = v2.id_p_virtual
			inner join detalles_tema v3 on v2.id_p_virtual = v3.id_p_virtual and v3.tipo_tema = 0
			inner join tema v4 on v4.id_tema = v3.id_tema
			inner join detalles_programa v5 on v4.id_tema = v5.id_tema
			inner join programa v6 on v5.id_programa = v6.id_programa
			inner join detalles_area v7 on  v6.id_programa = v7.id_programa
			inner join area v8 on v7.id_area = v8.id_area
			inner join area_centro v9 on v8.id_area = v9.id_area
			inner join autor v10 on v1.id_version = v10.id_version
			inner join funcionario v11 on v10.id_funcionario = v11.id_funcionario
			inner join area_centro v12 on v11.id_area_centro = v12.id_area_centro
			inner join centro v13 on v12.id_centro = v13.id_centro
			inner join ciudad v14 on v13.id_ciudad = v14.id_ciudad
			where v1.id_estado in (6,7) and v10.principal = 1 
			and v13.id_centro = idcentro_var and date_format(v1.fecha_publicacion,'%y') = anio_var and date_format(v1.fecha_publicacion,'%m') = mes_var
			group by v8.nom_area;
        end;
        when 3 then
        begin 
			-- estadistica por categoria de acuerdo a los temas que se encuentran en dichas categorias

			select date_format(v1.fecha_publicacion,'%y') as "año",date_format(v1.fecha_publicacion,'%m') as mes,v10.nom_categoria as categoria,count(*) as publicaciones
			from version v1 inner join autor v2 on v1.id_version = v2.id_version
			inner join funcionario v3 on v2.id_funcionario = v3.id_funcionario
			inner join area_centro v4 on v3.id_area_centro = v4.id_area_centro
			inner join centro v5 on v4.id_centro = v5.id_centro
			inner join ciudad v6 on v5.id_ciudad = v6.id_ciudad
			inner join producto_virtual v7 on v1.id_p_virtual = v7.id_p_virtual
			inner join detalles_tema v8 on v7.id_p_virtual = v8.id_p_virtual and v8.tipo_tema = 1
			inner join detalles_categoria v9 on v8.id_tema = v9.id_tema
			inner join categoria v10 on v9.id_categoria = v10.id_categoria
			where v1.id_estado in (6,7) and v2.principal = 1 
			and v5.id_centro = idcentro_var and date_format(v1.fecha_publicacion,'%y') = anio_var and date_format(v1.fecha_publicacion,'%m') = mes_var
			group by v10.nom_categoria;
        end;
    end case;
	
end;;
delimiter ;

-- call consultarreporte("5~0~0~0");

drop procedure if exists consultarreporte;
delimiter ;;
create procedure consultarreporte (in arrayconsultareporte varchar(100))
begin
declare contenido varchar(1200) default "";
declare where_var varchar(200) default "";
declare contenido2 varchar(500) default "";
declare reporte_var,idcentro_var,mes_var,anio_var integer default 0;
    
      call execute_array(
			arrayconsultareporte,
            "~",
            "case @i
				when 0 then set @reporte_var1 = @valor;
                when 1 then set @idcentro_var1 = @valor;
				when 2 then set @mes_var1 = @valor;
                when 3 then set @anio_var1 = @valor;
			end case;"
        );
	
    set reporte_var 	= @reporte_var1,
		idcentro_var 	= @idcentro_var1,
        mes_var 		= @mes_var1,
        anio_var 		= @anio_var1;


case (reporte_var)
when 1 then
	begin
		-- cantidad de publicaciones de pv por área
		set contenido = "
		select date_format(v1.fecha_publicacion,'%m %y') as mes,concat(v14.nom_ciudad) as ciudad,concat(ce.nom_centro) as centro,concat(v8.nom_area) as area,count(*) as publicaciones
		from version v1 
		inner join producto_virtual v2 on v1.id_p_virtual = v2.id_p_virtual
		inner join detalles_tema v3 on v2.id_p_virtual = v3.id_p_virtual and v3.tipo_tema = 0
		inner join tema v4 on v4.id_tema = v3.id_tema
		inner join detalles_programa v5 on v4.id_tema = v5.id_tema
		inner join programa v6 on v5.id_programa = v6.id_programa
		inner join detalles_area v7 on  v6.id_programa = v7.id_programa
		inner join area v8 on v7.id_area = v8.id_area
		inner join area_centro v9 on v8.id_area = v9.id_area
		inner join autor v10 on v1.id_version = v10.id_version
		inner join funcionario v11 on v10.id_funcionario = v11.id_funcionario
		inner join area_centro v12 on v11.id_area_centro = v12.id_area_centro
		inner join centro ce on v12.id_centro = ce.id_centro
		inner join ciudad v14 on ce.id_ciudad = v14.id_ciudad
		where v1.id_estado in (6,7) and v10.principal = 1 ";
        
        set contenido2 = " group by v14.nom_ciudad, ce.nom_centro, v8.nom_area";
	end;
when 2 then
	begin
		-- cantidad de publicaciones de pv por tipo objeto
		set contenido = "
		select date_format(v1.fecha_publicacion,'%m %y') as mes,concat(v6.nom_ciudad) as ciudad,concat(ce.nom_centro) as centro,concat(v9.nom_tipo_formato) as formato,concat(v8.nom_formato) as extencion,count(*) as publicaciones
		from version v1 inner join autor v2 on v1.id_version = v2.id_version
		inner join funcionario v3 on v2.id_funcionario = v3.id_funcionario
		inner join area_centro v4 on v3.id_area_centro = v4.id_area_centro
		inner join centro ce on v4.id_centro = ce.id_centro
		inner join ciudad v6 on ce.id_ciudad = v6.id_ciudad
		inner join producto_virtual v7 on v1.id_p_virtual = v7.id_p_virtual
		inner join formato v8 on v7.id_formato = v8.id_formato
		inner join tipo_formato v9 on v8.id_tipo_formato = v9.id_tipo_formato
		where v1.id_estado in (6,7) and v2.principal = 1 ";
        
        set contenido2 = "
		group by v6.nom_ciudad,ce.nom_centro,v8.nom_formato,v9.nom_tipo_formato";
	end;
when 3 then 
	begin
		-- cantidad de publicaciones de pv por categoria
		set contenido = "
		select date_format(v1.fecha_publicacion,'%m %y') as mes,concat(v6.nom_ciudad) as ciudad,concat(ce.nom_centro) as centro, concat(v10.nom_categoria) as categoria,count(*) as publicaciones
		from version v1 inner join autor v2 on v1.id_version = v2.id_version
		inner join funcionario v3 on v2.id_funcionario = v3.id_funcionario
		inner join area_centro v4 on v3.id_area_centro = v4.id_area_centro
		inner join centro ce on v4.id_centro = ce.id_centro
		inner join ciudad v6 on ce.id_ciudad = v6.id_ciudad
		inner join producto_virtual v7 on v1.id_p_virtual = v7.id_p_virtual
		inner join detalles_tema v8 on v7.id_p_virtual = v8.id_p_virtual and v8.tipo_tema = 1
		inner join detalles_categoria v9 on v8.id_tema = v9.id_tema
		inner join categoria v10 on v9.id_categoria = v10.id_categoria
		where v1.id_estado in (6,7) and v2.principal = 1 ";
        
        set contenido2 = "
		group by v6.nom_ciudad,ce.nom_centro,v10.nom_categoria";
    end;
when 4 then 
	begin
		-- cantidad de publicaciones visitadas
		set contenido = "
		select date_format(v1.fecha_publicacion,'%m %y') as mes,concat(v6.nom_ciudad) as ciudad,concat(ce.nom_centro) as centro,
        concat(v7.nom_p_virtual) as ""producto virtual"", concat(v8.cant_visitas) as visitas
		from version v1 inner join autor v2 on v1.id_version = v2.id_version
		inner join funcionario v3 on v2.id_funcionario = v3.id_funcionario
		inner join area_centro v4 on v3.id_area_centro = v4.id_area_centro
		inner join centro ce on v4.id_centro = ce.id_centro
		inner join ciudad v6 on ce.id_ciudad = v6.id_ciudad
		inner join producto_virtual v7 on v1.id_p_virtual = v7.id_p_virtual
		inner join rankin v8 on v1.id_version = v8.id_version 
        where 1 = 1";
        
        set contenido2 = "
		group by v6.nom_ciudad,ce.nom_centro,v7.nom_p_virtual, v8.cant_visitas";
    end;
when 5 then 
	begin
		-- cantidad de publicaciones descargadas
		set contenido = "
		select date_format(v1.fecha_publicacion,'%m %y') as mes,concat(v6.nom_ciudad) as ciudad,concat(ce.nom_centro) as centro,concat(v7.nom_p_virtual) as ""producto virtual"",concat(v1.num_version) as version,concat(v8.cant_descargas) as descargas
		from version v1 inner join autor v2 on v1.id_version = v2.id_version
		inner join funcionario v3 on v2.id_funcionario = v3.id_funcionario
		inner join area_centro v4 on v3.id_area_centro = v4.id_area_centro
		inner join centro ce on v4.id_centro = ce.id_centro
		inner join ciudad v6 on ce.id_ciudad = v6.id_ciudad
		inner join producto_virtual v7 on v1.id_p_virtual = v7.id_p_virtual
		inner join rankin v8 on v1.id_version = v8.id_version
        where 1 = 1";
        
        set contenido2 = "
		group by v6.nom_ciudad,ce.nom_centro,v7.nom_p_virtual, v8.cant_descargas";
    end;
when 6 then 
	begin
		-- cantidad de publicaciones de pv publicados e inhabilitados
		set contenido = "
		select date_format(v1.fecha_publicacion,'%m %y') as mes,concat(v6.nom_ciudad) as ciudad,concat(ce.nom_centro) as centro,count(*) as publicados,
		(
			select count(*)
			from version v11 inner join autor v22 on v11.id_version = v22.id_version
			inner join funcionario v33 on v22.id_funcionario = v33.id_funcionario
			inner join area_centro v44 on v33.id_area_centro = v44.id_area_centro
			inner join centro v55 on v44.id_centro = v55.id_centro
			inner join ciudad v66 on v55.id_ciudad = v66.id_ciudad
			where v11.id_estado = 7 and date_format( v11.fecha_vigencia ,'%m %y') = mes 
			and v44.id_area_centro = v4.id_area_centro
			
		) as inhabilitados
		from version v1 inner join autor v2 on v1.id_version = v2.id_version
		inner join funcionario v3 on v2.id_funcionario = v3.id_funcionario and v2.principal = 1
		inner join area_centro v4 on v3.id_area_centro = v4.id_area_centro
		inner join centro ce on v4.id_centro = ce.id_centro
		inner join ciudad v6 on ce.id_ciudad = v6.id_ciudad
		where v1.id_estado = 6 ";
        
        set contenido2 = "
		group by date_format(v1.fecha_publicacion,'%m %y'),v6.nom_ciudad,ce.nom_centro";
    end;
when 7 then 
	begin
		-- cantidad de pv creados o actualizaciones por cada funcionario
		set contenido = "
        select date_format(v1.fecha_publicacion,'%m') as mes,concat(v6.nom_ciudad) as ciudad,concat(ce.nom_centro) as centro,concat(v7.nom_area) as area,concat(v3.nom_funcionario,"" "",v3.apellidos) as funcionario,count(*) as publicaciones
		from version v1 inner join autor v2 on v1.id_version = v2.id_version
		inner join funcionario v3 on v2.id_funcionario = v3.id_funcionario 
		inner join area_centro v4 on v3.id_area_centro = v4.id_area_centro
		inner join centro ce on v4.id_centro = ce.id_centro
		inner join ciudad v6 on ce.id_ciudad = v6.id_ciudad
		inner join area   v7 on v4.id_area = v7.id_area
		where v1.id_estado in (6,7) ";
        
        set contenido2 = "
		group by date_format(v1.fecha_publicacion,'%m %y'),v6.nom_ciudad,ce.nom_centro,v7.nom_area,v3.nom_funcionario";
    end;
end case;

if (idcentro_var <> 0) then
	set where_var = concat(where_var , " and ce.id_centro = " , idcentro_var);
end if;
if (mes_var <> 0) then
	set where_var = concat(where_var , " and date_format(v1.fecha_publicacion,'%m') = " , mes_var);
end if;
if (anio_var <> 0) then
	set where_var = concat(where_var ," and date_format(v1.fecha_publicacion,'%y') = " , anio_var);
end if;

 call macc(concat(contenido,where_var,contenido2));
    -- select (concat(contenido,wherecentro,idcentro,contenido2));
     -- select (concat(contenido,where_var,contenido2));
end;;
delimiter ;


-- call consultavistasubirpv("1~0");


drop procedure if exists consultavistasubirpv;
delimiter ;;
create procedure consultavistasubirpv (in arrayconsultavistasubir varchar(100))
begin
declare camino_var,idtipoformato_var integer default 0;

  call execute_array(
		arrayconsultavistasubir,
		"~",
		"case @i
			when 0 then set @camino_var = @valor;
			when 1 then set @idtipoformato_var = @valor;
		end case;"
	);

set camino_var 	= @camino_var,
	idtipoformato_var 	= @idtipoformato_var;

case (camino_var)
when 1 then
begin
	select id_tipo_formato, nom_tipo_formato
    from tipo_formato;
end;
when 2 then
begin
	select v2.id_formato, v2.nom_formato
    from tipo_formato v1 inner join formato v2 on v1.id_tipo_formato = v2.id_tipo_formato
    where v1.id_tipo_formato = idtipoformato_var;
end;
end case;
    
end;;
delimiter ;


-- call modificarcontraseña("1~1019133595~e10adc3949ba59abbe56e057f20f883e~e10adc3949ba59abbe56e057f20f883e1");


drop procedure if exists modificarcontraseña;
delimiter ;;
create procedure modificarcontraseña (in arraycontraseña varchar(100))
begin
	declare idfun_var integer default 0;
	declare numfun_var double default 0; 
    declare contractual_var varchar(300);
    declare contrnueva_var varchar(300);
    
    call execute_array(
		arraycontraseña,
		"~",
		"case @i
			when 0 then set @idfun_var = @valor;
			when 1 then set @numfun_var = @valor;
            when 2 then set @contractual_var = @valor;
            when 3 then set @contrnueva_var = @valor;
		end case;"
	);
    
    set idfun_var = @idfun_var,
		numfun_var = @numfun_var,
        contractual_var = @contractual_var,
        contrnueva_var = @contrnueva_var;
	
    if( select 1
		from funcionario 
        where num_documento = numfun_var and id_funcionario = idfun_var and contraseña = contractual_var
    )then
		update funcionario 
        set contraseña = contrnueva_var
        where id_funcionario = idfun_var;
    end if;
    
end;;
delimiter ;




drop procedure if exists modificarperfil;
delimiter ;;
create procedure modificarperfil (in arrayperfil varchar(100))
begin
declare idfun_var integer default 0;
declare nomfun_var varchar(45) default "";
declare apefun_var varchar(100) default "";
declare idtipoident_var integer default 0;
declare numfun_var double default 0;
declare ipsena_var varchar(6);
declare cargo_var  varchar(45);
declare correo_var varchar(125);


  call execute_array(
		arrayperfil,
		"~",
		"case @i
			when 0 then set @idfun_var = @valor;
			when 1 then set @nomfun_var = @valor;
            when 2 then set @apefun_var = @valor;
            when 3 then set @idtipoident_var = @valor;
            when 4 then set @numfun_var = @valor;
            when 5 then set @ipsena_var = @valor;
            when 6 then set @cargo_var = @valor;
            when 7 then set @correo_var = @valor;
		end case;"
	);

set idfun_var 	= @idfun_var,
	nomfun_var 	= @nomfun_var,
    apefun_var 	= @apefun_var,
    idtipoident_var = @idtipoident_var,
    numfun_var 	= @numfun_var,
    ipsena_var 	= @ipsena_var,
    cargo_var 	= @cargo_var,
    correo_var 	= @correo_var;

update funcionario 
set id_tipo_documento 	= idtipoident_var,
	num_documento 		= numfun_var,
	nom_funcionario 	= nomfun_var,
	apellidos 			= apefun_var,
	correo 				= correo_var,
	cargo 				= cargo_var,
	ip_sena 			= ipsena_var
where id_funcionario = idfun_var;

end;;
delimiter ;



-- call login("1019~1019");
-- call login("1019133595~fcea920f7412b5da7be0cf42b8c93759");
drop procedure if exists login;
delimiter ;;
create procedure login(in arraylogin varchar(100))
begin
	declare numfun_var double default 0;
    declare contrasenia_var varchar(300) default "";
    
    call execute_array(
		arraylogin,
        "~",
        "case @i
			when 0 then set @numfun_var = @valor;
			when 1 then set @contrasenia_var = @valor; 
        end case;"
    );
    
    set numfun_var = @numfun_var,
		contrasenia_var = @contrasenia_var;
	
    if(
		select 1 
        from funcionario 
        where num_documento = numfun_var and contraseña = contrasenia_var
    )then
        
        select 1 as tipouser,rf.id_rol,fu.id_funcionario,fu.nom_funcionario,ac.id_centro
        from funcionario fu 
        inner join rol_funcionario rf on fu.id_funcionario = rf.id_funcionario and rf.vigencia = 1
        inner join area_centro ac on fu.id_area_centro = ac.id_area_centro
        where fu.num_documento = numfun_var and fu.contraseña = contrasenia_var;
        
        else if(
			select 1 
            from admin where usuario = numfun_var and clave = contrasenia_var
        )then
			select 2 as tipouser,5 as id_rol 
            from admin where usuario = numfun_var and clave = contrasenia_var;
        end if;
    end if;
end;;
delimiter ;


-- tema_procedure
-- 

/*
call tema_procedure("1~0~tema_1.1~des_tema_1.1");
call tema_procedure("2~5~tema_2.2~des_tema_2.2");
call tema_procedure("0~0~0~0");
*/

drop procedure if exists tema_procedure;

delimiter ;;
create procedure tema_procedure (in arraytema varchar (200))
begin

declare	opcion		integer(1);
declare idtema_var integer default 0;
declare	nomtema_var varchar(45);
declare	destema_var varchar(100);

set @opcion = 0,
	@idtema_var = 0,
    @nomtema_var = "0",
	@destema_var = "0";
    
call execute_array(
		arraytema,
        "~",
        "case @i
			when 0 then set @opcion = @valor;
			when 1 then set @idtema_var = @valor;
            when 2 then set @nomtema_var = @valor;
            when 3 then set @destema_var = @valor;
        end case;"
    );

set opcion = @opcion,
	idtema_var = @idtema_var,
    nomtema_var = @nomtema_var,
	destema_var = @destema_var;
    
case opcion
when 1 then 
begin -- crear tema
	insert into tema values(null,nomtema_var,destema_var);
end;
when 2 then
begin -- modificar tema
	update tema 
    set nom_tema = nomtema_var,
		des_tema = destema_var
	where id_tema = idtema_var;
end;
else select id_tema,nom_tema,des_tema from tema;-- retorna esto
end case;

select id_tema,nom_tema,des_tema from tema;

end;;
delimiter ;


-- programa_procedure
-- 

/*
	call programa_procedure("1~0~programa_2.1~basico2.2~1,2,3");
    call programa_procedure("2~4~programa_1.1~basico3~0");
    call programa_procedure("3~6~0~0~0");
    call programa_procedure("0~0~0~0~0");
*/

drop procedure if exists programa_procedure;

delimiter ;;
create procedure programa_procedure (in arrayprograma varchar (400))
begin

declare opcion integer(1);
declare idprograma_var integer default 0;
declare nomprograma_var varchar(100);
declare nivelformacion_var varchar(45);
declare arraytemas_var varchar(100) default "0";
declare i,num,cant integer default 0;
declare valor varchar(400) default "";

set @opcion = 0,
	@idprograma_var = 0,
    @nomprograma_var = "0",
	@nivelformacion_var = "0",
    @arraytemas_var = "0";

call execute_array(
		arrayprograma,
        "~",
        "case @i
			when 0 then set @opcion = @valor;
			when 1 then set @idprograma_var = @valor;
            when 2 then set @nomprograma_var = @valor;
            when 3 then set @nivelformacion_var = @valor;
            when 4 then set @arraytemas_var = @valor;
        end case;"
    );

set opcion = @opcion,
	idprograma_var = @idprograma_var,
    nomprograma_var = @nomprograma_var,
	nivelformacion_var = @nivelformacion_var,
    arraytemas_var = @arraytemas_var;
    

case opcion
when 1 then
begin -- crear programa
	insert into programa values(null,nomprograma_var,nivelformacion_var);
    select id_programa into idprograma_var from programa 
    where nom_programa = nomprograma_var and nivel_formacion = nivelformacion_var;
    select id_programa,nom_programa,nivel_formacion from programa;
end;
when 2 then 
begin -- modificar probrama
    update programa 
    set nom_programa = nomprograma_var, nivel_formacion = nivelformacion_var
    where id_programa = idprograma_var;
    select id_programa,nom_programa,nivel_formacion from programa;
end;
when 3 then
begin -- multiselect - modificar

    select te.id_tema,te.nom_tema,case(
		select 1 from detalles_programa v1 
        where v1.id_tema = te.id_tema and v1.id_programa = idprograma_var
    ) when 1 then 1 
	  else 0 end as tipo
    from tema te;
    
end;
else select id_programa,nom_programa,nivel_formacion from programa;
end case;
if(opcion <> 3 and arraytemas_var <> "0")then 
	set num = m_length(arraytemas_var,",");
    while(i < num)do
		set valor = substring_index(arraytemas_var,",",1);
        set cant = char_length(arraytemas_var) - char_length(valor);
        set arraytemas_var = right(arraytemas_var,cant -1);
			call sara_crud("insert","detalles_programa",concat("id_tema~",valor,"|id_programa~",idprograma_var,""),"");
        set i = i + 1;
    end while;
end if;

end;;
delimiter ;


-- area_procedure
-- 

/*
	call area_procedure("1~0~area_2.1~liderarea2.1~1,2,3");
    call area_procedure("2~5~area_2.2~liderarea2.2~4");
    call area_procedure("3~6~0~0~0");
    call area_procedure("0~0~0~0~0");
*/

drop procedure if exists area_procedure;

delimiter ;;
create procedure area_procedure (in arrayarea varchar (400))
begin

declare opcion integer(1);
declare idarea_var integer default 0;
declare nomarea_var varchar(100);
declare liderarea_var varchar(70);
declare arrayprogramas_var varchar(100) default "0";
declare i,num,cant integer default 0;
declare valor varchar(400) default "";

set @opcion = 0,
	@idarea_var = 0,
    @nomarea_var = "0",
	@liderarea_var = "0",
    @arrayprogramas_var = "0";

call execute_array(
		arrayarea,
        "~",
        "case @i
			when 0 then set @opcion = @valor;
			when 1 then set @idarea_var = @valor;
            when 2 then set @nomarea_var = @valor;
            when 3 then set @liderarea_var = @valor;
            when 4 then set @arrayprogramas_var = @valor;
        end case;"
    );

set opcion = @opcion,
	idarea_var = @idarea_var,
    nomarea_var = @nomarea_var,
	liderarea_var = @liderarea_var,
    arrayprogramas_var = @arrayprogramas_var;
    

case opcion
when 1 then
begin -- crear area
	insert into area values (null,nomarea_var,liderarea_var);
    select id_area into idarea_var from area where nom_area = nomarea_var and lider_area = liderarea_var;
    select id_area,nom_area,lider_area from area;
end;
when 2 then 
begin -- modificar area
	update area
    set nom_area = nomarea_var, lider_area = liderarea_var
    where id_area = idarea_var;
    select id_area,nom_area,lider_area from area;
end;
when 3 then
begin -- multiselect - modificar

    select pr.id_programa, pr.nom_programa,
    case(
    select 1 from detalles_area v1
    where v1.id_programa = pr.id_programa and v1.id_area = idarea_var
    )when 1 then 1 
	else 0 end as tipo
    from programa pr;
    
end;
else select id_area,nom_area,lider_area from area;
end case;
if(opcion <> 3 and arrayprogramas_var <> "0")then 
	set num = m_length(arrayprogramas_var,",");
    while(i < num)do
		set valor = substring_index(arrayprogramas_var,",",1);
        set cant = char_length(arrayprogramas_var) - char_length(valor);
        set arrayprogramas_var = right(arrayprogramas_var,cant -1);
        
			call sara_crud("insert","detalles_area",concat("id_area~",idarea_var,"|id_programa~",valor,""),"");
        set i = i + 1;
    end while;
end if;

end;;
delimiter ;


-- centro_procedure
-- 

/*
	call centro_procedure("1~0~centro2.1~num2~direcc2~1~1,2,3");
    call centro_procedure("2~4~centro2.2~num2.1~direcc2.1~2~4");
    call centro_procedure("3~5~0~0~0~0");
    call centro_procedure("0~0~0~0~0~0");
*/

drop procedure if exists centro_procedure;

delimiter ;;
create procedure centro_procedure (in arraycentro varchar (400))
begin

declare opcion integer(1);
declare idcentro_var integer default 0;
declare nomcentro_var varchar(100);
declare numcentro_var varchar(50);
declare direccion_var varchar(100);
declare idciudad_var integer default 0;
declare arrayareas_var varchar(100) default "0";
declare i,num,cant integer default 0;
declare valor varchar(400) default "";


set @opcion = 0,
	@idcentro_var = 0,
    @numcentro_var = "0",
	@nomcentro_var = "0",
    @direccion_var = "0",
	@idciudad_var = 0,
    @arrayareas_var = "0";

call execute_array(
		arraycentro,
        "~",
        "case @i
			when 0 then set @opcion = @valor;
			when 1 then set @idcentro_var = @valor;
            when 2 then set @nomcentro_var = @valor;
            when 3 then set @numcentro_var = @valor;
            when 4 then set @direccion_var = @valor;
            when 5 then set @idciudad_var = @valor;
            when 6 then set @arrayareas_var = @valor;
        end case;"
    );

set opcion = @opcion,
	idcentro_var = @idcentro_var,
    nomcentro_var = @nomcentro_var,
    numcentro_var = @numcentro_var,
    direccion_var = @direccion_var,
    idciudad_var = @idciudad_var,
    arrayareas_var = @arrayareas_var;
    

case opcion
when 1 then
begin -- crear area
	insert into centro values (null,numcentro_var,nomcentro_var,direccion_var,idciudad_var);
    select id_centro into idcentro_var from centro 
    where num_centro = numcentro_var and nom_centro = nomcentro_var and direccion = direccion_var and id_ciudad = idciudad_var;
    
    select v1.id_centro,v1.num_centro,v1.nom_centro,v1.direccion,v2.id_ciudad,v2.nom_ciudad
    from centro v1 inner join ciudad v2 on v1.id_ciudad = v2.id_ciudad;
end;
when 2 then 
begin -- modificar area
	update centro
    set num_centro = numcentro_var ,
		nom_centro = nomcentro_var ,
		direccion =  direccion_var ,
		id_ciudad =  idciudad_var
    where id_centro = idcentro_var;
    
    select v1.id_centro,v1.num_centro,v1.nom_centro,v1.direccion,v2.id_ciudad,v2.nom_ciudad
    from centro v1 inner join ciudad v2 on v1.id_ciudad = v2.id_ciudad;
end;
when 3 then
begin -- multiselect - modificar

    select ar.id_area, ar.nom_area,
    case(
	select 1 from area_centro v1
    where v1.id_area = ar.id_area and v1.id_centro = idcentro_var
    )when 1 then 1 
    else 0 end as tipo
    from area ar;
    
end;
else select v1.id_centro,v1.num_centro,v1.nom_centro,v1.direccion,v2.id_ciudad,v2.nom_ciudad
    from centro v1 inner join ciudad v2 on v1.id_ciudad = v2.id_ciudad;
end case;
if(opcion <> 3 and arrayareas_var <> "0")then 
	select arrayareas_var;
	set num = m_length(arrayareas_var,",");
    while(i < num)do
		set valor = substring_index(arrayareas_var,",",1);
        set cant = char_length(arrayareas_var) - char_length(valor);
        set arrayareas_var = right(arrayareas_var,cant -1);
        
			call sara_crud("insert","area_centro",concat("id_area~",valor,"|id_centro~",idcentro_var,""),"");
        set i = i + 1;
    end while;
end if;

end;;
delimiter ;


-- formato_procedure
-- 

/*
	call formato_procedure("1~0~0o01~des12~2");
    call formato_procedure("2~40~0o02~des122~1");
    call formato_procedure("0~0~0~0~0");
*/

drop procedure if exists formato_procedure;

delimiter ;;
create procedure formato_procedure (in arrayformato varchar (400))
begin

declare opcion integer(1);
declare idformato_var integer default 0;
declare nomformato_var varchar(50);
declare desformato_var varchar(100);
declare idtipoformato_var varchar(100);
declare i,num,cant integer default 0;
declare valor varchar(400) default "";


set @opcion = 0,
	@idformato_var = 0,
    @nomformato_var = "0",
	@desformato_var = "0",
    @idtipoformato_var = 0;

call execute_array(
		arrayformato,
        "~",
        "case @i
			when 0 then set @opcion = @valor;
			when 1 then set @idformato_var = @valor;
            when 2 then set @nomformato_var = @valor;
            when 3 then set @desformato_var = @valor;
            when 4 then set @idtipoformato_var = @valor;
        end case;"
    );

set opcion = @opcion,
	idformato_var = @idformato_var,
    nomformato_var = @nomformato_var,
	desformato_var = @desformato_var,
    idtipoformato_var = @idtipoformato_var;
    

case opcion
when 1 then
begin -- crear area
	insert into formato values (null,nomformato_var,desformato_var,idtipoformato_var);
end;
when 2 then 
begin -- modificar area
	update formato 
    set nom_formato = nomformato_var, des_formato = desformato_var, id_tipo_formato = idtipoformato_var
    where id_formato = idformato_var;
end;
else select * from formato;
end case;
select * from formato;
end;;
delimiter ;


-- formato_procedure
-- 

/*
	call tipoformato_procedure("1~0~tipoformato001~url001");
    call tipoformato_procedure("2~4~tipoformato002~url002");
    call tipoformato_procedure("0~0~0~0");
    
    alter table tipo_formato 
	add column urlimgtipoformato varchar(100);
*/

drop procedure if exists tipoformato_procedure;

delimiter ;;
create procedure tipoformato_procedure (in arraytipoformato varchar (400))
begin

declare opcion integer(1);
declare idtipoformato_var integer default 0;
declare nomtipoformato_var varchar(60);
declare urlimgtipoformato_var varchar(100);

set @opcion = 0,
	@idtipoformato_var = 0,
    @nomtipoformato_var = "0",
	@urlimgtipoformato_var = "0";

call execute_array(
		arraytipoformato,
        "~",
        "case @i
			when 0 then set @opcion = @valor;
			when 1 then set @idtipoformato_var = @valor;
            when 2 then set @nomtipoformato_var = @valor;
            when 3 then set @urlimgtipoformato_var = @valor;
        end case;"
    );

set opcion = @opcion,
	idtipoformato_var = @idtipoformato_var,
    nomtipoformato_var = @nomtipoformato_var,
	urlimgtipoformato_var = @urlimgtipoformato_var;
    

case opcion
when 1 then
begin -- crear tipo formato
	insert into tipo_formato values (null,nomtipoformato_var,urlimgtipoformato_var);
end;
when 2 then 
begin -- modificar tipo formato
	update tipo_formato 
    set nom_tipo_formato = nomtipoformato_var, urlimgtipoformato = urlimgtipoformato_var
    where id_tipo_formato = idtipoformato_var;
end;
else select * from tipo_formato;
end case;
select * from tipo_formato;
end;;
delimiter ;


-- asignar_rol
-- 

/*

crea la columna de vigencia

alter table rol_funcionario
add column vigencia integer not null default 1

call consultarnotificaciones("5~2~3");

call asignar_rol("0~0~0~0");
call asignar_rol("2~1~0~0");
call asignar_rol("1~1~5~2");
call asignar_rol("1~4~25~2");

*/

drop procedure if exists asignar_rol;

delimiter ;;
create procedure asignar_rol(in arrayasignarrol varchar (400))
begin

declare opcion integer(1); 
declare idcentro_var		 integer default 0;
declare idfuncionario_var	 integer default 0;
declare idrol_var	 		 integer default 0;
declare idfunold_var  		 integer default 0;
declare idestado_var		 integer default 0;


set	@contador			= 0;
set @idsdetanoti         = ""; 
set @opcion = 0,
	@idcentro_var = 0,
    @idfuncionario_var = "0",
    @idrol_var		  = 0;

call execute_array(
		arrayasignarrol,
        "~",
        "case @i
			when 0 then set @opcion = @valor;
			when 1 then set @idcentro_var = @valor;
            when 2 then set @idfuncionario_var = @valor;
            when 3 then set @idrol_var = @valor;
        end case;"
    );

set opcion = @opcion,
	idcentro_var = @idcentro_var,
    idfuncionario_var = @idfuncionario_var,
    idrol_var = @idrol_var;
    
    
    
    

case opcion
when 1 then
begin -- modificar o insertar vigencia rol

	if(idrol_var = 2 or idrol_var = 3)then
        
		case idrol_var
			when 2 then set idestado_var = 3;
			when 3 then set idestado_var = 4;
		end case;
		
		select fu.id_funcionario into idfunold_var
		from funcionario fu 
		inner join rol_funcionario rf on fu.id_funcionario = rf.id_funcionario and rf.vigencia = 1 
		inner join rol ro on rf.id_rol = ro.id_rol and rf.id_rol = idrol_var
		inner join area_centro ac on fu.id_area_centro  = ac.id_area_centro
		where id_centro = idcentro_var and id_estado = 1;
		
		if(idfunold_var <> 0 and idfunold_var <> idfuncionario_var)then
        
			select  @idsdetanoti := concat(@idsdetanoti,",",id_detalles_notificacion), @contador := @contador + 1
			from 43_v_consultatodonotificacion v1 
			inner join version v2 on v1.ides_proceso = v2.id_version
			inner join producto_virtual v3 on v2.id_p_virtual = v3.id_p_virtual
			where v1.tipoides = 1 and idfuncionariorecibe = idfunold_var and v2.id_estado = idestado_var and v1.estadonotificacion = 0;  
			
			set @idsdetanoti = substring_index(@idsdetanoti,",",@contador * -1); 
			
			call macc(concat("
			update detalles_notificacion
			set id_funcionario = ",idfuncionario_var,"
			where id_detalles_notificacion in (",@idsdetanoti,")
			"));
			#validar cuando no se encuentre ningun registro en las notificaciones
			update rol_funcionario
			set vigencia = 0
			where id_funcionario = idfunold_var;
            
            update rol_funcionario
			set vigencia = 1
			where id_funcionario = idfunold_var and id_rol = 1;
			
		end if;
	
		
	end if;


	update rol_funcionario
	set vigencia = 0
	where id_funcionario = idfuncionario_var;

	if( select 1 from rol_funcionario where id_funcionario = idfuncionario_var and id_rol = idrol_var)then

		update rol_funcionario
		set vigencia = 1
		where id_funcionario = idfuncionario_var and id_rol = idrol_var;

	else
	begin
		insert into rol_funcionario 
		values (null,idrol_var,idfuncionario_var,1);
	end;

	end if;
    
    select fu.id_funcionario,concat(fu.nom_funcionario," ", fu.apellidos) as funcionario,ro.id_rol,ro.nom_rol as rol
    from funcionario fu 
    inner join rol_funcionario rf on fu.id_funcionario = rf.id_funcionario and rf.vigencia = 1 
    inner join rol ro on rf.id_rol = ro.id_rol and rf.id_rol = 1
    inner join area_centro ac on fu.id_area_centro  = ac.id_area_centro
	where id_centro = idcentro_var and id_estado = 1;
end;
when 2 then 
begin -- consulta inicial de la vista asignar roles
	
    select fu.id_funcionario,concat(fu.nom_funcionario," ", fu.apellidos) as funcionario,ro.id_rol,ro.nom_rol as rol
    from funcionario fu 
    inner join rol_funcionario rf on fu.id_funcionario = rf.id_funcionario and rf.vigencia = 1 
    inner join rol ro on rf.id_rol = ro.id_rol and rf.id_rol = 1
    inner join area_centro ac on fu.id_area_centro  = ac.id_area_centro
	where id_centro = idcentro_var and id_estado = 1;
	
end;
else select id_rol,nom_rol from rol where id_rol not in (1,4); -- trae todos los roles menos el coordinador
end case; 
end;;
delimiter ;


-- misproductos
-- 

/*

call misproductos("5");

*/
drop procedure if exists misproductos;

delimiter ;;
create procedure misproductos(in idfuncionario_var varchar(5))
begin

    select distinct pv.id_p_virtual,pv.nom_p_virtual,v.num_version, e.nom_estado,v.fecha_envio ,v.url_version,f.id_funcionario
    from version v 
    inner join producto_virtual pv on v.id_p_virtual = pv.id_p_virtual
    inner join autor a on v.id_version = a.id_version 
    inner join funcionario f on a.id_funcionario = f.id_funcionario
    inner join estado	e	 on v.id_estado = e.id_estado
    where f.id_funcionario = idfuncionario_var;
end;;
delimiter ;



call sara_crud("insert","ciudad","nom_ciudad~bogotá ","");
call sara_crud("insert","ciudad","nom_ciudad~bucaramanga ","");
--
call sara_crud("insert","centro","num_centro~1	|nom_centro~centro de gestion de mercados, logistica y tecnologias de la información|direccion~crr 52#	|id_ciudad~1","");
call sara_crud("insert","centro","num_centro~2	|nom_centro~centro de formacion 2|direccion~crr 30	|id_ciudad~2","");
--
call sara_crud("insert","area","nom_area~teleinformatica	|lider_area~gustabo","");
call sara_crud("insert","area","nom_area~mercadeo			|lider_area~carmen","");
--
call sara_crud("insert","area_centro","id_area~1	|id_centro~1","");
call sara_crud("insert","area_centro","id_area~2	|id_centro~2","");
--
call sara_crud("insert","programa","nom_programa~analisis y desarrollo de sistemas de informacion |nivel_formacion~tecnólogo","");
call sara_crud("insert","programa","nom_programa~mantenimiento |nivel_formacion~tecnólogo","");
call sara_crud("insert","programa","nom_programa~negocios internacionales|nivel_formacion~tecnologo","");
-- 
call sara_crud("insert","detalles_area","id_programa~1	|id_area~1","");
call sara_crud("insert","detalles_area","id_programa~2	|id_area~1","");
call sara_crud("insert","detalles_area","id_programa~3	|id_area~2","");
--
call sara_crud("insert","tema","nom_tema~fundamentos de programación		|des_tema~descripcion tema 1","");
call sara_crud("insert","tema","nom_tema~programacion orientada ha objetos	|des_tema~descripcion tema 2","");
call sara_crud("insert","tema","nom_tema~negociacion		|des_tema~descripcion tema 3","");
call sara_crud("insert","tema","nom_tema~ingles 	|des_tema~descripcion tema 4","");
-- 
call sara_crud("insert","detalles_programa","id_tema~1	|id_programa~1","");
call sara_crud("insert","detalles_programa","id_tema~2	|id_programa~1","");
call sara_crud("insert","detalles_programa","id_tema~4	|id_programa~1","");
call sara_crud("insert","detalles_programa","id_tema~3	|id_programa~2","");
call sara_crud("insert","detalles_programa","id_tema~4	|id_programa~2","");

-- 
call sara_crud("insert","tipo_formato","nom_tipo_formato~video","");
call sara_crud("insert","tipo_formato","nom_tipo_formato~documento","");
call sara_crud("insert","tipo_formato","nom_tipo_formato~imagen","");

-- cambio 16/04/2017
call sara_crud("insert","formato","nom_formato~	txt		|des_formato~	texto plano		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	log		|des_formato~	texto plano		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	dot		|des_formato~	word			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	doc		|des_formato~	word			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	xls		|des_formato~	excel			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	xlm		|des_formato~	excel			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	xlt		|des_formato~	excel			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	xlv 	|des_formato~	excel			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	mdb		|des_formato~	acces			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	ppt		|des_formato~	powerpoint		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	pps		|des_formato~	powerpoint		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	pot		|des_formato~	powerpoint		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	pdf		|des_formato~	pdf				|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	gif		|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	dib		|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	jpg		|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	png		|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	tga		|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	tif		|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	tiff	|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	pcx		|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	plic	|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	emf		|des_formato~	image			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	ico		|des_formato~	imagen			|id_tipo_formato~3","");
call sara_crud("insert","formato","nom_formato~	htm		|des_formato~	html 			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	html	|des_formato~	html			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	asp		|des_formato~	.net			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	jsp		|des_formato~	java			|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	php		|des_formato~	php				|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	css		|des_formato~	css				|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	js		|des_formato~	js				|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	arj		|des_formato~	compress		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	zip		|des_formato~	compress		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	iso		|des_formato~	compress		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	lha		|des_formato~	compress		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	izh		|des_formato~	compress		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	rar		|des_formato~	compress		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	img		|des_formato~	compress		|id_tipo_formato~2","");
call sara_crud("insert","formato","nom_formato~	bin		|des_formato~	compress		|id_tipo_formato~2","");
--

--
call sara_crud("insert","tipo_estado","nom_tipo_estado~funcionario","");
call sara_crud("insert","tipo_estado","nom_tipo_estado~version","");
--
call sara_crud("insert","estado","nom_estado~activo			|id_tipo_estado~1","");
call sara_crud("insert","estado","nom_estado~inactivo		|id_tipo_estado~1","");
call sara_crud("insert","estado","nom_estado~evaluando equipo tecnico			|id_tipo_estado~2","");
call sara_crud("insert","estado","nom_estado~evaluando equipo pedagogico		|id_tipo_estado~2","");
call sara_crud("insert","estado","nom_estado~pendiente coordinador  			|id_tipo_estado~2","");
call sara_crud("insert","estado","nom_estado~habilitado							|id_tipo_estado~2","");
call sara_crud("insert","estado","nom_estado~inhabilitado						|id_tipo_estado~2","");
call sara_crud("insert","estado","nom_estado~cancelado							|id_tipo_estado~2","");-- cambio-----------------------------------------
call sara_crud("insert","estado","nom_estado~corregir equipo tecnico			|id_tipo_estado~2","");-- cambio 12/04/2017-----------------------------------------
call sara_crud("insert","estado","nom_estado~corregir equipo pedagogico			|id_tipo_estado~2","");-- cambio 12/04/2017---------------------------------
call sara_crud("insert","estado","nom_estado~espera coordinador					|id_tipo_estado~2","");-- cambio num version---------------------------------

--
call sara_crud("insert","rol","nom_rol~instructor							|des_rol~suprincipal participacion es el envio de los oa","");
call sara_crud("insert","rol","nom_rol~lider equipo tecnico					|des_rol~evaluara los oa tecnicamente","");
call sara_crud("insert","rol","nom_rol~lider equipo pedagogico				|des_rol~evaluara los oa pedagogicamente",""); 
call sara_crud("insert","rol","nom_rol~coordinador formacion profecional	|des_rol~controla la publicacion de las oas","");
--
call sara_crud("insert","tipo_documento","nom_tipo_documento~cedula de ciudadania","");
call sara_crud("insert","tipo_documento","nom_tipo_documento~cedula extrangera","");
call sara_crud("insert","tipo_documento","nom_tipo_documento~registro civil","");
--
--
call sara_crud("insert","item_lista","des_item_lista~el documento debe tener imagenes ilustrativas	|tipo_item~1","");
call sara_crud("insert","item_lista","des_item_lista~el documento debe tener buena ortografia		|tipo_item~1","");
call sara_crud("insert","item_lista","des_item_lista~el documento debe ser coherente con la introducción|tipo_item~0","");
call sara_crud("insert","item_lista","des_item_lista~el documento debe contener una introduccion	|tipo_item~0","");

-- 
call sara_crud("insert","tipo_notificacion","nom_tipo_notif~evaluativa			|des_tipo_notif~solo podran recibirlas los equipos evaluadores","");
call sara_crud("insert","tipo_notificacion","nom_tipo_notif~retroalimentativa	|des_tipo_notif~solo podran recibirlas los intructores","");
call sara_crud("insert","tipo_notificacion","nom_tipo_notif~publicativa			|des_tipo_notif~lo recibiran tanto los instructores como el coordinador","");

call registrarfuncionario("1~1~1019133595~funcionario-1~inst1~funcionario1@outlook.es~ins~123451~cont1~1~1");
call registrarfuncionario("2~1~2019133595~funcionario-2~evalt1~funcionario2@outlook.es~ep~123452~cont2~1~1");
call registrarfuncionario("3~1~3019133595~funcionario-3~evalp1~funcionario3@outlook.es~et~123453~cont3~1~1");
call registrarfuncionario("4~1~4019133595~funcionario-4~coor1~funcionario4@outlook.es~co~123454~cont4~1~1");
call registrarfuncionario("1~1~5019133595~funcionario-5~inst2~funcionario5@outlook.es~ins~123455~cont5~1~1");

update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=1;
update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=3;
update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=2;
update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=5;
update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=4;
update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=1;
update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=3;
update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=2;
update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=5;
update funcionario set contraseña ='25f9e794323b453885f5181f1b624d0b', id_estado = 1 where id_funcionario=4;
insert into admin (usuario,clave) values ('1029', 'e10adc3949ba59abbe56e057f20f883e');

/*
contraseñas por default
	funcionarios  123456789
	administrador 123456*/