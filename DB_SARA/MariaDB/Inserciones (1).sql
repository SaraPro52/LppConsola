-- Proceso de validacion
USE SARA;
-- FUNCIONARIOS
CALL RegistrarFuncionario("1~1~1019133595~Funcionario-1~Inst1~Funcionario1@outlook.es~INS~123451~con1~1~1");
CALL RegistrarFuncionario("2~1~2019133595~Funcionario-2~EvalT1~Funcionario2@outlook.es~EP~123452~con2~1~1");
CALL RegistrarFuncionario("3~1~3019133595~Funcionario-3~EvalP1~Funcionario3@outlook.es~ET~123453~con3~1~1");
CALL RegistrarFuncionario("4~1~4019133595~Funcionario-4~Coor1~Funcionario4@outlook.es~CO~123454~con4~1~1");

CALL RegistrarFuncionario("1~1~5019133595~Funcionario-5~Inst2~Funcionario5@outlook.es~INS~123455~con5~1~1");


CALL SARA_CRUD("UPDATE","Funcionario","Id_Estado~1","Id_Funcionario > 0");
CALL SARA_CRUD("SELECT","Funcionario","","");
CALL SARA_CRUD("SELECT","Rol_Funcionario","","");

-- PRODUCTOS VIRTUALES

CALL Registrar_PV("Producto Virtual 1~ Des Producto Virtual 1~PV1,PV2,PV3~1~UrlVER/1~UrlIMG/1~Intruncion 1~Requisito 1~1,5~1-0,2-0");

SELECT v1.Id_Funcionario, Nom_Funcionario, Nom_Rol, Fecha_Envio, Conte_Notificacion, Ides_Proceso,v3.Id_Funcionario
FROM Funcionario v1 INNER JOIN Detalles_Notificacion v2 ON v1.Id_Funcionario = v2.Id_Funcionario
	 INNER JOIN Notificacion v3 ON v2.Id_Notificacion = v3.Id_Notificacion INNER JOIN Rol_Funcionario v4 ON v1.Id_Funcionario = v4.Id_Funcionario
     INNER JOIN Rol v5 ON v4.Id_Rol = v5.Id_Rol
WHERE v5.Id_Rol = 2;


CALL SARA_CRUD("SELECT","Version","","");
CALL SARA_CRUD("SELECT","Autor","","");

CALL SARA_CRUD("DELETE","Autor","","Id_Autor > 0");
CALL SARA_CRUD("DELETE","Version","","Id_Version > 0");
CALL SARA_CRUD("DELETE","Detalles_Tema","","Id_Detalles_Tema > 0");
CALL SARA_CRUD("DELETE","Producto_Virtual","","Id_P_Virtual > 0");


CALL SARA_CRUD("DELETE","Detalles_Notificacion","","Id_Detalles_Notificacion > 0");
CALL SARA_CRUD("DELETE","Notificacion","","Id_Notificacion > 0");

-- CREAR LISTA DE CHEQUEO- PARA UNA EVALUACION

CALL RegistrarLista("Lista Chequeo 1~ Des Lista Chequeo 1~2~1,2,3");
CALL RegistrarLista("Lista Chequeo 2~ Des Lista Chequeo 2~2~1,2");

CALL SARA_CRUD("SELECT","Lista_Chequeo","","");
CALL SARA_CRUD("SELECT","Detalles_Lista","","");

-- EVALUAR PRODUCTO VIRTUAL

-- ERROR EN LA NOTIFICACION EN EL URL CUALDO SE LE ENVIA AL COORDINADOR

CALL RegistrarEvaluacion("Evaluacion PV Prueba 1~1~2~1~2~2017-08-01~1¤Observacion Item 1¤1|1¤Observacion Item 2¤2");

CALL RegistrarEvaluacion("Evaluacion PV Prueba 2~1~2~1~3~2017-08-01~1¤Observacion Item 3¤1|1¤Observacion Item 4¤2");

-- CASO ALTERNO

CALL RegistrarEvaluacion("Evaluacion PV Prueba 2~0~1~1~2~2017-08-01~0¤Observacion Item 1¤1|1¤Observacion Item 2¤2");

CALL CorreccionVersion("1~1~URLversion1/1");

CALL RegistrarEvaluacion("Evaluacion PV Prueba 3~0~1~1~3~2017-08-01~0¤Observacion Item 1¤1|1¤Observacion Item 2¤2");

CALL CorreccionVersion("1~4~URLversion2/2");



-- APROBACION

CALL AprobarPV("4~2");
CALL SARA_CRUD("SELECT","Evaluacion_General","","");
CALL SARA_CRUD("SELECT","Detalles_Evaluacion","","");

CALL SARA_CRUD("DELETE","Rankin","","Id_Rankin > 0");
-- NUEVA VERSION PARA ACTUALIZAR UNA YA PUBLICADA

CALL RegistrarVersion("1~urlactualizacion6/~url2actualizacion/6~Instruacion actualizacion 6~Requisitos actualizacion 6~1,5");

CALL SARA_CRUD("SELECT","Notificacion","","");
CALL SARA_CRUD("SELECT","Detalles_Notificacion","","");

CALL SARA_CRUD("DELETE","Detalles_Notificacion","","Id_Detalles_Notificacion > 0");
CALL SARA_CRUD("DELETE","Notificacion","","Id_Notificacion > 7");

CALL SARA_CRUD("SELECT","Categoria","","");
CALL SARA_CRUD("SELECT","Evaluacion_General","","");

CALL SARA_CRUD("DELETE","Detalles_Evaluacion","","Id_Detalles_Evaluacion > 6");
CALL SARA_CRUD("DELETE","Evaluacion_General","","Id_Evaluacion_General > 3");



CALL SARA_CRUD("UPDATE","Version","Id_Estado~5","Id_Version = 2");

DROP PROCEDURE IF EXISTS Pruebita;
DELIMITER ;;
CREATE PROCEDURE Pruebita(IN valor INTEGER,OUT retorno VARCHAR(10))
BEGIN
	CASE valor
		WHEN 1 THEN SET retorno = "uno";
        WHEN 2 THEN SET retorno = "dos";
    END CASE;
END;;
DELIMITER ;

CALL Pruebita(2,@p);

SELECT @p;