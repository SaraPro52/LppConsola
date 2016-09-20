DROP DATABASE SARA08;
CREATE DATABASE SARA08;

USE SARA08;

CREATE TABLE Tipo_Estado(
		
    Id_Tipo_Estado 	INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Tipo_Estado VARCHAR(50) NOT NULL,
    
    CONSTRAINT PK_Tipo_Estado PRIMARY KEY (Id_Tipo_Estado),
    CONSTRAINT UN_Tipo_Estado UNIQUE	  (Nom_Tipo_Estado)
);

CREATE TABLE Estado(
	
    Id_Estado         INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Estado 	      VARCHAR(50) NOT NULL,
    Id_Tipo_Estado 	  INTEGER NOT NULL,
    
    CONSTRAINT PK_Estado      PRIMARY KEY 	(Id_Estado),
    CONSTRAINT UN_Estado 	  UNIQUE		(Nom_Estado),
    CONSTRAINT FK_Tipo_Estado FOREIGN KEY 	(Id_Tipo_Estado) REFERENCES Tipo_Estado(Id_Tipo_Estado)
    
);


CREATE TABLE Tipo_Version(
	
	Id_Tipo_Version    INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Tipo_Version   VARCHAR(50) NOT NULL,
    Des_Tipo_Version   VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Tipo_Version 		PRIMARY KEY (Id_Tipo_Version),
    CONSTRAINT UN_Tipo_Version_01 	UNIQUE 		(Nom_Tipo_Version),
    CONSTRAINT UN_Tipo_Version_02 	UNIQUE 		(Des_Tipo_Version)

);

CREATE TABLE Formato(
	
    Id_Formato     INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Formato    VARCHAR(50) NOT NULL,
    Des_Formato    VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Formato 		PRIMARY KEY (Id_Formato),
    CONSTRAINT UN_Formato_01 	UNIQUE		(Nom_Formato),
    CONSTRAINT UN_Formato_02	UNIQUE		(Des_Formato)
    
);

CREATE TABLE Producto_Virtual(
	
    Id_P_Virtual     INTEGER NOT NULL AUTO_INCREMENT,
    Nom_P_Virtual    VARCHAR(100) NOT NULL,
    Des_P_Virtual	 VARCHAR(200) NOT NULL,
    Palabras_Clave	 VARCHAR(100) NOT NULL,
    Id_Formato 	     INTEGER NOT NULL,
    
    CONSTRAINT PK_P_Virtual 	PRIMARY KEY (Id_P_Virtual),
    CONSTRAINT UN_P_Virtual_01 	UNIQUE 		(Nom_P_Virtual),
    CONSTRAINT UN_P_Virtual_02	UNIQUE		(Des_P_Virtual),
    CONSTRAINT FK_Formato   	FOREIGN KEY (Id_Formato)    REFERENCES Formato(Id_Formato)

);

CREATE TABLE Version (

	Id_Version           INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Envio          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Fecha_Publicacion 	 TIMESTAMP,
    Num_Version 		 INTEGER,
	Fecha_Vigencia 		 TIMESTAMP,
    Url_Version			 VARCHAR (500),
    Url_Img				 VARCHAR (500),				
    Inst_Instalacion	 VARCHAR (800),
    Reqst_Instalacion    VARCHAR (500),
    Id_P_Virtual		 INTEGER NOT NULL,
	Id_Estado			 INTEGER NOT NULL,
    Id_Tipo_Version      INTEGER NOT NULL,
	
	CONSTRAINT PK_Version      PRIMARY KEY (Id_Version),
    CONSTRAINT FK_P_Virtual_01 FOREIGN KEY (Id_P_Virtual)    REFERENCES Producto_Virtual(Id_P_Virtual),
    CONSTRAINT FK_Estado_01    FOREIGN KEY (Id_Estado)       REFERENCES Estado(Id_Estado),
    CONSTRAINT FK_Tipo_Version FOREIGN KEY (Id_Tipo_Version) REFERENCES Tipo_Version(Id_Tipo_Version)

    
);	

CREATE TABLE Rankin(

	Id_Rankin        INTEGER NOT NULL AUTO_INCREMENT,
    Puesto			 INTEGER NOT NULL DEFAULT 0,
    Num_Visitas      INTEGER NOT NULL DEFAULT 0,
    Num_Descargas	 INTEGER NOT NULL DEFAULT 0,
    Cant_5			 INTEGER NOT NULL DEFAULT 0, 
    Cant_4			 INTEGER NOT NULL DEFAULT 0,
    Cant_3			 INTEGER NOT NULL DEFAULT 0,
    Cant_2			 INTEGER NOT NULL DEFAULT 0,
    Cant_1			 INTEGER NOT NULL DEFAULT 0,
    Numero_Votos     INTEGER NOT NULL DEFAULT 0,
    Id_Version		 INTEGER NOT NULL,
    
    CONSTRAINT PK_Rankin 	PRIMARY KEY (Id_Rankin),
    CONSTRAINT FK_Version 	FOREIGN KEY (Id_Version) REFERENCES Version (Id_Version),
    CONSTRAINT UN_Rankin	UNIQUE		(Id_Version)
    
);

CREATE TABLE Tema(

	Id_Tema    INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Tema   VARCHAR(45) NOT NULL,
    Des_Tema   VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Tema 		PRIMARY KEY (Id_Tema),
    CONSTRAINT UN_Tema_01 	UNIQUE	   	(Nom_Tema),
	CONSTRAINT UN_Tema_02 	UNIQUE	   	(Des_Tema)
    
);


CREATE TABLE Detalles_Tema(

	Id_Detalles_Tema INTEGER NOT NULL AUTO_INCREMENT,
    Id_Tema          INTEGER NOT NULL,
    Id_P_Virtual     INTEGER NOT NULL,
    Tipo_Tema		 BOOLEAN NOT NULL ,  -- DETERMINA SI TIENE UNA RELACION CON CATEGORIA O CON PROGRAMA
    
    CONSTRAINT PK_Detalles_Tema    PRIMARY KEY (Id_Detalles_Tema),
    CONSTRAINT UN_Detalles_Tema	   UNIQUE	   (Id_Tema,Id_P_Virtual,Tipo_Tema),
    CONSTRAINT FK_Tema_01          FOREIGN KEY (Id_Tema)      REFERENCES Tema(Id_Tema),
    CONSTRAINT FK_P_Virtual_02     FOREIGN KEY (Id_P_Virtual) REFERENCES Producto_Virtual(Id_P_Virtual)
    
);


CREATE TABLE Programa(
	
    Id_Programa     INTEGER NOT NULL AUTO_INCREMENT,
	Nom_Programa    VARCHAR(100) NOT NULL,
    Nivel_Formacion VARCHAR(45) NOT NULL,
    
    CONSTRAINT PK_Programa PRIMARY KEY 	(Id_Programa),
	CONSTRAINT UN_Programa UNIQUE	    (Nom_Programa)
		
);

CREATE TABLE Detalles_Programa(

	Id_Detalles_Programa INTEGER NOT NULL AUTO_INCREMENT,
    Id_Tema              INTEGER NOT NULL,
    Id_Programa          INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Programa PRIMARY KEY (Id_Detalles_Programa),
    CONSTRAINT UN_Detalles_Programa UNIQUE		(Id_Tema,Id_Programa),
    CONSTRAINT FK_Tema_02           FOREIGN KEY (Id_Tema)     REFERENCES Tema(Id_Tema),
    CONSTRAINT FK_Programa_01       FOREIGN KEY (Id_Programa) REFERENCES Programa(Id_Programa)
    
);

CREATE TABLE Area (

	Id_Area       INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Area      VARCHAR(100) NOT NULL,
    Lider_Area    VARCHAR(70) NOT NULL,
    
    CONSTRAINT PK_Area PRIMARY KEY (Id_Area),
    CONSTRAINT UN_Area UNIQUE 	   (Nom_Area)
    
);

CREATE TABLE Detalles_Area(

	Id_Detalles_Area INTEGER NOT NULL AUTO_INCREMENT,
    Id_Area          INTEGER NOT NULL,
    Id_Programa      INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Area PRIMARY KEY (Id_Detalles_Area),
    CONSTRAINT UN_Detalles_Area	UNIQUE		(Id_Area,Id_Programa),
    CONSTRAINT FK_Area_01		FOREIGN KEY (Id_Area)	  REFERENCES Area (Id_Area),
    CONSTRAINT FK_Programa_02   FOREIGN KEY (Id_Programa) REFERENCES Programa(Id_Programa)

);

CREATE TABLE Ciudad(
	
    Id_Ciudad    INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Ciudad   VARCHAR(75) NOT NULL,
    
    CONSTRAINT PK_Ciudad    PRIMARY KEY (Id_Ciudad),
    CONSTRAINT UN_Ciudad    UNIQUE (Nom_Ciudad) 
    
);

CREATE TABLE Centro(
	
	Id_Centro    INTEGER NOT NULL AUTO_INCREMENT,
    Num_Centro   VARCHAR(50) NOT NULL,
    Nom_Centro   VARCHAR(100) NOT NULL,
    Direccion    VARCHAR(100) NOT NULL,
    Id_Ciudad 	 INTEGER NOT NULL,
    
    CONSTRAINT PK_Centro 	PRIMARY KEY 	(Id_Centro),
    CONSTRAINT UN_Centro_01 UNIQUE	     	(Num_Centro),
    CONSTRAINT UN_Centro_02 UNIQUE	     	(Nom_Centro),
    CONSTRAINT UN_Centro_03	UNIQUE		 	(Direccion),
    CONSTRAINT FK_Ciudad 	FOREIGN KEY 	(Id_Ciudad) REFERENCES Ciudad(Id_Ciudad)
    
);

CREATE TABLE Area_Centro(

	Id_Area_Centro INTEGER NOT NULL AUTO_INCREMENT,
    Id_Area        INTEGER NOT NULL,
    Id_Centro	   INTEGER NOT NULL,
	
	CONSTRAINT PK_Area_Centro PRIMARY KEY (Id_Area_Centro),
    CONSTRAINT UN_Area_Centro UNIQUE	  (Id_Area,Id_Centro),
    CONSTRAINT FK_Area_02     FOREIGN KEY (Id_Area)   REFERENCES Area (Id_Area),
    CONSTRAINT FK_Centro	  FOREIGN KEY (Id_Centro) REFERENCES Centro(Id_Centro)	
     
);

CREATE TABLE Tipo_Documento(

	Id_Tipo_Documento INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Tipo_Documento VARCHAR (100) NOT NULL,--
    
    CONSTRAINT PK_Tipo_Documento PRIMARY KEY (Id_Tipo_Documento),
    CONSTRAINT UN_Tipo_Documento UNIQUE (Nom_Tipo_Documento)
);


CREATE TABLE Funcionario(

	Id_Funcionario  	INTEGER NOT NULL AUTO_INCREMENT,
    Id_Tipo_Documento	INTEGER NOT NULL,
    Num_Documento   	DOUBLE NOT NULL,
	Nom_Funcionario 	VARCHAR(45) NOT NULL,
    Apellidos       	VARCHAR(100) NOT NULL,
    Correo				VARCHAR(125) NOT NULL,
    Cargo 				VARCHAR(45) NOT NULL,
    Ip_Sena				VARCHAR(6) NOT NULL,
    Contraseña      	VARCHAR(300) NOT NULL,
    Id_Estado 	    	INTEGER NOT NULL,
    Id_Area_Centro 		INTEGER NOT NULL,
    
    CONSTRAINT PK_Funcionario 			PRIMARY KEY (Id_Funcionario),
    CONSTRAINT UN_Funcionario_01 		UNIQUE 	  	(Num_Documento),
    CONSTRAINT UN_Funcionario_02 		UNIQUE 	  	(Correo),
    CONSTRAINT UN_Funcionario_03		UNIQUE		(Ip_Sena),
    CONSTRAINT FK_Tipo_Documento 		FOREIGN KEY (Id_Tipo_Documento) 	REFERENCES Tipo_Documento(Id_Tipo_Documento),
    CONSTRAINT FK_Estado_02	  			FOREIGN KEY (Id_Estado) 	   		REFERENCES Estado(Id_Estado), 	
    CONSTRAINT FK_Area_Centro 			FOREIGN KEY (Id_Area_Centro) 		REFERENCES Area_Centro(Id_Area_Centro)
    
);	

CREATE TABLE Tipo_Notificacion(
	
    Id_Tipo_Notificacion INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Tipo_Notif		 VARCHAR(70) NOT NULL,
    Des_Tipo_Notif	     VARCHAR(150) NOT NULL,
    
    CONSTRAINT PK_Tipo_Notificacion 	PRIMARY KEY (Id_Tipo_Notificacion),
    CONSTRAINT UN_Tipo_Notificacion_01 	UNIQUE 		(Nom_Tipo_Notif),
    CONSTRAINT UN_Tipo_Notificacion_02 	UNIQUE		(Des_Tipo_Notif)
);

CREATE TABLE Notificacion(
	
    Id_Notificacion 		INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Envio				TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Conte_Notificacion 		VARCHAR(600) NOT NULL,
    Archivos_Adjuntos		VARCHAR(500),
    Id_Tipo_Notificacion	INTEGER NOT NULL,
    Id_Funcionario 			INTEGER NOT NULL,
    
    CONSTRAINT PK_Notificacion 		PRIMARY KEY (Id_Notificacion),
    CONSTRAINT UN_Notificacion 		UNIQUE 		(Conte_Notificacion),
    CONSTRAINT FK_Tipo_Notificacion FOREIGN KEY (Id_Tipo_Notificacion) REFERENCES Tipo_Notificacion(Id_Tipo_Notificacion),
    CONSTRAINT FK_Funcionario_06	FOREIGN KEY (Id_Funcionario)	   REFERENCES Funcionario(Id_Funcionario)
);

CREATE TABLE Detalles_Notificacion(
	
    Id_Detalles_Notificacion INTEGER NOT NULL AUTO_INCREMENT,
    Id_Notificacion INTEGER NOT NULL,
    Id_Funcionario  INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Notificacion PRIMARY KEY (Id_Detalles_Notificacion),
    CONSTRAINT UN_Detalles_Notificacion UNIQUE 		(Id_Notificacion,Id_Funcionario),
    CONSTRAINT FK_Notificacion		    FOREIGN KEY (Id_Notificacion) REFERENCES Notificacion(Id_Notificacion),
    CONSTRAINT FK_Funcionario_07		FOREIGN KEY (Id_Funcionario)  REFERENCES Funcionario(Id_Funcionario)
    
);

CREATE TABLE Rol(

	Id_Rol  INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Rol VARCHAR(45) NOT NULL,
    Des_Rol VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Rol 		PRIMARY KEY (Id_Rol),
    CONSTRAINT UN_Rol_01 	UNIQUE      (Nom_Rol),
    CONSTRAINT UN_Rol_02	UNIQUE		(Des_Rol)
);

CREATE TABLE Rol_Funcionario(

	Id_Rol_Funcionario INTEGER NOT NULL AUTO_INCREMENT,
    Id_Rol             INTEGER NOT NULL,
    Id_Funcionario     INTEGER NOT NULL,
    
    CONSTRAINT PK_Rol_Funcionario PRIMARY KEY (Id_Rol_Funcionario),
    CONSTRAINT UN_Rol_Funcionario UNIQUE	  (Id_Rol,Id_Funcionario),
    CONSTRAINT FK_Rol_01		  FOREIGN KEY (Id_Rol)         REFERENCES Rol(Id_Rol),
	CONSTRAINT FK_Funcionario_01  FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario (Id_Funcionario)
    
);


CREATE TABLE Autor (

	Id_Autor       INTEGER NOT NULL AUTO_INCREMENT,
    Id_Version     INTEGER NOT NULL,
    Id_Funcionario INTEGER NOT NULL,
    
    CONSTRAINT PK_Autor          PRIMARY KEY (Id_Autor),
    CONSTRAINT UN_Autor		     UNIQUE 	 (Id_Version,Id_Funcionario),
    CONSTRAINT FK_Version_01     FOREIGN KEY (Id_Version)     REFERENCES Version (Id_Version),
    CONSTRAINT FK_Funcionario_02 FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario)
    
);

CREATE TABLE Comentario(

	Id_Comentario   INTEGER NOT NULL AUTO_INCREMENT,
	Comentario      VARCHAR(500) NOT NULL,
	Id_Funcionario  INTEGER NOT NULL,
    Id_Version      INTEGER NOT NULL,
    
    CONSTRAINT PK_Comentario     PRIMARY KEY (Id_Comentario),
    CONSTRAINT UN_Comentario     UNIQUE		 (Comentario),
    CONSTRAINT FK_Funcionario_03 FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario),
    CONSTRAINT FK_Version_02     FOREIGN KEY (Id_Version)     REFERENCES Version (Id_Version)
    
);

CREATE TABLE Lista_Chequeo (

	Id_Lista_Chequeo  INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Lista_Chequeo VARCHAR(100) NOT NULL,
    Des_Lista_Chequeo VARCHAR(200) NOT NULL,
	Fecha_Creacion    TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    Id_Funcionario    INTEGER NOT NULL,
    
    CONSTRAINT PK_Lista_Chequeo  PRIMARY KEY (Id_Lista_Chequeo),
    CONSTRAINT UN_Lista_Chequeo_01  UNIQUE	     (Nom_Lista_Chequeo),
    CONSTRAINT UN_Lista_Chequeo_02	UNIQUE		 (Des_Lista_Chequeo),
    CONSTRAINT FK_Funcionario_04 FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario)
    
);

CREATE TABLE Item_Lista(

	Id_Item_Lista 	INTEGER NOT NULL AUTO_INCREMENT,
    Des_Item_Lista 	VARCHAR(300) NOT NULL,
    Tipo_Item		BOOLEAN NOT NULL, 
    
    CONSTRAINT PK_Item_Lista PRIMARY KEY (Id_Item_Lista),
    CONSTRAINT UN_Item_Lista UNIQUE      (Des_Item_Lista)
);

CREATE TABLE Detalles_Lista (

	Id_Detalles_Lista INTEGER NOT NULL AUTO_INCREMENT,
    Id_Lista_Chequeo  INTEGER NOT NULL,
    Id_Item_Lista     INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Lista 	PRIMARY KEY (Id_Detalles_Lista),
    CONSTRAINT UN_Detalles_Lista	UNIQUE		(Id_Lista_Chequeo,Id_Item_Lista),
    CONSTRAINT FK_Lista_Chequeo_01 	FOREIGN KEY (Id_Lista_Chequeo) REFERENCES Lista_Chequeo(Id_Lista_Chequeo),
    CONSTRAINT FK_Item_Lista    	FOREIGN KEY (Id_Item_Lista)	   REFERENCES Item_Lista(Id_Item_Lista)	
    
);
CREATE TABLE Evaluacion_General(

	Id_Evaluacion_General INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Evaluacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Observacion			  VARCHAR(250) NOT NULL,
    Resultado 			  BOOLEAN NOT NULL,
    Id_Version            INTEGER NOT NULL,
    Id_Lista_Chequeo      INTEGER NOT NULL,
    Id_Funcionario		  INTEGER NOT NULL,

	CONSTRAINT PK_Evaluacion_General PRIMARY KEY (Id_Evaluacion_General),
	CONSTRAINT FK_Version_03         FOREIGN KEY (Id_Version) 		REFERENCES Version (Id_Version),
    CONSTRAINT FK_Lista_Chequeo_02   FOREIGN KEY (Id_Lista_Chequeo) REFERENCES Lista_Chequeo(Id_Lista_Chequeo),
    CONSTRAINT FK_Funcionario_05     FOREIGN KEY (Id_Funcionario) 	REFERENCES Funcionario(Id_Funcionario)
);



CREATE TABLE Detalles_Evaluacion(

	Id_Detalles_Evaluacion INTEGER NOT NULL AUTO_INCREMENT,
    Valorizacion           BOOLEAN NOT NULL,
    Observacion 		   VARCHAR(200) NOT NULL,	
    Id_Detalles_Lista	   INTEGER NOT NULL,
    Id_Evaluacion_General  INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Evaluacion PRIMARY KEY (Id_Detalles_Evaluacion),
    CONSTRAINT FK_Detalles_Lista      FOREIGN KEY (Id_Detalles_Lista) 		REFERENCES Detalles_Lista (Id_Detalles_Lista),
    CONSTRAINT FK_Evaluacion_General  FOREIGN KEY (Id_Evaluacion_General) 	REFERENCES Evaluacion_General(Id_Evaluacion_General)
);

CREATE TABLE Categoria(
	
    Id_Categoria INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Categoria	VARCHAR(45) NOT NULL,
    Des_Categoria	VARCHAR(100) NOT NULL,
    Fecha_Creacion	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Id_Funcionario	INTEGER NOT NULL,
    
    CONSTRAINT PK_Categoria PRIMARY KEY (Id_Categoria),
    CONSTRAINT UN_Categoria_01	UNIQUE(Nom_Categoria),
    CONSTRAINT UN_Categoria_02	UNIQUE(Des_Categoria),
    CONSTRAINT FK_Funcionario_08	FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario (Id_Funcionario) 
);

CREATE TABLE Detalles_Categoria(
	
    Id_Detalles_Categoria INTEGER NOT NULL AUTO_INCREMENT,
    Id_Categoria	 	  INTEGER NOT NULL,
    Id_Tema				  INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Categoria PRIMARY KEY (Id_Detalles_Categoria),
    CONSTRAINT UN_Detalles_Categoria UNIQUE		 (Id_Categoria,Id_Tema),
    CONSTRAINT FK_Categoria		     FOREIGN KEY (Id_Categoria) REFERENCES Categoria (Id_Categoria),
    CONSTRAINT FK_Tema_03		     FOREIGN KEY (Id_Tema)		REFERENCES Tema		 (Id_Tema)
);


