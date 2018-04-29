DROP DATABASE IF EXISTS SARA008;
CREATE DATABASE SARA008;

USE SARA008;

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

CREATE TABLE Tipo_Formato (
	Id_Tipo_Formato INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Tipo_Formato VARCHAR(60) NOT NULL,
    UrlImgTipoFormato VARCHAR(100), -- CAMBION CON LAS IMAGENES
	
    CONSTRAINT PK_TipoFormato PRIMARY KEY (Id_Tipo_Formato),
    CONSTRAINT UN_TipoFormato UNIQUE(Nom_Tipo_Formato)
);


CREATE TABLE Formato(
	
    Id_Formato     INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Formato    VARCHAR(50) NOT NULL,
    Des_Formato    VARCHAR(100) NOT NULL,
    Id_Tipo_Formato INTEGER NOT NULL,
    
    CONSTRAINT PK_Formato 		PRIMARY KEY (Id_Formato),
    CONSTRAINT UN_Formato_01 	UNIQUE		(Nom_Formato),
    CONSTRAINT FK_TipoFormato   FOREIGN KEY (Id_Tipo_Formato) REFERENCES Tipo_Formato (Id_Tipo_Formato)
    
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
    Fecha_Publicacion 	 TIMESTAMP DEFAULT "2016-01-01",
    Num_Version 		 FLOAT DEFAULT 1,-- Cambio NUMERO VERSION
	Fecha_Vigencia 		 TIMESTAMP DEFAULT "2016-01-01",
    Url_Version			 VARCHAR (500),
    Url_Img				 VARCHAR (500),				
    Inst_Instalacion	 VARCHAR (800),
    Reqst_Instalacion    VARCHAR (500),
    Id_P_Virtual		 INTEGER NOT NULL,
	Id_Estado			 INTEGER NOT NULL DEFAULT 3,
	
	CONSTRAINT PK_Version      PRIMARY KEY (Id_Version),
    CONSTRAINT FK_P_Virtual_01 FOREIGN KEY (Id_P_Virtual)    REFERENCES Producto_Virtual(Id_P_Virtual),
    CONSTRAINT FK_Estado_01    FOREIGN KEY (Id_Estado)       REFERENCES Estado(Id_Estado)
);	

CREATE TABLE Rankin(

	Id_Rankin         INTEGER NOT NULL AUTO_INCREMENT,
    Puesto			    INTEGER NOT NULL DEFAULT 0,
    Cant_Visitas    INTEGER NOT NULL DEFAULT 0,
    Cant_Descargas	INTEGER NOT NULL DEFAULT 0,
    Cant_Votos      INTEGER NOT NULL DEFAULT 0,
    Id_Version		  INTEGER NOT NULL,
    
    CONSTRAINT PK_Rankin 	  PRIMARY KEY (Id_Rankin),
    CONSTRAINT FK_Version 	FOREIGN KEY (Id_Version) REFERENCES Version (Id_Version),
    CONSTRAINT UN_Rankin	  UNIQUE		(Id_Version)
    
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
    Contraseña      	VARCHAR(300),
    Id_Estado 	    	INTEGER NOT NULL DEFAULT 2,
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
    Ides_Proceso			INTEGER NOT NULL,
    Id_Tipo_Notificacion	INTEGER NOT NULL,
    Id_Funcionario 			INTEGER NOT NULL,
    Estado 					BOOLEAN NOT NULL DEFAULT 0,
    
    CONSTRAINT PK_Notificacion 		PRIMARY KEY (Id_Notificacion),
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
    Vigencia		   INTEGER(1) NOT NULL,
    
    CONSTRAINT PK_Rol_Funcionario PRIMARY KEY (Id_Rol_Funcionario),
    CONSTRAINT UN_Rol_Funcionario UNIQUE	  (Id_Rol,Id_Funcionario),
    CONSTRAINT FK_Rol_01		  FOREIGN KEY (Id_Rol)         REFERENCES Rol(Id_Rol),
	CONSTRAINT FK_Funcionario_01  FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario (Id_Funcionario)
    
);


CREATE TABLE Autor (

	Id_Autor       INTEGER NOT NULL AUTO_INCREMENT,
    Id_Version     INTEGER NOT NULL,
    Id_Funcionario INTEGER NOT NULL,
    Principal      BOOLEAN NOT NULL,
    
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


 CREATE TABLE Voto (
  
  Id_Voto         INTEGER NOT NULL AUTO_INCREMENT,
  Num_Voto        INTEGER(1) NOT NULL,
  Id_Funcionario  INTEGER NOT NULL,
  Id_Rankin       INTEGER NOT NULL,
  
  CONSTRAINT PK_Voto              PRIMARY KEY (Id_Voto),
  CONSTRAINT UN_Voto              UNIQUE (Num_Voto,Id_Funcionario,Id_Rankin),
  CONSTRAINT FK_Funcionario_Voto  FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario (Id_Funcionario),
  CONSTRAINT FK_Rankin            FOREIGN KEY (Id_Rankin) REFERENCES Rankin (Id_Rankin)
 );


CREATE TABLE Admin(
	Usuario INTEGER NOT NULL,
    Clave   VARCHAR(200) NOT NULL,
    CONSTRAINT UN_Admin UNIQUE(Usuario,Clave)
);

CREATE TABLE Toquen(
	Numero_Toquen VARCHAR(20) NOT NULL,
	Funcionario   INTEGER NOT NULL,
    FechaVigencia TIMESTAMP NOT NULL,
    
    CONSTRAINT PK_Toquen PRIMARY KEY (Numero_Toquen),
    CONSTRAINT UN_Toquen UNIQUE (Funcionario)
);

-- CALL SARA_CRUD("INSERT ","Admin","Usuario~1019|Clave~Sena","");
-- CALL SARA_CRUD("SELECT","Admin","","");

-- Tipo Estado----------------------------------------------------------

CREATE TABLE Tipo_Estado_Log(
    Id_Tipo_Estado_Log 	INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log            TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log             CHAR(1) NOT NULL,
    Id_Tipo_Estado      INTEGER NOT NULL,
    Nom_Tipo_Estado     VARCHAR(50) NOT NULL,
    
    CONSTRAINT PK_Tipo_Estado_Log PRIMARY KEY (Id_Tipo_Estado_Log)
);

DROP TRIGGER IF EXISTS TipoEstado_Insert ;
DELIMITER ;;
CREATE TRIGGER TipoEstado_Insert AFTER INSERT ON Tipo_Estado FOR EACH ROW
BEGIN
  INSERT INTO Tipo_Estado_Log (Tipo_Log,Id_Tipo_Estado,Nom_Tipo_Estado) 
  VALUES ('I',NEW.Id_Tipo_Estado,NEW.Nom_Tipo_Estado);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS TipoEstado_Update;
DELIMITER ;;
CREATE TRIGGER TipoEstado_Update AFTER UPDATE  ON Tipo_Estado FOR EACH ROW
BEGIN
  INSERT INTO Tipo_Estado_Log (Tipo_Log,Id_Tipo_Estado,Nom_Tipo_Estado) 
  VALUES ('U',NEW.Id_Tipo_Estado,NEW.Nom_Tipo_Estado);
END;;
DELIMITER ;

-- Estado -------------------------------------------------------------

CREATE TABLE Estado_Log(
	
    Id_Estado_Log     INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log           CHAR(1) NOT NULL,
    Id_Estado         INTEGER NOT NULL,
    Nom_Estado 	      VARCHAR(50) NOT NULL,
    Id_Tipo_Estado 	  INTEGER NOT NULL,
    
    CONSTRAINT PK_Estado_Log      PRIMARY KEY 	(Id_Estado_Log)
);

DROP TRIGGER IF EXISTS Estado_Insert ;
DELIMITER ;;
CREATE TRIGGER Estado_Insert AFTER INSERT ON Estado FOR EACH ROW
BEGIN
  INSERT INTO Estado_Log (Tipo_Log,Id_Estado,Nom_Estado,Id_Tipo_Estado) 
  VALUES ('I',NEW.Id_Estado,NEW.Nom_Estado,NEW.Id_Tipo_Estado);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Estado_Update;
DELIMITER ;;
CREATE TRIGGER Estado_Update AFTER UPDATE  ON Estado FOR EACH ROW
BEGIN
  INSERT INTO Estado_Log (Tipo_Log,Id_Estado,Nom_Estado,Id_Tipo_Estado) 
  VALUES ('U',NEW.Id_Estado,NEW.Nom_Estado,NEW.Id_Tipo_Estado);
END;;
DELIMITER ;


-- Tipo_Formato--------------------------------------------------------
CREATE TABLE Tipo_Formato_Log(
	  Id_Tipo_Formato_Log   INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log               CHAR(1) NOT NULL,
    Id_Tipo_Formato       INTEGER NOT NULL,
    Nom_Tipo_Formato      VARCHAR(60) NOT NULL,
	
    CONSTRAINT PK_TipoFormato_Log PRIMARY KEY (Id_Tipo_Formato_Log)
);

DROP TRIGGER IF EXISTS Tipo_Formato_Insert ;
DELIMITER ;;
CREATE TRIGGER Tipo_Formato_Insert AFTER INSERT ON Tipo_Formato FOR EACH ROW
BEGIN
  INSERT INTO Tipo_Formato_Log (Tipo_Log,Id_Tipo_Formato,Nom_Tipo_Formato) 
  VALUES ('I',NEW.Id_Tipo_Formato,NEW.Nom_Tipo_Formato);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Tipo_Formato_Update;
DELIMITER ;;
CREATE TRIGGER Tipo_Formato_Update AFTER UPDATE  ON Tipo_Formato FOR EACH ROW
BEGIN
  INSERT INTO Tipo_Formato_Log (Tipo_Log,Id_Tipo_Formato,Nom_Tipo_Formato) 
  VALUES ('U',NEW.Id_Tipo_Formato,NEW.Nom_Tipo_Formato);
END;;
DELIMITER ;

-- Formato ---------------------------------------------------------------

CREATE TABLE Formato_Log(
	
    Id_Formato_Log    INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log           CHAR(1) NOT NULL,
    Id_Formato        INTEGER NOT NULL,
    Nom_Formato       VARCHAR(50) NOT NULL,
    Des_Formato       VARCHAR(100) NOT NULL,
    Id_Tipo_Formato   INTEGER NOT NULL,
    
    CONSTRAINT PK_Formato_Log		PRIMARY KEY (Id_Formato_Log)
);

DROP TRIGGER IF EXISTS Formato_Insert ;
DELIMITER ;;
CREATE TRIGGER Formato_Insert AFTER INSERT ON Formato FOR EACH ROW
BEGIN
  INSERT INTO Formato_Log (Tipo_Log,Id_Formato,Nom_Formato,Des_Formato,Id_Tipo_Formato) 
  VALUES ('I',NEW.Id_Formato,NEW.Nom_Formato,NEW.Des_Formato,NEW.Id_Tipo_Formato);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Formato_Update;
DELIMITER ;;
CREATE TRIGGER Formato_Update AFTER UPDATE  ON Formato FOR EACH ROW
BEGIN
  INSERT INTO Formato_Log (Tipo_Log,Id_Formato,Nom_Formato,Des_Formato,Id_Tipo_Formato) 
  VALUES ('U',NEW.Id_Formato,NEW.Nom_Formato,NEW.Des_Formato,NEW.Id_Tipo_Formato);
END;;
DELIMITER ;

-- Producto Virtual -----------------------------------------------------------------
CREATE TABLE Producto_Virtual_Log(
	
    Id_P_Virtual_Log  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log          CHAR(1) NOT NULL,
    Id_P_Virtual      INTEGER NOT NULL,
    Nom_P_Virtual     VARCHAR(100) NOT NULL,
    Des_P_Virtual	    VARCHAR(200) NOT NULL,
    Palabras_Clave	  VARCHAR(100) NOT NULL,
    Id_Formato 	      INTEGER NOT NULL,
    
    CONSTRAINT PK_P_Virtual_Log 	PRIMARY KEY (Id_P_Virtual_Log)

);

DROP TRIGGER IF EXISTS Producto_Virtual_Insert ;
DELIMITER ;;
CREATE TRIGGER Producto_Virtual_Insert AFTER INSERT ON Producto_Virtual FOR EACH ROW
BEGIN
  INSERT INTO Producto_Virtual_Log (Tipo_Log,Id_P_Virtual,Nom_P_Virtual,Des_P_Virtual,Palabras_Clave,Id_Formato) 
  VALUES ('I',NEW.Id_P_Virtual,NEW.Nom_P_Virtual,NEW.Des_P_Virtual,NEW.Palabras_Clave,NEW.Id_Formato);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Producto_Virtual_Update;
DELIMITER ;;
CREATE TRIGGER Producto_Virtual_Update AFTER UPDATE  ON Producto_Virtual FOR EACH ROW
BEGIN
  INSERT INTO Producto_Virtual_Log (Tipo_Log,Id_P_Virtual,Nom_P_Virtual,Des_P_Virtual,Palabras_Clave,Id_Formato) 
  VALUES ('U',NEW.Id_P_Virtual,NEW.Nom_P_Virtual,NEW.Des_P_Virtual,NEW.Palabras_Clave,NEW.Id_Formato);
END;;
DELIMITER ;


-- Version -----------------------------------------------------------------

CREATE TABLE Version_Log (
    Id_Version_Log      INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log            CHAR(1) NOT NULL,
	  Id_Version          INTEGER NOT NULL,
    Fecha_Envio         TIMESTAMP NOT NULL,
    Fecha_Publicacion   TIMESTAMP NOT NULL,
    Num_Version 		    FLOAT NOT NULL,
	  Fecha_Vigencia 		  TIMESTAMP NOT NULL,
    Url_Version			    VARCHAR (500),
    Url_Img				      VARCHAR (500),				
    Inst_Instalacion	  VARCHAR (800),
    Reqst_Instalacion   VARCHAR (500),
    Id_P_Virtual		    INTEGER NOT NULL,
	  Id_Estado			      INTEGER NOT NULL,
	
	CONSTRAINT PK_Version_Log      PRIMARY KEY (Id_Version_Log)
);	

DROP TRIGGER IF EXISTS Version_Insert ;
DELIMITER ;;
CREATE TRIGGER Version_Insert AFTER INSERT ON Version FOR EACH ROW
BEGIN
  INSERT INTO Version_Log (Tipo_Log,Id_Version,Fecha_Envio,Fecha_Publicacion,Num_Version,Fecha_Vigencia,Url_Version,Url_Img,Inst_Instalacion,Reqst_Instalacion,Id_P_Virtual,Id_Estado) 
  VALUES ('I',NEW.Id_Version,NEW.Fecha_Envio,NEW.Fecha_Publicacion,NEW.Num_Version,NEW.Fecha_Vigencia,NEW.Url_Version,NEW.Url_Img,NEW.Inst_Instalacion,NEW.Reqst_Instalacion,NEW.Id_P_Virtual,NEW.Id_Estado);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Version_Update;
DELIMITER ;;
CREATE TRIGGER Version_Update AFTER UPDATE  ON Version FOR EACH ROW
BEGIN
  INSERT INTO Version_Log (Tipo_Log,Id_Version,Fecha_Envio,Fecha_Publicacion,Num_Version,Fecha_Vigencia,Url_Version,Url_Img,Inst_Instalacion,Reqst_Instalacion,Id_P_Virtual,Id_Estado) 
  VALUES ('U',NEW.Id_Version,NEW.Fecha_Envio,NEW.Fecha_Publicacion,NEW.Num_Version,NEW.Fecha_Vigencia,NEW.Url_Version,NEW.Url_Img,NEW.Inst_Instalacion,NEW.Reqst_Instalacion,NEW.Id_P_Virtual,NEW.Id_Estado);
END;;
DELIMITER ;

-- Rankin -----------------------------------------------------------------

CREATE TABLE Rankin_Log(

	  Id_Rankin_Log   INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log        CHAR(1) NOT NULL,
    Id_Rankin       INTEGER NOT NULL,
    Puesto			    INTEGER NOT NULL,
    Cant_Visitas    INTEGER NOT NULL,
    Cant_Descargas	INTEGER NOT NULL,
    Cant_Votos      INTEGER NOT NULL,
    Id_Version		  INTEGER NOT NULL,
    
    CONSTRAINT PK_Rankin_Log 	  PRIMARY KEY (Id_Rankin_Log)
);

DROP TRIGGER IF EXISTS Rankin_Insert ;
DELIMITER ;;
CREATE TRIGGER Rankin_Insert AFTER INSERT ON Rankin FOR EACH ROW
BEGIN
  INSERT INTO Rankin_Log (Tipo_Log,Id_Rankin,Puesto,Cant_Visitas,Cant_Descargas,Cant_Votos,Id_Version) 
  VALUES ('I',NEW.Id_Rankin,NEW.Puesto,NEW.Cant_Visitas,NEW.Cant_Descargas,NEW.Cant_Votos,NEW.Id_Version);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Rankin_Update;
DELIMITER ;;
CREATE TRIGGER Rankin_Update AFTER UPDATE  ON Rankin FOR EACH ROW
BEGIN
  INSERT INTO Rankin_Log (Tipo_Log,Id_Rankin,Puesto,Cant_Visitas,Cant_Descargas,Cant_Votos,Id_Version) 
  VALUES ('U',NEW.Id_Rankin,NEW.Puesto,NEW.Cant_Visitas,NEW.Cant_Descargas,NEW.Cant_Votos,NEW.Id_Version);
END;;
DELIMITER ;

-- Voto -----------------------------------------------------------------

 CREATE TABLE Voto_Log (
  
  Id_Voto_Log     INTEGER NOT NULL AUTO_INCREMENT,
  Fecha_Log       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  Tipo_Log        CHAR(1) NOT NULL,
  Id_Voto         INTEGER NOT NULL,
  Num_Voto        INTEGER(1) NOT NULL,
  Id_Funcionario  INTEGER NOT NULL,
  Id_Rankin       INTEGER NOT NULL,
  
  CONSTRAINT PK_Voto_Log     PRIMARY KEY (Id_Voto_Log)
 );
 
 DROP TRIGGER IF EXISTS Voto_Insert ;
DELIMITER ;;
CREATE TRIGGER Voto_Insert AFTER INSERT ON Voto FOR EACH ROW
BEGIN
  INSERT INTO Voto_Log (Tipo_Log,Id_Voto,Num_Voto,Id_Funcionario,Id_Rankin) 
  VALUES ('I',NEW.Id_Voto,NEW.Num_Voto,NEW.Id_Funcionario,NEW.Id_Rankin);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Voto_Update;
DELIMITER ;;
CREATE TRIGGER Voto_Update AFTER UPDATE  ON Voto FOR EACH ROW
BEGIN
  INSERT INTO Voto_Log (Tipo_Log,Id_Voto,Num_Voto,Id_Funcionario,Id_Rankin) 
  VALUES ('U',NEW.Id_Voto,NEW.Num_Voto,NEW.Id_Funcionario,NEW.Id_Rankin);
END;;
DELIMITER ;


-- Tema -----------------------------------------------------------------

CREATE TABLE Tema_Log(

	Id_Tema_Log   INTEGER NOT NULL AUTO_INCREMENT,
  Fecha_Log     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  Tipo_Log      CHAR(1) NOT NULL,
  Id_Tema       INTEGER NOT NULL,
  Nom_Tema      VARCHAR(45) NOT NULL,
  Des_Tema      VARCHAR(100) NOT NULL,
    
  CONSTRAINT PK_Tema_Log 		PRIMARY KEY (Id_Tema_Log)
    
);

DROP TRIGGER IF EXISTS Tema_Insert ;
DELIMITER ;;
CREATE TRIGGER Tema_Insert AFTER INSERT ON Tema FOR EACH ROW
BEGIN
  INSERT INTO Tema_Log (Tipo_Log,Id_Tema,Nom_Tema,Des_Tema) 
  VALUES ('I',NEW.Id_Tema,NEW.Nom_Tema,NEW.Des_Tema);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Tema_Update;
DELIMITER ;;
CREATE TRIGGER Tema_Update AFTER UPDATE  ON Tema FOR EACH ROW
BEGIN
  INSERT INTO Tema_Log (Tipo_Log,Id_Tema,Nom_Tema,Des_Tema) 
  VALUES ('U',NEW.Id_Tema,NEW.Nom_Tema,NEW.Des_Tema);
END;;
DELIMITER ;



-- Detalles_Tema -----------------------------------------------------------------

CREATE TABLE Detalles_Tema_Log(

	  Id_Detalles_Tema_Log  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log              CHAR(1) NOT NULL,
    Id_Detalles_Tema      INTEGER NOT NULL,
    Id_Tema               INTEGER NOT NULL,
    Id_P_Virtual          INTEGER NOT NULL,
    Tipo_Tema		          BOOLEAN NOT NULL ,  -- DETERMINA SI TIENE UNA RELACION CON CATEGORIA(0) O CON PROGRAMA(1) 
    
    CONSTRAINT PK_Detalles_Tema_Log    PRIMARY KEY (Id_Detalles_Tema_Log)
    
);

DROP TRIGGER IF EXISTS Detalles_Tema_Insert ;
DELIMITER ;;
CREATE TRIGGER Detalles_Tema_Insert AFTER INSERT ON Detalles_Tema FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Tema_Log (Tipo_Log,Id_Detalles_Tema,Id_Tema,Id_P_Virtual,Tipo_Tema) 
  VALUES ('I',NEW.Id_Detalles_Tema,NEW.Id_Tema,NEW.Id_P_Virtual,NEW.Tipo_Tema);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Detalles_Tema_Update;
DELIMITER ;;
CREATE TRIGGER Detalles_Tema_Update AFTER UPDATE  ON Detalles_Tema FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Tema_Log (Tipo_Log,Id_Detalles_Tema,Id_Tema,Id_P_Virtual,Tipo_Tema) 
  VALUES ('U',NEW.Id_Detalles_Tema,NEW.Id_Tema,NEW.Id_P_Virtual,NEW.Tipo_Tema);
END;;
DELIMITER ;


-- Programa -----------------------------------------------------------------

CREATE TABLE Programa_Log(
	
    Id_Programa_Log     INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log            CHAR(1) NOT NULL,
    Id_Programa         INTEGER NOT NULL,
	  Nom_Programa        VARCHAR(100) NOT NULL,
    Nivel_Formacion     VARCHAR(45) NOT NULL,
    
    CONSTRAINT PK_Programa_Log PRIMARY KEY 	(Id_Programa_Log)
);


DROP TRIGGER IF EXISTS Programa_Insert ;
DELIMITER ;;
CREATE TRIGGER Programa_Insert AFTER INSERT ON Programa FOR EACH ROW
BEGIN
  INSERT INTO Programa_Log (Tipo_Log,Id_Programa,Nom_Programa,Nivel_Formacion) 
  VALUES ('I',NEW.Id_Programa,NEW.Nom_Programa,NEW.Nivel_Formacion);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Programa_Update;
DELIMITER ;;
CREATE TRIGGER Programa_Update AFTER UPDATE  ON Programa FOR EACH ROW
BEGIN
  INSERT INTO Programa_Log (Tipo_Log,Id_Programa,Nom_Programa,Nivel_Formacion) 
  VALUES ('U',NEW.Id_Programa,NEW.Nom_Programa,NEW.Nivel_Formacion);
END;;
DELIMITER ;


-- Detalles_Programa -----------------------------------------------------------------

CREATE TABLE Detalles_Programa_Log(

	  Id_Detalles_Programa_Log    INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log                   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                    CHAR(1) NOT NULL,
    Id_Detalles_Programa        INTEGER NOT NULL,
    Id_Tema                     INTEGER NOT NULL,
    Id_Programa                 INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Programa_Log PRIMARY KEY (Id_Detalles_Programa_Log)
);

DROP TRIGGER IF EXISTS Detalles_Programa_Insert ;
DELIMITER ;;
CREATE TRIGGER Detalles_Programa_Insert AFTER INSERT ON Detalles_Programa FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Programa_Log (Tipo_Log,Id_Detalles_Programa,Id_Tema,Id_Programa) 
  VALUES ('I',NEW.Id_Detalles_Programa,NEW.Id_Tema,NEW.Id_Programa);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Detalles_Programa_Update;
DELIMITER ;;
CREATE TRIGGER Detalles_Programa_Update AFTER UPDATE  ON Detalles_Programa FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Programa_Log (Tipo_Log,Id_Detalles_Programa,Id_Tema,Id_Programa) 
  VALUES ('U',NEW.Id_Detalles_Programa,NEW.Id_Tema,NEW.Id_Programa);
END;;
DELIMITER ;



-- Area -----------------------------------------------------------------

CREATE TABLE Area_Log (

	  Id_Area_Log   INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log      CHAR(1) NOT NULL,
    Id_Area       INTEGER NOT NULL,
    Nom_Area      VARCHAR(100) NOT NULL,
    Lider_Area    VARCHAR(70) NOT NULL,
    
    CONSTRAINT PK_Area_Log PRIMARY KEY (Id_Area_Log)
);

DROP TRIGGER IF EXISTS Area_Insert ;
DELIMITER ;;
CREATE TRIGGER Area_Insert AFTER INSERT ON Area FOR EACH ROW
BEGIN
  INSERT INTO Area_Log (Tipo_Log,Id_Area,Nom_Area,Lider_Area) 
  VALUES ('I',NEW.Id_Area,NEW.Nom_Area,NEW.Lider_Area);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Area_Update;
DELIMITER ;;
CREATE TRIGGER Area_Update AFTER UPDATE  ON Area FOR EACH ROW
BEGIN
  INSERT INTO Area_Log (Tipo_Log,Id_Area,Nom_Area,Lider_Area) 
  VALUES ('U',NEW.Id_Area,NEW.Nom_Area,NEW.Lider_Area); 
END;;
DELIMITER ;



-- Detalles_Area -----------------------------------------------------------------

CREATE TABLE Detalles_Area_Log(

	  Id_Detalles_Area_Log  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log              CHAR(1) NOT NULL,
    Id_Detalles_Area      INTEGER NOT NULL,
    Id_Area               INTEGER NOT NULL,
    Id_Programa           INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Area_Log PRIMARY KEY (Id_Detalles_Area_Log)
);

DROP TRIGGER IF EXISTS Detalles_Area_Insert ;
DELIMITER ;;
CREATE TRIGGER Detalles_Area_Insert AFTER INSERT ON Detalles_Area FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Area_Log (Tipo_Log,Id_Detalles_Area,Id_Area,Id_Programa) 
  VALUES ('I',NEW.Id_Detalles_Area,NEW.Id_Area,NEW.Id_Programa);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Detalles_Area_Update;
DELIMITER ;;
CREATE TRIGGER Detalles_Area_Update AFTER UPDATE  ON Detalles_Area FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Area_Log (Tipo_Log,Id_Detalles_Area,Id_Area,Id_Programa) 
  VALUES ('U',NEW.Id_Detalles_Area,NEW.Id_Area,NEW.Id_Programa);
END;;
DELIMITER ;




-- Ciudad -----------------------------------------------------------------
CREATE TABLE Ciudad_Log(
	
    Id_Ciudad_Log   INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log        CHAR(1) NOT NULL,
    Id_Ciudad       INTEGER NOT NULL,
    Nom_Ciudad      VARCHAR(75) NOT NULL,
    
    CONSTRAINT PK_Ciudad_Log    PRIMARY KEY (Id_Ciudad_Log)
);

DROP TRIGGER IF EXISTS Ciudad_Insert ;
DELIMITER ;;
CREATE TRIGGER Ciudad_Insert AFTER INSERT ON Ciudad FOR EACH ROW
BEGIN
  INSERT INTO Ciudad_Log (Tipo_Log,Id_Ciudad,Nom_Ciudad) 
  VALUES ('I',NEW.Id_Ciudad,NEW.Nom_Ciudad);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Ciudad_Update;
DELIMITER ;;
CREATE TRIGGER Ciudad_Update AFTER UPDATE  ON Ciudad FOR EACH ROW
BEGIN
  INSERT INTO Ciudad_Log (Tipo_Log,Id_Ciudad,Nom_Ciudad) 
  VALUES ('U',NEW.Id_Ciudad,NEW.Nom_Ciudad);
END;;
DELIMITER ;



-- Centro -----------------------------------------------------------------

CREATE TABLE Centro_Log(
	
	  Id_Centro_Log   INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log        CHAR(1) NOT NULL,
    Id_Centro       INTEGER NOT NULL,
    Num_Centro      VARCHAR(50) NOT NULL,
    Nom_Centro      VARCHAR(100) NOT NULL,
    Direccion       VARCHAR(100) NOT NULL,
    Id_Ciudad 	    INTEGER NOT NULL,
    
    CONSTRAINT PK_Centro_Log 	PRIMARY KEY 	(Id_Centro_Log)
);

DROP TRIGGER IF EXISTS Centro_Insert ;
DELIMITER ;;
CREATE TRIGGER Centro_Insert AFTER INSERT ON Centro FOR EACH ROW
BEGIN
  INSERT INTO Centro_Log (Tipo_Log,Id_Centro,Num_Centro,Nom_Centro,Direccion,Id_Ciudad) 
  VALUES ('I',NEW.Id_Centro,NEW.Num_Centro,NEW.Nom_Centro,NEW.Direccion,NEW.Id_Ciudad);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Centro_Update;
DELIMITER ;;
CREATE TRIGGER Centro_Update AFTER UPDATE  ON Centro FOR EACH ROW
BEGIN
  INSERT INTO Centro_Log (Tipo_Log,Id_Centro,Num_Centro,Nom_Centro,Direccion,Id_Ciudad) 
  VALUES ('U',NEW.Id_Centro,NEW.Num_Centro,NEW.Nom_Centro,NEW.Direccion,NEW.Id_Ciudad);
END;;
DELIMITER ;


-- Area_Centro -----------------------------------------------------------------

CREATE TABLE Area_Centro_Log(

	  Id_Area_Centro_Log  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log            CHAR(1) NOT NULL,
    Id_Area_Centro      INTEGER NOT NULL,
    Id_Area             INTEGER NOT NULL,
    Id_Centro	          INTEGER NOT NULL,
	
	CONSTRAINT PK_Area_Centro_Log PRIMARY KEY (Id_Area_Centro_Log)	
);

DROP TRIGGER IF EXISTS Area_Centro_Insert ;
DELIMITER ;;
CREATE TRIGGER Area_Centro_Insert AFTER INSERT ON Area_Centro FOR EACH ROW
BEGIN
  INSERT INTO Area_Centro_Log (Tipo_Log,Id_Area_Centro,Id_Area,Id_Centro) 
  VALUES ('I',NEW.Id_Area_Centro,NEW.Id_Area,NEW.Id_Centro);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Area_Centro_Update;
DELIMITER ;;
CREATE TRIGGER Area_Centro_Update AFTER UPDATE  ON Area_Centro FOR EACH ROW
BEGIN
  INSERT INTO Area_Centro_Log (Tipo_Log,Id_Area_Centro,Id_Area,Id_Centro) 
  VALUES ('U',NEW.Id_Area_Centro,NEW.Id_Area,NEW.Id_Centro);
END;;
DELIMITER ;



-- Tipo_Documento -----------------------------------------------------------------

CREATE TABLE Tipo_Documento_Log(

	  Id_Tipo_Documento_Log   INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                CHAR(1) NOT NULL,
    Id_Tipo_Documento       INTEGER NOT NULL,
    Nom_Tipo_Documento      VARCHAR (100) NOT NULL,
    
    CONSTRAINT PK_Tipo_Documento_Log PRIMARY KEY (Id_Tipo_Documento_Log)
);

DROP TRIGGER IF EXISTS Tipo_Documento_Insert ;
DELIMITER ;;
CREATE TRIGGER Tipo_Documento_Insert AFTER INSERT ON Tipo_Documento FOR EACH ROW
BEGIN
  INSERT INTO Tipo_Documento_Log (Tipo_Log,Id_Tipo_Documento,Nom_Tipo_Documento) 
  VALUES ('I',NEW.Id_Tipo_Documento,NEW.Nom_Tipo_Documento);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Tipo_Documento_Update;
DELIMITER ;;
CREATE TRIGGER Tipo_Documento_Update AFTER UPDATE  ON Tipo_Documento FOR EACH ROW
BEGIN
  INSERT INTO Tipo_Documento_Log (Tipo_Log,Id_Tipo_Documento,Nom_Tipo_Documento) 
  VALUES ('U',NEW.Id_Tipo_Documento,NEW.Nom_Tipo_Documento);
END;;
DELIMITER ;


-- Funcionario -----------------------------------------------------------------

CREATE TABLE Funcionario_Log(

	  Id_Funcionario_Log  	INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log              CHAR(1) NOT NULL,
    Id_Funcionario  	    INTEGER NOT NULL,
    Id_Tipo_Documento	    INTEGER NOT NULL,
    Num_Documento   	    DOUBLE NOT NULL,
	  Nom_Funcionario 	    VARCHAR(45) NOT NULL,
    Apellidos       	    VARCHAR(100) NOT NULL,
    Correo				        VARCHAR(125) NOT NULL,
    Cargo 				        VARCHAR(45) NOT NULL,
    Ip_Sena				        VARCHAR(6) NOT NULL,
    Contraseña      	    VARCHAR(300),
    Id_Estado 	    	    INTEGER NOT NULL,
    Id_Area_Centro 		    INTEGER NOT NULL,
    
    CONSTRAINT PK_Funcionario_Log 			PRIMARY KEY (Id_Funcionario_Log)
    
);


DROP TRIGGER IF EXISTS Funcionario_Insert ;
DELIMITER ;;
CREATE TRIGGER Funcionario_Insert AFTER INSERT ON Funcionario FOR EACH ROW
BEGIN
  INSERT INTO Funcionario_Log (Tipo_Log,Id_Funcionario,Id_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,Correo,Cargo,Ip_Sena,Contraseña,Id_Estado,Id_Area_Centro) 
  VALUES ('I',NEW.Id_Funcionario,NEW.Id_Tipo_Documento,NEW.Num_Documento,NEW.Nom_Funcionario,NEW.Apellidos,NEW.Correo,NEW.Cargo,NEW.Ip_Sena,NEW.Contraseña,NEW.Id_Estado,NEW.Id_Area_Centro);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Funcionario_Update;
DELIMITER ;;
CREATE TRIGGER Funcionario_Update AFTER UPDATE  ON Funcionario FOR EACH ROW
BEGIN
  INSERT INTO Funcionario_Log (Tipo_Log,Id_Funcionario,Id_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,Correo,Cargo,Ip_Sena,Contraseña,Id_Estado,Id_Area_Centro) 
  VALUES ('U',NEW.Id_Funcionario,NEW.Id_Tipo_Documento,NEW.Num_Documento,NEW.Nom_Funcionario,NEW.Apellidos,NEW.Correo,NEW.Cargo,NEW.Ip_Sena,NEW.Contraseña,NEW.Id_Estado,NEW.Id_Area_Centro);

END;;
DELIMITER ;



-- Tipo_Notificacion -----------------------------------------------------------------

CREATE TABLE Tipo_Notificacion_Log(
	
    Id_Tipo_Notificacion_Log  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                  CHAR(1) NOT NULL,
    Id_Tipo_Notificacion      INTEGER NOT NULL,
    Nom_Tipo_Notif		        VARCHAR(70) NOT NULL,
    Des_Tipo_Notif	          VARCHAR(150) NOT NULL,
    
    CONSTRAINT PK_Tipo_Notificacion_Log 	PRIMARY KEY (Id_Tipo_Notificacion_Log)
);


DROP TRIGGER IF EXISTS Tipo_Notificacion_Insert ;
DELIMITER ;;
CREATE TRIGGER Tipo_Notificacion_Insert AFTER INSERT ON Tipo_Notificacion FOR EACH ROW
BEGIN
  INSERT INTO Tipo_Notificacion_Log (Tipo_Log,Id_Tipo_Notificacion,Nom_Tipo_Notif,Des_Tipo_Notif) 
  VALUES ('I',NEW.Id_Tipo_Notificacion,NEW.Nom_Tipo_Notif,NEW.Des_Tipo_Notif);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Tipo_Notificacion_Update;
DELIMITER ;;
CREATE TRIGGER Tipo_Notificacion_Update AFTER UPDATE  ON Tipo_Notificacion FOR EACH ROW
BEGIN
  INSERT INTO Tipo_Notificacion_Log (Tipo_Log,Id_Tipo_Notificacion,Nom_Tipo_Notif,Des_Tipo_Notif) 
  VALUES ('U',NEW.Id_Tipo_Notificacion,NEW.Nom_Tipo_Notif,NEW.Des_Tipo_Notif);
END;;
DELIMITER ;



-- Notificacion -----------------------------------------------------------------

CREATE TABLE Notificacion_Log(
	
    Id_Notificacion_Log 		INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                CHAR(1) NOT NULL,
    Id_Notificacion 		    INTEGER NOT NULL,
    Fecha_Envio				      TIMESTAMP NOT NULL,
    Conte_Notificacion 		  VARCHAR(600) NOT NULL,
    Ides_Proceso			      INTEGER NOT NULL,
    Id_Tipo_Notificacion	  INTEGER NOT NULL,
    Id_Funcionario 			    INTEGER NOT NULL,
    Estado 					        BOOLEAN NOT NULL,-- 0 no se ha visualizado, 1 ya se visualizo 
    
    CONSTRAINT PK_Notificacion_Log 		PRIMARY KEY (Id_Notificacion_Log)
);

DROP TRIGGER IF EXISTS Notificacion_Insert ;
DELIMITER ;;
CREATE TRIGGER Notificacion_Insert AFTER INSERT ON Notificacion FOR EACH ROW
BEGIN
  INSERT INTO Notificacion_Log (Tipo_Log,Id_Notificacion,Fecha_Envio,Conte_Notificacion,Ides_Proceso,Id_Tipo_Notificacion,Id_Funcionario,Estado) 
  VALUES ('I',NEW.Id_Notificacion,NEW.Fecha_Envio,NEW.Conte_Notificacion,NEW.Ides_Proceso,NEW.Id_Tipo_Notificacion,NEW.Id_Funcionario,NEW.Estado);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Notificacion_Update;
DELIMITER ;;
CREATE TRIGGER Notificacion_Update AFTER UPDATE  ON Notificacion FOR EACH ROW
BEGIN
  INSERT INTO Notificacion_Log (Tipo_Log,Id_Notificacion,Fecha_Envio,Conte_Notificacion,Ides_Proceso,Id_Tipo_Notificacion,Id_Funcionario,Estado) 
  VALUES ('U',NEW.Id_Notificacion,NEW.Fecha_Envio,NEW.Conte_Notificacion,NEW.Ides_Proceso,NEW.Id_Tipo_Notificacion,NEW.Id_Funcionario,NEW.Estado);
END;;
DELIMITER ;



-- Detalles_Notificacion -----------------------------------------------------------------

CREATE TABLE Detalles_Notificacion_Log(
	
    Id_Detalles_Notificacion_Log  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log                     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                      CHAR(1) NOT NULL,
    Id_Detalles_Notificacion      INTEGER NOT NULL,
    Id_Notificacion               INTEGER NOT NULL,
    Id_Funcionario                INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Notificacion_Log PRIMARY KEY (Id_Detalles_Notificacion_Log)
);


DROP TRIGGER IF EXISTS Detalles_Notificacion_Insert ;
DELIMITER ;;
CREATE TRIGGER Detalles_Notificacion_Insert AFTER INSERT ON Detalles_Notificacion FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Notificacion_Log (Tipo_Log,Id_Detalles_Notificacion,Id_Notificacion,Id_Funcionario) 
  VALUES ('I',NEW.Id_Detalles_Notificacion,NEW.Id_Notificacion,NEW.Id_Funcionario);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Detalles_Notificacion_Update;
DELIMITER ;;
CREATE TRIGGER Detalles_Notificacion_Update AFTER UPDATE  ON Detalles_Notificacion FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Notificacion_Log (Tipo_Log,Id_Detalles_Notificacion,Id_Notificacion,Id_Funcionario) 
  VALUES ('U',NEW.Id_Detalles_Notificacion,NEW.Id_Notificacion,NEW.Id_Funcionario);
END;;
DELIMITER ;


-- Rol -----------------------------------------------------------------

CREATE TABLE Rol_Log(

	  Id_Rol_Log  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log    CHAR(1) NOT NULL,
    Id_Rol      INTEGER NOT NULL,
    Nom_Rol     VARCHAR(45) NOT NULL,
    Des_Rol     VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Rol_Log 		PRIMARY KEY (Id_Rol_Log)
);

DROP TRIGGER IF EXISTS Rol_Insert ;
DELIMITER ;;
CREATE TRIGGER Rol_Insert AFTER INSERT ON Rol FOR EACH ROW
BEGIN
  INSERT INTO Rol_Log (Tipo_Log,Id_Rol,Nom_Rol,Des_Rol) 
  VALUES ('I',NEW.Id_Rol,NEW.Nom_Rol,NEW.Des_Rol);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Rol_Update;
DELIMITER ;;
CREATE TRIGGER Rol_Update AFTER UPDATE  ON Rol FOR EACH ROW
BEGIN
  INSERT INTO Rol_Log (Tipo_Log,Id_Rol,Nom_Rol,Des_Rol) 
  VALUES ('U',NEW.Id_Rol,NEW.Nom_Rol,NEW.Des_Rol);
END;;
DELIMITER ;




-- RoRol_Funcionario -----------------------------------------------------------------

CREATE TABLE Rol_Funcionario_Log(

	Id_Rol_Funcionario_Log  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                CHAR(1) NOT NULL,
    Id_Rol_Funcionario      INTEGER NOT NULL,
    Id_Rol                  INTEGER NOT NULL,
    Id_Funcionario          INTEGER NOT NULL,
	Vigencia				INTEGER(1) NOT NULL,
    
    CONSTRAINT PK_Rol_Funcionario_Log PRIMARY KEY (Id_Rol_Funcionario_Log)
    
);

DROP TRIGGER IF EXISTS Rol_Funcionario_Insert ;
DELIMITER ;;
CREATE TRIGGER Rol_Funcionario_Insert AFTER INSERT ON Rol_Funcionario FOR EACH ROW
BEGIN
  INSERT INTO Rol_Funcionario_Log (Tipo_Log,Id_Rol_Funcionario,Id_Rol,Id_Funcionario,Vigencia) 
  VALUES ('I',NEW.Id_Rol_Funcionario,NEW.Id_Rol,NEW.Id_Funcionario,NEW.Vigencia);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Rol_Funcionario_Update;
DELIMITER ;;
CREATE TRIGGER Rol_Funcionario_Update AFTER UPDATE  ON Rol_Funcionario FOR EACH ROW
BEGIN
  INSERT INTO Rol_Funcionario_Log (Tipo_Log,Id_Rol_Funcionario,Id_Rol,Id_Funcionario,Vigencia)
  VALUES ('U',NEW.Id_Rol_Funcionario,NEW.Id_Rol,NEW.Id_Funcionario,NEW.Vigencia);
END;;
DELIMITER ;



-- Autor -----------------------------------------------------------------

CREATE TABLE Autor_Log(

	  Id_Autor_Log   INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log       CHAR(1) NOT NULL,
    Id_Autor       INTEGER NOT NULL,
    Id_Version     INTEGER NOT NULL,
    Id_Funcionario INTEGER NOT NULL,
    Principal      BOOLEAN NOT NULL,
    
    CONSTRAINT PK_Autor_Log      PRIMARY KEY (Id_Autor_Log)
);

DROP TRIGGER IF EXISTS Autor_Insert ;
DELIMITER ;;
CREATE TRIGGER Autor_Insert AFTER INSERT ON Autor FOR EACH ROW
BEGIN
  INSERT INTO Autor_Log (Tipo_Log,Id_Autor,Id_Version,Id_Funcionario,Principal) 
  VALUES ('I',NEW.Id_Autor,NEW.Id_Version,NEW.Id_Funcionario,NEW.Principal);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Autor_Update;
DELIMITER ;;
CREATE TRIGGER Autor_Update AFTER UPDATE  ON Autor FOR EACH ROW
BEGIN
  INSERT INTO Autor_Log (Tipo_Log,Id_Autor,Id_Version,Id_Funcionario,Principal) 
  VALUES ('U',NEW.Id_Autor,NEW.Id_Version,NEW.Id_Funcionario,NEW.Principal);
END;;
DELIMITER ;


-- Comentario -----------------------------------------------------------------


CREATE TABLE Comentario_Log(

	Id_Comentario_Log   INTEGER NOT NULL AUTO_INCREMENT,
  Fecha_Log           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  Tipo_Log            CHAR(1) NOT NULL,
  Id_Comentario       INTEGER NOT NULL,
	Comentario          VARCHAR(500) NOT NULL,
	Id_Funcionario      INTEGER NOT NULL,
  Id_Version          INTEGER NOT NULL,
    
  CONSTRAINT PK_Comentario_Log     PRIMARY KEY (Id_Comentario_Log)
    
);

DROP TRIGGER IF EXISTS Comentario_Insert ;
DELIMITER ;;
CREATE TRIGGER Comentario_Insert AFTER INSERT ON Comentario FOR EACH ROW
BEGIN
  INSERT INTO Comentario_Log (Tipo_Log,Id_Comentario,Comentario,Id_Funcionario,Id_Version) 
  VALUES ('I',NEW.Id_Comentario,NEW.Comentario,NEW.Id_Funcionario,NEW.Id_Version);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Comentario_Update;
DELIMITER ;;
CREATE TRIGGER Comentario_Update AFTER UPDATE  ON Comentario FOR EACH ROW
BEGIN
  INSERT INTO Comentario_Log (Tipo_Log,Id_Comentario,Comentario,Id_Funcionario,Id_Version) 
  VALUES ('U',NEW.Id_Comentario,NEW.Comentario,NEW.Id_Funcionario,NEW.Id_Version);
END;;
DELIMITER ;


-- Lista_Chequeo -----------------------------------------------------------------

CREATE TABLE Lista_Chequeo_Log (

	  Id_Lista_Chequeo_Log  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log              CHAR(1) NOT NULL,
    Id_Lista_Chequeo      INTEGER NOT NULL,
    Nom_Lista_Chequeo     VARCHAR(100) NOT NULL,
    Des_Lista_Chequeo     VARCHAR(200) NOT NULL,
	  Fecha_Creacion        TIMESTAMP NOT NULL,    
    Id_Funcionario        INTEGER NOT NULL,
    
    CONSTRAINT PK_Lista_Chequeo_Log  PRIMARY KEY (Id_Lista_Chequeo_Log)
);


DROP TRIGGER IF EXISTS Lista_Chequeo_Insert ;
DELIMITER ;;
CREATE TRIGGER Lista_Chequeo_Insert AFTER INSERT ON Lista_Chequeo FOR EACH ROW
BEGIN
  INSERT INTO Lista_Chequeo_Log (Tipo_Log,Id_Lista_Chequeo,Nom_Lista_Chequeo,Des_Lista_Chequeo,Fecha_Creacion,Id_Funcionario) 
  VALUES ('I',NEW.Id_Lista_Chequeo,NEW.Nom_Lista_Chequeo,NEW.Des_Lista_Chequeo,NEW.Fecha_Creacion,NEW.Id_Funcionario);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Lista_Chequeo_Update;
DELIMITER ;;
CREATE TRIGGER Lista_Chequeo_Update AFTER UPDATE  ON Lista_Chequeo FOR EACH ROW
BEGIN
  INSERT INTO Lista_Chequeo_Log (Tipo_Log,Id_Lista_Chequeo,Nom_Lista_Chequeo,Des_Lista_Chequeo,Fecha_Creacion,Id_Funcionario) 
  VALUES ('U',NEW.Id_Lista_Chequeo,NEW.Nom_Lista_Chequeo,NEW.Des_Lista_Chequeo,NEW.Fecha_Creacion,NEW.Id_Funcionario);
END;;
DELIMITER ;



-- Item_Lista -----------------------------------------------------------------

CREATE TABLE Item_Lista_Log(

	  Id_Item_Lista_Log 	INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log            CHAR(1) NOT NULL,
    Id_Item_Lista 	    INTEGER NOT NULL,
    Des_Item_Lista 	    VARCHAR(300) NOT NULL,
    Tipo_Item		        BOOLEAN NOT NULL, 
    
    CONSTRAINT PK_Item_Lista_Log PRIMARY KEY (Id_Item_Lista_Log)
);


DROP TRIGGER IF EXISTS Item_Lista_Insert ;
DELIMITER ;;
CREATE TRIGGER Item_Lista_Insert AFTER INSERT ON Item_Lista FOR EACH ROW
BEGIN
  INSERT INTO Item_Lista_Log (Tipo_Log,Id_Item_Lista,Des_Item_Lista,Tipo_Item) 
  VALUES ('I',NEW.Id_Item_Lista,NEW.Des_Item_Lista,NEW.Tipo_Item);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Item_Lista_Update;
DELIMITER ;;
CREATE TRIGGER Item_Lista_Update AFTER UPDATE  ON Item_Lista FOR EACH ROW
BEGIN
  INSERT INTO Item_Lista_Log (Tipo_Log,Id_Item_Lista,Des_Item_Lista,Tipo_Item) 
  VALUES ('U',NEW.Id_Item_Lista,NEW.Des_Item_Lista,NEW.Tipo_Item);
END;;
DELIMITER ;


-- Detalles_Lista -----------------------------------------------------------------

CREATE TABLE Detalles_Lista_Log (

	  Id_Detalles_Lista_Log   INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                CHAR(1) NOT NULL,
    Id_Detalles_Lista       INTEGER NOT NULL,
    Id_Lista_Chequeo        INTEGER NOT NULL,
    Id_Item_Lista           INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Lista_Log 	PRIMARY KEY (Id_Detalles_Lista_Log)
);

DROP TRIGGER IF EXISTS Detalles_Lista_Insert;
DELIMITER ;;
CREATE TRIGGER Detalles_Lista_Insert AFTER INSERT ON Detalles_Lista FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Lista_Log (Tipo_Log,Id_Detalles_Lista,Id_Lista_Chequeo,Id_Item_Lista) 
  VALUES ('I',NEW.Id_Detalles_Lista,NEW.Id_Lista_Chequeo,NEW.Id_Item_Lista);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Detalles_Lista_Update;
DELIMITER ;;
CREATE TRIGGER Detalles_Lista_Update AFTER UPDATE  ON Detalles_Lista FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Lista_Log (Tipo_Log,Id_Detalles_Lista,Id_Lista_Chequeo,Id_Item_Lista) 
  VALUES ('U',NEW.Id_Detalles_Lista,NEW.Id_Lista_Chequeo,NEW.Id_Item_Lista);
END;;
DELIMITER ;


-- Evaluacion_General -----------------------------------------------------------------

CREATE TABLE Evaluacion_General_Log(

	  Id_Evaluacion_General_Log INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                  CHAR(1) NOT NULL,
    Id_Evaluacion_General     INTEGER NOT NULL,
    Fecha_Evaluacion          TIMESTAMP NOT NULL,
    Observacion			          VARCHAR(250) NOT NULL,
    Resultado 			          BOOLEAN NOT NULL,
    Id_Version                INTEGER NOT NULL,
    Id_Lista_Chequeo          INTEGER NOT NULL,
    Id_Funcionario		        INTEGER NOT NULL, 

	  CONSTRAINT PK_Evaluacion_General_Log PRIMARY KEY (Id_Evaluacion_General_Log)
);

DROP TRIGGER IF EXISTS Evaluacion_General_Insert ;
DELIMITER ;;
CREATE TRIGGER Evaluacion_General_Insert AFTER INSERT ON Evaluacion_General FOR EACH ROW
BEGIN
  INSERT INTO Evaluacion_General_Log (Tipo_Log,Id_Evaluacion_General,Fecha_Evaluacion,Observacion,Resultado,Id_Version,Id_Lista_Chequeo,Id_Funcionario) 
  VALUES ('I',NEW.Id_Evaluacion_General,NEW.Fecha_Evaluacion,NEW.Observacion,NEW.Resultado,NEW.Id_Version,NEW.Id_Lista_Chequeo,NEW.Id_Funcionario);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Evaluacion_General_Update;
DELIMITER ;;
CREATE TRIGGER Evaluacion_General_Update AFTER UPDATE  ON Evaluacion_General FOR EACH ROW
BEGIN
  INSERT INTO Evaluacion_General_Log (Tipo_Log,Id_Evaluacion_General,Fecha_Evaluacion,Observacion,Resultado,Id_Version,Id_Lista_Chequeo,Id_Funcionario) 
  VALUES ('U',NEW.Id_Evaluacion_General,NEW.Fecha_Evaluacion,NEW.Observacion,NEW.Resultado,NEW.Id_Version,NEW.Id_Lista_Chequeo,NEW.Id_Funcionario);
END;;
DELIMITER ;


-- Detalles_Evaluacion -----------------------------------------------------------------

CREATE TABLE Detalles_Evaluacion_Log(
    
    Id_Detalles_Evaluacion_Log    INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log                     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                      CHAR(1) NOT NULL,
	  Id_Detalles_Evaluacion        INTEGER NOT NULL,
    Valorizacion                  BOOLEAN NOT NULL,
    Observacion 		              VARCHAR(200) NOT NULL,	
    Id_Detalles_Lista	            INTEGER NOT NULL,
    Id_Evaluacion_General         INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Evaluacion_Log PRIMARY KEY (Id_Detalles_Evaluacion_Log)
);

DROP TRIGGER IF EXISTS Detalles_Evaluacion_Insert;
DELIMITER ;;
CREATE TRIGGER Detalles_Evaluacion_Insert AFTER INSERT ON Detalles_Evaluacion FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Evaluacion_Log (Tipo_Log,Id_Detalles_Evaluacion,Valorizacion,Observacion,Id_Detalles_Lista,Id_Evaluacion_General) 
  VALUES ('I',NEW.Id_Detalles_Evaluacion,NEW.Valorizacion,NEW.Observacion,NEW.Id_Detalles_Lista,NEW.Id_Evaluacion_General);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Detalles_Evaluacion_Update;
DELIMITER ;;
CREATE TRIGGER Detalles_Evaluacion_Update AFTER UPDATE  ON Detalles_Evaluacion FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Evaluacion_Log (Tipo_Log,Id_Detalles_Evaluacion,Valorizacion,Observacion,Id_Detalles_Lista,Id_Evaluacion_General) 
  VALUES ('U',NEW.Id_Detalles_Evaluacion,NEW.Valorizacion,NEW.Observacion,NEW.Id_Detalles_Lista,NEW.Id_Evaluacion_General);
END;;
DELIMITER ;



-- Categoria -----------------------------------------------------------------

CREATE TABLE Categoria_Log(
	
    Id_Categoria_Log 	    INTEGER      NOT NULL AUTO_INCREMENT,
    Fecha_Log             TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log              CHAR(1)      NOT NULL,
    Id_Categoria 	        INTEGER      NOT NULL,
    Nom_Categoria	        VARCHAR(45)  NOT NULL,
    Des_Categoria	        VARCHAR(100) NOT NULL,
    Fecha_Creacion	      TIMESTAMP    NOT NULL,
    Id_Funcionario	      INTEGER      NOT NULL,
    
    CONSTRAINT PK_Categoria_Log PRIMARY KEY (Id_Categoria_Log)
);


DROP TRIGGER IF EXISTS Categoria_Insert;
DELIMITER ;;
CREATE TRIGGER Categoria_Insert AFTER INSERT ON Categoria FOR EACH ROW
BEGIN
  INSERT INTO Categoria_Log (Tipo_Log,Id_Categoria,Nom_Categoria,Des_Categoria,Fecha_Creacion,Id_Funcionario) 
  VALUES ('I',NEW.Id_Categoria,NEW.Nom_Categoria,NEW.Des_Categoria,NEW.Fecha_Creacion,NEW.Id_Funcionario);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Categoria_Update;
DELIMITER ;;
CREATE TRIGGER Categoria_Update AFTER UPDATE  ON Categoria FOR EACH ROW
BEGIN
  INSERT INTO Categoria_Log (Tipo_Log,Id_Categoria,Nom_Categoria,Des_Categoria,Fecha_Creacion,Id_Funcionario) 
  VALUES ('U',NEW.Id_Categoria,NEW.Nom_Categoria,NEW.Des_Categoria,NEW.Fecha_Creacion,NEW.Id_Funcionario);
END;;
DELIMITER ;



-- Detalles_Categoria -----------------------------------------------------------------

CREATE TABLE Detalles_Categoria_Log(

    Id_Detalles_Categoria_Log 	  INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Log                     TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    Tipo_Log                      CHAR(1) NOT NULL,
    Id_Detalles_Categoria         INTEGER NOT NULL,
    Id_Categoria	 	              INTEGER NOT NULL,
    Id_Tema				                INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Categoria_Log PRIMARY KEY (Id_Detalles_Categoria_Log)
);

DROP TRIGGER IF EXISTS Detalles_Categoria_Insert;
DELIMITER ;;
CREATE TRIGGER Detalles_Categoria_Insert AFTER INSERT ON Detalles_Categoria FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Categoria_Log (Tipo_Log,Id_Detalles_Categoria,Id_Categoria,Id_Tema) 
  VALUES ('I',NEW.Id_Detalles_Categoria,NEW.Id_Categoria,NEW.Id_Tema);
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Detalles_Categoria_Update;
DELIMITER ;;
CREATE TRIGGER Detalles_Categoria_Update AFTER UPDATE  ON Detalles_Categoria FOR EACH ROW
BEGIN
  INSERT INTO Detalles_Categoria_Log (Tipo_Log,Id_Detalles_Categoria,Id_Categoria,Id_Tema) 
  VALUES ('U',NEW.Id_Detalles_Categoria,NEW.Id_Categoria,NEW.Id_Tema);
END;;
DELIMITER ;


-- LISTA_CHEQUEO ----- DETALLES_LISTA ------ ITEM_LISTA ------ 
DROP VIEW IF EXISTS 01_V_Detalles_Lista;
CREATE VIEW 01_V_Detalles_Lista AS(
	
    SELECT dl.Id_Lista_Chequeo,Nom_Lista_Chequeo, Des_Lista_Chequeo, Fecha_Creacion, Id_Funcionario, dl.Id_Item_Lista, Des_Item_Lista, Tipo_Item,Id_Detalles_Lista
    FROM  ((Lista_Chequeo lc INNER JOIN Detalles_Lista dl ON lc.Id_Lista_Chequeo = dl.Id_Lista_Chequeo)
		   INNER JOIN Item_Lista il ON dl.Id_Item_Lista = il.Id_Item_Lista)
    
);
--  BRAYAN PORFA HASTA QUE NOSE ALLA BARGADO ESE COMMIT (LA VENTANA CON EL DE LAS ACTUALIZACIONES DEL UBUNTO)
-- NO UTILICE EL INTERNET PORFA ... ES QUE ES SOBRE EL PROYECTO Y NECESITO QUE CARGUE ESO

-- CIUDAD-----CENTRO ----- AREA_CENTRO ------- AREA ----
DROP VIEW IF EXISTS 02_V_Area_Centro;
CREATE VIEW 02_V_Area_Centro AS
(
	SELECT Id_Area_Centro, AC.Id_Centro, Num_Centro, Nom_Centro, Direccion,Ce.Id_Ciudad,Nom_Ciudad, AC.Id_Area,Nom_Area,Lider_Area
	FROM (((Centro Ce INNER JOIN Area_Centro AC ON Ce.Id_Centro = AC.Id_Centro) INNER JOIN 
		 Area Ar ON AC.Id_Area = Ar.Id_Area) INNER JOIN Ciudad Ci ON Ce.Id_Ciudad = Ci.Id_Ciudad)
);

-- AREA ----- DETALLES_AREA ------- PROGRAMA
DROP VIEW IF EXISTS 03_V_Detalles_Area;
CREATE VIEW 03_V_Detalles_Area AS(

	SELECT  Id_Detalles_Area,da.Id_Area, Nom_Area, Lider_Area, da.Id_Programa, Nom_Programa, Nivel_Formacion
    FROM ((Area ar INNER JOIN Detalles_Area da ON ar.Id_Area = da.Id_Area) 
		  INNER JOIN Programa pr ON da.Id_Programa = pr.Id_Programa)
);

-- PROGRAMA ------- DETALLES_PROGRAMA ------- TEMA ---- 0
DROP VIEW IF EXISTS 04_V_Detalles_Programa;
CREATE VIEW 04_V_Detalles_Programa AS(
	
    SELECT Id_Detalles_Programa, dp.Id_Programa, Nom_Programa, Nivel_Formacion,dp.Id_Tema, Nom_Tema, Des_Tema
    FROM  ((Programa pr INNER JOIN Detalles_Programa dp ON pr.Id_Programa = dp.Id_Programa)
          INNER JOIN Tema te ON dp.Id_Tema = te.Id_Tema)
);

-- CATEGORIA ------ DETALLES_CATEGORIA ------ TEMA---- 1
DROP VIEW IF EXISTS 05_V_Detalles_Categoria;
CREATE VIEW 05_V_Detalles_Categoria AS
(
	SELECT DISTINCT DC.Id_Categoria, Nom_Categoria,Des_Categoria,Fecha_Creacion,Id_Funcionario,DC.Id_Detalles_Categoria, DC.Id_Tema, Te.Nom_Tema,Te.Des_Tema
	FROM  ((Categoria Ca INNER JOIN Detalles_Categoria DC ON Ca.Id_Categoria = DC.Id_Categoria) INNER JOIN
		   Tema Te ON DC.Id_Tema = Te.Id_Tema) 
);


-- FORMATO ----- PRODUCTO_VIRTUAL ----- DETALLES_TEMA  ---- TEMA ----
DROP VIEW IF EXISTS 06_V_Detalles_Tema;
CREATE VIEW 06_V_Detalles_Tema AS
(
	SELECT 	DT.Id_P_Virtual, Nom_P_Virtual, Des_P_Virtual,Palabras_Clave,
			PV.Id_Formato, Fo.Nom_Formato, Fo.Des_Formato,
            DT.Id_Detalles_Tema,DT.Id_Tema, Te.Nom_Tema, Te.Des_Tema,Tipo_Tema
	FROM (((Formato Fo INNER JOIN Producto_Virtual PV ON Fo.Id_Formato = PV.Id_Formato) INNER JOIN
		 Detalles_Tema DT ON PV.Id_P_Virtual = DT.Id_P_Virtual) INNER JOIN 
		 Tema Te ON DT.Id_Tema = Te.Id_Tema) 
);


--  PROCUCTO_VIRTUAL ----- VERSION ----- TIPO_VERSION -------- ESTADO ------
DROP VIEW IF EXISTS 07_V_Version;
CREATE VIEW 07_V_Version AS (
	
    SELECT v.Id_P_Virtual, Nom_P_Virtual, Des_P_Virtual,Palabras_Clave,Id_Formato,
			v.Id_Version, Fecha_Envio, Fecha_Publicacion, Num_Version, Fecha_Vigencia, Url_Version, Url_Img, Inst_Instalacion, Reqst_Instalacion,
            v.Id_Estado, Nom_Estado, Id_Tipo_Estado
    FROM ((Producto_Virtual pv INNER JOIN Version v ON pv.Id_P_Virtual = v.Id_P_Virtual)
    INNER JOIN Estado e ON e.Id_Estado = v.Id_Estado)
);


-- ROL ---- ROL_FUNCIONARIO --- FUNCIONARIO ---- TIPO_DOCUMENTO
DROP VIEW IF EXISTS 08_V_Funcionario;
CREATE VIEW 08_V_Funcionario AS
(
	SELECT  Id_Rol_Funcionario, RF.Id_Rol, Nom_Rol,Des_Rol,
			RF.Id_Funcionario,td.Id_Tipo_Documento, Nom_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,
            Correo,Cargo,Ip_Sena,Contraseña,Id_Estado,Fu.Id_Area_Centro,Id_Centro
	FROM (((Rol Ro INNER JOIN Rol_Funcionario RF ON Ro.Id_Rol = RF.Id_Rol) INNER JOIN
		   Funcionario Fu ON RF.Id_Funcionario = Fu.Id_Funcionario AND RF.Vigencia = 1) INNER JOIN 
           Tipo_Documento td ON td.Id_Tipo_Documento = Fu.Id_Tipo_Documento)INNER JOIN 
           Area_Centro ac ON Fu.Id_Area_Centro = ac.Id_Area_Centro
);    



-- AUTOR -------- V_FUNCIONARIO -------- V_VERSION--------
DROP VIEW IF EXISTS 09_V_Autor;
CREATE VIEW 09_V_Autor AS(

	SELECT	au.Id_Autor, Id_P_Virtual, Nom_P_Virtual, Des_P_Virtual,Palabras_Clave,Id_Formato,
			vVer.Id_Version, Fecha_Envio, Fecha_Publicacion, Num_Version, Fecha_Vigencia, Url_Version, Url_Img, Inst_Instalacion, Reqst_Instalacion,
            vVer.Id_Estado, Nom_Estado, Id_Tipo_Estado,
			Id_Rol_Funcionario, Id_Rol, Nom_Rol,Des_Rol,
			vFu.Id_Funcionario,Id_Tipo_Documento, Nom_Tipo_Documento,Num_Documento,Nom_Funcionario,Apellidos,
            Correo,Cargo,Ip_Sena,Contraseña,vFu.Id_Estado AS Id_EstadoFun,Id_Area_Centro
    FROM (Autor au INNER JOIN 08_V_Funcionario vFu ON au.Id_Funcionario = vFu.Id_Funcionario) INNER JOIN 
		 07_V_Version vVer ON au.Id_Version = vVer.Id_Version 
);




-- HABILITAR PRODUCTO VIRTUAL 
DROP VIEW IF EXISTS 10_Habilitar_P;
CREATE VIEW 10_Habilitar_P AS(
	SELECT DISTINCT v2.Id_Version,Nom_P_Virtual,Num_Version,Fecha_Vigencia, Id_Centro
	FROM Producto_Virtual v1 INNER JOIN Version v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
    INNER JOIN Autor v3 ON v2.Id_Version = v3.Id_Version INNER JOIN Funcionario v4 ON v3.Id_Funcionario = v4.Id_Funcionario
	INNER JOIN Area_Centro v5 ON v4.Id_Area_Centro = v5.Id_Area_Centro
	WHERE v2.Id_Estado = 5
);


-- VISTA PARA LISTAR LAS AREAS Y EL CENTRO QUE TIENE UNA RELACION
-- REGISTRAR FUNCIONARIO . SELECT CENTRO Y AREAS DE ESE CENTRO

DROP VIEW IF EXISTS 11_V_Area;
CREATE VIEW 11_V_Area AS (
	SELECT v1.Id_Area, Nom_Area, v1.Id_Centro,Nom_Centro
	FROM Area_Centro v1 INNER JOIN Area v2 ON v1.Id_Area = v2.Id_Area INNER JOIN Centro v3 ON v1.Id_Centro = v3.Id_Centro
);

-- INHABILITAR FUNCIONARIO POR PARTE DE ADMINISTRADOR
DROP VIEW IF EXISTS 12_Inabilitar_Funcionario;
CREATE VIEW 12_Inabilitar_Funcionario AS 
(
    SELECT v1.Id_Funcionario, CONCAT(Nom_Funcionario," ",Apellidos) AS NombreCompleto,Ip_Sena, Cargo,Nom_Rol,Nom_Estado, Nom_Area, Nom_Centro 
	FROM Funcionario v1 INNER JOIN Estado v2 ON v1.Id_Estado = v2.Id_Estado INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario AND v3.Vigencia = 1
	INNER JOIN Rol v4 ON v3.Id_Rol = v4.Id_Rol INNER JOIN  Area_Centro v5 ON v1.Id_Area_Centro = v5.Id_Area_Centro 
	INNER JOIN Area v6 ON v5.Id_Area = v6.Id_Area INNER JOIN Centro v7 ON v5.Id_Centro = v7.Id_Centro WHERE v1.Id_Estado = 1
);


-- VISTA PARA HACER EL LISTADO DE DE LAS LISTAS DE CHEQUEO DEACUERDO AL ROL DEL FUNCIONARIO 
DROP VIEW IF EXISTS 13_V_Listas_Chequeo;
CREATE VIEW 13_V_Listas_Chequeo AS(
	
	SELECT Id_Lista_Chequeo, Nom_Lista_Chequeo, Des_Lista_Chequeo,Fecha_Creacion,v2.Id_Funcionario,Id_Rol
    FROM Lista_Chequeo v1 INNER JOIN Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario 
    INNER JOIN Rol_Funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario -- AND v3.Vigencia = 1
    
);


-- LISTAR LOS TITULOS DE LOS PRODUCTOS VIRTUALES EN EL CASO DE USO DE SUBIR PRODUCTO VIRTUAL
DROP VIEW IF EXISTS 14_V_Titulos;
CREATE VIEW 14_V_Titulos AS (
	SELECT DISTINCT v1.Id_P_Virtual, Nom_P_Virtual
    FROM Producto_Virtual v1 INNER JOIN Version v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
    WHERE Id_Estado = 6
);


-- LISTAR LOS FUNCIONARIOS QUE TENGAN EL ROL DE INSTRUCTOR
DROP VIEW IF EXISTS 15_V_Subir_Autores;
CREATE VIEW 15_V_Subir_Autores AS(
	
    SELECT v1.Id_Funcionario,Nom_Funcionario,Id_Centro
    FROM  Funcionario v1 INNER JOIN Rol_Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario AND v2.Vigencia = 1
		  INNER JOIN Area_Centro v3 ON v1.Id_Area_Centro = v3.Id_Area_Centro
    WHERE Id_Rol = 1
);

-- LISTAR LOS ITEMS QUE TIENE RELACION CON UNA LISTA DE CHEQUEO
DROP VIEW IF EXISTS 16_V_Items_Lista;
CREATE VIEW 16_V_Items_Lista AS(
	
    SELECT v3.Id_Item_Lista,Des_Item_Lista,Tipo_Item,v1.Id_Lista_Chequeo,Id_Detalles_Lista
    FROM Detalles_Lista v1 INNER JOIN Lista_Chequeo v2 ON v1.Id_Lista_Chequeo = v2.Id_Lista_Chequeo
    INNER JOIN Item_Lista v3 ON v1.Id_Item_Lista = v3.Id_Item_Lista
 
);

DROP VIEW IF EXISTS 17_V_ProductosEvaluador;
CREATE VIEW 17_V_ProductosEvaluador AS (
	
    SELECT v1.Id_P_Virtual, Nom_P_Virtual, Id_Version, Num_Version, Fecha_Vigencia,v3.Id_Estado,Nom_Estado
	FROM Producto_Virtual v1 INNER JOIN Version v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual INNER JOIN Estado v3 ON v2.Id_Estado = v3.Id_Estado
);

DROP VIEW IF EXISTS 18_V_Notificaciones;
CREATE VIEW 18_V_Notificaciones AS(
	SELECT v1.Id_Funcionario, Nom_Funcionario, v5.Id_Rol,Nom_Rol,v3.Id_Notificacion,Fecha_Envio, Conte_Notificacion, Ides_Proceso,v3.Id_Funcionario AS Id_FuncionarioEnvio,Estado,Id_Centro,Id_Tipo_Notificacion
	FROM Funcionario v1 INNER JOIN Detalles_Notificacion v2 ON v1.Id_Funcionario = v2.Id_Funcionario
	 INNER JOIN Notificacion v3 ON v2.Id_Notificacion = v3.Id_Notificacion 
     INNER JOIN Rol_Funcionario v4 ON v1.Id_Funcionario = v4.Id_Funcionario AND v4.Vigencia = 1
     INNER JOIN Rol v5 ON v4.Id_Rol = v5.Id_Rol 
     INNER JOIN Area_Centro v6 ON v1.Id_Area_Centro = v6.Id_Area_Centro 
	ORDER BY v1.Id_Funcionario
);

DROP VIEW IF EXISTS 19_v_TemasFormacion;
CREATE VIEW 19_v_TemasFormacion AS(

	SELECT Id_Tema, Nom_Tema, Id_Centro
    FROM 02_V_Area_Centro v1 INNER JOIN 03_V_Detalles_Area v2 ON v1.Id_Area = v2.Id_Area
	INNER JOIN 04_V_Detalles_Programa v3 ON v2.Id_Programa = v3.Id_Programa 
    
);

DROP VIEW IF EXISTS 20_V_Login;
CREATE VIEW 20_V_Login AS(
SELECT Id_Rol, Id_Funcionario, Nom_Funcionario,v2.Id_Centro,Num_Documento, Contraseña
FROM  08_V_Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
);

DROP VIEW IF EXISTS 21_V_AsignarRol;

CREATE VIEW 21_V_AsignarRol AS(
SELECT v1.Id_Funcionario, CONCAT(Nom_Funcionario," ",Apellidos) AS NombreCompleto, Cargo,v2.Id_Centro, Nom_Centro,v2.Id_Area,Nom_Area,v3.Id_Ciudad,Nom_Ciudad
FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
	 INNER JOIN Centro v3 ON v2.Id_Centro = v3.Id_Centro INNER JOIN Area v4 ON v2.Id_Area = v4.Id_Area
     INNER JOIN Ciudad v5 ON v3.Id_Ciudad = v5.Id_Ciudad INNER JOIN Estado v7 ON v1.Id_Estado = v7.Id_Estado
WHERE v1.Id_Estado = 2
);

DROP VIEW IF EXISTS 22_V_Autor_Simple;
CREATE VIEW 22_V_Autor_Simple AS(
	SELECT DISTINCT v1.Id_Funcionario ,CONCAT(Nom_Funcionario," ",Apellidos) AS NombreCompleto, Id_Version
    FROM Funcionario v1 INNER JOIN Autor v2 ON v1.Id_Funcionario = v2.Id_Funcionario
);


-- ---------
DROP VIEW IF EXISTS 23_V_Consultar;
CREATE VIEW 23_V_Consultar AS(
	SELECT  Id_P_Virtual, Nom_P_Virtual,Des_P_Virtual,Palabras_Clave,Fecha_Publicacion,Fecha_Vigencia,Inst_Instalacion,Reqst_Instalacion,Url_Version,Id_Version,Num_Version
    FROM 07_V_Version
    WHERE Id_Estado = 6
);

DROP VIEW IF EXISTS 24_V_Toquen;
CREATE VIEW 24_V_Toquen AS(
	SELECT * 
    FROM Toquen
    WHERE FechaVigencia > CURRENT_TIMESTAMP
);

DROP VIEW IF EXISTS 25_V_EvaluarProductosV;
CREATE VIEW 25_V_EvaluarProductosV AS (
	SELECT 
    Id_Funcionario, -- -
    Nom_Funcionario, 
    v1.Id_Rol,-- -
    Nom_Rol,
    Id_Notificacion, --
    v1.Fecha_Envio, --
    Conte_Notificacion, --
    Ides_Proceso,--
    Id_FuncionarioEnvio,
    Estado, -- -
    Id_Centro, -- - 
    Id_Tipo_Notificacion,
    v2.Url_Version,--
    CONCAT(Nom_P_Virtual," ",Num_Version) AS Producto--
    FROM 18_V_Notificaciones v1 INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version 
    INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
    WHERE Id_Rol NOT IN (1)
);


DROP VIEW IF EXISTS 26_V_Comentarios;
CREATE VIEW 26_V_Comentarios AS (
	SELECT Id_Comentario, Comentario,v1.Id_Funcionario, CONCAT(Nom_Funcionario," ",Apellidos) AS Nombre_Completo,Id_Version
    FROM Comentario v1 INNER JOIN Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario
);

DROP VIEW IF EXISTS 27_V_Autores;
CREATE VIEW 27_V_Autores AS (
	SELECT DISTINCT  v1.Id_Funcionario, CONCAT(Nom_Funcionario ," " ,Apellidos) AS NombreCompleto
    FROM 08_V_Funcionario v1 INNER JOIN Autor v2 ON v1.Id_Funcionario = v2.Id_Funcionario
);

DROP VIEW IF EXISTS 28_V_ConsultaCategoria;
CREATE VIEW 28_V_ConsultaCategoria AS (
	SELECT DISTINCT v3.Id_P_Virtual, v3.Nom_P_Virtual,v3.Des_P_Virtual,Id_Formato,Fecha_Publicacion,v4.Id_Funcionario,Id_Categoria,v4.Id_Version
	FROM 05_V_Detalles_Categoria v1 INNER JOIN 06_V_Detalles_Tema v2 ON v1.Id_Tema = v2.Id_Tema 
	INNER JOIN 23_V_Consultar v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
	INNER JOIN 22_V_Autor_Simple v4 ON v3.Id_Version = v4.Id_Version
	WHERE Tipo_Tema = 1 AND v3.Num_Version = 
		(	SELECT Num_Version 
			FROM Producto_Virtual v11 INNER JOIN Version v22 ON v11.Id_P_Virtual = v22.Id_P_Virtual 
            WHERE v11.Id_P_Virtual = v3.Id_P_Virtual 
            AND v22.Id_Estado IN (6,7)
            ORDER BY Num_Version DESC LIMIT 1)

);


DROP VIEW IF EXISTS 29_V_ConsultaPrograma;
CREATE VIEW 29_V_ConsultaPrograma AS (
	SELECT DISTINCT v3.Id_P_Virtual, v3.Nom_P_Virtual,v3.Des_P_Virtual,Id_Formato,Fecha_Publicacion,Id_Funcionario,Id_Programa,v4.Id_Version
	FROM 04_V_Detalles_Programa v1 INNER JOIN 06_V_Detalles_Tema v2 ON v1.Id_Tema = v2.Id_Tema 
	INNER JOIN 23_V_Consultar v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
	INNER JOIN 22_V_Autor_Simple v4 ON v3.Id_Version = v4.Id_Version
	WHERE Tipo_Tema = 0 AND v3.Num_Version = 
		(	SELECT Num_Version 
			FROM Producto_Virtual v11 INNER JOIN Version v22 ON v11.Id_P_Virtual = v22.Id_P_Virtual 
            WHERE v11.Id_P_Virtual = v3.Id_P_Virtual 
            AND v22.Id_Estado IN (6,7)
            ORDER BY Num_Version DESC LIMIT 1)
);

DROP VIEW IF EXISTS 30_V_ConsultaNormal;
CREATE VIEW 30_V_ConsultaNormal AS (
	SELECT Id_P_Virtual,Nom_P_Virtual,Des_P_Virtual,Palabras_Clave,Fecha_Publicacion,Id_Version
	FROM 23_V_Consultar v1
	WHERE Num_Version = 
			(	SELECT Num_Version 
				FROM Producto_Virtual v11 INNER JOIN Version v22 ON v11.Id_P_Virtual = v22.Id_P_Virtual 
				WHERE v11.Id_P_Virtual = v1.Id_P_Virtual  AND v22.Id_Estado IN (6,7)
        ORDER BY Num_Version DESC LIMIT 1)

);

-- traer la cantidad de productos virtuales que se encuentran con cada tipo de formato

DROP VIEW IF EXISTS 31_V_EstadisticaTipo1;
CREATE VIEW 31_V_EstadisticaTipo1 AS (

	SELECT DISTINCT v1.Id_Formato, Nom_Formato,v2.Id_P_Virtual,Nom_P_Virtual,Fecha_Publicacion, Id_Centro
	FROM  Formato v1 INNER JOIN Producto_Virtual v2 ON v1.Id_Formato = v2.Id_Formato
		  INNER JOIN Version v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual 
          INNER JOIN Autor v4 ON v3.Id_Version = v4.Id_Version
          INNER JOIN 08_V_Funcionario v5 ON v4.Id_Funcionario = v5.Id_Funcionario
	WHERE v3.Id_Estado = 6
);

DROP VIEW IF EXISTS 32_V_EstadisticaTipo2;
CREATE VIEW 32_V_EstadisticaTipo2 AS (

	SELECT Id_Formato, Nom_Formato, COUNT(*) AS Cantidad,Id_Centro
	FROM  31_V_EstadisticaTipo1
	GROUP BY Id_Formato, Nom_Formato, Id_Centro
);



-- CALL SARA_CRUD("SELECT","31_V_EstadisticaTipo1","Id_Formato|Nom_Formato|COUNT(*) AS Cantidad|Id_Centro"," Fecha_Publicacion BETWEEN '2016-11-24' AND '2016-11-25' GROUP BY Id_Formato, Nom_Formato, Id_Centro");


-- traer la cantidad de productos virtuales que se encuentren con cada area deacuerdo al centro de formacion

DROP VIEW IF EXISTS 33_v_EstadisticaArea1;
CREATE VIEW 33_v_EstadisticaArea1 AS (

	SELECT DISTINCT v7.Id_Area, v7.Nom_Area,v1.Id_P_Virtual,v1.Nom_P_Virtual,Fecha_Publicacion,Id_Centro
	FROM Producto_Virtual v1 INNER JOIN Detalles_Tema v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
		 INNER JOIN Tema v3 ON v2.Id_Tema = v3.Id_Tema 
		 INNER JOIN Detalles_Programa v4 ON v3.Id_Tema = v4.Id_Tema
		 INNER JOIN Programa v5 ON v4.Id_Programa = v5.Id_Programa
		 INNER JOIN Detalles_Area v6 ON v5.Id_Programa = v6.Id_Programa
		 INNER JOIN Area v7 ON v6.Id_Area = v7.Id_Area
		 INNER JOIN Area_Centro v8 ON v7.Id_Area = v8.Id_Area
		 INNER JOIN Version v9 ON v1.Id_P_Virtual = v9.Id_P_Virtual
	WHERE Id_Estado = 6 AND Tipo_Tema = 0

);



DROP VIEW IF EXISTS 34_V_EstadisticaArea2;
CREATE VIEW 34_V_EstadisticaArea2 AS (

	SELECT Id_Area, Nom_Area,COUNT(*) AS Cantidad, Id_Centro
	FROM 33_v_EstadisticaArea1
	GROUP BY Id_Area, Nom_Area
);


-- Traer la cantidad de Productos virtuales que se encuentren con cada categoria de acuerdo al centro de formacion

DROP VIEW IF EXISTS 35_V_EstadisticaCategoria1;
CREATE VIEW 35_V_EstadisticaCategoria1 AS (

	SELECT DISTINCT v5.Id_Categoria, Nom_Categoria, v1.Id_P_Virtual,Fecha_Publicacion,Id_Centro
	FROM Producto_Virtual v1 INNER JOIN Detalles_Tema v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
			 INNER JOIN Tema v3 ON v2.Id_Tema = v3.Id_Tema 
			 INNER JOIN Detalles_Categoria v4 ON v3.Id_Tema = v4.Id_Tema
			 INNER JOIN Categoria v5 ON v4.Id_Categoria = v5.Id_Categoria
			 INNER JOIN Version v6 ON v1.Id_P_Virtual = v6.Id_P_Virtual 
			 INNER JOIN Autor v7 ON v6.Id_Version = v7.Id_Version
			 INNER JOIN 08_V_Funcionario v8 ON v7.Id_Funcionario = v8.Id_Funcionario
	WHERE v6.Id_Estado IN  (6,7)
);

DROP VIEW IF EXISTS 36_V_EstadisticaCategoria2;
CREATE VIEW 36_V_EstadisticaCategoria2 AS (
	SELECT Id_Categoria, Nom_Categoria, COUNT(*) AS Canti, Id_Centro
	FROM 35_V_EstadisticaCategoria1
	GROUP BY Id_Categoria, Nom_Categoria,Id_Centro
);

DROP VIEW IF EXISTS 37_V_EvaluacionGeneral;
CREATE VIEW 37_V_EvaluacionGeneral AS (
	
    SELECT v1.Id_Evaluacion_General,v1.Id_Lista_Chequeo, v5.Nom_Lista_Chequeo, v2.Valorizacion, v2.Observacion, v3.Id_Item_Lista, v4.Des_Item_Lista,v1.Observacion AS Observacion_General,v1.Resultado, v1.Fecha_Evaluacion
    FROM Evaluacion_General v1 INNER JOIN Detalles_Evaluacion v2 ON v1.Id_Evaluacion_General = v2.Id_Evaluacion_General
	     INNER JOIN Detalles_Lista v3 ON v2.Id_Detalles_Lista = v3.Id_Detalles_Lista
         INNER JOIN Item_Lista v4 ON v3.Id_Item_Lista = v4.Id_Item_Lista
         INNER JOIN Lista_Chequeo v5 ON v1.Id_Lista_Chequeo = v5.Id_Lista_Chequeo
);

DROP VIEW IF EXISTS 38_V_Notificaciones_AR;-- Aprobado - Reprobado
CREATE VIEW 38_V_Notificaciones_AR AS (
    SELECT 	Id_Funcionario,
			Nom_Funcionario,
			Id_Rol,
			Nom_Rol,
			Id_Notificacion,
			v1.Fecha_Envio,
			Conte_Notificacion,
			Ides_Proceso,
			v3.Nom_P_Virtual,
			v2.Num_Version,
			Id_FuncionarioEnvio,
			Estado,
			Id_Centro,
			Id_Tipo_Notificacion
	FROM 18_V_Notificaciones v1 
		INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
		INNER JOIN Producto_Virtual v3 ON v3.Id_P_Virtual = v2.Id_P_Virtual
	WHERE Id_Tipo_Notificacion IN (2,3)
);


DROP VIEW IF EXISTS 39_v_listacategoria;
CREATE VIEW 39_v_listacategoria AS (
	SELECT Id_Categoria,Nom_Categoria, Fecha_Creacion, Id_Centro
    FROM Categoria v1 INNER JOIN 08_v_funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario
);

-- //-------CAMBIADO idversion
DROP VIEW IF EXISTS 40_V_EvaluaVersion;
CREATE VIEW 40_V_EvaluaVersion AS (
	SELECT Id_Evaluacion_General,v1.Nom_P_Virtual,v1.Num_Version,v1.Id_Version,Url_Version
	FROM 07_v_version v1 INNER JOIN Evaluacion_General v2 ON v1.Id_Version = v2.Id_Version
);

-- CALL SARA_CRUD("SELECT","41_V_ConsultaTodo","","");

DROP VIEW IF EXISTS 41_V_ConsultaTodo;
CREATE VIEW 41_V_ConsultaTodo AS (
	SELECT DISTINCT 
    v3.Id_P_Virtual, 
    v3.Nom_P_Virtual,
    v3.Des_P_Virtual,
    v5.Id_Formato,
    v6.Id_Tipo_Formato,
    v6.Nom_Tipo_Formato,
    Fecha_Publicacion,
    v4.Id_Version,
    v4.Id_Funcionario,
    NombreCompleto,
    v1.Id_Programa,
    v1_1.Id_Categoria,
    Tipo_Tema
	FROM 04_V_Detalles_Programa v1 INNER JOIN 06_V_Detalles_Tema v2 ON v1.Id_Tema = v2.Id_Tema 
	INNER JOIN  05_v_detalles_categoria v1_1 ON v1_1.Id_Tema = v2.Id_Tema
	INNER JOIN 23_V_Consultar v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
	INNER JOIN 22_V_Autor_Simple v4 ON v3.Id_Version = v4.Id_Version
    INNER JOIN Formato v5 ON v2.Id_Formato = v5.Id_Formato
    INNER JOIN Tipo_Formato v6 ON v5.Id_Tipo_Formato = v6.Id_Tipo_Formato
	WHERE   v3.Num_Version = 
		(	SELECT Num_Version 
			FROM Producto_Virtual v11 INNER JOIN Version v22 ON v11.Id_P_Virtual = v22.Id_P_Virtual 
            WHERE v11.Id_P_Virtual = v3.Id_P_Virtual 
            AND v22.Id_Estado IN (6,7)
            ORDER BY Num_Version DESC LIMIT 1)
); 

DROP VIEW IF EXISTS 42_V_ProductosActualizar;
CREATE VIEW 42_V_ProductosActualizar AS (
	
    SELECT DISTINCT v1.Id_P_Virtual, Nom_P_Virtual, Id_Funcionario
		FROM Producto_Virtual v1 INNER JOIN Version v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
        INNER JOIN Autor v3 ON v2.Id_Version = v3.Id_Version
		WHERE Id_Estado IN (6,7)
);

DROP VIEW IF EXISTS 43_V_ConsultaTodoNotificacion;
CREATE VIEW 43_V_ConsultaTodoNotificacion AS (
SELECT
v1.Id_Notificacion,
Fecha_Envio,
Conte_Notificacion,
Ides_Proceso,
CASE 
  WHEN v1.Id_Tipo_Notificacion IN (1,3) THEN 1 -- SI ES VERSION
  ELSE 2 -- SI ES EVALUACION
END
 AS TipoIdes,
Id_Tipo_Notificacion,
v1.Id_Funcionario 	AS IdFuncionarioEnvia,
v3.Nom_Funcionario 	AS NomFuncionarioEnvia,
v3.Id_Area_Centro 	AS IdAreaCentroEnvia,
v5.Id_Centro 		AS IdCentroEnvia,
v7.Id_Rol AS IdRolEnvia,
Estado AS EstadoNotificacion,
Id_Detalles_Notificacion,
v2.Id_Funcionario AS IdFuncionarioRecibe,
v4.Nom_Funcionario  AS IdNomFuncionarioRecibe,
v4.Id_Area_Centro AS IdAreaCentroRecibe,
v6.Id_Centro AS IdCentroRecibe,
v8.Id_Rol AS IdRolRecibe
FROM Notificacion v1
INNER JOIN Detalles_Notificacion v2 ON v1.Id_Notificacion = v2.Id_Notificacion
INNER JOIN Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
INNER JOIN Funcionario v4 ON v2.Id_Funcionario = v4.Id_Funcionario
INNER JOIN Area_Centro v5 ON v3.Id_Area_Centro = v5.Id_Area_Centro
INNER JOIN Area_Centro v6 ON v4.Id_Area_Centro = v6.Id_Area_Centro
INNER JOIN Rol_Funcionario v7 ON v3.Id_Funcionario = v7.Id_Funcionario AND v7.Vigencia = 1
INNER JOIN Rol_Funcionario v8 ON v3.Id_Funcionario = v8.Id_Funcionario AND v8.Vigencia = 1
);


DROP VIEW IF EXISTS 45_ConsultaPuestos; 
CREATE VIEW 45_ConsultaPuestos AS (
	SELECT v1.Puesto,v3.Nom_P_Virtual AS Producto,v2.Num_Version AS Version, v7.Nom_Centro AS Centro
    FROM Rankin v1 INNER JOIN Version v2 ON v1.Id_Version = v2.Id_Version
    INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
    INNER JOIN Autor v4 ON v2.Id_Version = v4.Id_Version 
    INNER JOIN Funcionario v5 ON v4.Id_Funcionario = v5.Id_Funcionario
    INNER JOIN Area_Centro v6 ON v5.Id_Area_Centro = v6.Id_Area_Centro
    INNER JOIN Centro v7 ON v6.Id_Centro = v7.Id_Centro
    WHERE v4.Principal = 1
    ORDER BY v1.Puesto
);


DROP PROCEDURE IF EXISTS SARA_CRUD;
DELIMITER ;;
CREATE PROCEDURE SARA_CRUD(IN Sentencia VARCHAR(40),IN Tabla VARCHAR(70),IN Array_Datos1 VARCHAR(500), IN Array_Datos2 VARCHAR(500))
BEGIN
DECLARE i INTEGER DEFAULT 0;DECLARE a INTEGER DEFAULT 0;DECLARE num INTEGER DEFAULT 0;
DECLARE ArrayColum VARCHAR(500);DECLARE val VARCHAR(500);DECLARE cant INTEGER;
DECLARE columnas VARCHAR(500) DEFAULT "";DECLARE conjunto VARCHAR(500) DEFAULT "";DECLARE valores  VARCHAR(500) DEFAULT "";

	SET Sentencia = M_REMOVE(Sentencia);
    SET Tabla = M_REMOVE(Tabla);
    SET Array_Datos2 = M_REMOVE(Array_Datos2);
    
    IF(Array_Datos2 != " " OR Array_Datos2 != null)THEN
		SET Array_Datos2 = CONCAT("WHERE ", Array_Datos2);
    END IF;
    
	SET i = 0;
	SET num = M_LENGTH(Array_Datos1,"|");
	WHILE(i < num)DO
        SET Array_Datos1 = M_REMOVE(Array_Datos1);
		SET ArrayColum = SUBSTRING_INDEX(Array_Datos1,"|",1);
        SET cant = CHAR_LENGTH(Array_Datos1) - CHAR_LENGTH(ArrayColum);
        SET Array_Datos1 = RIGHT(Array_Datos1,cant -1);
        
        SET a = 0;
        WHILE(a < 2)DO
			SET ArrayColum = M_REMOVE(ArrayColum);
			SET val = SUBSTRING_INDEX(ArrayColum,"~",1);
			SET cant = CHAR_LENGTH(ArrayColum) - CHAR_LENGTH(val);
			SET ArrayColum = RIGHT(ArrayColum,cant -1);
            SET val = M_REMOVE(val);
            CASE a
				WHEN 0 THEN 
					BEGIN
						IF(val != "")THEN
							IF(i = 0 AND (Sentencia = "INSERT" OR Sentencia = "SELECT"))THEN
								SET columnas = val; 
                                ELSEIF(i > 0 AND (Sentencia = "INSERT" OR Sentencia = "SELECT"))THEN
									SET columnas = CONCAT(columnas ,",", val);
							END IF;
                            IF(i = (num-1) AND Sentencia = "INSERT")THEN 
								SET columnas = RPAD(columnas,CHAR_LENGTH(columnas)+1,")");
								SET columnas = LPAD(columnas,CHAR_LENGTH(columnas)+1,"(");
							END IF;
                            ELSEIF(Sentencia = "SELECT")THEN SET columnas = "*";
								ELSE SET columnas = "";
                        END IF;
                        
                        IF(i = 0 AND Sentencia = "UPDATE")THEN
                            SET conjunto = CONCAT(val," = ");
                            ELSEIF(i > 0 AND Sentencia = "UPDATE")THEN
                            SET conjunto = CONCAT(conjunto,",",val," = ");
                        END IF;
                    END;
                WHEN 1 THEN 
					BEGIN
						IF(i = 0 AND Sentencia = "INSERT")THEN
							SET valores = CONCAT("'",val,"'"); 
							ELSEIF(i > 0 AND Sentencia = "INSERT")THEN
							SET valores = CONCAT(valores ,",'", val,"'");
                        END IF;
                        IF(Sentencia = "UPDATE")THEN
                            SET conjunto = CONCAT(conjunto," '",val,"'");
                        END IF;
                    END;
            END CASE;
            SET a = a + 1; 
        END WHILE;    
		SET i = i + 1;
    END WHILE;
    
	CASE Sentencia
		WHEN "INSERT" THEN SET @EXEC = 	(CONCAT("INSERT INTO ",Tabla," ",columnas," VALUES(",valores,")"));
        WHEN "UPDATE" THEN SET @EXEC =	(CONCAT("UPDATE ",Tabla," SET ",conjunto," ",Array_Datos2,""));
        WHEN "SELECT" THEN SET @EXEC =	(CONCAT("SELECT DISTINCT ",columnas," FROM ",Tabla," ",Array_Datos2,""));
        WHEN "DELETE" THEN SET @EXEC =	(CONCAT("DELETE FROM ",Tabla," ",Array_Datos2,""));
    END CASE;
    
    PREPARE EXEC FROM @EXEC;
    EXECUTE EXEC;
    DEALLOCATE PREPARE EXEC;
END;;

DELIMITER ;


DROP PROCEDURE IF EXISTS InfoDB;
DELIMITER ;;
CREATE PROCEDURE InfoDB(IN ArrayInfoDB VARCHAR(200))
BEGIN
	
    
    CALL EXECUTE_ARRAY(
		ArrayInfoDB,"~",
        "CASE @i 
			WHEN 0 THEN SET @valDB    	 	= @valor;
			WHEN 1 THEN SET @valINT 	  	= @valor;
			WHEN 2 THEN SET @valTabla 	  	= @valor;
		END CASE;");
        
    SET @cont = -1;
	CASE (@valINT) 
		WHEN 1 THEN 
                    SET @cont1 = -1;
					SELECT DISTINCT iT.TABLE_NAME AS tablas,1 AS tipoT, @cont := @cont + 1 AS posicion
					FROM  information_schema.TABLES iT
					WHERE iT.TABLE_SCHEMA = @valDB AND TABLE_TYPE = "BASE TABLE"
					GROUP BY  iT.TABLE_NAME,TABLE_TYPE 
                    UNION 
                    SELECT DISTINCT iT.TABLE_NAME AS tablas,2 AS tipoT, @cont1 := @cont1 + 1 AS posicion
					FROM  information_schema.TABLES iT
					WHERE iT.TABLE_SCHEMA = @valDB AND TABLE_TYPE = "VIEW"
					GROUP BY  iT.TABLE_NAME,TABLE_TYPE 
                    ORDER BY tablas, tipoT;
		WHEN 2 THEN 
					SELECT COLUMN_NAME AS Columnas, @cont := @cont + 1 AS PosicionColum
                    FROM information_schema.COLUMNS iC
                    WHERE iC.TABLE_SCHEMA = @valDB AND TABLE_NAME = @valTabla;
		WHEN 3 THEN 
					SELECT DISTINCT iT.TABLE_NAME AS tablas
					FROM  information_schema.TABLES iT
					WHERE iT.TABLE_SCHEMA = @valDB AND TABLE_TYPE = "BASE TABLE" AND iT.TABLE_NAME NOT LIKE '%_Log';
    END CASE;
 
END;;
DELIMITER ;

-- CALL InfoDB("SARA006~3~0");

DROP FUNCTION IF EXISTS M_REMOVE;
DELIMITER ;;
CREATE FUNCTION M_REMOVE(cadena VARCHAR(500)) RETURNS varchar(500) CHARSET latin1
BEGIN
	RETURN REPLACE(REPLACE(TRIM(cadena),"\n",""),"\t","");
END;;
DELIMITER ;

DROP FUNCTION IF EXISTS M_LENGTH;
DELIMITER ;;
CREATE FUNCTION M_LENGTH(Array VARCHAR(1000), Separador CHAR(1)) RETURNS int(11)
BEGIN 
	DECLARE	contador INTEGER DEFAULT 1;
    DECLARE valor VARCHAR(500);
    DECLARE cantidad INTEGER;
    Bucle : WHILE (TRUE) DO
		
        SET valor = SUBSTRING_INDEX(Array,Separador,1);
        SET cantidad = CHAR_LENGTH(Array) - CHAR_LENGTH(valor);
        SET Array = RIGHT(Array,cantidad -1);
        
        IF(CHAR_LENGTH(Array) = 0) THEN
			LEAVE Bucle;
        END IF;
        
        SET contador = contador + 1; 
    END WHILE Bucle;
    RETURN contador;
    
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS EXECUTE_ARRAY;
DELIMITER ;;
CREATE PROCEDURE EXECUTE_ARRAY(IN Array VARCHAR(500),IN Separador CHAR(1),IN Contenido VARCHAR(1000))
BEGIN
	
	SET @i = 0;SET @valor = "";SET @cant = 0;
    Bucle : WHILE(TRUE)DO
		SET @valor = SUBSTRING_INDEX(Array,Separador,1);
        SET @cant = CHAR_LENGTH(Array) - CHAR_LENGTH(@valor);
        SET Array = RIGHT(Array,@cant-1);
        CALL MACC(Contenido);
        
        IF(CHAR_LENGTH(Array) = 0) THEN
			LEAVE Bucle;
        END IF;
        SET @i = @i + 1;
    END WHILE Bucle;
    SET @i = 0;SET @valor = "";SET @cant = 0;
END;;

DELIMITER ;

DROP PROCEDURE IF EXISTS MACC;
DELIMITER ;;
CREATE PROCEDURE MACC(IN concatenacion VARCHAR(2000))
BEGIN
	SET @var = concatenacion;
    PREPARE var FROM @var;
    EXECUTE var;
    DEALLOCATE PREPARE var;
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS RegistrarEvaluacion;
DELIMITER ;;
CREATE PROCEDURE RegistrarEvaluacion(IN ArrayEvaluacion VARCHAR(500))
BEGIN

    CALL EXECUTE_ARRAY(
		ArrayEvaluacion,"~",
        "CASE @i 
			WHEN 0 THEN SET @observacionG 	= @valor;
			WHEN 1 THEN SET @resultado 	  	= @valor;
			WHEN 2 THEN SET @idVersion 	  	= @valor;
			WHEN 3 THEN SET @idLista 	  	= @valor;
			WHEN 4 THEN SET @idFuncionario 	= @valor;
            WHEN 5 THEN SET @fechaVigencia  = @valor;
			WHEN 6 THEN SET @ArrayEvaItems 	= @valor;
		END CASE;");
        
	SELECT "1";
	SELECT  COUNT(*) INTO @contRepro
    FROM Evaluacion_General
    WHERE Id_Version = @idVersion AND Resultado = 0 AND Id_Funcionario = @idFuncionario; 
    
    SELECT Id_Estado INTO @idEstado
    FROM Version 
    WHERE Id_Version = @idVersion;
    
    
    IF(@contRepro < 3 AND @idEstado in (3,4))THEN
    SELECT "2";
		CALL SARA_CRUD("INSERT","Evaluacion_General",CONCAT("Observacion~",@observacionG,"|Resultado~",@resultado,"|Id_Version~",@idVersion,"|Id_Lista_Chequeo~",@idLista,"|Id_Funcionario~",@idFuncionario,""),"");
		CALL SARA_CRUD("SELECT","Evaluacion_General","Id_Evaluacion_General INTO @idEvaluacion","Id_Evaluacion_General > 0 ORDER BY Id_Evaluacion_General DESC LIMIT 1");
    
    BEGIN-- Validacion de estado y actualizacion del mismo
    	
        SET @idProd = 0;
        
        SELECT Id_P_Virtual INTO @idProd FROM Version WHERE Id_Version = @idVersion;
        
        IF(@resultado = 1)THEN
    		CASE @idEstado
    			WHEN 3 THEN UPDATE Version SET Id_Estado = 4 WHERE Id_Version = @idVersion;
                WHEN 4 THEN 
                BEGIN 
    				
                    SET @val = 0;
    				SELECT COUNT(*) INTO @val
    				FROM Version 
    				WHERE Id_P_Virtual = @idProd AND Id_Estado = 5;
    				
    				IF (@val > 0) THEN
                    
    					UPDATE Version SET Id_Estado = 11,Num_Version = ROUND(Num_Version) WHERE Id_Version = @idVersion;
                        
                        ELSE UPDATE Version SET Id_Estado = 5,Num_Version = ROUND(Num_Version) WHERE Id_Version = @idVersion;
    				
    				END IF;
                END;
                
            END CASE;
            
        END IF;
    END;
    
    
    -- ------------------------------------ VALIDACION SOLUCION FECHA-----------------------------------------------------------------------

 
		-- CALL SARA_CRUD("SELECT","08_V_Funcionario","Id_Rol INTO @rol",
		-- CONCAT("Id_Funcionario = ",@idFuncionario," AND Id_Rol IN (2,3)"));
        
        SELECT Id_Rol INTO @rol
        FROM Funcionario fu INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1
        WHERE fu.Id_Funcionario = @idFuncionario AND Id_Rol IN (2,3);
    
	IF(@rol = 2 AND @resultado = 1)THEN
    
		IF(@fechaVigencia = "null")THEN 
			SET @fechaVigencia = CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH)," 18:00:00");	
		END IF;	
    
		 CALL SARA_CRUD("UPDATE","Version",CONCAT("Fecha_Publicacion~",@fechaVigencia,""),CONCAT("Id_Version = ",@idVersion,""));
         
         ELSE IF (@rol = 3 AND @resultado = 1)THEN
    
			CALL SARA_CRUD("SELECT","Version","Fecha_Publicacion INTO @fechaVigencia",CONCAT("Id_Version = ",@idVersion,""));
            
            CALL SARA_CRUD("UPDATE","Version",CONCAT("Fecha_Vigencia~",@fechaVigencia,""),CONCAT("Id_Version = ",@idVersion,""));
            
            ELSE IF((@rol = 2 OR  @rol = 3) AND @resultado = 0) THEN
                
				IF(@fechaVigencia = "null")THEN 
					SET @fechaVigencia = CONCAT(DATE_ADD(CURDATE(), INTERVAL 3 DAY)," 18:00:00");	
				END IF;	
				CALL SARA_CRUD("UPDATE","Version",CONCAT("Fecha_Vigencia~",@fechaVigencia,""),CONCAT("Id_Version = ",@idVersion,""));
            
			END IF;
         END IF;
         
    END IF;
    
    -- -------------------------------------------------------------------------------
	
    SELECT "3";
    SET @i = 0;
	SET @num = M_LENGTH(@ArrayEvaItems,"|");
	WHILE(@i < @num)DO
		SET @arrayE = SUBSTRING_INDEX(@ArrayEvaItems,"|",1);
        SET @cant = CHAR_LENGTH(@ArrayEvaItems) - CHAR_LENGTH(@arrayE);
        SET @ArrayEvaItems = RIGHT(@ArrayEvaItems,@cant -1);  
        SET @a = 0;
        
        WHILE(@a < 3 )DO
			SET @val = SUBSTRING_INDEX(@arrayE,"¤",1);
			SET @cant = CHAR_LENGTH(@arrayE) - CHAR_LENGTH(@val);
			SET @arrayE = RIGHT(@arrayE,@cant -1);
				
                CASE @a
					WHEN 0 THEN SET @valorizacion = @val;
                    WHEN 1 THEN SET @observacionItem = @val;
                    WHEN 2 THEN SET @idDetallesLista = @val;
                END CASE;
            SET @a = @a + 1;        
        END WHILE;
        SELECT @valorizacion,@observacionItem,@idDetallesLista,@idEvaluacion;
        CALL SARA_CRUD("INSERT","Detalles_Evaluacion",CONCAT("Valorizacion~",@valorizacion,"|Observacion~",@observacionItem,"|Id_Detalles_Lista~",@idDetallesLista,"|Id_Evaluacion_General~",@idEvaluacion,""),"");

        SET @i = @i + 1;
    END WHILE;
    
    -- SI FUE ACEPTADO POR PARTE DEL E TECNICO
    CALL SARA_CRUD("SELECT","Version","Id_Estado INTO @estado1","Id_Version = @idVersion");
    CALL SARA_CRUD("SELECT","Version","Url_Version INTO @urlVer","Id_Version = @idVersion");
    
    SELECT Id_Centro INTO @idCentro
    FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
    WHERE Id_Funcionario = @idFuncionario;
    
    SELECT  COUNT(*) INTO @contRepro
    FROM Evaluacion_General
    WHERE Id_Version = @idVersion AND Resultado = 0 AND Id_Funcionario = @idFuncionario;
    
    SELECT v3.Nom_Rol INTO @nomRol
    FROM Funcionario v1 
	INNER JOIN Rol_Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario AND v2.Vigencia = 1
	INNER JOIN Rol v3 ON v2.Id_Rol = v3.Id_Rol
	WHERE v2.Id_Funcionario = @idFuncionario;
    
    SELECT "Entro0",@resultado,@estado1;
    IF(@resultado = 1 AND @estado1 = 4)THEN
		
        SELECT v1.Id_Funcionario INTO @idEval
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
		INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario AND v3.Vigencia = 1
		WHERE Id_Centro = @idCentro AND Id_Rol = 3;
        
		CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha evaluar para EP~1~",@idFuncionario,"~",@idEval,"~",@idVersion,""));
        
        -- CALL RegistarNotificaion(CONCAT("El Producto Virtual ",@idVersion," ",@estado1,"a pasado a la siguiente face de evaluacion",@i+@a,"~3~",@idFuncionario,"~",@idFun2,""));
        
        ELSE IF(@resultado = 1 AND @estado1 = 5 OR @estado1 = 11) THEN
			
            SELECT v1.Id_Funcionario  INTO @idCoor
			FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
			INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario AND v3.Vigencia = 1
			WHERE Id_Centro = @idCentro AND Id_Rol = 4;
            
			CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha aprobar CO~3~",@idFuncionario,"~",@idCoor,"~",@idVersion,""));	
            
            
            -- CODIGOOO LARGO PARA EL NUMERO VERSION ---------------------------------------------------------
            
            -- CAMBIAR NUMERO VERSION APROBADA
				
            -- CAMBIAR EL NUMERO DE VERSION DE LAS OTRAS VERSIONES QUE ESTAN EN EVALUACION
				
                SET @lineas = 0;
                SELECT Id_P_Virtual INTO @idPro1 FROM Version 
				WHERE Id_Version = @idVersion;
                
				SELECT COUNT(*) INTO @lineas
				FROM Version
				WHERE Id_P_Virtual = @idPro1 AND Id_Estado IN (3,4,9,10); 
                
                IF(@lineas > 0) THEN
					CALL UpdateNumeroVersion(@idPro1,@idVersion,@idCoor);
                END IF;
				
                
            -- ------------------------------------------------------------------------------------------

				ELSE IF(@resultado = 0 AND (@estado1 = 3 OR @estado1 = 4) AND @contRepro < 3)THEN
                
					CALL ALL_AUTOR(@idVersion,@autores);
					
                    CASE (@estado1)-- 13/04/2017
						WHEN 3 THEN SET @newEstado = 9;
                        WHEN 4 THEN SET @newEstado = 10;
                    END CASE;-- 
                    -- -------------- 12/04/2017
                    UPDATE Version SET Id_Estado = @newEstado -- corregir
					WHERE Id_Version  = @idVersion;
                    -- -----------------
                    
					CALL RegistarNotificaion(CONCAT("El Producto Virtual Fue reprovado por el ",@nomRol,"~2~",@idFuncionario,"~",@autores,"~",@idEvaluacion,""));	
                    
                    -- --------------------------------------TRES INTENTOS ERRADOS------------------------------------------------- CAMBIO
                    ELSE IF(@contRepro = 3) THEN
                    
						CALL ALL_AUTOR(@idVersion,@autores);
                        
						SELECT @autores as Autores_1; -- Verificacion del datos de autores por si lo pasa bien
                        
                        CALL RegistarNotificaion(CONCAT("El Producto Virtual Fue reprovado INS~2~",@idFuncionario,"~",@autores,"~",@idEvaluacion,""));	
                    
						CALL RegistarNotificaion(CONCAT("El Producto Virtual, Fue reprobado 3 veses por el ",@nomRol,", dejando esta version cancelada~3~",@idFuncionario,"~",@autores,"~",@idVersion,""));
                        
						UPDATE Version SET Id_Estado = 8 -- cancelado
                        WHERE Id_Version  = @idVersion;
                        
                    END IF;
					-- ------------------------------------------------------------------------------------- CAMBIO
				END IF;
		END IF;
    END IF;
    ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "La version se encuentra anulada";
    END IF;
        
END;;
DELIMITER ;;

DROP PROCEDURE IF EXISTS UpdateNumeroVersion;
DELIMITER ;;
CREATE PROCEDURE UpdateNumeroVersion(IN idPro INTEGER, IN idVerAprobada INTEGER,IN idCoordinador INTEGER)
BEGIN
	DECLARE u,c,cont INTEGER;
    DECLARE numId INTEGER;
    DECLARE idis VARCHAR(100);
    DECLARE valor VARCHAR(100);
    DECLARE cant  INTEGER;
    DECLARE autoresVersion VARCHAR(200);
    DECLARE numVer1 FLOAT(2);
	DECLARE numOld1 FLOAT(2);
    
	SET SQL_SAFE_UPDATES = 0;
    DROP TEMPORARY TABLE IF EXISTS tmpVersion;
    
    CREATE TEMPORARY TABLE tmpVersion(
		IdVersion INTEGER ,
        NumVersion FLOAT,
        NumOld FLOAT);
	
	SET @o = 0;
    
	CALL MACC(CONCAT("
    INSERT INTO tmpVersion
     SELECT Id_Version, ROUND(Num_Version + 1.0) + (@o := @o +1)*0.1 ,Num_Version
     FROM Version
     WHERE Id_P_Virtual = ",idPro," AND Id_Estado IN (3,4,9,10)
     ORDER BY Fecha_Envio ASC;"));
     
     SELECT * FROM tmpVersion;
     
     UPDATE Version v1
     SET v1.Num_Version = (SELECT v2.NumVersion FROM tmpVersion v2 WHERE v2.IdVersion = v1.Id_Version)
     WHERE v1.Id_P_Virtual = idPro AND v1.Id_Estado IN (3,4,9,10);
        
	SET cont = 0;
    SELECT COUNT(*) INTO cont
    FROM tmpVersion;
    
    SET c = 0;
    SET idis = "0";
    WHILE(c < cont)DO
			CALL MACC(CONCAT("SELECT IdVersion INTO @idVer 
            FROM tmpVersion WHERE IdVersion NOT IN (",idis,") ORDER BY IdVersion ASC LIMIT 1"));
            
            IF(c = 0)THEN
				SET idis = @idver;
                ELSE SET idis = CONCAT(idis,",",@idver);
            END IF;
            SET c = c + 1;
    END WHILE;
    
    SELECT idis;
    
   
    
    SET u = 0;
		SET numId = M_LENGTH(idis,",");
		WHILE(u < numId)DO
			SET valor = SUBSTRING_INDEX(idis,",",1);
			SET cant = CHAR_LENGTH(idis) - CHAR_LENGTH(valor);
			SET idis = RIGHT(idis,cant -1);
            
            CALL ALL_AUTOR(valor,autoresVersion);
            
            SELECT NumVersion,NumOld INTO numVer1,numOld1 FROM tmpVersion WHERE IdVersion = valor;
            
            SELECT @numVer1,numOld1 ,idCoordinador,autoresVersion,valor,numId,u;
            
            CALL RegistarNotificaion(CONCAT("El Numero de la Version a sido Modificado de ",numOld1," a ",numVer1,"~3~",idCoordinador,"~",autoresVersion,"~",valor,""));	
            
			SET u = u + 1;
		END WHILE;
	 SELECT "---",numVer1,numOld1 ,idCoordinador,autoresVersion,valor,numId,u;
     DROP TEMPORARY TABLE IF EXISTS tmpVersion;
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS ALL_AUTOR;
DELIMITER ;;
CREATE PROCEDURE ALL_AUTOR(IN idVersion INTEGER, OUT salida VARCHAR(50))
BEGIN
	SELECT COUNT(*) INTO @cont
    FROM Version v1 INNER JOIN Autor v2 ON v1.Id_Version = v2.Id_Version
    WHERE v1.Id_Version = idVersion;
    
    SET @idVersion = idVersion;
    SET @c = 0;
    SET @idis = "0";
    WHILE(@c < @cont)DO
			CALL MACC(CONCAT("SELECT v2.Id_Funcionario INTO @idFun
			FROM Version v1 INNER JOIN Autor v2 ON v1.Id_Version = v2.Id_Version INNER JOIN Funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
			WHERE v2.Id_Version = ",@idVersion," AND v2.Id_Funcionario NOT IN (",@idis,")
			ORDER BY v2.Id_Funcionario ASC LIMIT 1"));
            
            IF(@c = 0)THEN
				SET @idis = @idFun;
                ELSE SET @idis = CONCAT(@idis,",",@idFun);
            END IF;
            SET @c = @c + 1;
    END WHILE;
	SET salida = @idis;
END;;
DELIMITER ;;

DROP PROCEDURE IF EXISTS RegistrarCategoria;
DELIMITER ;;
CREATE PROCEDURE RegistrarCategoria(IN ArrayCategoria VARCHAR(500))
BEGIN
	CALL EXECUTE_ARRAY(
    ArrayCategoria,
    "~",
    "CASE @i 
		WHEN 0 THEN SET @nomCategoria  = @valor; 
        WHEN 1 THEN SET @desCategoria  = @valor;
        WHEN 2 THEN SET @idFuncionario = @valor;
        WHEN 3 THEN SET @ArrayTemas 	= @valor;
    END CASE;"
    );
    
    CALL SARA_CRUD("INSERT","Categoria",CONCAT("Nom_Categoria~",@nomCategoria,"|Des_Categoria~",@desCategoria,"|Id_Funcionario~",@idFuncionario,""),"");
    CALL SARA_CRUD("SELECT","Categoria","Id_Categoria INTO @idCate","Nom_Categoria = @nomCategoria AND Des_Categoria = @desCategoria");
    
     SET @i = 0;
    SET @num = M_LENGTH(@ArrayTemas,",");
    WHILE(@i < @num)DO
		SET @valor = SUBSTRING_INDEX(@ArrayTemas,",",1);
        SET @cant = CHAR_LENGTH(@ArrayTemas) - CHAR_LENGTH(@valor);
        SET @ArrayTemas = RIGHT(@ArrayTemas,@cant -1);
			CALL SARA_CRUD("INSERT","Detalles_Categoria",CONCAT("Id_Categoria~",@idCate,"|Id_Tema~",@valor,""),"");
        SET @i = @i + 1;
    END WHILE;
END;;
DELIMITER ;;


DROP PROCEDURE IF EXISTS RegistrarLista;
DELIMITER ;;
CREATE PROCEDURE RegistrarLista(IN ArrayLista VARCHAR(500))
BEGIN

	CALL EXECUTE_ARRAY(
		ArrayLista,
        "~",
        "CASE @i
			WHEN 0 THEN SET @Nom_Lista_Chequeo = @valor;
			WHEN 1 THEN SET @Des_Lista_Chequeo = @valor;
			WHEN 2 THEN SET @Id_Funcionario = @valor;
			WHEN 3 THEN SET @Array_Items = @valor;
        END CASE;"
    );
    CALL SARA_CRUD("INSERT","Lista_Chequeo",CONCAT("Nom_Lista_Chequeo~",@Nom_Lista_Chequeo,"|Des_Lista_Chequeo~",@Des_Lista_Chequeo,"|Id_Funcionario~",@Id_Funcionario,""),"");

	CALL SARA_CRUD("SELECT","Lista_Chequeo","Id_Lista_Chequeo INTO @idList","Nom_Lista_Chequeo  = @Nom_Lista_Chequeo");

    SET @i = 0;
    SET @num = M_LENGTH(@Array_Items,",");
    WHILE(@i < @num)DO
		SET @valor = SUBSTRING_INDEX(@Array_Items,",",1);
        SET @cant = CHAR_LENGTH(@Array_Items) - CHAR_LENGTH(@valor);
        SET @Array_Items = RIGHT(@Array_Items,@cant -1);
		CALL SARA_CRUD("INSERT","Detalles_Lista",CONCAT("Id_Lista_Chequeo~",@idList,"|Id_Item_Lista~",@valor,""),"");
        SET @i = @i + 1;
    END WHILE;
    
END;;
DELIMITER ;;

DROP PROCEDURE IF EXISTS RegistrarItem_Tema;
DELIMITER ;;
CREATE PROCEDURE RegistrarItem_Tema(IN arrayItems_Temas VARCHAR(400))
BEGIN
	CALL EXECUTE_ARRAY(
		arrayItems_Temas,
        ",",
        "CASE @i
			WHEN 0 THEN SET @eleccion = @valor;
			WHEN 1 THEN SET @arrayEleccion = @valor;
        END CASE;"
    );
    IF(@eleccion = 1)THEN
		CALL EXECUTE_ARRAY(
			@arrayEleccion,
			"~",
			"CASE @i
				WHEN 0 THEN SET @desItemLista = @valor;
				WHEN 1 THEN SET @tipoItem = @valor;
			END CASE;"
		);
        INSERT INTO Item_Lista VALUES(null,@desItemLista,@tipoItem);
        SELECT Id_Item_Lista INTO @idItem FROM Item_Lista WHERE Des_Item_Lista = @desItemLista AND Tipo_Item = @tipoItem;
        SELECT Id_Item_Lista, Des_Item_Lista FROM Item_Lista WHERE Id_Item_Lista = @idItem;
        
        ELSE IF(@eleccion = 2)THEN
			CALL EXECUTE_ARRAY(
			@arrayEleccion,
			"~",
			"CASE @i
				WHEN 0 THEN SET @nomTema = @valor;
				WHEN 1 THEN SET @desTema = @valor;
			END CASE;"
		);
        INSERT INTO Tema VALUES (null,@nomTema,@desTema);
        SELECT Id_Tema INTO @idTema FROM Tema WHERE Nom_Tema = @nomTema AND Des_Tema = @desTema;
        SELECT Id_Tema, Nom_Tema FROM Tema WHERE Id_Tema = @idTema;
        END IF;
    END IF;
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS ModificarLista;
DELIMITER ;;
CREATE PROCEDURE ModificarLista(IN arrayModificar VARCHAR(400))
BEGIN
	CALL EXECUTE_ARRAY(
		arrayModificar,
        "~",
        "CASE @i
			WHEN 0 THEN SET @Id_Lista_Chequeo = @valor;
			WHEN 1 THEN SET @Nom_Lista_Chequeo = @valor;
			WHEN 2 THEN SET @Des_Lista_Chequeo = @valor;
			WHEN 3 THEN SET @Array_Items = @valor;
        END CASE;"
    );
    
    UPDATE lista_chequeo 
    SET Nom_Lista_Chequeo = @Nom_Lista_Chequeo, Des_Lista_Chequeo = @Des_Lista_Chequeo
    WHERE Id_Lista_Chequeo = @Id_Lista_Chequeo;
    
    IF (@Array_Items)THEN
		SET @i = 0;
		SET @num = M_LENGTH(@Array_Items,",");
		WHILE(@i < @num)DO
			SET @valor = SUBSTRING_INDEX(@Array_Items,",",1);
			SET @cant = CHAR_LENGTH(@Array_Items) - CHAR_LENGTH(@valor);
			SET @Array_Items = RIGHT(@Array_Items,@cant -1);
			CALL SARA_CRUD("INSERT","Detalles_Lista",CONCAT("Id_Lista_Chequeo~",@Id_Lista_Chequeo,"|Id_Item_Lista~",@valor,""),"");
			SET @i = @i + 1;
		END WHILE;
    END IF;
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS Registrar_PV;
DELIMITER ;;
CREATE PROCEDURE Registrar_PV(IN ArrayTodo VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN

DECLARE i,a,co,num,idPro,idTema,tipo INTEGER DEFAULT 0;

DECLARE Nom_P_Virtual_Var,Des_P_Virtual_Var,Palabras_Clave_Var,Id_Formato_Var,
		Url_Version_Var,Url_Img_Var,Inst_Instalacion_Var,Reqst_Instalacion_Var,
        ArrayFuncionario_Var ,ArrayTema_Var VARCHAR(200);
        
DECLARE arrayT VARCHAR(100) DEFAULT "";
DECLARE cant   INTEGER DEFAULT 0;
DECLARE val    VARCHAR(100) DEFAULT "";

SELECT 1;

	CALL EXECUTE_ARRAY(
		ArrayTodo,
		"~",
		"CASE @i
			WHEN 0 THEN SET @Nom_P_Virtual = @valor;
			WHEN 1 THEN SET @Des_P_Virtual = @valor;
			WHEN 2 THEN SET @Palabras_Clave = @valor;
			WHEN 3 THEN SET @Id_Formato = @valor;
			WHEN 4 THEN SET @Url_Version = @valor;
			WHEN 5 THEN SET @Url_Img = @valor;
			WHEN 6 THEN SET @Inst_Instalacion= @valor;
			WHEN 7 THEN SET @Reqst_Instalacion = @valor;
			WHEN 8 THEN SET @ArrayFuncionario = @valor;
			WHEN 9 THEN SET @ArrayTema = @valor;
		END CASE;"
	);	
    
SET Nom_P_Virtual_Var 	= @Nom_P_Virtual, 
	Des_P_Virtual_Var 	= @Des_P_Virtual,
	Palabras_Clave_Var 	= @Palabras_Clave,
	Id_Formato_Var 		= @Id_Formato,
	Url_Version_Var 	= @Url_Version,
	Url_Img_Var 		= @Url_Img,
	Inst_Instalacion_Var	= @Inst_Instalacion,
	Reqst_Instalacion_Var 	= @Reqst_Instalacion,
	ArrayFuncionario_Var 	= @ArrayFuncionario,
	ArrayTema_Var 			= @ArrayTema;

    -- CALL SARA_CRUD("SELECT","Producto_Virtual","COUNT(*) INTO @co","Nom_P_Virtual = @Nom_P_Virtual OR Des_P_Virtual = @Des_P_Virtual");
    
    SELECT COUNT(*) -- INTO co
    FROM Producto_Virtual
    WHERE Nom_P_Virtual = Nom_P_Virtual_Var OR Des_P_Virtual = Des_P_Virtual_Var;
    
    IF (co = 0) THEN 
		CALL SARA_CRUD("INSERT","Producto_Virtual",CONCAT("Nom_P_Virtual~",Nom_P_Virtual_Var,"|Des_P_Virtual~",Des_P_Virtual_Var,"|Palabras_Clave~",Palabras_Clave_Var,"|Id_Formato~",Id_Formato_Var,""),"");
		
        -- CALL SARA_CRUD("SELECT","Producto_Virtual","Id_P_Virtual INTO @idPro","Nom_P_Virtual = @Nom_P_Virtual");
        
        SELECT Id_P_Virtual INTO idPro
        FROM Producto_Virtual
        WHERE Nom_P_Virtual = Nom_P_Virtual_Var;
        
        SELECT idPro,Nom_P_Virtual_Var; 
        
		SET i = 0;
		SET num = M_LENGTH(ArrayTema_Var,",");
        
        SELECT num;
        
        
		WHILE(i < num)DO
         -- SET i = i + 1;
         
        SELECT "Entro1_";
        
			SET arrayT = SUBSTRING_INDEX(ArrayTema_Var,",",1);
			SET cant = CHAR_LENGTH(ArrayTema_Var) - CHAR_LENGTH(arrayT);
			SET ArrayTema_Var = RIGHT(ArrayTema_Var,cant -1);
			SET a = 0;
			WHILE(a < 2)DO
            
            SELECT "Entro2_";
				SET val = SUBSTRING_INDEX(arrayT,"-",1);
				SET cant = CHAR_LENGTH(arrayT) - CHAR_LENGTH(val);
				SET arrayT = RIGHT(arrayT,cant -1);
				CASE a
					WHEN 0 THEN SET idTema = val; 
					WHEN 1 THEN SET tipo 	= val;
				END CASE;
				SET a = a + 1;        
			END WHILE;
            
            SELECT idTema,tipo,idPro;
            
			CALL SARA_CRUD("INSERT","Detalles_Tema",CONCAT("Id_Tema~",idTema,"|Id_P_Virtual~",idPro,"|Tipo_Tema~",tipo,""),"");
			SET i = i + 1;
		END WHILE;
		CALL RegistrarVersion(CONCAT("",idPro,"~",Url_Version_Var,"~",Url_Img_Var,"~",Inst_Instalacion_Var,"~",Reqst_Instalacion_Var,"~",ArrayFuncionario_Var,""),nomUrl);
        
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "El nombre del producto o los detalles del mismo ya existen ";
	END IF;
	
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS RegistrarVersion;
DELIMITER ;;
CREATE PROCEDURE RegistrarVersion(IN ArrayVersion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN

DECLARE numVer FLOAT DEFAULT 1;

SET @idVer = NULL;


	CALL EXECUTE_ARRAY(
		ArrayVersion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idPro = @valor;
			WHEN 1 THEN SET @Url_Version = @valor;
			WHEN 2 THEN SET @Url_Img = @valor;
			WHEN 3 THEN SET @Inst_Instalacion = @valor;
			WHEN 4 THEN SET @Reqst_Instalacion = @valor;
			WHEN 5 THEN SET @ArrayFuncionario = @valor;
        END CASE;"
    );
    
    SELECT COUNT(*) INTO @lineas
    FROM Version
    WHERE Id_P_Virtual = @idPro AND Id_Estado IN (6,7);-- 7
    
    
    IF(@lineas > 0 )THEN-- ACTUALIZACION
    
		-- -------- Num Version
        SELECT "ENTRA";
        SELECT COUNT(*) INTO @lineasSub
        FROM Version
        WHERE Id_P_Virtual = @idPro AND Id_Estado IN (3,4,9,10);
        
        
		SET @numVer = (SELECT MAX(Num_Version) 
		FROM Version 
		WHERE Id_P_Virtual = @idPro AND Id_Estado IN (5,6,7,11));-- 7
		
        IF (@lineasSub >= 0 AND @lineasSub < 5) THEN 
			CALL MACC(CONCAT("SET @numVer = @numVer + 1.",(@lineasSub + 1),""));
            
			ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Imposible actualizar esta version";
            
        END IF;
        SET numVer = @numVer;
	
        -- ------------------
        
	END IF;
    
		CALL SARA_CRUD("INSERT","Version",CONCAT("Num_Version~",numVer,"|Url_Version~",@Url_Version,"|Url_Img~",@Url_Img,"|Inst_Instalacion~",@Inst_Instalacion,"|Reqst_Instalacion~",@Reqst_Instalacion ,"|Id_P_Virtual~",@idPro,""),"");
		-- CALL SARA_CRUD("SELECT","Version","Id_Version INTO @idVer","Inst_Instalacion = @Inst_Instalacion AND Reqst_Instalacion = @Reqst_Instalacion");
		
        
        SELECT @Inst_Instalacion,@Reqst_Instalacion,@idPro,numVer;
        
        
		SELECT Id_Version INTO @idVer
		FROM Version v1 INNER JOIN Producto_Virtual v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
		WHERE Inst_Instalacion = @Inst_Instalacion 
			AND Reqst_Instalacion = @Reqst_Instalacion 
			AND v1.Id_P_Virtual = @idPro 
			AND v1.Id_Estado = 3
			AND v1.Num_Version = numVer
		ORDER BY Fecha_Envio DESC LIMIT 1;
        
			
	   SET @a = 0;
	   Bucle : WHILE (TRUE) DO
			SET @valor = SUBSTRING_INDEX(@ArrayFuncionario,",",1);
			SET @cantidad = CHAR_LENGTH(@ArrayFuncionario) - CHAR_LENGTH(@valor);
			SET @ArrayFuncionario = RIGHT(@ArrayFuncionario,@cantidad -1);
				
				IF(@a = 0)THEN
					SET @prin = 1;
					SET @funPrin = @valor;
					ELSE SET @prin = 0;
				END IF;
                SELECT @idVer,@valor;
				CALL SARA_CRUD("INSERT","Autor",CONCAT("Id_Version~",@idVer,"|Id_Funcionario~",@valor,"|Principal~",@prin,""),"");
			SET @a = @a +1;
			IF(CHAR_LENGTH(@ArrayFuncionario) = 0) THEN
				LEAVE Bucle;
			END IF;
			
		END WHILE Bucle;
		
		SELECT Id_Centro INTO @idCentro
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
		WHERE Id_Funcionario = @funPrin; -- SE PUEDE HACER DESDE SARA_CRUD
		
		SELECT v1.Id_Funcionario,v4.Nom_Rol INTO @idEval,@nomRol-- Anadir nomRol para la notificacion 14/04/2017
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
			 INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario AND v3.Vigencia = 1
			 INNER JOIN Rol v4 ON v3.Id_Rol = v4.Id_Rol
		WHERE Id_Centro = @idCentro AND v3.Id_Rol = 2; -- SE PUEDE HACER DESDE SARA_CRUD
		
		CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual ha evaluar para el ",@nomRol,"~1~",@funPrin,"~",@idEval,"~",@idVer,""));-- Anadir nomRol para la notificacion 14/04/2017
		
		UPDATE Version SET Url_Version = NameUrl(@idVer) WHERE Id_Version = @idVer;-- NUEVO NOMBRE 16/04/2017
		
		SET nomUrl = NameUrl(@idVer);-- RETORNA EL NOMBRE DEL ARCHIVO
        
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS CorreccionVersion;
DELIMITER ;;
CREATE PROCEDURE CorreccionVersion(IN ArrayCorrecion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN

	CALL EXECUTE_ARRAY(
		ArrayCorrecion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idFuncionario = @valor;
			WHEN 1 THEN SET @idVersion = @valor;
		END CASE"
    );
    

	SELECT Id_Funcionario INTO @idFun
    FROM Version v1 INNER JOIN Autor v2 ON v1.Id_Version = v2.Id_Version
    WHERE v1.Id_Version = @idVersion AND Principal = 1;
    
    CALL SARA_CRUD("SELECT","Version","Id_Estado INTO @oldEstado","Id_Version = @idVersion");
    CALL SARA_CRUD("SELECT","Version","Url_Version INTO @oldUrl","Id_Version = @idVersion");
    
    SELECT CONCAT("ID1",@idFuncionario,"---  ID2",@idFun);
    
    IF(@idFuncionario = @idFun)THEN -- Cambio en la validacion ------------------------
		
		SELECT Id_Centro INTO @idCentro
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
		WHERE Id_Funcionario = @idFun;
		
        IF(@oldEstado = 9 OR @oldEstado = 10)THEN-- Cambio de estados 9-3 y 10-4
        
			CASE  @oldEstado
				WHEN 9 THEN SET @rol = 2, @newEstado = 3;-- @newEstado 12/042017
                WHEN 10 THEN SET @rol = 3, @newEstado = 4;-- @newEstado 12/042017
            END CASE;
            
			SELECT v1.Id_Funcionario INTO @idEval
			FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro 
			 INNER JOIN Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario AND v3.Vigencia = 1
			WHERE Id_Centro = @idCentro AND Id_Rol = @rol;
            
            CALL SARA_CRUD("UPDATE","Version",CONCAT("Id_Estado~",@newEstado,"|Fecha_Envio~",CURRENT_TIMESTAMP,""),CONCAT("Id_Version = ",@idVersion,""));-- @newEstado 12/042017
            CALL RegistarNotificaion(CONCAT("Nuevo Producto Virtual Corregido ha evaluar para Equipo~1~",@idFun,"~",@idEval,"~",@idVersion,""));
            
            UPDATE Version SET Url_Version = NameUrl(@idVersion) WHERE Id_Version = @idVersion;-- NUEVO NOMBRE 16/04/2017
            SET nomUrl = NameUrl(@idVersion);-- RETORNA EL NOMBRE DEL ARCHIVO
        END IF;
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Usuario no aceptado o URL no actualizado";
    END IF;
    
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS AprobarPV;
DELIMITER ;;
CREATE PROCEDURE AprobarPV(IN ArrayAprobacion VARCHAR(100),OUT nomUrl VARCHAR(50))
BEGIN
	DECLARE idProd INTEGER;
    
	CALL EXECUTE_ARRAY(
		ArrayAprobacion,
        "~",
        "CASE @i 
			WHEN 0 THEN SET @idCoordinador = @valor;
			WHEN 1 THEN SET @idVersion = @valor;
		END CASE"
    );
    
    CALL SARA_CRUD("UPDATE","Version",CONCAT("Id_Estado~6|Fecha_Publicacion~",CURRENT_TIMESTAMP,""),CONCAT("Id_Version = ",@idVersion,""));
    
    -- ------------------- Num version
    
    SET @idVerProxi = 0;
    
    SELECT Id_P_Virtual INTO idProd 
    FROM Version WHERE Id_Version = @idVersion;
    
	SELECT Id_Version INTO @idVerProxi
    FROM Version 
    WHERE Id_Estado = 11 AND Id_P_Virtual = idProd
    ORDER BY Num_Version ASC LIMIT 1;
    
    IF(@idVerProxi != 0) THEN
		UPDATE Version 
		SET Id_Estado = 5
		WHERE Id_Version = @idVerProxi;
    END IF;
    
    -- -------------------
    
    UPDATE Version SET Url_Version = NameUrl(@idVersion) WHERE Id_Version = @idVersion;-- NUEVO NOMBRE 16/04/2017
    SET nomUrl = NameUrl(@idVersion);-- RETORNA EL NOMBRE DEL ARCHIVO
    CALL ALL_AUTOR(@idVersion,@autores);
    CALL RegistarNotificaion(CONCAT("El Producto Virtual Fue publicado INS~3~",@idCoordinador,"~",@autores,"~",@idVersion,""));	
    
    -- ----------------------------------------
    --  RANKIN
    INSERT INTO Rankin (Id_Version)VALUES (@idVersion);
    
    -- CALL SARA_CRUD("SELECT","Version","Id_P_Virtual~@idPro","Id_Version = @idVersion");
    -- CALL SARA_CRUD("SELECT","Version","Num_Version~@numVer","Id_Version = @idVersion");
    -- CALL SARA_CRUD("UPDATE","Version",CONCAT("Num_Version~",@numVer + 1,""),
			-- "Id_P_Virtual = @idPro AND Id_Estado != 6 AND Num_Version = @numVer");
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS RegistrarFuncionario;
DELIMITER ;;
CREATE PROCEDURE RegistrarFuncionario(IN ArrayReg VARCHAR(800))
BEGIN
	CALL EXECUTE_ARRAY(
		ArrayReg,
        "~",
        "CASE @i
			WHEN 0 THEN SET @Id_Rol = @valor;
			WHEN 1 THEN SET @Id_Tipo_Documento = @valor; 
			WHEN 2 THEN SET @Num_Documento = @valor;
			WHEN 3 THEN SET @Nom_Funcionario = @valor;
			WHEN 4 THEN SET @Apellidos = @valor;
			WHEN 5 THEN SET @Correo = @valor;
			WHEN 6 THEN SET @Cargo = @valor;
			WHEN 7 THEN SET @Ip_Sena = @valor;
			WHEN 8 THEN SET @Toquen = @valor;
			WHEN 9 THEN SET @Id_Centro = @valor;
			WHEN 10 THEN SET @Id_Area = @valor;
        END CASE;"
    );
    
    SET @count = 0;
    IF(@Id_Rol != 1)THEN
		SELECT COUNT(*) INTO @count
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro INNER JOIN
			 Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario AND v3.Vigencia = 1
		WHERE Id_Centro = @Id_Centro AND Id_Rol = @Id_Rol;
    END IF;
    SELECT @count;
    IF(@count = 0 )THEN
		CALL SARA_CRUD("SELECT","Area_Centro","Id_Area_Centro INTO @idAC","Id_Centro = @Id_Centro AND Id_Area = @Id_Area");
		CALL SARA_CRUD("INSERT","Funcionario",CONCAT("Id_Tipo_Documento~",@Id_Tipo_Documento,"|Num_Documento~",@Num_Documento,"|Nom_Funcionario~",@Nom_Funcionario,"|Apellidos~",@Apellidos,"|Correo~",@Correo,"|Cargo~",@Cargo,"|Ip_Sena~",@Ip_Sena,"|Id_Area_Centro~",@idAC,""),"");
		CALL SARA_CRUD("SELECT","Funcionario","Id_Funcionario INTO @idFun","Num_Documento = @Num_Documento"); 
        
		CALL SARA_CRUD("INSERT","Rol_Funcionario",CONCAT("Id_Rol~",@Id_Rol,"|Id_Funcionario~",@idFun,"|Vigencia~1"),"");
		CALL SARA_CRUD("INSERT","Toquen",CONCAT("Numero_Toquen~",@Toquen,"|Funcionario~",@idFun,"|FechaVigencia~",DATE_ADD(CURDATE(), INTERVAL 7 DAY)," 18:00:00"),"");
	ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Lo siento, ya existe un funcionario con ese rol y centro de formacion";
    END IF;
    
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Rol_Funcionario_BI;
DELIMITER ;;
CREATE TRIGGER Rol_Funcionario_BI BEFORE INSERT ON rol_funcionario FOR EACH ROW
BEGIN
	SET @count = 0;
    SET @idCentro = 0;
    SELECT Id_Centro INTO @idCentro
    FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
    WHERE Id_Funcionario = NEW.Id_Funcionario;
    
    
    IF(NEW.Id_Rol != 1)THEN
		SELECT COUNT(*) INTO @count
		FROM Funcionario v1 INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro INNER JOIN
			 Rol_Funcionario v3 ON v1.Id_Funcionario = v3.Id_Funcionario
		WHERE Id_Centro = @idCentro AND Id_Rol = NEW.Id_Rol AND v3.Vigencia = 1;
    END IF;
    
    IF(@count = 0)THEN
		SET @count = 0;
        ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Lo siento, ya existe un funcionario con ese rol y centro de formacion";
    END IF;
    
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS RegistarNotificaion;
DELIMITER ;;
CREATE PROCEDURE RegistarNotificaion(IN ArrayDatos VARCHAR(1000))
BEGIN
		CALL EXECUTE_ARRAY(
			ArrayDatos,
            "~",
            "CASE @i
				WHEN 0 THEN SET @contenido = @valor;
				WHEN 1 THEN SET @idTipo = @valor;
				WHEN 2 THEN SET @idFun = @valor;
				WHEN 3 THEN SET @ArrayFun = @valor;
                WHEN 4 THEN SET @Ides = @valor;
			END CASE;"
        );
    
    
    SET @numRt = 0;
    

        CALL MACC(CONCAT( 
		" SELECT COUNT(*) INTO @numRt
		 FROM 18_v_notificaciones v1 
		 INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
		 INNER JOIN Funcionario v3 ON v1.Id_FuncionarioEnvio = v3.Id_Funcionario
		 INNER JOIN Rol_Funcionario v4 ON v3.Id_Funcionario = v4.Id_Funcionario AND v4.Vigencia = 1
		 INNER JOIN Rol v5 ON v4.Id_Rol = v5.Id_Rol
		 WHERE Conte_Notificacion = """,@contenido,"""
			AND Id_Tipo_Notificacion = 3
			AND v4.Id_Rol = 4 
			AND Ides_Proceso = ",@Ides,"
			AND v2.Id_Estado IN (6,7)
			AND v1.Id_FuncionarioEnvio = ",@idFun,"
			AND v1.Id_Funcionario IN (",@ArrayFun,");"));
       
    SELECT @numRt,@contenido,@Ides,@idFun,@ArrayFun;
    
    IF(@numRt = 0)THEN
		SELECT "Entro 1";
		CALL SARA_CRUD("INSERT","Notificacion",CONCAT("Conte_Notificacion~",@contenido,"|Id_Tipo_Notificacion~",@idTipo,"|Id_Funcionario~",@idFun,"|Ides_Proceso~",@Ides,""),"");
		CALL SARA_CRUD("SELECT","Notificacion","Id_Notificacion INTO @idNoti","Conte_Notificacion = @contenido AND Id_Tipo_Notificacion = @idTipo AND Id_Funcionario = @idFun AND Ides_Proceso = @Ides ORDER BY Id_Notificacion DESC LIMIT 1");
       
        SET @i = 0;
		SET @num = M_LENGTH(@ArrayFun,",");
		WHILE(@i < @num)DO
			SET @valor = SUBSTRING_INDEX(@ArrayFun,",",1);
			SET @cant = CHAR_LENGTH(@ArrayFun) - CHAR_LENGTH(@valor);
			SET @ArrayFun = RIGHT(@ArrayFun,@cant -1);
            
                SELECT  @idNoti,@valor,@num;
				CALL SARA_CRUD("INSERT","Detalles_Notificacion",CONCAT("Id_Notificacion~",@idNoti,"|Id_Funcionario~",@valor,""),"");
			SET @i = @i + 1;
		END WHILE;
		ELSE SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Ya se encuentra un registro con dichos datos";
    END IF;
END;;
	
DELIMITER ;


-- CALL ConsultarNotificaciones ("4~4~1");

DROP PROCEDURE IF EXISTS ConsultarNotificaciones;
DELIMITER ;;
CREATE PROCEDURE ConsultarNotificaciones(IN ArrayConsuNoti VARCHAR(70))
BEGIN
  -- Tener todas las consultas de notificaciones en este procedimiento
  
  CALL EXECUTE_ARRAY(
			ArrayConsuNoti,
            "~",
            "CASE @i
				WHEN 0 THEN SET @idFuncionario = @valor;
                WHEN 1 THEN SET @idRol = @valor;
				WHEN 2 THEN SET @tipoConsulta = @valor;
			END CASE;"
        );
        
  CASE (@tipoConsulta)
    WHEN 1 THEN -- CONSULTA INSTRUCTOR-FUNCIONARIO/PRINCIPAL 
      BEGIN
        SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version AND EstadoNotificacion = 0
		INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
        INNER JOIN Rol_Funcionario rf ON v1.IdFuncionarioRecibe = rf.Id_Funcionario AND rf.Id_Rol = @idRol AND rf.Vigencia = 1
		WHERE v1.TipoIdes = 1 AND IdFuncionarioRecibe = @idFuncionario
		UNION 
		SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 
		INNER JOIN Evaluacion_General v2 ON v1.Ides_Proceso = v2.Id_Evaluacion_General AND EstadoNotificacion = 0
		INNER JOIN Version v3 ON v2.Id_Version = v3.Id_Version
		INNER JOIN Producto_Virtual v4 ON v3.Id_P_Virtual = v4.Id_P_Virtual
        INNER JOIN Rol_Funcionario rf ON v1.IdFuncionarioRecibe = rf.Id_Funcionario AND rf.Id_Rol = @idRol AND rf.Vigencia = 1
		WHERE v1.TipoIdes = 2 AND IdFuncionarioRecibe = @idFuncionario
		ORDER BY Fecha_Envio DESC;
      END;
    WHEN 2 THEN -- CONSULTA CORRECCION
      BEGIN
		SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,v3.Id_Version,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 
		INNER JOIN Evaluacion_General v2 ON v1.Ides_Proceso = v2.Id_Evaluacion_General
		INNER JOIN Version v3 ON v2.Id_Version = v3.Id_Version
		INNER JOIN Producto_Virtual v4 ON v3.Id_P_Virtual = v4.Id_P_Virtual
        INNER JOIN Autor v5 ON v1.IdFuncionarioRecibe = v5.Id_Funcionario
		WHERE v1.TipoIdes = 2 AND IdFuncionarioRecibe = @idFuncionario AND v3.Id_Estado IN (9,10) AND v1.EstadoNotificacion = 0
        AND v5.Principal = 1 AND v3.Id_Version = v5.Id_Version;
		
      END;
    WHEN 3 THEN -- CONSULTA NOTIFICACIONES DE EVALUACION 
      BEGIN
        SET @idEstado = 0;
		CASE @idRol
			WHEN 2 THEN SET @idEstado = 3;
            WHEN 3 THEN SET @idEstado = 4;
        END CASE;
        
        SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 
		INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
		INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
		WHERE v1.TipoIdes = 1 AND IdFuncionarioRecibe = @idFuncionario AND v2.Id_Estado = @idEstado AND v1.EstadoNotificacion = 0;  
      END;
	WHEN 4 THEN -- CONSULTA HABILITAR PRODUCTO VIRTUAL
	  BEGIN
        SELECT Id_Notificacion,Conte_Notificacion,v1.Fecha_Envio,Ides_Proceso,
		Nom_P_Virtual,Num_Version,Url_Version
		FROM 43_V_ConsultaTodoNotificacion v1 
		INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
		INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
		WHERE v1.TipoIdes = 1 AND IdFuncionarioRecibe = @idFuncionario AND v1.EstadoNotificacion = 0 AND v2.Id_Estado = 5;
	  END;
	WHEN 5 THEN -- CONSULTA ACTUALIZAR PRODUCTO VIRTUAL
      BEGIN
		SELECT v1.Id_P_Virtual,v1.Nom_P_Virtual,v3.Id_Version,v3.Num_Version,v3.Fecha_Vigencia,v3.Url_Version,v2.Nom_Formato,v4.Id_Funcionario
		FROM Producto_Virtual v1 INNER JOIN Formato v2 ON v1.Id_Formato = v2.Id_Formato
		INNER JOIN Version v3 ON v1.Id_P_Virtual = v3.Id_P_Virtual
		INNER JOIN Autor v4 ON v3.Id_Version = v4.Id_Version
		WHERE v4.Id_Funcionario = @idFuncionario AND v3.Id_Estado IN (6,7) AND v3.Id_Version = (
		  SELECT v33.Id_version FROM Version v33 WHERE v33.Id_P_Virtual = v1.Id_P_Virtual AND v33.Id_Estado IN (6,7)
		  ORDER BY v33.Num_Version DESC LIMIT 1);
      END;
  END CASE;

END;;
DELIMITER ;

SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS Event_Notificaciones;
DELIMITER ;;
CREATE EVENT Event_Notificaciones 
ON SCHEDULE EVERY 1 DAY STARTS '2017/03/09 18:00:00' ENABLE
COMMENT "Notificaciones"
DO
BEGIN 
	CALL TIME_LIMIT ();
END;;

DELIMITER ;

DROP PROCEDURE IF EXISTS TIME_LIMIT;
DELIMITER ;;
CREATE PROCEDURE TIME_LIMIT()
BEGIN

	DECLARE done INTEGER DEFAULT FALSE;
    DECLARE idVer INTEGER;
    DECLARE fechaV TIMESTAMP;
    DECLARE idEst INTEGER;
    DECLARE cur CURSOR FOR 
    SELECT Id_Version, DATE_FORMAT(Fecha_Vigencia,'%y-%m-%d'),Id_Estado
    FROM Version WHERE Id_Estado IN (6,7);
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SELECT Id_Version, DATE_FORMAT(Fecha_Vigencia,'%y-%m-%d') 
    FROM Version WHERE Id_Estado IN (6,7);-- Select
    
    SET @fechaA  = DATE_FORMAT(CURRENT_TIMESTAMP,'%y-%m-%d');
    OPEN cur;
    read_loop:LOOP
    
		FETCH cur INTO idVer,fechaV,idEst;
        
        IF done THEN LEAVE read_loop; END IF;-- Posible salida
        
        -- Valida que el pv no tenga una nueva version
        SELECT COUNT(*) INTO @validarNuevoV
		FROM Version v1 INNER JOIN Producto_Virtual  v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
		WHERE v1.Id_P_Virtual = (SELECT Id_P_Virtual FROM Version WHERE Id_Version = idVer) 
			AND Id_Estado IN (6,7)-- Num Version 
			AND Num_Version > (SELECT Num_Version FROM Version WHERE Id_Version = idVer); 
        
		
        SELECT v1.Id_Funcionario INTO @idFunc
        FROM Funcionario v1 INNER JOIN Rol_Funcionario v2 ON v1.Id_Funcionario = v2.Id_Funcionario AND v2.Vigencia = 1
			INNER JOIN Area_Centro v3 ON v1.Id_Area_Centro = v3.Id_Area_Centro
		WHERE Id_Centro = 
        (
			SELECT Id_Centro 
			FROM Funcionario v1 
				INNER JOIN Area_Centro v2 ON v1.Id_Area_Centro = v2.Id_Area_Centro
				INNER JOIN Autor v3 ON v1.Id_Funcionario = v3.Id_Funcionario
			WHERE v3.Id_Version = idVer AND Principal = 1
        ) AND Id_Rol = 4;
        
        SELECT idVer;-- 
        
        CALL ALL_AUTOR(idVer,@autores);
        
        SELECT @autores as au;
        
        IF(fechaV = @fechaA AND idEst = 6)THEN
			SELECT "time 1";-- 
            
			UPDATE Version
            SET Id_Estado = 7
            WHERE Id_Version = idVer;
            
            CALL RegistarNotificaion(CONCAT("La version fue inhabilitada por ser obsoleta~3~",@idFunc,"~",@autores,"~",idVer,""));	
            
            ELSE IF(fechaV = DATE_ADD(@fechaA, INTERVAL 7 DAY ) AND idEst = 6 AND @validarNuevoV = 0)THEN
            
				SELECT "time 2";-- 
                
				CALL RegistarNotificaion(CONCAT("La version debe ser actualizada antes de 7 dias~3~",@idFunc,"~",@autores,"~",idVer,""));
                
                ELSE IF( @fechaA = DATE_ADD(fechaV, INTERVAL 7 DAY) AND idEst = 7 AND @validarNuevoV = 0)THEN
					
                    SELECT "time 3";--
                    
					SELECT @idFunc,@autores,idVer;-- 
                    
					CALL RegistarNotificaion(CONCAT("La Version debe ser actualizada yaque fue inhabilitada hace 7 dias~3~",@idFunc,"~",@autores,"~",idVer,""));
                    
                END IF;
            END IF;
        END IF;
		
    END LOOP;
    CLOSE cur;
    
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS ConsultaVistaActualizar;
DELIMITER ;;
CREATE PROCEDURE ConsultaVistaActualizar(IN ArrayVistaActualizar VARCHAR (50))
BEGIN
    CALL EXECUTE_ARRAY(
			ArrayVistaActualizar,
            "~",
            "CASE @i
				WHEN 0 THEN SET @idPv = @valor;
				WHEN 1 THEN SET @idVersion = @valor;
				WHEN 2 THEN SET @val = @valor;
			END CASE;"
        );
     CASE (@val)
        WHEN 1 THEN 
          SELECT v1.* ,v2.Nom_Formato
          FROM Producto_Virtual v1 INNER JOIN Formato v2 ON v1.Id_Formato = v2.Id_Formato
          WHERE Id_P_Virtual = @idPv;
        WHEN 2 THEN
          SELECT * FROM 22_v_autor_simple WHERE Id_Version = @idVersion;
        WHEN 3 THEN
          SELECT  Id_Tema, Nom_Tema
          FROM 06_v_detalles_tema 
          WHERE Id_P_Virtual = @idPv AND Tipo_Tema = 0;
        WHEN 4 THEN
          SELECT  Id_Tema, Nom_Tema
          FROM 06_v_detalles_tema 
          WHERE Id_P_Virtual = @idPv AND Tipo_Tema = 1;
     END CASE;
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS RegistarActualizacion;
DELIMITER ;;
CREATE PROCEDURE RegistarActualizacion(IN ArrayActualizacion VARCHAR(2000),OUT nomUrl VARCHAR(50))
BEGIN
  CALL EXECUTE_ARRAY(
		ArrayActualizacion,
        "~",
        "CASE @i
			WHEN 0 THEN SET @idPro = @valor;
			WHEN 1 THEN SET @Url_Version = @valor;
			WHEN 2 THEN SET @Url_Img = @valor;
			WHEN 3 THEN SET @Inst_Instalacion = @valor;
			WHEN 4 THEN SET @Reqst_Instalacion = @valor;
			WHEN 5 THEN SET @ArrayFuncionario = @valor;
			WHEN 6 THEN SET @ArrayTemas = @valor;
        END CASE;"
    );
    SELECT "1";
    
    IF(@ArrayTemas != "null")THEN-- 20/04/2017
		SET @i = 0;
		SET @num = M_LENGTH(@ArrayTemas,",");
		WHILE(@i < @num)DO
			 SET @i = @i + 1;
				SET @arrayT = SUBSTRING_INDEX(@ArrayTemas,",",1);
				SET @cant = CHAR_LENGTH(@ArrayTemas) - CHAR_LENGTH(@arrayT);
				SET @ArrayTemas = RIGHT(@ArrayTemas,@cant -1);
				SET @a = 0;
				WHILE(@a < 2)DO
					SET @val = SUBSTRING_INDEX(@arrayT,"-",1);
					SET @cant = CHAR_LENGTH(@arrayT) - CHAR_LENGTH(@val);
					SET @arrayT = RIGHT(@arrayT,@cant -1);
					CASE @a
						WHEN 0 THEN SET @idTema = @val; 
						WHEN 1 THEN SET @tipo 	= @val;
					END CASE;
					SET @a = @a + 1;        
				END WHILE;
				CALL SARA_CRUD("INSERT","Detalles_Tema",CONCAT("Id_Tema~",@idTema,"|Id_P_Virtual~",@idPro,"|Tipo_Tema~",@tipo,""),"");
				SET @i = @i + 1;
			END WHILE;
    END IF;
    
    
    CALL RegistrarVersion(CONCAT("",@idPro,"~",@Url_Version,"~",@Url_Img,"~",@Inst_Instalacion,"~",@Reqst_Instalacion,"~",@ArrayFuncionario,""),nomUrl);
    
END;;
DELIMITER ;

DROP FUNCTION IF EXISTS NameUrl;
DELIMITER ;;
CREATE FUNCTION NameUrl(idVer INTEGER) RETURNS varchar(50) CHARSET latin1
BEGIN
  SET @idVer = idVer;
  SELECT Id_Estado, Id_P_Virtual INTO @idEstado,@idPro
  FROM Version WHERE Id_Version = @idVer;
  
  IF(@idEstado IN (6,7))THEN
    SET @tipoVer = 2;
    ELSEIF (@idEstado IN (3,4,5,9,10))THEN SET @tipoVer = 1;
  END IF;
  
  CASE (@tipoVer)
    WHEN 1 THEN 
        SELECT COUNT(*) INTO @numVer
        FROM 18_v_notificaciones 
        WHERE Id_Tipo_Notificacion = 1 AND Ides_Proceso = @idVer;
    WHEN 2 THEN
        SELECT Num_Version INTO @numVer 
        FROM  Version
        WHERE Id_Version = @idVer;
  END CASE;
  
  SELECT v2.Nom_Formato INTO @formato 
  FROM producto_virtual v1 INNER JOIN formato v2 ON v2.Id_Formato = v1.Id_Formato
  WHERE v1.Id_P_Virtual = @idPro;
  
  SET @idPro = LPAD(@idPro,3,"0");
  SET @numVer = LPAD(@numVer/0.1,2,"0");-- Num Version 
  SET @idVer = LPAD(@idVer,3,"0");
  
  SET @nomUrl = CONCAT(@tipoVer,"-",@idPro,"-",@numVer,"-",@idVer,".",@formato);
  
  RETURN @nomUrl;
END;;
DELIMITER ;

-- LA VALORACION DE LOS VOTOS TIENE QUE SER EN FLOAT

DROP PROCEDURE IF EXISTS RegistrarRankin;
DELIMITER ;;
CREATE PROCEDURE RegistrarRankin(IN arrayRegistrarRankin VARCHAR(50))
-- IN numeroCaso INTEGER(1),IN idVer_Prod INTEGER,IN idFuncionario INTEGER, IN numVoto INTEGER
BEGIN
  DECLARE idProd        INTEGER DEFAULT 0;
  DECLARE idRankin      INTEGER DEFAULT 0;
  DECLARE numeroCaso    INTEGER(1)DEFAULT 0;
  DECLARE idVer_Prod    INTEGER DEFAULT 0;
  DECLARE idFuncionario INTEGER DEFAULT 0;
  DECLARE numVoto       INTEGER(1) DEFAULT 0;
  
  SET @numeroCaso = NULL,@idVer_Prod = NULL,@idFuncionario = NULL,@numVoto = NULL;
  
  CALL EXECUTE_ARRAY(
		arrayRegistrarRankin,"~",
        "CASE @i 
			WHEN 0 THEN SET @numeroCaso	 	      = @valor;
			WHEN 1 THEN SET @idVer_Prod 	  	  = @valor;
			WHEN 2 THEN SET @idFuncionario 	  	= @valor;
			WHEN 3 THEN SET @numVoto 	  	      = @valor;
		END CASE;");
   
  SET numeroCaso = @numeroCaso,
  idVer_Prod = @idVer_Prod,
  idFuncionario = @idFuncionario,
  numVoto = @numVoto;

  SELECT Id_Rankin INTO idRankin FROM rankin WHERE Id_Version = idVer_Prod;
  
  CASE numeroCaso
  
     WHEN 1 THEN 
     -- Aumenta una unidad a la cantidad de visitas que tiene un pv y este
     -- numero es compartido por todas las versiones
     BEGIN
        
        SELECT Id_P_Virtual INTO idProd 
        FROM version WHERE Id_Version = idVer_Prod;
        
        UPDATE rankin v1 INNER JOIN Version v2 ON v1.Id_Version = v2.Id_Version
        SET Cant_Visitas = Cant_Visitas + 1 
        WHERE Id_P_Virtual = idProd;
        
     END; 
     WHEN 2 THEN
     -- Aumenta una unidad a la cantidad de Descargas que tiene la version
     BEGIN
        UPDATE rankin
        SET Cant_Descargas = Cant_Descargas + 1 
        WHERE Id_Rankin = idRankin;
     END;
     WHEN 3 THEN 
     -- Inserta o actualiza el voto que tiene un determinado usuario con respecto a una determinada version
     BEGIN
        IF (
          SELECT TRUE FROM Voto
          WHERE Id_Rankin = idRankin AND Id_Funcionario = idFuncionario
        ) THEN
        
          UPDATE Voto SET Num_Voto = numVoto 
          WHERE Id_Funcionario = idFuncionario AND Id_Rankin = idRankin; 
          
          ELSE BEGIN
            INSERT INTO Voto VALUES ( NULL, numVoto,idFuncionario, idRankin );
            UPDATE Rankin SET Cant_Votos = Cant_Votos + 1 WHERE Id_Rankin = idRankin;
          END;
        END IF;
        
     END;
  END CASE;
END;;
DELIMITER ;

/*
CALL RegistrarRankin("1~12~0~0");
CALL RegistrarRankin("2~12~0~0");
CALL RegistrarRankin("3~12~5~5");

SELECT * FROM rankin;
SELECT * FROM Voto;
*/


DROP PROCEDURE IF EXISTS ActualizarPuestoRankin;
DELIMITER ;;
CREATE PROCEDURE ActualizarPuestoRankin()
BEGIN
  SET SQL_SAFE_UPDATES = 0;
  DROP TEMPORARY TABLE IF EXISTS ActualizarPuesto1;
  CREATE TEMPORARY TABLE ActualizarPuesto1 (
    IdRankin1  INTEGER NOT NULL,
    Puesto1    INTEGER NOT NULL
  );
  
  SET @contPuesto = 0;
  INSERT INTO ActualizarPuesto1 (
    SELECT Id_Rankin, @contPuesto := @contPuesto + 1 
    FROM  VistaPuesto
    ORDER BY Val_Puesto DESC
  );
  
  UPDATE Rankin v1 
  INNER JOIN ActualizarPuesto1 v2 ON v1.Id_Rankin = v2.IdRankin1 
  SET v1.Puesto = v2.Puesto1;
  
END;;
DELIMITER ;

-- CALL ActualizarPuestoRankin();

DROP VIEW IF EXISTS vistapuesto;
CREATE VIEW VistaPuesto AS (
    SELECT v1.Id_Rankin, 
    LPAD((SUM(Num_Voto) / v1.Cant_Votos) * 0.7 + v1.Cant_Descargas * 0.2 + v1.Cant_Visitas * 0.1,3,"0") AS Val_Puesto, v1.Puesto
    FROM rankin v1 INNER JOIN voto v2 ON v1.Id_Rankin = v2.Id_Rankin
    GROUP BY v1.Id_Rankin
);


SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS Event_ActualizarPuesto;
DELIMITER ;;
CREATE EVENT Event_ActualizarPuesto 
ON SCHEDULE EVERY 5 MINUTE STARTS '2017/05/24 18:00:00' ENABLE
COMMENT "ActualizarPuesto"
DO
BEGIN 
	CALL ActualizarPuestoRankin();
END;;
DELIMITER ;

-- select * from information_schema.EVENTS



-- CALL ConsultarGrafica("1~1~6~0");


DROP PROCEDURE IF EXISTS ConsultarGrafica;
DELIMITER ;;
CREATE PROCEDURE ConsultarGrafica (IN ArrayConsultaGrafica VARCHAR(100))
BEGIN

	DECLARE grafica_Var,idCentro_Var,mes_Var,anio_Var INTEGER DEFAULT 0;
    
      CALL EXECUTE_ARRAY(
			ArrayConsultaGrafica,
            "~",
            "CASE @i
				WHEN 0 THEN SET @grafica_Var = @valor;
                WHEN 1 THEN SET @idCentro_Var = @valor;
				WHEN 2 THEN SET @mes_Var = @valor;
                WHEN 3 THEN SET @anio_Var = @valor;
			END CASE;"
        );
	
    SET grafica_Var 	= @grafica_Var,
		idCentro_Var 	= @idCentro_Var,
        mes_Var 		= @mes_Var,
        anio_Var 		= @anio_Var;
	
    IF(mes_Var = 0) THEN SET mes_Var = DATE_FORMAT(CURRENT_TIME,'%m');END IF;
    IF(anio_Var = 0) THEN SET anio_Var = DATE_FORMAT(CURRENT_TIME,'%Y');END IF;
    
    CASE (grafica_Var)
		WHEN 1 THEN
        BEGIN
        	-- Estadistica Por Formato

			SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%Y') AS "Año" ,DATE_FORMAT(v1.Fecha_Publicacion,'%m') AS Mes,v9.Nom_Tipo_Formato AS Formato,COUNT(*) AS Publicaciones
			FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
			INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
			INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
			INNER JOIN centro v5 ON v4.Id_Centro = v5.Id_Centro
			INNER JOIN ciudad v6 ON v5.Id_Ciudad = v6.Id_Ciudad
			INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
			INNER JOIN formato v8 ON v7.Id_Formato = v8.Id_Formato
			INNER JOIN tipo_formato v9 ON v8.Id_Tipo_Formato = v9.Id_Tipo_Formato
			WHERE v1.Id_Estado IN (6,7) AND v2.Principal = 1 
			AND v5.Id_Centro = idCentro_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%Y') = anio_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%m') = mes_Var
			GROUP BY v9.Nom_Tipo_Formato;
        END;
        WHEN 2 THEN
        BEGIN
			-- Estadistica por Area De acuerdo a los temas que se encuentran en dichas areas

			SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%Y') AS "Año",DATE_FORMAT(v1.Fecha_Publicacion,'%m') AS Mes,v8.Nom_Area AS Area,COUNT(*) AS Publicaciones
			FROM version v1 
			INNER JOIN producto_virtual v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
			INNER JOIN detalles_tema v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual AND v3.Tipo_Tema = 0
			INNER JOIN tema v4 ON v4.Id_Tema = v3.Id_Tema
			INNER JOIN detalles_programa v5 ON v4.Id_Tema = v5.Id_Tema
			INNER JOIN programa v6 ON v5.Id_Programa = v6.Id_Programa
			INNER JOIN detalles_area v7 ON  v6.Id_Programa = v7.Id_Programa
			INNER JOIN area v8 ON v7.Id_Area = v8.Id_Area
			INNER JOIN area_centro v9 ON v8.Id_Area = v9.Id_Area
			INNER JOIN autor v10 ON v1.Id_Version = v10.Id_Version
			INNER JOIN funcionario v11 ON v10.Id_Funcionario = v11.Id_Funcionario
			INNER JOIN area_centro v12 ON v11.Id_Area_Centro = v12.Id_Area_Centro
			INNER JOIN centro v13 ON v12.Id_Centro = v13.Id_Centro
			INNER JOIN ciudad v14 ON v13.Id_Ciudad = v14.Id_Ciudad
			WHERE v1.Id_Estado IN (6,7) AND v10.Principal = 1 
			AND v13.Id_Centro = idCentro_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%Y') = anio_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%m') = mes_Var
			GROUP BY v8.Nom_Area;
        END;
        WHEN 3 THEN
        BEGIN 
			-- Estadistica por Categoria de acuerdo a los temas que se encuentran en dichas categorias

			SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%Y') AS "Año",DATE_FORMAT(v1.Fecha_Publicacion,'%m') AS Mes,v10.Nom_Categoria AS Categoria,COUNT(*) AS Publicaciones
			FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
			INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
			INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
			INNER JOIN centro v5 ON v4.Id_Centro = v5.Id_Centro
			INNER JOIN ciudad v6 ON v5.Id_Ciudad = v6.Id_Ciudad
			INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
			INNER JOIN detalles_tema v8 ON v7.Id_P_Virtual = v8.Id_P_Virtual AND v8.Tipo_Tema = 1
			INNER JOIN detalles_categoria v9 ON v8.Id_Tema = v9.Id_Tema
			INNER JOIN categoria v10 ON v9.Id_Categoria = v10.Id_Categoria
			WHERE v1.Id_Estado IN (6,7) AND v2.Principal = 1 
			AND v5.Id_Centro = idCentro_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%Y') = anio_Var AND DATE_FORMAT(v1.Fecha_Publicacion,'%m') = mes_Var
			GROUP BY v10.Nom_Categoria;
        END;
    END CASE;
	
END;;
DELIMITER ;

-- CALL ConsultarReporte("5~0~0~0");

DROP PROCEDURE IF EXISTS ConsultarReporte;
DELIMITER ;;
CREATE PROCEDURE ConsultarReporte (IN ArrayConsultaReporte VARCHAR(100))
BEGIN
DECLARE contenido VARCHAR(1200) DEFAULT "";
DECLARE where_Var VARCHAR(200) DEFAULT "";
DECLARE contenido2 VARCHAR(500) DEFAULT "";
DECLARE reporte_Var,idCentro_Var,mes_Var,anio_Var INTEGER DEFAULT 0;
    
      CALL EXECUTE_ARRAY(
			ArrayConsultaReporte,
            "~",
            "CASE @i
				WHEN 0 THEN SET @reporte_Var1 = @valor;
                WHEN 1 THEN SET @idCentro_Var1 = @valor;
				WHEN 2 THEN SET @mes_Var1 = @valor;
                WHEN 3 THEN SET @anio_Var1 = @valor;
			END CASE;"
        );
	
    SET reporte_Var 	= @reporte_Var1,
		idCentro_Var 	= @idCentro_Var1,
        mes_Var 		= @mes_Var1,
        anio_Var 		= @anio_Var1;


CASE (reporte_Var)
WHEN 1 THEN
	BEGIN
		-- Cantidad de Publicaciones de PV por Área
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v14.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,CONCAT(v8.Nom_Area) AS Area,COUNT(*) AS Publicaciones
		FROM version v1 
		INNER JOIN producto_virtual v2 ON v1.Id_P_Virtual = v2.Id_P_Virtual
		INNER JOIN detalles_tema v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual AND v3.Tipo_Tema = 0
		INNER JOIN tema v4 ON v4.Id_Tema = v3.Id_Tema
		INNER JOIN detalles_programa v5 ON v4.Id_Tema = v5.Id_Tema
		INNER JOIN programa v6 ON v5.Id_Programa = v6.Id_Programa
		INNER JOIN detalles_area v7 ON  v6.Id_Programa = v7.Id_Programa
		INNER JOIN area v8 ON v7.Id_Area = v8.Id_Area
		INNER JOIN area_centro v9 ON v8.Id_Area = v9.Id_Area
		INNER JOIN autor v10 ON v1.Id_Version = v10.Id_Version
		INNER JOIN funcionario v11 ON v10.Id_Funcionario = v11.Id_Funcionario
		INNER JOIN area_centro v12 ON v11.Id_Area_Centro = v12.Id_Area_Centro
		INNER JOIN centro ce ON v12.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v14 ON ce.Id_Ciudad = v14.Id_Ciudad
		WHERE v1.Id_Estado IN (6,7) AND v10.Principal = 1 ";
        
        SET contenido2 = " GROUP BY v14.Nom_Ciudad, ce.Nom_Centro, v8.Nom_Area";
	END;
WHEN 2 THEN
	BEGIN
		-- Cantidad de Publicaciones de PV por Tipo Objeto
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,CONCAT(v9.Nom_Tipo_Formato) AS Formato,CONCAT(v8.Nom_Formato) AS Extencion,COUNT(*) AS Publicaciones
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
		INNER JOIN formato v8 ON v7.Id_Formato = v8.Id_Formato
		INNER JOIN tipo_formato v9 ON v8.Id_Tipo_Formato = v9.Id_Tipo_Formato
		WHERE v1.Id_Estado IN (6,7) AND v2.Principal = 1 ";
        
        SET contenido2 = "
		GROUP BY v6.Nom_Ciudad,ce.Nom_Centro,v8.Nom_Formato,v9.Nom_Tipo_Formato";
	END;
WHEN 3 THEN 
	BEGIN
		-- Cantidad de Publicaciones de PV por Categoria
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro, CONCAT(v10.Nom_Categoria) AS Categoria,COUNT(*) AS Publicaciones
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
		INNER JOIN detalles_tema v8 ON v7.Id_P_Virtual = v8.Id_P_Virtual AND v8.Tipo_Tema = 1
		INNER JOIN detalles_categoria v9 ON v8.Id_Tema = v9.Id_Tema
		INNER JOIN categoria v10 ON v9.Id_Categoria = v10.Id_Categoria
		WHERE v1.Id_Estado IN (6,7) AND v2.Principal = 1 ";
        
        SET contenido2 = "
		GROUP BY v6.Nom_Ciudad,ce.Nom_Centro,v10.Nom_Categoria";
    END;
WHEN 4 THEN 
	BEGIN
		-- Cantidad de Publicaciones Visitadas
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,
        CONCAT(v7.Nom_P_Virtual) AS ""Producto Virtual"", CONCAT(v8.Cant_Visitas) AS Visitas
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
		INNER JOIN rankin v8 ON v1.Id_Version = v8.Id_Version 
        WHERE 1 = 1";
        
        SET contenido2 = "
		GROUP BY v6.Nom_Ciudad,ce.Nom_Centro,v7.Nom_P_Virtual, v8.Cant_Visitas";
    END;
WHEN 5 THEN 
	BEGIN
		-- Cantidad de Publicaciones Descargadas
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,CONCAT(v7.Nom_P_Virtual) AS ""Producto Virtual"",CONCAT(v1.Num_Version) AS Version,CONCAT(v8.Cant_Descargas) AS Descargas
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN producto_virtual v7 ON v1.Id_P_Virtual = v7.Id_P_Virtual
		INNER JOIN rankin v8 ON v1.Id_Version = v8.Id_Version
        WHERE 1 = 1";
        
        SET contenido2 = "
		GROUP BY v6.Nom_Ciudad,ce.Nom_Centro,v7.Nom_P_Virtual, v8.Cant_Descargas";
    END;
WHEN 6 THEN 
	BEGIN
		-- Cantidad de Publicaciones de PV publicados e inhabilitados
		SET contenido = "
		SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,COUNT(*) AS Publicados,
		(
			SELECT COUNT(*)
			FROM version v11 INNER JOIN autor v22 ON v11.Id_Version = v22.Id_Version
			INNER JOIN funcionario v33 ON v22.Id_Funcionario = v33.Id_Funcionario
			INNER JOIN area_centro v44 ON v33.Id_Area_Centro = v44.Id_Area_Centro
			INNER JOIN centro v55 ON v44.Id_Centro = v55.Id_Centro
			INNER JOIN ciudad v66 ON v55.Id_Ciudad = v66.Id_Ciudad
			WHERE v11.Id_Estado = 7 AND DATE_FORMAT( v11.Fecha_Vigencia ,'%M %Y') = Mes 
			AND v44.Id_Area_Centro = v4.Id_Area_Centro
			
		) AS Inhabilitados
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario AND v2.Principal = 1
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		WHERE v1.Id_Estado = 6 ";
        
        SET contenido2 = "
		GROUP BY DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y'),v6.Nom_Ciudad,ce.Nom_Centro";
    END;
WHEN 7 THEN 
	BEGIN
		-- Cantidad de Pv Creados o actualizaciones por cada Funcionario
		SET contenido = "
        SELECT DATE_FORMAT(v1.Fecha_Publicacion,'%M') AS Mes,CONCAT(v6.Nom_Ciudad) AS Ciudad,CONCAT(ce.Nom_Centro) AS Centro,CONCAT(v7.Nom_Area) AS Area,CONCAT(v3.Nom_Funcionario,"" "",v3.Apellidos) AS Funcionario,COUNT(*) AS Publicaciones
		FROM version v1 INNER JOIN autor v2 ON v1.Id_Version = v2.Id_Version
		INNER JOIN funcionario v3 ON v2.Id_Funcionario = v3.Id_Funcionario 
		INNER JOIN area_centro v4 ON v3.Id_Area_Centro = v4.Id_Area_Centro
		INNER JOIN centro ce ON v4.Id_Centro = ce.Id_Centro
		INNER JOIN ciudad v6 ON ce.Id_Ciudad = v6.Id_Ciudad
		INNER JOIN area   v7 ON v4.Id_Area = v7.Id_Area
		WHERE v1.Id_Estado IN (6,7) ";
        
        SET contenido2 = "
		GROUP BY DATE_FORMAT(v1.Fecha_Publicacion,'%M %Y'),v6.Nom_Ciudad,ce.Nom_Centro,v7.Nom_Area,v3.Nom_Funcionario";
    END;
END CASE;

IF (idCentro_Var <> 0) THEN
	SET where_Var = CONCAT(where_Var , " AND ce.Id_Centro = " , idCentro_Var);
END IF;
IF (mes_Var <> 0) THEN
	SET where_Var = CONCAT(where_Var , " AND DATE_FORMAT(v1.Fecha_Publicacion,'%m') = " , mes_Var);
END IF;
IF (anio_Var <> 0) THEN
	SET where_Var = CONCAT(where_Var ," AND DATE_FORMAT(v1.Fecha_Publicacion,'%Y') = " , anio_Var);
END IF;

 CALL MACC(CONCAT(contenido,where_Var,contenido2));
    -- SELECT (CONCAT(contenido,whereCentro,idCentro,contenido2));
     -- SELECT (CONCAT(contenido,where_Var,contenido2));
END;;
DELIMITER ;


-- CALL ConsultaVistaSubirPV("1~0");


DROP PROCEDURE IF EXISTS ConsultaVistaSubirPV;
DELIMITER ;;
CREATE PROCEDURE ConsultaVistaSubirPV (IN ArrayConsultaVistaSubir VARCHAR(100))
BEGIN
DECLARE camino_Var,idTipoFormato_Var INTEGER DEFAULT 0;

  CALL EXECUTE_ARRAY(
		ArrayConsultaVistaSubir,
		"~",
		"CASE @i
			WHEN 0 THEN SET @camino_Var = @valor;
			WHEN 1 THEN SET @idTipoFormato_Var = @valor;
		END CASE;"
	);

SET camino_Var 	= @camino_Var,
	idTipoFormato_Var 	= @idTipoFormato_Var;

CASE (camino_Var)
WHEN 1 THEN
BEGIN
	SELECT Id_Tipo_Formato, Nom_Tipo_Formato
    FROM Tipo_Formato;
END;
WHEN 2 THEN
BEGIN
	SELECT v2.Id_Formato, v2.Nom_Formato
    FROM Tipo_Formato v1 INNER JOIN Formato v2 ON v1.Id_Tipo_Formato = v2.Id_Tipo_Formato
    WHERE v1.Id_Tipo_Formato = idTipoFormato_Var;
END;
END CASE;
    
END;;
DELIMITER ;


-- CALL ModificarContraseña("1~1019133595~e10adc3949ba59abbe56e057f20f883e~e10adc3949ba59abbe56e057f20f883e1");


DROP PROCEDURE IF EXISTS ModificarContraseña;
DELIMITER ;;
CREATE PROCEDURE ModificarContraseña (IN ArrayContraseña VARCHAR(100))
BEGIN
	DECLARE idFun_Var INTEGER DEFAULT 0;
	DECLARE numFun_Var DOUBLE DEFAULT 0; 
    DECLARE contrActual_Var VARCHAR(300);
    DECLARE contrNueva_Var VARCHAR(300);
    
    CALL EXECUTE_ARRAY(
		ArrayContraseña,
		"~",
		"CASE @i
			WHEN 0 THEN SET @idFun_Var = @valor;
			WHEN 1 THEN SET @numFun_Var = @valor;
            WHEN 2 THEN SET @contrActual_Var = @valor;
            WHEN 3 THEN SET @contrNueva_Var = @valor;
		END CASE;"
	);
    
    SET idFun_Var = @idFun_Var,
		numFun_Var = @numFun_Var,
        contrActual_Var = @contrActual_Var,
        contrNueva_Var = @contrNueva_Var;
	
    IF( SELECT 1
		FROM Funcionario 
        WHERE Num_Documento = numFun_Var AND Id_Funcionario = idFun_Var AND Contraseña = contrActual_Var
    )THEN
		UPDATE Funcionario 
        SET Contraseña = contrNueva_Var
        WHERE Id_Funcionario = idFun_Var;
    END IF;
    
END;;
DELIMITER ;




DROP PROCEDURE IF EXISTS ModificarPerfil;
DELIMITER ;;
CREATE PROCEDURE ModificarPerfil (IN ArrayPerfil VARCHAR(100))
BEGIN
DECLARE idFun_Var INTEGER DEFAULT 0;
DECLARE nomFun_Var VARCHAR(45) DEFAULT "";
DECLARE apeFun_Var VARCHAR(100) DEFAULT "";
DECLARE idTipoIdent_Var INTEGER DEFAULT 0;
DECLARE numFun_Var DOUBLE DEFAULT 0;
DECLARE ipSena_Var VARCHAR(6);
DECLARE cargo_Var  VARCHAR(45);
DECLARE correo_Var VARCHAR(125);


  CALL EXECUTE_ARRAY(
		ArrayPerfil,
		"~",
		"CASE @i
			WHEN 0 THEN SET @idFun_Var = @valor;
			WHEN 1 THEN SET @nomFun_Var = @valor;
            WHEN 2 THEN SET @apeFun_Var = @valor;
            WHEN 3 THEN SET @idTipoIdent_Var = @valor;
            WHEN 4 THEN SET @numFun_Var = @valor;
            WHEN 5 THEN SET @ipSena_Var = @valor;
            WHEN 6 THEN SET @cargo_Var = @valor;
            WHEN 7 THEN SET @correo_Var = @valor;
		END CASE;"
	);

SET idFun_Var 	= @idFun_Var,
	nomFun_Var 	= @nomFun_Var,
    apeFun_Var 	= @apeFun_Var,
    idTipoIdent_Var = @idTipoIdent_Var,
    numFun_Var 	= @numFun_Var,
    ipSena_Var 	= @ipSena_Var,
    cargo_Var 	= @cargo_Var,
    correo_Var 	= @correo_Var;

UPDATE Funcionario 
SET Id_Tipo_Documento 	= idTipoIdent_Var,
	Num_Documento 		= numFun_Var,
	Nom_Funcionario 	= nomFun_Var,
	Apellidos 			= apeFun_Var,
	Correo 				= correo_Var,
	Cargo 				= cargo_Var,
	Ip_Sena 			= ipSena_Var
WHERE Id_Funcionario = idFun_Var;

END;;
DELIMITER ;



-- CALL Login("1019~1019");
-- CALL Login("1019133595~fcea920f7412b5da7be0cf42b8c93759");
DROP PROCEDURE IF EXISTS Login;
DELIMITER ;;
CREATE PROCEDURE Login(IN ArrayLogin VARCHAR(100))
BEGIN
	DECLARE numFun_Var DOUBLE DEFAULT 0;
    DECLARE contrasenia_Var VARCHAR(300) DEFAULT "";
    
    CALL EXECUTE_ARRAY(
		ArrayLogin,
        "~",
        "CASE @i
			WHEN 0 THEN SET @numFun_Var = @valor;
			WHEN 1 THEN SET @contrasenia_Var = @valor; 
        END CASE;"
    );
    
    SET numFun_Var = @numFun_Var,
		contrasenia_Var = @contrasenia_Var;
	
    IF(
		SELECT 1 
        FROM Funcionario 
        WHERE Num_Documento = numFun_Var AND Contraseña = contrasenia_Var
    )THEN
        
        SELECT 1 AS TipoUser,rf.Id_Rol,fu.Id_Funcionario,fu.Nom_Funcionario,ac.Id_Centro
        FROM Funcionario fu 
        INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1
        INNER JOIN Area_Centro ac ON fu.Id_Area_Centro = ac.Id_Area_Centro
        WHERE fu.Num_Documento = numFun_Var AND fu.Contraseña = contrasenia_Var;
        
        ELSE IF(
			SELECT 1 
            FROM Admin WHERE Usuario = numFun_Var AND Clave = contrasenia_Var
        )THEN
			SELECT 2 AS TipoUser,5 AS Id_Rol 
            FROM Admin WHERE Usuario = numFun_Var AND Clave = contrasenia_Var;
        END IF;
    END IF;
END;;
DELIMITER ;


-- TEMA_PROCEDURE
-- 

/*
CALL Tema_Procedure("1~0~Tema_1.1~Des_Tema_1.1");
CALL Tema_Procedure("2~5~Tema_2.2~Des_Tema_2.2");
CALL Tema_Procedure("0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Tema_Procedure;

DELIMITER ;;
CREATE PROCEDURE Tema_Procedure (IN arrayTema VARCHAR (200))
BEGIN

DECLARE	opcion		INTEGER(1);
DECLARE idTema_Var INTEGER DEFAULT 0;
DECLARE	nomTema_Var VARCHAR(45);
DECLARE	desTema_Var VARCHAR(100);

SET @opcion = 0,
	@idTema_Var = 0,
    @nomTema_Var = "0",
	@desTema_Var = "0";
    
CALL EXECUTE_ARRAY(
		arrayTema,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idTema_Var = @valor;
            WHEN 2 THEN SET @nomTema_Var = @valor;
            WHEN 3 THEN SET @desTema_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idTema_Var = @idTema_Var,
    nomTema_Var = @nomTema_Var,
	desTema_Var = @desTema_Var;
    
CASE opcion
WHEN 1 THEN 
BEGIN -- CREAR TEMA
	INSERT INTO Tema VALUES(null,nomTema_Var,desTema_Var);
END;
WHEN 2 THEN
BEGIN -- MODIFICAR TEMA
	UPDATE Tema 
    SET Nom_Tema = nomTema_Var,
		Des_Tema = desTema_Var
	WHERE Id_Tema = idTema_Var;
END;
ELSE SELECT Id_Tema,Nom_Tema,Des_Tema FROM Tema;-- RETORNA ESTO
END CASE;

SELECT Id_Tema,Nom_Tema,Des_Tema FROM Tema;

END;;
DELIMITER ;


-- PROGRAMA_PROCEDURE
-- 

/*
	CALL Programa_Procedure("1~0~Programa_2.1~Basico2.2~1,2,3");
    CALL Programa_Procedure("2~4~Programa_1.1~Basico3~0");
    CALL Programa_Procedure("3~6~0~0~0");
    CALL Programa_Procedure("0~0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Programa_Procedure;

DELIMITER ;;
CREATE PROCEDURE Programa_Procedure (IN arrayPrograma VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idPrograma_Var INTEGER DEFAULT 0;
DECLARE nomPrograma_Var VARCHAR(100);
DECLARE nivelFormacion_Var VARCHAR(45);
DECLARE arrayTemas_Var VARCHAR(100) DEFAULT "0";
DECLARE i,num,cant INTEGER DEFAULT 0;
DECLARE valor VARCHAR(400) DEFAULT "";

SET @opcion = 0,
	@idPrograma_Var = 0,
    @nomPrograma_Var = "0",
	@nivelFormacion_Var = "0",
    @arrayTemas_Var = "0";

CALL EXECUTE_ARRAY(
		arrayPrograma,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idPrograma_Var = @valor;
            WHEN 2 THEN SET @nomPrograma_Var = @valor;
            WHEN 3 THEN SET @nivelFormacion_Var = @valor;
            WHEN 4 THEN SET @arrayTemas_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idPrograma_Var = @idPrograma_Var,
    nomPrograma_Var = @nomPrograma_Var,
	nivelFormacion_Var = @nivelFormacion_Var,
    arrayTemas_Var = @arrayTemas_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR PROGRAMA
	INSERT INTO Programa VALUES(null,nomPrograma_Var,nivelFormacion_Var);
    SELECT Id_Programa INTO idPrograma_Var FROM Programa 
    WHERE Nom_Programa = nomPrograma_Var AND Nivel_Formacion = nivelFormacion_Var;
    SELECT Id_Programa,Nom_Programa,Nivel_Formacion FROM Programa;
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR PROBRAMA
    UPDATE Programa 
    SET Nom_Programa = nomPrograma_Var, Nivel_Formacion = nivelFormacion_Var
    WHERE Id_Programa = idPrograma_Var;
    SELECT Id_Programa,Nom_Programa,Nivel_Formacion FROM Programa;
END;
WHEN 3 THEN
BEGIN -- Multiselect - Modificar

    SELECT te.Id_Tema,te.Nom_Tema,CASE(
		SELECT 1 FROM Detalles_Programa v1 
        WHERE v1.Id_Tema = te.Id_Tema AND v1.Id_Programa = idPrograma_Var
    ) WHEN 1 THEN 1 
	  ELSE 0 END AS Tipo
    FROM Tema te;
    
END;
ELSE SELECT Id_Programa,Nom_Programa,Nivel_Formacion FROM Programa;
END CASE;
IF(opcion <> 3 AND arrayTemas_Var <> "0")THEN 
	SET num = M_LENGTH(arrayTemas_Var,",");
    WHILE(i < num)DO
		SET valor = SUBSTRING_INDEX(arrayTemas_Var,",",1);
        SET cant = CHAR_LENGTH(arrayTemas_Var) - CHAR_LENGTH(valor);
        SET arrayTemas_Var = RIGHT(arrayTemas_Var,cant -1);
			CALL SARA_CRUD("INSERT","Detalles_Programa",CONCAT("Id_Tema~",valor,"|Id_Programa~",idPrograma_Var,""),"");
        SET i = i + 1;
    END WHILE;
END IF;

END;;
DELIMITER ;


-- AREA_PROCEDURE
-- 

/*
	CALL Area_Procedure("1~0~Area_2.1~LiderArea2.1~1,2,3");
    CALL Area_Procedure("2~5~Area_2.2~LiderArea2.2~4");
    CALL Area_Procedure("3~6~0~0~0");
    CALL Area_Procedure("0~0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Area_Procedure;

DELIMITER ;;
CREATE PROCEDURE Area_Procedure (IN arrayArea VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idArea_Var INTEGER DEFAULT 0;
DECLARE nomArea_Var VARCHAR(100);
DECLARE liderArea_Var VARCHAR(70);
DECLARE arrayProgramas_Var VARCHAR(100) DEFAULT "0";
DECLARE i,num,cant INTEGER DEFAULT 0;
DECLARE valor VARCHAR(400) DEFAULT "";

SET @opcion = 0,
	@idArea_Var = 0,
    @nomArea_Var = "0",
	@liderArea_Var = "0",
    @arrayProgramas_Var = "0";

CALL EXECUTE_ARRAY(
		arrayArea,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idArea_Var = @valor;
            WHEN 2 THEN SET @nomArea_Var = @valor;
            WHEN 3 THEN SET @liderArea_Var = @valor;
            WHEN 4 THEN SET @arrayProgramas_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idArea_Var = @idArea_Var,
    nomArea_Var = @nomArea_Var,
	liderArea_Var = @liderArea_Var,
    arrayProgramas_Var = @arrayProgramas_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR AREA
	INSERT INTO Area VALUES (null,nomArea_Var,liderArea_Var);
    SELECT Id_Area INTO idArea_Var FROM Area WHERE Nom_Area = nomArea_Var AND Lider_Area = liderArea_Var;
    SELECT Id_Area,Nom_Area,Lider_Area FROM Area;
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR AREA
	UPDATE Area
    SET Nom_Area = nomArea_Var, Lider_Area = liderArea_Var
    WHERE Id_Area = idArea_Var;
    SELECT Id_Area,Nom_Area,Lider_Area FROM Area;
END;
WHEN 3 THEN
BEGIN -- Multiselect - Modificar

    SELECT pr.Id_Programa, pr.Nom_Programa,
    CASE(
    SELECT 1 FROM Detalles_Area v1
    WHERE v1.Id_Programa = pr.Id_Programa AND v1.Id_Area = idArea_Var
    )WHEN 1 THEN 1 
	ELSE 0 END AS Tipo
    FROM Programa pr;
    
END;
ELSE SELECT Id_Area,Nom_Area,Lider_Area FROM Area;
END CASE;
IF(opcion <> 3 AND arrayProgramas_Var <> "0")THEN 
	SET num = M_LENGTH(arrayProgramas_Var,",");
    WHILE(i < num)DO
		SET valor = SUBSTRING_INDEX(arrayProgramas_Var,",",1);
        SET cant = CHAR_LENGTH(arrayProgramas_Var) - CHAR_LENGTH(valor);
        SET arrayProgramas_Var = RIGHT(arrayProgramas_Var,cant -1);
        
			CALL SARA_CRUD("INSERT","Detalles_Area",CONCAT("Id_Area~",idArea_Var,"|Id_Programa~",valor,""),"");
        SET i = i + 1;
    END WHILE;
END IF;

END;;
DELIMITER ;


-- CENTRO_PROCEDURE
-- 

/*
	CALL Centro_Procedure("1~0~Centro2.1~Num2~Direcc2~1~1,2,3");
    CALL Centro_Procedure("2~4~Centro2.2~Num2.1~Direcc2.1~2~4");
    CALL Centro_Procedure("3~5~0~0~0~0");
    CALL Centro_Procedure("0~0~0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Centro_Procedure;

DELIMITER ;;
CREATE PROCEDURE Centro_Procedure (IN arrayCentro VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idCentro_Var INTEGER DEFAULT 0;
DECLARE nomCentro_Var VARCHAR(100);
DECLARE numCentro_Var VARCHAR(50);
DECLARE direccion_Var VARCHAR(100);
DECLARE idCiudad_Var INTEGER DEFAULT 0;
DECLARE arrayAreas_Var VARCHAR(100) DEFAULT "0";
DECLARE i,num,cant INTEGER DEFAULT 0;
DECLARE valor VARCHAR(400) DEFAULT "";


SET @opcion = 0,
	@idCentro_Var = 0,
    @numCentro_Var = "0",
	@nomCentro_Var = "0",
    @direccion_Var = "0",
	@idCiudad_Var = 0,
    @arrayAreas_Var = "0";

CALL EXECUTE_ARRAY(
		arrayCentro,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idCentro_Var = @valor;
            WHEN 2 THEN SET @nomCentro_Var = @valor;
            WHEN 3 THEN SET @numCentro_Var = @valor;
            WHEN 4 THEN SET @direccion_Var = @valor;
            WHEN 5 THEN SET @idCiudad_Var = @valor;
            WHEN 6 THEN SET @arrayAreas_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idCentro_Var = @idCentro_Var,
    nomCentro_Var = @nomCentro_Var,
    numCentro_Var = @numCentro_Var,
    direccion_Var = @direccion_Var,
    idCiudad_Var = @idCiudad_Var,
    arrayAreas_Var = @arrayAreas_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR AREA
	INSERT INTO Centro VALUES (null,numCentro_Var,nomCentro_Var,direccion_Var,idCiudad_Var);
    SELECT Id_Centro INTO idCentro_Var FROM Centro 
    WHERE Num_Centro = numCentro_Var AND Nom_Centro = nomCentro_Var AND Direccion = direccion_Var AND Id_Ciudad = idCiudad_Var;
    
    SELECT v1.Id_Centro,v1.Num_Centro,v1.Nom_Centro,v1.Direccion,v2.Id_Ciudad,v2.Nom_Ciudad
    FROM Centro v1 INNER JOIN Ciudad v2 ON v1.Id_Ciudad = v2.Id_Ciudad;
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR AREA
	UPDATE Centro
    SET Num_Centro = numCentro_Var ,
		Nom_Centro = nomCentro_Var ,
		Direccion =  direccion_Var ,
		Id_Ciudad =  idCiudad_Var
    WHERE Id_Centro = idCentro_Var;
    
    SELECT v1.Id_Centro,v1.Num_Centro,v1.Nom_Centro,v1.Direccion,v2.Id_Ciudad,v2.Nom_Ciudad
    FROM Centro v1 INNER JOIN Ciudad v2 ON v1.Id_Ciudad = v2.Id_Ciudad;
END;
WHEN 3 THEN
BEGIN -- Multiselect - Modificar

    SELECT ar.Id_Area, ar.Nom_Area,
    CASE(
	SELECT 1 FROM Area_Centro v1
    WHERE v1.Id_Area = ar.Id_Area AND v1.Id_Centro = idCentro_Var
    )WHEN 1 THEN 1 
    ELSE 0 END AS Tipo
    FROM Area ar;
    
END;
ELSE SELECT v1.Id_Centro,v1.Num_Centro,v1.Nom_Centro,v1.Direccion,v2.Id_Ciudad,v2.Nom_Ciudad
    FROM Centro v1 INNER JOIN Ciudad v2 ON v1.Id_Ciudad = v2.Id_Ciudad;
END CASE;
IF(opcion <> 3 AND arrayAreas_Var <> "0")THEN 
	SELECT arrayAreas_Var;
	SET num = M_LENGTH(arrayAreas_Var,",");
    WHILE(i < num)DO
		SET valor = SUBSTRING_INDEX(arrayAreas_Var,",",1);
        SET cant = CHAR_LENGTH(arrayAreas_Var) - CHAR_LENGTH(valor);
        SET arrayAreas_Var = RIGHT(arrayAreas_Var,cant -1);
        
			CALL SARA_CRUD("INSERT","Area_Centro",CONCAT("Id_Area~",valor,"|Id_Centro~",idCentro_Var,""),"");
        SET i = i + 1;
    END WHILE;
END IF;

END;;
DELIMITER ;


-- FORMATO_PROCEDURE
-- 

/*
	CALL Formato_Procedure("1~0~0O01~Des12~2");
    CALL Formato_Procedure("2~40~0O02~Des122~1");
    CALL Formato_Procedure("0~0~0~0~0");
*/

DROP PROCEDURE IF EXISTS Formato_Procedure;

DELIMITER ;;
CREATE PROCEDURE Formato_Procedure (IN arrayFormato VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idFormato_Var INTEGER DEFAULT 0;
DECLARE nomFormato_Var VARCHAR(50);
DECLARE desFormato_Var VARCHAR(100);
DECLARE idTipoFormato_Var VARCHAR(100);
DECLARE i,num,cant INTEGER DEFAULT 0;
DECLARE valor VARCHAR(400) DEFAULT "";


SET @opcion = 0,
	@idFormato_Var = 0,
    @nomFormato_Var = "0",
	@desFormato_Var = "0",
    @idTipoFormato_Var = 0;

CALL EXECUTE_ARRAY(
		arrayFormato,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idFormato_Var = @valor;
            WHEN 2 THEN SET @nomFormato_Var = @valor;
            WHEN 3 THEN SET @desFormato_Var = @valor;
            WHEN 4 THEN SET @idTipoFormato_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idFormato_Var = @idFormato_Var,
    nomFormato_Var = @nomFormato_Var,
	desFormato_Var = @desFormato_Var,
    idTipoFormato_Var = @idTipoFormato_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR AREA
	INSERT INTO Formato VALUES (null,nomFormato_Var,desFormato_Var,idTipoFormato_Var);
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR AREA
	UPDATE Formato 
    SET Nom_Formato = nomFormato_Var, Des_Formato = desFormato_Var, Id_Tipo_Formato = idTipoFormato_Var
    WHERE Id_Formato = idFormato_Var;
END;
ELSE SELECT * FROM Formato;
END CASE;
SELECT * FROM Formato;
END;;
DELIMITER ;


-- FORMATO_PROCEDURE
-- 

/*
	CALL TipoFormato_Procedure("1~0~TipoFormato001~Url001");
    CALL TipoFormato_Procedure("2~4~TipoFormato002~Url002");
    CALL TipoFormato_Procedure("0~0~0~0");
    
    ALTER TABLE Tipo_Formato 
	ADD COLUMN UrlImgTipoFormato VARCHAR(100);
*/

DROP PROCEDURE IF EXISTS TipoFormato_Procedure;

DELIMITER ;;
CREATE PROCEDURE TipoFormato_Procedure (IN arrayTipoFormato VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1);
DECLARE idTipoFormato_Var INTEGER DEFAULT 0;
DECLARE nomTipoFormato_Var VARCHAR(60);
DECLARE urlImgTipoFormato_Var VARCHAR(100);

SET @opcion = 0,
	@idTipoFormato_Var = 0,
    @nomTipoFormato_Var = "0",
	@urlImgTipoFormato_Var = "0";

CALL EXECUTE_ARRAY(
		arrayTipoFormato,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idTipoFormato_Var = @valor;
            WHEN 2 THEN SET @nomTipoFormato_Var = @valor;
            WHEN 3 THEN SET @urlImgTipoFormato_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idTipoFormato_Var = @idTipoFormato_Var,
    nomTipoFormato_Var = @nomTipoFormato_Var,
	urlImgTipoFormato_Var = @urlImgTipoFormato_Var;
    

CASE opcion
WHEN 1 THEN
BEGIN -- CREAR TIPO FORMATO
	INSERT INTO Tipo_Formato VALUES (null,nomTipoFormato_Var,urlImgTipoFormato_Var);
END;
WHEN 2 THEN 
BEGIN -- MODIFICAR TIPO FORMATO
	UPDATE Tipo_Formato 
    SET Nom_Tipo_Formato = nomTipoFormato_Var, UrlImgTipoFormato = urlImgTipoFormato_Var
    WHERE Id_Tipo_Formato = idTipoFormato_Var;
END;
ELSE SELECT * FROM Tipo_Formato;
END CASE;
SELECT * FROM Tipo_Formato;
END;;
DELIMITER ;


-- ASIGNAR_ROL
-- 

/*

Crea la columna de vigencia

ALTER TABLE Rol_Funcionario
ADD COLUMN Vigencia INTEGER NOT NULL DEFAULT 1

CALL ConsultarNotificaciones("5~2~3");

CALL Asignar_Rol("0~0~0~0");
CALL Asignar_Rol("2~1~0~0");
CALL Asignar_Rol("1~1~5~2");
CALL Asignar_Rol("1~4~25~2");

*/

DROP PROCEDURE IF EXISTS Asignar_Rol;

DELIMITER ;;
CREATE PROCEDURE Asignar_Rol(IN arrayAsignarRol VARCHAR (400))
BEGIN

DECLARE opcion INTEGER(1); 
DECLARE idCentro_Var		 INTEGER DEFAULT 0;
DECLARE idFuncionario_Var	 INTEGER DEFAULT 0;
DECLARE idRol_Var	 		 INTEGER DEFAULT 0;
DECLARE idFunOld_Var  		 INTEGER DEFAULT 0;
DECLARE idEstado_Var		 INTEGER DEFAULT 0;


SET	@contador			= 0;
SET @idsDetaNoti         = ""; 
SET @opcion = 0,
	@idCentro_Var = 0,
    @idFuncionario_Var = "0",
    @idRol_Var		  = 0;

CALL EXECUTE_ARRAY(
		arrayAsignarRol,
        "~",
        "CASE @i
			WHEN 0 THEN SET @opcion = @valor;
			WHEN 1 THEN SET @idCentro_Var = @valor;
            WHEN 2 THEN SET @idFuncionario_Var = @valor;
            WHEN 3 THEN SET @idRol_Var = @valor;
        END CASE;"
    );

SET opcion = @opcion,
	idCentro_Var = @idCentro_Var,
    idFuncionario_Var = @idFuncionario_Var,
    idRol_Var = @idRol_Var;
    
    
    
    

CASE opcion
WHEN 1 THEN
BEGIN -- MODIFICAR O INSERTAR VIGENCIA ROL

	IF(idRol_Var = 2 OR idRol_Var = 3)THEN
        
		CASE idRol_Var
			WHEN 2 THEN SET idEstado_Var = 3;
			WHEN 3 THEN SET idEstado_Var = 4;
		END CASE;
		
		SELECT fu.Id_Funcionario INTO idFunOld_Var
		FROM Funcionario fu 
		INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1 
		INNER JOIN Rol ro ON rf.Id_Rol = ro.Id_Rol AND rf.Id_Rol = idRol_Var
		INNER JOIN Area_Centro ac ON fu.Id_Area_Centro  = ac.Id_Area_Centro
		WHERE Id_Centro = idCentro_Var AND Id_Estado = 1;
		
		IF(idFunOld_Var <> 0 AND idFunOld_Var <> idFuncionario_Var)THEN
        
			SELECT  @idsDetaNoti := CONCAT(@idsDetaNoti,",",Id_Detalles_Notificacion), @contador := @contador + 1
			FROM 43_V_ConsultaTodoNotificacion v1 
			INNER JOIN Version v2 ON v1.Ides_Proceso = v2.Id_Version
			INNER JOIN Producto_Virtual v3 ON v2.Id_P_Virtual = v3.Id_P_Virtual
			WHERE v1.TipoIdes = 1 AND IdFuncionarioRecibe = idFunOld_Var AND v2.Id_Estado = idEstado_Var AND v1.EstadoNotificacion = 0;  
			
			SET @idsDetaNoti = SUBSTRING_INDEX(@idsDetaNoti,",",@contador * -1); 
			
			CALL MACC(CONCAT("
			UPDATE Detalles_Notificacion
			SET Id_Funcionario = ",idFuncionario_Var,"
			WHERE Id_Detalles_Notificacion IN (",@idsDetaNoti,")
			"));
			#VALIDAR CUANDO NO SE ENCUENTRE NINGUN REGISTRO EN LAS NOTIFICACIONES
			UPDATE Rol_Funcionario
			SET Vigencia = 0
			WHERE Id_Funcionario = idFunOld_Var;
            
            UPDATE Rol_Funcionario
			SET Vigencia = 1
			WHERE Id_Funcionario = idFunOld_Var AND Id_Rol = 1;
			
		END IF;
	
		
	END IF;


	UPDATE Rol_Funcionario
	SET Vigencia = 0
	WHERE Id_Funcionario = idFuncionario_Var;

	IF( SELECT 1 FROM Rol_Funcionario WHERE Id_Funcionario = idFuncionario_Var AND Id_Rol = idRol_Var)THEN

		UPDATE Rol_Funcionario
		SET Vigencia = 1
		WHERE Id_Funcionario = idFuncionario_Var AND Id_Rol = idRol_Var;

	ELSE
	BEGIN
		INSERT INTO Rol_Funcionario 
		VALUES (null,idRol_Var,idFuncionario_Var,1);
	END;

	END IF;
    
    SELECT fu.Id_Funcionario,CONCAT(fu.Nom_Funcionario," ", fu.Apellidos) AS Funcionario,ro.Id_Rol,ro.Nom_Rol AS Rol
    FROM Funcionario fu 
    INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1 
    INNER JOIN Rol ro ON rf.Id_Rol = ro.Id_Rol AND rf.Id_Rol = 1
    INNER JOIN Area_Centro ac ON fu.Id_Area_Centro  = ac.Id_Area_Centro
	WHERE Id_Centro = idCentro_Var AND Id_Estado = 1;
END;
WHEN 2 THEN 
BEGIN -- CONSULTA INICIAL DE LA VISTA ASIGNAR ROLES
	
    SELECT fu.Id_Funcionario,CONCAT(fu.Nom_Funcionario," ", fu.Apellidos) AS Funcionario,ro.Id_Rol,ro.Nom_Rol AS Rol
    FROM Funcionario fu 
    INNER JOIN Rol_Funcionario rf ON fu.Id_Funcionario = rf.Id_Funcionario AND rf.Vigencia = 1 
    INNER JOIN Rol ro ON rf.Id_Rol = ro.Id_Rol AND rf.Id_Rol = 1
    INNER JOIN Area_Centro ac ON fu.Id_Area_Centro  = ac.Id_Area_Centro
	WHERE Id_Centro = idCentro_Var AND Id_Estado = 1;
	
END;
ELSE SELECT Id_Rol,Nom_Rol FROM Rol WHERE Id_Rol NOT IN (1,4); -- Trae todos los roles menos el coordinador
END CASE; 
END;;
DELIMITER ;


-- MisProductos
-- 

/*

CALL MisProductos("5");

*/
DROP PROCEDURE IF EXISTS MisProductos;

DELIMITER ;;
CREATE PROCEDURE MisProductos(IN idFuncionario_Var VARCHAR(5))
BEGIN

    SELECT DISTINCT pv.Id_P_Virtual,pv.Nom_P_Virtual,v.Num_Version, e.Nom_Estado,v.Fecha_Envio ,v.Url_Version,f.Id_Funcionario
    FROM Version v 
    INNER JOIN Producto_Virtual pv ON v.Id_P_Virtual = pv.Id_P_Virtual
    INNER JOIN Autor a ON v.Id_Version = a.Id_Version 
    INNER JOIN Funcionario f ON a.Id_Funcionario = f.Id_Funcionario
    INNER JOIN Estado	e	 ON v.Id_Estado = e.Id_Estado
    WHERE f.Id_Funcionario = idFuncionario_Var;
END;;
DELIMITER ;


            
            

            
            
            


            
            

            
            
            
















































