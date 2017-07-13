USE SARA;

LOAD DATA LOCAL INFILE 'C:/Users/migue/Desktop/LppConsola/DB_SARA/MariaDB/Libro1.csv'
INTO TABLE Ciudad
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(@Nom_Ciudad);

CALL SARA_CRUD("SELECT","Ciudad","","");
CALL SARA_CRUD("DELETE","Ciudad","","Id_Ciudad > 2");