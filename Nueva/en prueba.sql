DROP DATABASE SARApro;
CREATE DATABASE SARApro;

USE SARApro;


CREATE TABLE Tipo_Estado(
	
    Id_Tipo_Estado      INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Tipo_Estado     VARCHAR(45) NOT NULL,
    
    CONSTRAINT PK_Tipo_Estado PRIMARY KEY (Id_Tipo_Estado)

);

CREATE TABLE Estado(
	
    Id_Estado         INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Estado 	      VARCHAR(45) NOT NULL,
    Id_Tipo_Estado    INTEGER NOT NULL,
    
    CONSTRAINT PK_Estado      PRIMARY KEY (Id_Estado),
    CONSTRAINT FK_Tipo_Estado FOREIGN KEY (Id_Tipo_Estado) REFERENCES Tipo_Estado(Id_Tipo_Estado)
);

CREATE TABLE Rankin(

	Id_Rankin        INTEGER NOT NULL AUTO_INCREMENT,
    Num_Visitas      INTEGER NOT NULL,
    Num_Descargas	 INTEGER NOT NULL,
    Cant_5			 INTEGER NOT NULL, 
    Cant_4			 INTEGER NOT NULL,
    Cant_3			 INTEGER NOT NULL,
    Cant_2			 INTEGER NOT NULL,
    Cant_1			 INTEGER NOT NULL,
    Numero_Votos     INTEGER NOT NULL,
    
    CONSTRAINT PK_Rankin PRIMARY KEY (Id_Rankin)
);

CREATE TABLE Tipo_Version(
	
	Id_Tipo_Version    INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Tipo_Version   VARCHAR(45) NOT NULL,
    Des_Version        VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Tipo_Version PRIMARY KEY (Id_Tipo_Version)

);

CREATE TABLE Formato(
	
    Id_Formato     INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Formato    VARCHAR(45) NOT NULL,
    Des_Formato    VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Formato PRIMARY KEY (Id_Formato)
    
);

CREATE TABLE Producto_Virtual(
	
    Id_P_Virtual     INTEGER NOT NULL AUTO_INCREMENT,
    Nom_P_Virtual    VARCHAR(80) NOT NULL,
    Des_P_Virtual	 VARCHAR(200) NOT NULL,
    Palabras_Clave	 VARCHAR(100) NOT NULL,
    Id_Formato 	     INTEGER NOT NULL,
    
    CONSTRAINT PK_P_Virtual PRIMARY KEY (Id_P_Virtual),
    CONSTRAINT FK_Formato   FOREIGN KEY (Id_Formato)    REFERENCES Formato(Id_Formato)

);

CREATE TABLE Version (

	Id_Version           INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Envio          DATE NOT NULL,
    Fecha_Publicacion 	 DATE,
    Num_Version 		 INTEGER NOT NULL,
	Fecha_Vigencia 		 DATE,
    Url_Version			 VARCHAR (500),
    Url_Img				 VARCHAR (500),				
    Inst_Instalacion	 VARCHAR (800) NOT NULL,
    Reqst_Instalacion    VARCHAR (500) NOT NULL,
    Id_P_Virtual		 INTEGER NOT NULL,
	Id_Estado			 INTEGER NOT NULL,
    Id_Tipo_Version      INTEGER NOT NULL,
    Id_Rankin			 INTEGER NOT NULL,
	
	CONSTRAINT PK_Version      PRIMARY KEY (Id_Version),
    CONSTRAINT FK_P_Virtual_01 FOREIGN KEY (Id_P_Virtual)    REFERENCES Producto_Virtual(Id_P_Virtual),
    CONSTRAINT FK_Estado       FOREIGN KEY (Id_Estado)       REFERENCES Estado(Id_Estado),
    CONSTRAINT FK_Tipo_Version FOREIGN KEY (Id_Tipo_Version) REFERENCES Tipo_Version(Id_Tipo_Version),
    CONSTRAINT FK_Rankin       FOREIGN KEY (Id_Rankin)       REFERENCES Rankin(Id_Rankin)
    
);	

CREATE TABLE Tema(

	Id_Tema    INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Tema   VARCHAR(45) NOT NULL,
    Des_Tema   VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Tema PRIMARY KEY (Id_Tema)
    
);

CREATE TABLE Detalles_Tema(

	Id_Detalles_Tema INTEGER NOT NULL AUTO_INCREMENT,
    Id_Tema          INTEGER NOT NULL,
    Id_P_Virtual     INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Tema    PRIMARY KEY (Id_Detalles_Tema),
    CONSTRAINT FK_Tema_01          FOREIGN KEY (Id_Tema)      REFERENCES Tema(Id_Tema),
    CONSTRAINT FK_P_Virtual_02     FOREIGN KEY (Id_P_Virtual) REFERENCES Producto_Virtual(Id_P_Virtual)
);

CREATE TABLE Programa(
	
    Id_Programa     INTEGER NOT NULL AUTO_INCREMENT,
	Nom_Programa    VARCHAR(100) NOT NULL,
    Nivel_Formacion VARCHAR(45) NOT NULL,
    
    CONSTRAINT PK_Programa PRIMARY KEY (Id_Programa)
    
);

CREATE TABLE Detalles_Programa(

	Id_Detalles_Programa INTEGER NOT NULL AUTO_INCREMENT,
    Id_Tema              INTEGER NOT NULL,
    Id_Programa          INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Programa PRIMARY KEY (Id_Detalles_Programa),
    CONSTRAINT FK_Tema_02           FOREIGN KEY (Id_Tema)     REFERENCES Tema(Id_Tema),
    CONSTRAINT FK_Programa_01       FOREIGN KEY (Id_Programa) REFERENCES Programa(Id_Programa)
    
);

CREATE TABLE Area (

	Id_Area       INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Area      VARCHAR(100) NOT NULL,
    Lider_Area    VARCHAR(70) NOT NULL,
    
    CONSTRAINT PK_Area PRIMARY KEY (Id_Area)
    
);

CREATE TABLE Detalles_Area(

	Id_Detalles_Area INTEGER NOT NULL AUTO_INCREMENT,
    Id_Programa      INTEGER NOT NULL,
    Id_Area          INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Area PRIMARY KEY (Id_Detalles_Area),
    CONSTRAINT FK_Programa_02   FOREIGN KEY (Id_Programa) REFERENCES Programa(Id_Programa),
    CONSTRAINT FK_Area_01		FOREIGN KEY (Id_Area)	  REFERENCES Area (Id_Area)

);

CREATE TABLE Ciudad(
	
    Id_Ciudad    INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Ciudad   VARCHAR(75) NOT NULL,
    
    CONSTRAINT PK_Ciudad    PRIMARY KEY (Id_Ciudad),
    CONSTRAINT UN_Ciudad_01 UNIQUE (Nom_Ciudad) 
    
);

CREATE TABLE Centro(
	
	Id_Centro    INTEGER NOT NULL,
    Nom_Centro   VARCHAR(100) NOT NULL,
    Direccion    VARCHAR(100) NOT NULL,
    Id_Ciudad 	 INTEGER NOT NULL,
    
    CONSTRAINT PK_Centro PRIMARY KEY (Id_Centro),
    CONSTRAINT FK_Ciudad FOREIGN KEY (Id_Ciudad) REFERENCES Ciudad(Id_Ciudad)
);

CREATE TABLE Area_Centro(

	Id_Area_Centro INTEGER NOT NULL AUTO_INCREMENT,
    Id_Area        INTEGER NOT NULL,
    Id_Centro	   INTEGER NOT NULL,
	
	CONSTRAINT PK_Area_Centro PRIMARY KEY (Id_Area_Centro),
    CONSTRAINT FK_Area_02     FOREIGN KEY (Id_Area)   REFERENCES Area (Id_Area),
    CONSTRAINT FK_Centro	  FOREIGN KEY (Id_Centro) REFERENCES Centro(Id_Centro)	
     
);


CREATE TABLE Funcionario(

	Id_Funcionario  INTEGER NOT NULL AUTO_INCREMENT,
    Num_Documento   DOUBLE NOT NULL,
	Nom_Funcionario VARCHAR(45) NOT NULL,
    Apellidos       VARCHAR(100) NOT NULL,
    Correo			VARCHAR(125) NOT NULL,
    Cargo 			VARCHAR(45) NOT NULL,
    Estado 	       	BOOLEAN NOT NULL DEFAULT TRUE,
    Ip_Sena			VARCHAR(6) NOT NULL,
    Contraseña      VARCHAR(255) NOT NULL,
    Id_Area_Centro 	INTEGER NOT NULL,
    
    CONSTRAINT PK_Funcionario PRIMARY KEY (Id_Funcionario),
    CONSTRAINT UN_Funcionario UNIQUE (Num_Documento,Correo,Ip_Sena,Contraseña),
    CONSTRAINT FK_Area_Centro FOREIGN KEY (Id_Area_Centro) REFERENCES Area_Centro(Id_Area_Centro)
    
);	

CREATE TABLE Rol(

	Id_Rol  INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Rol VARCHAR(45) NOT NULL,
    Des_Rol VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Rol PRIMARY KEY (Id_Rol)
);

CREATE TABLE Rol_Funcionario(

	Id_Rol_Funcionario INTEGER NOT NULL AUTO_INCREMENT,
    Id_Rol             INTEGER NOT NULL,
    Id_Funcionario     INTEGER NOT NULL,
    
    CONSTRAINT PK_Rol_Funcionario PRIMARY KEY (Id_Rol_Funcionario),
    CONSTRAINT FK_Rol			  FOREIGN KEY (Id_Rol)         REFERENCES Rol(Id_Rol),
	CONSTRAINT FK_Funcionario_01  FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario (Id_Funcionario)
    
);

CREATE TABLE Autor (

	Id_Autor       INTEGER NOT NULL AUTO_INCREMENT,
    Id_Version     INTEGER NOT NULL,
    Id_Funcionario INTEGER NOT NULL,
    
    CONSTRAINT PK_Autor          PRIMARY KEY (Id_Autor),
    CONSTRAINT FK_Version_01     FOREIGN KEY (Id_Version)     REFERENCES Version (Id_Version),
    CONSTRAINT FK_Funcionario_02 FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario)
    
);

CREATE TABLE Comentario(

	Id_Comentario   INTEGER NOT NULL AUTO_INCREMENT,
	Comentario      VARCHAR(350) NOT NULL,
	Id_Funcionario  INTEGER NOT NULL,
    Id_Version      INTEGER NOT NULL,
    
    CONSTRAINT PK_Comentario     PRIMARY KEY (Id_Comentario),
    CONSTRAINT UN_Comentario     UNIQUE	(Comentario),
    CONSTRAINT FK_Funcionario_03 FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario),
    CONSTRAINT FK_Version_02     FOREIGN KEY (Id_Version)     REFERENCES Version (Id_Version)
    
);

CREATE TABLE Lista_Chequeo (

	Id_Lista_Chequeo  INTEGER NOT NULL AUTO_INCREMENT,
    Nom_Lista_Chequeo VARCHAR(100) NOT NULL,
    Des_Lista_Chequeo VARCHAR(200) NOT NULL,
	Fecha_Creacion    DATE NOT NULL,
    Tipo_Lista		  VARCHAR(20) NOT NULL,
    Id_Funcionario    INTEGER NOT NULL,
    
    CONSTRAINT PK_Lista_Chequeo PRIMARY KEY (Id_Lista_Chequeo),
    CONSTRAINT FK_Funcionario_04 FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario)
    
);

CREATE TABLE Item_Lista(

	Id_Item_Lista 	INTEGER NOT NULL AUTO_INCREMENT,
    Des_Item_Lista 	VARCHAR(300) NOT NULL,
    Tipo_Rol_Item	INTEGER NOT NULL,
    
    CONSTRAINT PK_Item_Lista PRIMARY KEY (Id_Item_Lista),
    CONSTRAINT UN_Item_Lista UNIQUE (Des_Item_Lista)
);

CREATE TABLE Detalles_Lista (

	Id_Detalles_Lista INTEGER NOT NULL AUTO_INCREMENT,
    Id_Lista_Chequeo  INTEGER NOT NULL,
    Id_Item_Lista     INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Lista PRIMARY KEY (Id_Detalles_Lista),
    CONSTRAINT FK_Lista_Chequeo_01 FOREIGN KEY (Id_Lista_Chequeo) REFERENCES Lista_Chequeo(Id_Lista_Chequeo),
    CONSTRAINT FK_Item_Lista    FOREIGN KEY (Id_Item_Lista)	   REFERENCES Item_Lista(Id_Item_Lista)	
    
);
CREATE TABLE Evaluacion_General(

	Id_Evaluacion_General INTEGER NOT NULL AUTO_INCREMENT,
    Fecha_Evaluacion      DATE NOT NULL,
    Observacion			  VARCHAR(250) NOT NULL,
    Resultado 			  BOOLEAN NOT NULL,
    Id_Version            INTEGER NOT NULL,
    Id_Lista_Chequeo      INTEGER NOT NULL,
    Id_Funcionario		  INTEGER NOT NULL,

	CONSTRAINT PK_Evaluacion_General PRIMARY KEY (Id_Evaluacion_General),
	CONSTRAINT FK_Version            FOREIGN KEY (Id_Version) REFERENCES Version (Id_Version),
    CONSTRAINT FK_Lista_Chequeo_02   FOREIGN KEY (Id_Lista_Chequeo) REFERENCES Lista_Chequeo(Id_Lista_Chequeo),
    CONSTRAINT FK_Funcionario        FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario)
);



CREATE TABLE Detalles_Evaluacion(

	Id_Detalles_Evaluacion INTEGER NOT NULL AUTO_INCREMENT,
    Valorizacion           BOOLEAN NOT NULL,
    Observacion 		   VARCHAR(200) NOT NULL,	
    Id_Detalles_Lista	   INTEGER NOT NULL,
    Id_Evaluacion_General  INTEGER NOT NULL,
    
    CONSTRAINT PK_Detalles_Evaluacion PRIMARY KEY (Id_Detalles_Evaluacion),
    CONSTRAINT FK_Detalles_Lista      FOREIGN KEY (Id_Detalles_Lista) REFERENCES Detalles_Lista (Id_Detalles_Lista),
    CONSTRAINT FK_Evaluacion_General  FOREIGN KEY (Id_Evaluacion_General) REFERENCES Evaluacion_General(Id_Evaluacion_General)
);



