-- Tipo Estado----------------------------------------------------------
DROP TRIGGER IF EXISTS Tipo_Estado_Log ;
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
    
    CONSTRAINT PK_Rol_Funcionario_Log PRIMARY KEY (Id_Rol_Funcionario_Log)
    
);

DROP TRIGGER IF EXISTS Rol_Funcionario_Insert ;
DELIMITER ;;
CREATE TRIGGER Rol_Funcionario_Insert AFTER INSERT ON Rol_Funcionario FOR EACH ROW
BEGIN
  INSERT INTO Rol_Funcionario_Log (Tipo_Log,Id_Rol_Funcionario,Id_Rol,Id_Funcionario) 
  VALUES ('I',NEW.Id_Rol_Funcionario,NEW.Id_Rol,NEW.Id_Funcionario);

END;;
DELIMITER ;

DROP TRIGGER IF EXISTS Rol_Funcionario_Update;
DELIMITER ;;
CREATE TRIGGER Rol_Funcionario_Update AFTER UPDATE  ON Rol_Funcionario FOR EACH ROW
BEGIN
  INSERT INTO Rol_Funcionario_Log (Tipo_Log,Id_Rol_Funcionario,Id_Rol,Id_Funcionario) 
  VALUES ('U',NEW.Id_Rol_Funcionario,NEW.Id_Rol,NEW.Id_Funcionario);
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




